select c.id client_id,sn1.id sn_id,sn1.identification identification,sn1.social_id social_id,c.name cliname,c.company_id company,
(select count(*) from orders where social_network_id = sn1.id) peds
from social_networks sn1 left join clients c on c.id=sn1.client_id
where (select count(*) from clients c1 left join social_networks sn2 on c1.id = sn2.client_id where sn1.social_id = sn2.social_id and c1.company_id = 6) > 1
and c.company_id = 6 and sn1.identification = '5585984237271' order by sn1.social_id,peds desc limit 5;



BEGIN;



update orders set social_network_id = ID_DE_CIMA where social_network_id = ID_DE_BAIXO;
update orders set social_network_id = 114911 where social_network_id = 114912;


DELETE from clients c USING social_networks sn WHERE c.id = sn.client_id and sn.id = ID_DE_BAIXO;
DELETE from clients c USING social_networks sn WHERE c.id = sn.client_id and sn.id = 49781;




select c.id client_id,sn1.id sn_id,sn1.identification identification,sn1.social_id social_id,c.name cliname,c.company_id company,(select count(*) from orders where social_network_id = sn1.id) peds
from social_networks sn1 left join clients c on c.id=sn1.client_id
where (select count(*) from clients c1 left join social_networks sn2 on c1.id = sn2.client_id where sn1.social_id = sn2.social_id and c1.company_id = 6) > 1
and c.company_id = 6 order by sn1.social_id,peds desc limit 5;



select c.id client_id,sn1.id sn_id,sn1.identification identification,sn1.social_id social_id,c.name cliname,c.company_id company,
(select count(*) from orders where social_network_id = sn1.id) peds
from social_networks sn1 left join clients c on c.id=sn1.client_id where sn1.identification like '%99700022%' and c.company_id=6;

insert into integrations(type,data,enabled,social_network,shop_id,created_at,updated_at,grouping) 
	values ('z-api', '{"api_url":"https:\/\/api.z-api.io\/instances\/38E00005E4F6B0BFB7F1AEA47DC43D84","token":"2BB2D43452C0F2613B74E95F"}','false',
		   'whatsapp',2,'2020-12-29 11:56:44','2020-12-29 11:56:44','communication');

select sn.id sn_id,c.name, sn.identification ident, c.created_at criacao,(select count(*) from orders where social_network_id = sn.id) peds 
	from clients c join social_networks sn on c.id=sn.client_id where sn.identification like '%84237271%%' and c.company_id=6;







