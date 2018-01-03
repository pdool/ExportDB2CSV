SELECT
  (SELECT count(DISTINCT n_uid)
   FROM unity3dm_yanghao_db.union_member
   WHERE n_roleid IN (SELECT DISTINCT substring_index(s_extend_info, "|", 1)
                      FROM log_military_situation2017_12
                      WHERE (n_target_type = 4 OR n_target_type = 5) AND n_type = 7  AND DATEDIFF(d_createtime,NOW())=-1
                      UNION
                      SELECT DISTINCT n_attack_id
                      FROM log_military_situation2017_12
                      WHERE (n_target_type = 4 OR n_target_type = 5) AND n_type = 8  AND DATEDIFF(d_createtime,NOW())=-1))                      皇城战参与军团数,
  (SELECT count(DISTINCT n_uid)
   FROM unity3dm_yanghao_db.union_member
   WHERE n_roleid IN (SELECT DISTINCT substring_index(s_extend_info, "|", 1)
                      FROM log_military_situation2017_12
                      WHERE (n_target_type = 6 OR n_target_type = 7 OR n_target_type = 8) AND n_type = 7 AND DATEDIFF(d_createtime,NOW())=-1
                      UNION
                      SELECT DISTINCT n_attack_id
                      FROM log_military_situation2017_12
                      WHERE (n_target_type = 6 OR n_target_type = 7 OR n_target_type = 8) AND n_type = 9 AND DATEDIFF(d_createtime,NOW())=-1)) 势力战参与军团数,
  (SELECT count(*)
   FROM unity3dm_yanghao_db.npc_city_occupy where DATEDIFF(d_occupy_time,NOW())=-1 )                                                               势力战占领城市数量;
