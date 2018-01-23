SELECT
  DISTINCT
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
FROM {db.}player_roles
  LEFT JOIN
  (SELECT
     n_roleid,
     n_online
   FROM {db.}log_player_daily_online
   WHERE d_date = {dayStr}) temp1 ON player_roles.n_roleid = temp1.n_roleid
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
      FROM {logdb.}log_player_action{date}
      WHERE s_atype = 371 AND DATE_FORMAT(d_create, "%Y_%m_%d") ={dayStr}) temp999 GROUP BY n_roleid) temp2
    ON player_roles.n_roleid = temp2.n_roleid
  LEFT JOIN



  (SELECT
	t.n_roleid,
	sum(c.n_total_points) daily
FROM
{db.}player_daily_task t,
{db.}dict_daily_task c
WHERE
	DATE_FORMAT(
		d_reset_start_time,
		"%Y_%m_%d"
	) = {dayStr}
and t.n_status = 2
and c.n_tid = t.n_tid
GROUP BY t.n_roleid) temp3
    ON player_roles.n_roleid = temp3.n_roleid
  LEFT JOIN



  (SELECT
     n_roleid,
     MAX(substring_index(s_event, '|', -1)) main
   FROM {logdb.}log_player_action{date}
   WHERE
     s_atype = 373 AND
     DATE_FORMAT(d_create, "%Y_%m_%d") = {dayStr}
   GROUP BY n_roleid) temp4 ON player_roles.n_roleid = temp4.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     COUNT(*) monster
   FROM {logdb.}log_player_action{date}
   WHERE s_atype = 357 AND DATE_FORMAT(d_create, "%Y_%m_%d") = {dayStr}
   GROUP BY n_roleid) temp5 ON player_roles.n_roleid = temp5.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     COUNT(*) yellow
   FROM {logdb.}log_player_action{date}
   WHERE s_atype = 360 AND DATE_FORMAT(d_create, "%Y_%m_%d") = {dayStr}
   GROUP BY n_roleid) temp6 ON player_roles.n_roleid = temp6.n_roleid
  LEFT JOIN


  (SELECT
     n_roleid,
     COUNT(*) enemy
   FROM {logdb.}log_player_action{date}
   WHERE s_atype = 359 AND DATE_FORMAT(d_create, "%Y_%m_%d") = {dayStr}
   GROUP BY n_roleid) temp7 ON player_roles.n_roleid = temp7.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     substring_index(s_event, '|', -1) donate
   FROM {logdb.}log_player_action{date}
   WHERE s_atype = 39 AND DATE_FORMAT(d_create, "%Y_%m_%d") = {dayStr}) temp8
    ON player_roles.n_roleid = temp8.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     COUNT(*) friend
   FROM {db.}player_friend
   GROUP BY n_roleid) temp9 ON player_roles.n_roleid = temp9.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     substring_index(substring_index(s_event, '|', 2), '|', -1) gift
   FROM {logdb.}log_player_action{date}
   WHERE s_atype = 374 AND DATE_FORMAT(d_create, "%Y_%m_%d") = {dayStr}) temp10
    ON player_roles.n_roleid = temp10.n_roleid
  LEFT JOIN

  (SELECT
     n_roleid,
     substring_index(substring_index(s_event, '|', 2), '|', -1) score
   FROM {logdb.}log_player_action{date}
   WHERE s_atype = 375 AND
         DATE_FORMAT(substring_index(d_create, '|', -1), "%Y-%m-%d") = {dayStr}) temp11
    ON player_roles.n_roleid = temp11.n_roleid

where s_source <> 'pc';












