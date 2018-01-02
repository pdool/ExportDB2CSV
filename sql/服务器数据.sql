SELECT
	(
		SELECT
			s_value
		FROM
			dict_keyvalue
		WHERE
			s_key = "server_open"
	) ����ʱ��,
	(
		SELECT
			count(*)
		FROM
			union_info
	) ��������,
	(
		SELECT
			s_value
		FROM
			group_info
		WHERE
			n_type = 1
		AND s_sub_type = 0
	) Ұ�ֵȼ�,
	cao ����������,
	sun ����������,
	liu ����������,
	lv ����������,
	wu ����������,
	callNum �����Ҿ�ɽկ����,
	beatNum �����Ҿ�ɽկ����
FROM
	(
		SELECT
			COUNT(
				CASE
				WHEN n_ingroup = 1 THEN
					1
				END
			) cao,
			COUNT(
				CASE
				WHEN n_ingroup = 2 THEN
					1
				END
			) sun,
			COUNT(
				CASE
				WHEN n_ingroup = 3 THEN
					1
				END
			) liu,
			COUNT(
				CASE
				WHEN n_ingroup = 4 THEN
					1
				END
			) lv,
			COUNT(
				CASE
				WHEN n_ingroup = 5 THEN
					1
				END
			) han,
			COUNT(
				CASE
				WHEN n_ingroup = 0 THEN
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
				WHEN s_atype = 357 THEN
					1
				END
			) callNum,
			count(
				CASE
				WHEN s_atype = 358 THEN
					1
				END
			) beatNum
		FROM
			{logdb.}log_player_action{date}
		WHERE
			DATE_FORMAT(d_create, "%Y_%m") = DATE_FORMAT(NOW(), "%Y_%m")
	) enemy;

