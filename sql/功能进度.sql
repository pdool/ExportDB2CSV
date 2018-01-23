SELECT
	d.n_roleid,
	r.s_rolename 角色名,
	max(case SUBSTRING_INDEX(	d.s_stype,'_',1) WHEN 1 then d.n_tid else 0 END) 支线采集类,
	max(case SUBSTRING_INDEX(	d.s_stype,'_',1) WHEN 2 then d.n_tid else 0 END) 支线建造类,
	max(case SUBSTRING_INDEX(	d.s_stype,'_',1) WHEN 3 then d.n_tid else 0 END) 支线招募类,
	max(case SUBSTRING_INDEX(	d.s_stype,'_',1) WHEN 4 then d.n_tid else 0 END) 支线研究类,
	max(case SUBSTRING_INDEX(	d.s_stype,'_',1) WHEN 5 then d.n_tid else 0 END) 支线攻击类

FROM

	player_task_list_3d  d,
	player_roles r,
	player_property p
where d.n_roleid = r.n_roleid
AND  r.s_source <> 'pc'
	and r.n_roleid = p.n_roleid
 and  DATE_FORMAT(p.d_last_online, "%Y_%m_%d") = {dayStr}
group by d.n_roleid