SELECT
  (SELECT count(DISTINCT n_uid)
   FROM {db.}union_member
   WHERE n_roleid IN (SELECT DISTINCT substring_index(s_extend_info, "|", 1)
                      FROM {logdb.}log_military_situation{date}
                      WHERE (n_target_type = 4 OR n_target_type = 5) AND n_type = 7  AND DATE_FORMAT(d_createtime, "%Y_%m_%d") = {dayStr}
                      UNION
                      SELECT DISTINCT n_attack_id
                      FROM {logdb.}log_military_situation{date}
                      WHERE (n_target_type = 4 OR n_target_type = 5) AND n_type = 8  AND DATE_FORMAT(d_createtime, "%Y_%m_%d") = {dayStr} ))                    皇城战参与军团数,
  (SELECT count(DISTINCT n_uid)
   FROM {db.}union_member
   WHERE n_roleid IN (SELECT DISTINCT substring_index(s_extend_info, "|", 1)
                      FROM {logdb.}log_military_situation{date}
                      WHERE (n_target_type = 6 OR n_target_type = 7 OR n_target_type = 8) AND n_type = 7 AND DATE_FORMAT(d_createtime, "%Y_%m_%d") = {dayStr}
                      UNION
                      SELECT DISTINCT n_attack_id
                      FROM {logdb.}log_military_situation{date}
                      WHERE (n_target_type = 6 OR n_target_type = 7 OR n_target_type = 8) AND n_type = 9 AND DATE_FORMAT(d_createtime, "%Y_%m_%d") = {dayStr})) 势力战参与军团数,
  (SELECT count(*)
   FROM {db.}npc_city_occupy where    DATE_FORMAT(d_occupy_time, "%Y_%m_%d") = {dayStr} )                                                               势力战占领城市数量;
