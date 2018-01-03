SELECT
  player_roles.n_roleid   角色id,
  player_roles.s_rolename 角色名,
  n_online                当日在线时长,
  common                  普通招募次数,
  luxury                  豪华招募次数,
  daily                   日常活跃值,
  main                    主线章节章节号,
  monster                 野外打怪次数,
  yellow                  黄巾军营寨次数,
  enemy                   叛军营寨次数,
  donate                  公会捐献类型,
  friend                  好友数量,
  gift                    赠送资源次数,
  score                   厉兵秣马积分
FROM unity3dm_cn_cn_wrddb.player_roles
  LEFT JOIN
  (SELECT
     n_roleid,
     n_online
   FROM unity3dm_cn_cn_wrddb.log_player_daily_online
   WHERE d_date = DATE_FORMAT(NOW() + INTERVAL -1 DAY, "%Y-%m-%d")) temp1 ON player_roles.n_roleid = temp1.n_roleid
  LEFT JOIN


  (SELECT
     n_roleid,
     SUM(
         CASE WHEN type = 1 OR type = 2
           THEN time
         ELSE 0
         END
     ) common,
     SUM(
         CASE WHEN type <> 1 AND type <> 2
           THEN time
         ELSE 0
         END
     ) luxury
   FROM
     (SELECT
        n_roleid,
        substring_index(substring_index(s_event, '|', -2), '|', 1)  type,
        substring_index(substring_index(s_event, '|', -2), '|', -1) time
      FROM log_player_action2018_1
      WHERE s_atype = 371 AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -1 DAY, "%Y_%m_%d")) temp999) temp2
    ON player_roles.n_roleid = temp2.n_roleid
  LEFT JOIN


  (SELECT
     n_roleid,
     MAX(substring_index(s_event, '|', -1)) daily
   FROM log_player_action2018_1
   WHERE s_atype = 372 AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -1 DAY, "%Y_%m_%d")) temp3
    ON player_roles.n_roleid = temp3.n_roleid
  LEFT JOIN


  (SELECT
     n_roleid,
     MAX(substring_index(s_event, '|', -1)) main
   FROM log_player_action2018_1
   WHERE
     DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -1 DAY, "%Y_%m_%d")
   GROUP BY n_roleid) temp4 ON player_roles.n_roleid = temp4.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     COUNT(*) monster
   FROM log_player_action2018_1
   WHERE s_atype = 357 AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -1 DAY, "%Y_%m_%d")
   GROUP BY n_roleid) temp5 ON player_roles.n_roleid = temp5.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     COUNT(*) yellow
   FROM log_player_action2018_1
   WHERE s_atype = 360 AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -1 DAY, "%Y_%m_%d")
   GROUP BY n_roleid) temp6 ON player_roles.n_roleid = temp6.n_roleid
  LEFT JOIN


  (SELECT
     n_roleid,
     COUNT(*) enemy
   FROM log_player_action2018_1
   WHERE s_atype = 359 AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -1 DAY, "%Y_%m_%d")
   GROUP BY n_roleid) temp7 ON player_roles.n_roleid = temp7.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     substring_index(s_event, '|', -1) donate
   FROM log_player_action2018_1
   WHERE s_atype = 39 AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -1 DAY, "%Y_%m_%d")) temp8
    ON player_roles.n_roleid = temp8.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     COUNT(*) friend
   FROM unity3dm_cn_cn_wrddb.player_friend
   GROUP BY n_roleid) temp9 ON player_roles.n_roleid = temp9.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     substring_index(substring_index(s_event, '|', 2), '|', -1) gift
   FROM log_player_action2018_1
   WHERE s_atype = 374 AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -1 DAY, "%Y_%m_%d")) temp10
    ON player_roles.n_roleid = temp10.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     substring_index(substring_index(s_event, '|', 2), '|', -1) score
   FROM log_player_action2018_1
   WHERE s_atype = 375 AND
         DATE_FORMAT(substring_index(s_event, '|', -1), "%Y-%m-%d") = DATE_FORMAT(NOW() + INTERVAL -1 DAY, "%Y-%m-%d")) temp11
    ON player_roles.n_roleid = temp11.n_roleid;












