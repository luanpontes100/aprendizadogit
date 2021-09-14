#!/bin/bash

PROJETO='nome do projeto'
GIT_GROUP='nome do grupo do projeto'
DIR_PROJ='diretório para onde você quer colocar o projeto'
VERSION=$1
GIT_SERVER='ssh://git@IP'

if [ "X$1" = "X" ]; then
	echo "TAG de versão não informada não informado";
	exit 123;
fi
#
#  FUNCTIONS
#
function log() {
  echo -e "\rREMOTO::$1"
};
#
function logn() {
  echo -ne "\rREMOTO::$1"
};
#
function logerro() {
  echo -e "\rREMOTO::$1"
  return 127;
};
#
function install_composer() {
  logn "Instalando composer..."
  composer install -q && log 'composer install -- SUCESSO' || log 'composer install -- ERRO'
  #
  logn "Atualizando composer..."
  composer update -q && log 'composer update -- SUCESSO' || log 'composer update -- ERRO'
  return 0
}
#
function install_npm() {
  logn "Java Script :: NPM :: Instalando NPM..."
  npm cache clear --force && log 'NPM cache -- SUCESSO' || log 'NPM cache -- ERRO'
  npm install --silent && log 'NPM install -- SUCESSO' || log 'NPM install -- ERRO'
  if [ $? -eq 0 ]; then
    log "Java Script :: NPM :: Instalado com Sucesso."
    logn "Java Script :: NPM :: Atualizando ..."
    npm run prod --silent && log 'NPM run -- SUCESSO' || log 'NPM run -- ERRO'
    rm -rf node_modules
  else
    log "Java Script :: NPM :: Instalado com ERRO !!!!"
  fi
  return 0;
  #
}
#
echo -n "DATA Inicial do deploy: "
date
#
if [ -d $DIRETORIO ];then
  echo "removendo o diretorio $DIR_PROJ antigo ..."
  rm -rf $DIRETORIO
fi
#
git clone --depth 1 -b $VERSION ${GIT_SERVER}/${GIT_GROUP}/${PROJETO}.git $DIR_PROJ
#
if [ $? -eq 0]; then
  #
  cd $DIR_PROJ
  log "Dentro do diretorio do projeto: ${DIR_PROJ} -- ${PROJETO}"
  echo "removendo arquivos .git e demais desnecessários do projeto ...";
  ls -a | egrep "^\..*" | egrep -v "^\.$|^\.\.$" | xargs rm -rf
  #
  if [ $? -ne 0 ];then
    echo "erro ao apagar diretorio .git ..."
    exit -1
  fi
  #
  install_composer && log "Composer OK" || logerro "Composer com ERRO !!!" 
  install_npm && log "NPM OK" || logerro "NPM com ERRO !!" 
  PROJETO_VERSION="${DIR_PROJ}-${VERSION}"
  mv "${DIR_PROJ}" "${PROJETO_VERSION}"
  #
  echo "compactando o projeto ..."
  NAMEVERSION="${PROJETO_VERSION}.tar.gz";
  tar -zcf ${NAMEVERSION} ${PROJETO_VERSION}
  #
else
  echo "Git Clonado com ERRO !!!!!"
fi
echo -n "DATA final do deploy: "
date
exit 0;
