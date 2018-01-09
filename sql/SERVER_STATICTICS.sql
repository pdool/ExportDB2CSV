SELECT
  (
    SELECT s_value
    FROM
      dict_keyvalue
    WHERE
      s_key = "server_open"
  )       开服时间,
  (
    SELECT count(*)
    FROM
      union_info
  )       军团数量,
  (
    SELECT s_value
    FROM
      group_info
    WHERE
      n_type = 1
      AND s_sub_type = 0
  )       野怪等级,
  cao     曹势力人数,
  sun     孙势力人数,
  liu     刘势力人数,
  lv      吕势力人数,
  han     汉势力人数,
  wu      无势力人数,
  callNum 生成乱军山寨数量,
  beatNum 消灭乱军山寨数量
FROM
  (
    SELECT
      COUNT(
          CASE
          WHEN n_ingroup = 1
            THEN
              1
          END
      ) cao,
      COUNT(
          CASE
          WHEN n_ingroup = 2
            THEN
              1
          END
      ) sun,
      COUNT(
          CASE
          WHEN n_ingroup = 3
            THEN
              1
          END
      ) liu,
      COUNT(
          CASE
          WHEN n_ingroup = 4
            THEN
              1
          END
      ) lv,
      COUNT(
          CASE
          WHEN n_ingroup = 5
            THEN
              1
          END
      ) han,
      COUNT(
          CASE
          WHEN n_ingroup = 0
            THEN
              1
          END
      ) wu
    FROM
      player_property
  ) ingroup,
  (
    SELECT
      count(
          CASE
          WHEN s_atype = 357
            THEN
              1
          END
      ) callNum,
      count(
          CASE
          WHEN s_atype = 358 AND substring_index(substring_index(s_event, '|', 2), '|', -1) = 0
            THEN
              1
          END
      ) beatNum
    FROM
      {logdb.}log_player_action{date}
                        WHERE
                        DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -1 DAY , "%Y_%m_%d")
  ) enemy;

