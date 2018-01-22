SELECT
  temp4.LEVEL 野怪等级,
  totalNum    挑战总次数,
  totalRole   挑战总人数,
  victoryNum  成功总次数,
  defeatNum   失败总次数
FROM
  (
    SELECT
      LEVEL,
      count(*) totalNum
    FROM
      (
        SELECT
          n_roleid,
          SUBSTRING_INDEX(
              SUBSTRING_INDEX(s_event, "|", -2),
              "|",
              1
          ) LEVEL,
          SUBSTRING_INDEX(
              SUBSTRING_INDEX(s_event, "|", -2),
              "|", -1
          ) result
        FROM
          {logdb.}log_player_action{date}
                            WHERE
                            s_atype = 357
                            AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -3 DAY, "%Y_%m_%d")
      ) temp
    GROUP BY
      LEVEL
  ) temp3
  LEFT JOIN (
              SELECT
                LEVEL,
                count(*) totalRole
              FROM
                (
                  SELECT
                    LEVEL,
                    n_roleid
                  FROM
                    (
                      SELECT
                        n_roleid,
                        SUBSTRING_INDEX(
                            SUBSTRING_INDEX(s_event, "|", -2),
                            "|",
                            1
                        ) LEVEL,
                        SUBSTRING_INDEX(
                            SUBSTRING_INDEX(s_event, "|", -2),
                            "|", -1
                        ) result
                      FROM
                        {logdb.}log_player_action{date}
                                          WHERE
                                          s_atype = 357
                                          AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -3 DAY, "%Y_%m_%d")
                    ) temp
                  GROUP BY
                    LEVEL,
                    n_roleid
                ) temp1
              GROUP BY
                LEVEL
            ) temp2 ON temp3.LEVEL = temp2.LEVEL
  LEFT JOIN (
              SELECT
                LEVEL,
                count(*) victoryNum
              FROM
                (
                  SELECT
                    n_roleid,
                    SUBSTRING_INDEX(
                        SUBSTRING_INDEX(s_event, "|", -2),
                        "|",
                        1
                    ) LEVEL,
                    SUBSTRING_INDEX(
                        SUBSTRING_INDEX(s_event, "|", -2),
                        "|", -1
                    ) result
                  FROM
                    {logdb.}log_player_action{date}
                                      WHERE
                                      s_atype = 357
                                      AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -3 DAY, "%Y_%m_%d")
                ) temp
              WHERE
                result = 0
              GROUP BY
                LEVEL
            ) temp4 ON temp3.LEVEL = temp4.LEVEL
  LEFT JOIN (
              SELECT
                LEVEL,
                count(*) defeatNum
              FROM
                (
                  SELECT
                    n_roleid,
                    SUBSTRING_INDEX(
                        SUBSTRING_INDEX(s_event, "|", -2),
                        "|",
                        1
                    ) LEVEL,
                    SUBSTRING_INDEX(
                        SUBSTRING_INDEX(s_event, "|", -2),
                        "|", -1
                    ) result
                  FROM
                    {logdb.}log_player_action{date}
                                      WHERE
                                      s_atype = 357
                                      AND DATE_FORMAT(d_create, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -3 DAY, "%Y_%m_%d")
                ) temp
              WHERE
                result = 1
              GROUP BY
                LEVEL
            ) temp5 ON temp3.LEVEL = temp5.LEVEL;