select 
	r.n_roleid,
	r.s_rolename, 
		sum(CASE t.n_type WHEN 38 THEN (SUBSTRING_INDEX(substring_index(s_rewards,'_', 2),"_",-1)+0) - (SUBSTRING_INDEX(substring_index(s_rewards,'_', -1),"_",-1)+0)
		when 2 then (SUBSTRING_INDEX(substring_index(s_rewards,'_', 2),"_",-1)+0) - (SUBSTRING_INDEX(substring_index(s_rewards,'_', -1),"_",-1)+0)
		ELSE 0 END) 商城购买,
	sum(CASE t.n_type WHEN 138 THEN s_ext + 0 ELSE 0 END)  建筑加速,
	sum(CASE t.n_type WHEN 139 THEN s_ext + 0 ELSE 0 END)  招募加速,
	sum(CASE t.n_type WHEN 140 THEN s_ext + 0 ELSE 0 END)  治疗加速,
	sum(CASE t.n_type WHEN 141 THEN s_ext + 0 ELSE 0 END)  科技加速,
	sum(CASE t.n_type WHEN 218 THEN (SUBSTRING_INDEX(substring_index(s_rewards,'_', 2),"_",-1)+0) - (SUBSTRING_INDEX(substring_index(s_rewards,'_', -1),"_",-1)+0) ELSE 0 END) 购买建筑队列,
	sum(CASE t.n_type WHEN 147 THEN  IF(LEFT(s_ext,1) = '1' ,substring(s_ext, 3, LENGTH(s_ext)-2 ) + 0 ,0)    ELSE 0 END)  部队加速,
	sum(CASE t.n_type WHEN 212 THEN (SUBSTRING_INDEX(substring_index(s_rewards,'_', 2),"_",-1)+0) - (SUBSTRING_INDEX(substring_index(s_rewards,'_', -1),"_",-1)+0) ELSE 0 END) 改变势力,
	sum(CASE t.n_type WHEN 75 THEN s_ext + 0 ELSE 0 END)  军团创建
from {db.}player_roles r,

  {logdb.}log_reward{date} t
WHERE
	t.n_op_type = 2
and r.n_roleid = t.n_roleid
AND  DATEDIFF(d_time,NOW())=-1
GROUP BY t.n_roleid