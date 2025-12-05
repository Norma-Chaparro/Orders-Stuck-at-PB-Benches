select T.TM_ID, p.prod_id, t.location,order_id, pick_state, p.du_id, T.LOC_UPDATE_TIME, t.prev_location,datediff(minute,t.LOC_UPDATE_TIME,getdate()) as aging_min
from x_pick p 
join x_tm t 
on p.stock_tm_id=t.tm_id 
where t.location in ('epb01', 'pb01', 'pb02', 'pb03', 'pb04',
'pb05',
'pb06',
'pb07',
'pb08',
'pb09',
'pb10',
'pb11',
'pb12')
AND PICK_STATE IN ('PICKED', 'COLLATED')
and prev_location not in ('SC1:081','SC2:001')
and datediff(minute, T.LOC_Update_time, getdate()) > 10
and tm_id not like '1258%'
ORDER BY loc_update_time asc
