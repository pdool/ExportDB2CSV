SELECT
	t.n_roleid 角色ID
,t.s_type 赠送类型
,t.n_gtoken 赠送钻石数
,t.s_extend 赠送时等级
,t.d_create 赠送时间
FROM
	acc_handsel t
WHERE  DATEDIFF(d_create,NOW())=-3