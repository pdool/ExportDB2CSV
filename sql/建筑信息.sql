SELECT
	r.n_roleid 角色id,
	r.s_rolename 角色名,
	r.d_create 注册时间,
-- ----------------------------------------------------
Max(CASE b.n_btype WHEN 1 THEN b.lv ELSE 0 END ) 官邸1,
Max(CASE b.n_btype WHEN 2 THEN b.lv ELSE 0 END ) 农田2,
Max(CASE b.n_btype WHEN 3 THEN b.lv ELSE 0 END ) 伐木场3,
Max(CASE b.n_btype WHEN 4 THEN b.lv ELSE 0 END ) 采石场4, 
Max(CASE b.n_btype WHEN 5 THEN b.lv ELSE 0 END ) 铁矿厂5,
Max(CASE b.n_btype WHEN 6 THEN b.lv ELSE 0 END ) 民居6, 
Max(CASE b.n_btype WHEN 7 THEN b.lv ELSE 0 END ) 训练营7,
Max(CASE b.n_btype WHEN 8 THEN b.lv ELSE 0 END ) 急救帐篷8, 
Max(CASE b.n_btype WHEN 9 THEN b.lv ELSE 0 END ) 兵营9,
Max(CASE b.n_btype WHEN 10 THEN b.lv ELSE 0 END ) 校场10, 
Max(CASE b.n_btype WHEN 11 THEN b.lv ELSE 0 END ) 酒馆11,
Max(CASE b.n_btype WHEN 12 THEN b.lv ELSE 0 END ) 医馆12 ,
Max(CASE b.n_btype WHEN 13 THEN b.lv ELSE 0 END ) 书院13 ,
Max(CASE b.n_btype WHEN 14 THEN b.lv ELSE 0 END ) 仓库14 ,
Max(CASE b.n_btype WHEN 15 THEN b.lv ELSE 0 END ) 哨塔15,
Max(CASE b.n_btype WHEN 16 THEN b.lv ELSE 0 END ) 农田16 ,
Max(CASE b.n_btype WHEN 17 THEN b.lv ELSE 0 END ) 城门17,
Max(CASE b.n_btype WHEN 18 THEN b.lv ELSE 0 END ) 器械工坊18 ,
Max(CASE b.n_btype WHEN 19 THEN b.lv ELSE 0 END ) 督军府19,
Max(CASE b.n_btype WHEN 20 THEN b.lv ELSE 0 END ) 谋略府20, 
Max(CASE b.n_btype WHEN 21 THEN b.lv ELSE 0 END ) 藏兵洞21
-- ----------------------------------------------------
FROM
	player_roles r,
 (
	SELECT
		bl.n_roleid,
		bl.n_btype,
		max(bl.n_lv) lv
	FROM
		player_build_lvl bl
	GROUP BY
		bl.n_roleid,
		bl.n_btype
) b 

WHERE
	b.n_roleid = r.n_roleid
GROUP BY r.n_roleid