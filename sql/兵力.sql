
SELECT
	r.n_roleid,
	r.s_rolename,
 MAX(CASE a.n_army_type WHEN 1 THEN  a.n_army_lvl ELSE 0 END) 枪兵等级,
 MAX(CASE a.n_army_type WHEN 2 THEN  a.n_army_lvl ELSE 0 END) 锤兵等级,
 MAX(CASE a.n_army_type WHEN 3 THEN  a.n_army_lvl ELSE 0 END) 火弩手等级,
 MAX(CASE a.n_army_type WHEN 4 THEN  a.n_army_lvl ELSE 0 END) 强弓兵等级,
 MAX(CASE a.n_army_type WHEN 5 THEN  a.n_army_lvl ELSE 0 END) 重骑兵等级,
 MAX(CASE a.n_army_type WHEN 6 THEN  a.n_army_lvl ELSE 0 END) 驯兽师等级,
 MAX(CASE a.n_army_type WHEN 7 THEN  a.n_army_lvl ELSE 0 END) 藤甲兵等级,
 MAX(CASE a.n_army_type WHEN 8 THEN  a.n_army_lvl ELSE 0 END) 妖术师等级,
 MAX(CASE a.n_army_type WHEN 9 THEN  a.n_army_lvl ELSE 0 END) 投石车等级,
 MAX(CASE a.n_army_type WHEN 10 THEN  a.n_army_lvl ELSE 0 END) 弩车等级,

 MAX(CASE a.n_army_type WHEN 1 THEN  a.n_idle ELSE 0 END) 枪兵数量,
 MAX(CASE a.n_army_type WHEN 2 THEN  a.n_idle ELSE 0 END) 锤兵数量,
 MAX(CASE a.n_army_type WHEN 3 THEN  a.n_idle ELSE 0 END) 火弩手数量,
 MAX(CASE a.n_army_type WHEN 4 THEN  a.n_idle ELSE 0 END) 强弓兵数量,
 MAX(CASE a.n_army_type WHEN 5 THEN  a.n_idle ELSE 0 END) 重骑兵数量,
 MAX(CASE a.n_army_type WHEN 6 THEN  a.n_idle ELSE 0 END) 驯兽师数量,
 MAX(CASE a.n_army_type WHEN 7 THEN  a.n_idle ELSE 0 END) 藤甲兵数量,
 MAX(CASE a.n_army_type WHEN 8 THEN  a.n_idle ELSE 0 END) 妖术师数量,
 MAX(CASE a.n_army_type WHEN 9 THEN  a.n_idle ELSE 0 END) 投石车数量,
 MAX(CASE a.n_army_type WHEN 10 THEN  a.n_idle ELSE 0 END) 弩车数量,

 MAX(CASE a.n_army_type WHEN 1 THEN  a.n_injured ELSE 0 END) 枪兵受伤数量,
 MAX(CASE a.n_army_type WHEN 2 THEN  a.n_injured ELSE 0 END) 锤兵受伤数量,
 MAX(CASE a.n_army_type WHEN 3 THEN  a.n_injured ELSE 0 END) 火弩手受伤数量,
 MAX(CASE a.n_army_type WHEN 4 THEN  a.n_injured ELSE 0 END) 强弓兵受伤数量,
 MAX(CASE a.n_army_type WHEN 5 THEN  a.n_injured ELSE 0 END) 重骑兵受伤数量,
 MAX(CASE a.n_army_type WHEN 6 THEN  a.n_injured ELSE 0 END) 驯兽师受伤数量,
 MAX(CASE a.n_army_type WHEN 7 THEN  a.n_injured ELSE 0 END) 藤甲兵受伤数量,
 MAX(CASE a.n_army_type WHEN 8 THEN  a.n_injured ELSE 0 END) 妖术师受伤数量,
 MAX(CASE a.n_army_type WHEN 9 THEN  a.n_injured ELSE 0 END) 投石车受伤数量,
 MAX(CASE a.n_army_type WHEN 10 THEN  a.n_injured ELSE 0 END) 弩车受伤数量
	
FROM
	player_roles r
LEFT JOIN player_army_lib a ON a.n_roleid = r.n_roleid
 where  r.s_source <> 'pc'
GROUP BY
	r.n_roleid