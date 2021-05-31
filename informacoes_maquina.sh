#!/bin/bash
MEMORIA=`cat /proc/meminfo | grep "MemTotal" | sed 's/ //g'  | sed 's/^MemTotal:/ /g' | sed 's/ //g' | sed 's/kB//g'`
echo "====================================================="
echo "Relatório da máquina $HOSTNAME                       "
echo "Data/Hora: `date`"
echo "====================================================="
echo
echo "Máquina ativa desde: `uptime -s`"
echo
echo "Versão do Kernel: `uname -r`"
echo
echo "CPUs:"
echo "Quantidade de CPUs/Core: `cat /proc/cpuinfo | grep "siblings" | uniq | sed 's/^siblings.* //'`"
echo "Modelo da CPU: `cat /proc/cpuinfo | grep "model name" | uniq | sed 's/^model name.*: //g' | sed 's/\s/ /g' `"
echo
echo "Memória Total: `echo "scale=2;$MEMORIA/1024" | bc` MB"
echo 
echo "Partições:"
df -mh
