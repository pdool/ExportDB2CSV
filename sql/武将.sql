select
  t.n_role_id
  ,r.s_rolename
  , max(case t.rownum when 1 then dh.s_name else '' end ) 武将1
  , max(case t.rownum when 1 then t.n_total_fight else 0 end ) 战力1
  , max(case t.rownum when 1 then t.n_cur_lvl else 0 end ) 武将等级1
  , max(case t.rownum when 1 then t.s_skill_lvl else 0 end ) 技能等级1
  --
  , max(case t.rownum when 2 then dh.s_name else '' end ) 武将2
  , max(case t.rownum when 2 then t.n_total_fight else 0 end ) 战力2
  , max(case t.rownum when 2 then t.n_cur_lvl else 0 end ) 武将等级2
  , max(case t.rownum when 2 then t.s_skill_lvl else 0 end ) 技能等级2
  --
  , max(case t.rownum when 3 then dh.s_name else '' end ) 武将3
  , max(case t.rownum when 3 then t.n_total_fight else 0 end ) 战力3
  , max(case t.rownum when 3 then t.n_cur_lvl else 0 end ) 武将等级3
  , max(case t.rownum when 3 then t.s_skill_lvl else 0 end ) 技能等级3

  , max(case t.rownum when 4 then dh.s_name else '' end ) 武将4
  , max(case t.rownum when 4 then t.n_total_fight else 0 end ) 战力4
  , max(case t.rownum when 4 then t.n_cur_lvl else 0 end ) 武将等级4
  , max(case t.rownum when 4 then t.s_skill_lvl else 0 end ) 技能等级4

  , max(case t.rownum when 5 then dh.s_name else '' end ) 武将5
  , max(case t.rownum when 5 then t.n_total_fight else 0 end ) 战力5
  , max(case t.rownum when 5 then t.n_cur_lvl else 0 end ) 武将等级5
  , max(case t.rownum when 5 then t.s_skill_lvl else 0 end ) 技能等级5
  --
  , max(case t.rownum when 6 then dh.s_name else '' end ) 武将6
  , max(case t.rownum when 6 then t.n_total_fight else 0 end ) 战力6
  , max(case t.rownum when 6 then t.n_cur_lvl else 0 end ) 武将等级6
  , max(case t.rownum when 6 then t.s_skill_lvl else 0 end ) 技能等级6

  , max(case t.rownum when 7 then dh.s_name else '' end ) 武将7
  , max(case t.rownum when 7 then t.n_total_fight else 0 end ) 战力7
  , max(case t.rownum when 7 then t.n_cur_lvl else 0 end ) 武将等级7
  , max(case t.rownum when 7 then t.s_skill_lvl else 0 end ) 技能等级7

  , max(case t.rownum when 8 then dh.s_name else '' end ) 武将8
  , max(case t.rownum when 8 then t.n_total_fight else 0 end ) 战力8
  , max(case t.rownum when 8 then t.n_cur_lvl else 0 end ) 武将等级8
  , max(case t.rownum when 8 then t.s_skill_lvl else 0 end ) 技能等级8

  , max(case t.rownum when 9 then dh.s_name else '' end ) 武将9
  , max(case t.rownum when 9 then t.n_total_fight else 0 end ) 战力9
  , max(case t.rownum when 9 then t.n_cur_lvl else 0 end ) 武将等级9
  , max(case t.rownum when 9 then t.s_skill_lvl else 0 end ) 技能等级9

  , max(case t.rownum when 10 then dh.s_name else '' end ) 武将10
  , max(case t.rownum when 10 then t.n_total_fight else 0 end ) 战力10
  , max(case t.rownum when 10 then t.n_cur_lvl else 0 end ) 武将等级10
  , max(case t.rownum when 10 then t.s_skill_lvl else 0 end ) 技能等级10

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
GROUP BY r.n_roleid
