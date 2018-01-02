SELECT
	t.n_roleid
	,SUBSTRING_INDEX(SUBSTRING_INDEX(t.s_ext,'|',2),"|",-1)+0 道具id
	, e.s_desc 道具名称
	,(substring_index(substring_index(t.s_rewards,'_', 2),"_",-1)+0 - SUBSTRING_INDEX(substring_index(t.s_rewards,'_', -1),"_",-1)+0) 消费个人贡献数

, substring_index(substring_index(s_ext,'_', -2),'_', 1) 购买时等级
	, substring_index(s_ext,'_', -1) 购买时战力
	,t.d_time 购买时间
FROM
	unity3dm_cn_cn_log.log_reward2017_12 t,
	unity3dm_chongxin_db.dict_exchange_template e

	
where 
t.n_type = 2 
and LEFT(t.s_rewards,4) = '112_'
and e.n_id = SUBSTRING_INDEX(SUBSTRING_INDEX(t.s_ext,'|',2),"|",-1)+0