SELECT
t.n_roleid
,r.s_rolename
,max(case t.n_tid when 3020 then  1 else 0 end ) 每日签到1次
,max(case t.n_tid when 3021 then  1 else 0 end ) 普通宴请武将1次
,max(case t.n_tid when 3022 then  1 else 0 end ) 豪华宴请武将1次
,max(case t.n_tid when 3023 then  1 else 0 end ) 在军团中捐献1次
,max(case t.n_tid when 3024 then  1 else 0 end ) 在军团帮助其他盟友25次
,max(case t.n_tid when 3025 then  1 else 0 end ) 在书院研究科技1次
,max(case t.n_tid when 3026 then  1 else 0 end ) 在世界中消灭黄巾贼5次
,max(case t.n_tid when 3027 then  1 else 0 end ) 成功升级城池内的建筑物1次
,max(case t.n_tid when 3028 then  1 else 0 end ) 在兵营中训练任意兵种士兵250个
,max(case t.n_tid when 3029 then  1 else 0 end ) 采集木材达到30000
,max(case t.n_tid when 3030 then  1 else 0 end ) 采集食物到达30000
,max(case t.n_tid when 3031 then  1 else 0 end ) 采集石头达到6000
,max(case t.n_tid when 3032 then  1 else 0 end ) 采集铁矿达到3000
,max(case t.n_tid when 3033 then  1 else 0 end ) 在医馆中治疗伤兵1次
,max(case t.n_tid when 3034 then  1 else 0 end ) 侦查敌情1次
,max(case t.n_tid when 3035 then  1 else 0 end ) 击杀其他势力玩家1次
FROM
	player_daily_task t,
player_roles r
WHERE

	TO_DAYS(NOW()) - TO_DAYS(t.d_reset_start_time) = 1
and t.n_status >= 2
and t.n_roleid = r.n_roleid
GROUP BY t.n_roleid