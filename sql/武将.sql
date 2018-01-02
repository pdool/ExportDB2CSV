select 
	t.n_role_id
,r.s_rolename
, (case t.rownum when 1 then dh.s_name else '' end ) 武将1
,(case t.rownum when 1 then t.n_total_fight else 0 end ) 战力1
,(case t.rownum when 1 then t.n_cur_lvl else 0 end ) 武将等级1
,(case t.rownum when 1 then t.s_skill_lvl else 0 end ) 技能等级1

, (case t.rownum when 2 then dh.s_name else '' end ) 武将2
,(case t.rownum when 2 then t.n_total_fight else 0 end ) 战力2
,(case t.rownum when 2 then t.n_cur_lvl else 0 end ) 武将等级2
,(case t.rownum when 2 then t.s_skill_lvl else 0 end ) 技能等级2

, (case t.rownum when 3 then dh.s_name else '' end ) 武将3
,(case t.rownum when 3 then t.n_total_fight else 0 end ) 战力3
,(case t.rownum when 3 then t.n_cur_lvl else 0 end ) 武将等级3
,(case t.rownum when 3 then t.s_skill_lvl else 0 end ) 技能等级3

, (case t.rownum when 4 then dh.s_name else '' end ) 武将4
,(case t.rownum when 4 then t.n_total_fight else 0 end ) 战力4
,(case t.rownum when 4 then t.n_cur_lvl else 0 end ) 武将等级4
,(case t.rownum when 4 then t.s_skill_lvl else 0 end ) 技能等级4

, (case t.rownum when 5 then dh.s_name else '' end ) 武将5
,(case t.rownum when 5 then t.n_total_fight else 0 end ) 战力5
,(case t.rownum when 5 then t.n_cur_lvl else 0 end ) 武将等级5
,(case t.rownum when 5 then t.s_skill_lvl else 0 end ) 技能等级5

, (case t.rownum when 6 then dh.s_name else '' end ) 武将6
,(case t.rownum when 6 then t.n_total_fight else 0 end ) 战力6
,(case t.rownum when 6 then t.n_cur_lvl else 0 end ) 武将等级6
,(case t.rownum when 6 then t.s_skill_lvl else 0 end ) 技能等级6

, (case t.rownum when 7 then dh.s_name else '' end ) 武将7
,(case t.rownum when 7 then t.n_total_fight else 0 end ) 战力7
,(case t.rownum when 7 then t.n_cur_lvl else 0 end ) 武将等级7
,(case t.rownum when 7 then t.s_skill_lvl else 0 end ) 技能等级7

, (case t.rownum when 8 then dh.s_name else '' end ) 武将8
,(case t.rownum when 8 then t.n_total_fight else 0 end ) 战力8
,(case t.rownum when 8 then t.n_cur_lvl else 0 end ) 武将等级8
,(case t.rownum when 8 then t.s_skill_lvl else 0 end ) 技能等级8

, (case t.rownum when 9 then dh.s_name else '' end ) 武将9
,(case t.rownum when 9 then t.n_total_fight else 0 end ) 战力9
,(case t.rownum when 9 then t.n_cur_lvl else 0 end ) 武将等级9
,(case t.rownum when 9 then t.s_skill_lvl else 0 end ) 技能等级9

, (case t.rownum when 10 then dh.s_name else '' end ) 武将10
,(case t.rownum when 10 then t.n_total_fight else 0 end ) 战力10
,(case t.rownum when 10 then t.n_cur_lvl else 0 end ) 武将等级10
,(case t.rownum when 10 then t.s_skill_lvl else 0 end ) 技能等级10
-- ,t.*
 from 
(SELECT
	
	( @i := CASE WHEN @pre_parent_code = h.n_role_id THEN @i + 1 ELSE 1 END ) rownum,
	h.*, 
	( @pre_parent_code := h.n_role_id )
FROM
	player_emp_hero h,
	(
		SELECT
			@i := 0,
			@pre_parent_code := ''
	) AS a
GROUP BY
	h.n_role_id,h.n_hid
ORDER BY
	h.n_role_id) t,
dict_hero_info dh ,
player_roles r
where t.rownum <= 10

and dh.n_hid = t.n_hid
and r.n_roleid = t.n_role_id

