select 
	count(distinct umts.cell_identity) as site_umts_cnt,
	count(distinct gsm.cell_identity) as site_gsm_cnt,
	count(distinct lte.cell_identity) as site_lte_cnt
from umts 
full outer join gsm on gsm.site_id = umts.site_id
full outer join lte on lte.site_id = umts.site_id
left join site on umts.site_id = site.site_id 
where umts.site_id = site.site_id
or gsm.site_id = site.site_id
or lte.site_id = site.site_id