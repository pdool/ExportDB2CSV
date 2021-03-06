SELECT
  r.n_roleid 								角色ID,
  r.s_rolename 							角色名,
  r.d_create 								注册时间,
  p.d_last_online 					最近登录时间,
  p.n_online_time 					在线时长,
  b.n_lv 										官邸等级,
  po.n_power								总战斗力,
  acc.n_gtoken							剩余元宝,
  tp.n_value                剩余公会贡献,
  p.n_food 									剩余粮,
  p.n_wood 									剩余木,
  p.n_stone 								剩余石,
  p.n_iron_ore 							剩余铁,
  IFNULL(v.	n_vip_lvl,0)							vip等级

FROM
  player_roles r,
  player_type_property tp,
  player_property p,
  player_build_lvl b,
  player_power po,
  acc_balance acc
  LEFT JOIN player_vip v on v.n_roleid = acc.n_roleid
WHERE
  r.n_roleid = p.n_roleid
  AND r.n_roleid = b.n_roleid
  AND r.n_roleid = po.n_roleid
  AND r.n_roleid = acc.n_roleid
  and r.n_roleid = tp.n_roleid
  and tp.n_type = 112
  AND b.n_bid = 101
  and  DATE_FORMAT(p.d_last_online, "%Y_%m_%d") = {dayStr}
AND  r.s_source <> 'pc'