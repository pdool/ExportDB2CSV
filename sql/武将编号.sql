SELECT
	-- rownum  判断  @pre_parent_code是否和当前的parent_code一样 ，true:让 @i+=1 false:重置@i
	( @i := CASE WHEN @pre_parent_code = h.n_role_id THEN @i + 1 ELSE 1 END ) rownum,
	h.*, --  设置 @pre_parent_code等于上一个 parent_code 
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
	h.n_role_id