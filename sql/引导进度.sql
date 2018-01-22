SELECT
	r.n_roleid  			角色id,
	r.s_rolename			角色名,
	r.d_create				创建时间,
	b.n_lv 						官邸等级,							
	g.n_guide_id      引导进度
FROM
	player_roles r,
	player_build_lvl b,
	player_property t
LEFT JOIN (
	SELECT
		MAX(n_guide_id) n_guide_id,
		n_roleid
	FROM
		player_force_guide 
	GROUP BY
		n_roleid
) g ON t.n_roleid = g.n_roleid


WHERE
	r.n_roleid = t.n_roleid
AND r.n_roleid = b.n_roleid
AND b.n_bid = 101
AND  r.s_source <> 'pc'