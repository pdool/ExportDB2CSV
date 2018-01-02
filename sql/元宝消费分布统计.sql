SELECT
	t.n_roleid 角色ID
,t.s_type 消费类型
,t.n_gtoken 消费钻石数
,SUBSTRING_INDEX(SUBSTRING_INDEX(t.s_extend,"_",-2),"_",1) 消费时等级
, SUBSTRING_INDEX(t.s_extend,"_",-1) 消费时战力
,t.d_create 消费时间
FROM
	acc_reduce_log t