SELECT
  np.n_roleid        角色id,
  np.s_rolename   角色名,
  sum(CASE n_type = 166 AND food > 0
      WHEN 1
        THEN
          food
      ELSE 0 END) 采集获取粮,
  sum(CASE n_type = 166 AND wood > 0
      WHEN 1
        THEN
          wood
      ELSE 0 END) 采集获取木,
  sum(CASE n_type = 166 AND stone > 0
      WHEN 1
        THEN
          stone
      ELSE 0 END) 采集获取石,
  sum(CASE n_type = 166 AND iron > 0
      WHEN 1
        THEN
          iron
      ELSE 0 END) 采集获取铁,
  sum(CASE n_type = 145 AND food > 0
      WHEN 1
        THEN
          food
      ELSE 0 END) 内城产出粮,
  sum(CASE n_type = 145 AND wood > 0
      WHEN 1
        THEN
          wood
      ELSE 0 END) 内城产出木,
  sum(CASE n_type = 145 AND stone > 0
      WHEN 1
        THEN
          stone
      ELSE 0 END) 内城产出石,
  sum(CASE n_type = 145 AND iron > 0
      WHEN 1
        THEN
          iron
      ELSE 0 END) 内城产出铁,
  sum(CASE n_type = 153 AND food > 0
      WHEN 1
        THEN
          food
      ELSE 0 END) 掠夺获取粮,
  sum(CASE n_type = 153 AND wood > 0
      WHEN 1
        THEN
          wood
      ELSE 0 END) 掠夺获取木,
  sum(CASE n_type = 153 AND stone > 0
      WHEN 1
        THEN
          stone
      ELSE 0 END) 掠夺获取石,
  sum(CASE n_type = 153 AND iron > 0
      WHEN 1
        THEN
          iron
      ELSE 0 END) 掠夺获取铁,
  sum(CASE n_type = 18 AND food > 0
      WHEN 1
        THEN
          food
      ELSE 0 END) 道具获取粮,
  sum(CASE n_type = 18 AND wood > 0
      WHEN 1
        THEN
          wood
      ELSE 0 END) 道具获取木,
  sum(CASE n_type = 18 AND stone > 0
      WHEN 1
        THEN
          stone
      ELSE 0 END) 道具获取石,
  sum(CASE n_type = 18 AND iron > 0
      WHEN 1
        THEN
          iron
      ELSE 0 END) 道具获取铁,
  sum(CASE n_type <> 166 AND n_type <> 145 AND n_type <> 153 AND n_type <> 18 AND food > 0
      WHEN 1
        THEN
          food
      ELSE 0 END) 其他获取粮,
  sum(CASE n_type <> 166 AND n_type <> 145 AND n_type <> 153 AND n_type <> 18 AND wood > 0
      WHEN 1
        THEN
          wood
      ELSE 0 END) 其他获取木,
  sum(CASE n_type <> 166 AND n_type <> 145 AND n_type <> 153 AND n_type <> 18 AND stone > 0
      WHEN 1
        THEN
          stone
      ELSE 0 END) 其他获取石,
  sum(CASE n_type <> 166 AND n_type <> 145 AND n_type <> 153 AND n_type <> 18 AND iron > 0
      WHEN 1
        THEN
          iron
      ELSE 0 END) 其他获取铁,
  sum(CASE n_type = 142 AND food < 0
      WHEN 1
        THEN
          -food
      ELSE 0 END) 建筑消耗粮,
  sum(CASE n_type = 142 AND wood < 0
      WHEN 1
        THEN
          -wood
      ELSE 0 END) 建筑消耗木,
  sum(CASE n_type = 142 AND stone < 0
      WHEN 1
        THEN
          -stone
      ELSE 0 END) 建筑消耗石,
  sum(CASE n_type = 142 AND iron < 0
      WHEN 1
        THEN
          -iron
      ELSE 0 END) 建筑消耗铁,
  sum(CASE n_type = 144 AND food < 0
      WHEN 1
        THEN
          -food
      ELSE 0 END) 研究消耗粮,
  sum(CASE n_type = 144 AND wood < 0
      WHEN 1
        THEN
          -wood
      ELSE 0 END) 研究消耗木,
  sum(CASE n_type = 144 AND stone < 0
      WHEN 1
        THEN
          -stone
      ELSE 0 END) 研究消耗石,
  sum(CASE n_type = 144 AND iron < 0
      WHEN 1
        THEN
          -iron
      ELSE 0 END) 研究消耗铁,
  sum(CASE n_type = 148 AND food < 0
      WHEN 1
        THEN
          -food
      ELSE 0 END) 招募消耗粮,
  sum(CASE n_type = 148 AND wood < 0
      WHEN 1
        THEN
          -wood
      ELSE 0 END) 招募消耗木,
  sum(CASE n_type = 148 AND stone < 0
      WHEN 1
        THEN
          -stone
      ELSE 0 END) 招募消耗石,
  sum(CASE n_type = 148 AND iron < 0
      WHEN 1
        THEN
          -iron
      ELSE 0 END) 招募消耗铁
FROM
  (SELECT
     n_roleid,
     n_type,
     (substring_index(
         (SELECT @tempFood := substring_index(substring_index(concat(',', s_rewards), ',101_', -1), ',', 1)), '_', -1))
     -
     (substring_index(
         @tempFood, '_', 1))  food,
     (substring_index(
         (SELECT @tempWood := substring_index(substring_index(concat(',', s_rewards), ',102_', -1), ',', 1)), '_', -1))
     -
     (substring_index(
         @tempWood, '_', 1))  wood,
     (substring_index(
         (SELECT @tempStone := substring_index(substring_index(concat(',', s_rewards), ',103_', -1), ',', 1)), '_', -1))
     -
     (substring_index(
         @tempStone, '_', 1)) stone,
     (substring_index(
         (SELECT @tempIron := substring_index(substring_index(concat(',', s_rewards), ',104_', -1), ',', 1)), '_', -1))
     -
     (substring_index(
         @tempIron, '_', 1))  iron
   FROM {logdb.}log_reward{date}
   WHERE DATE_FORMAT(d_time, "%Y_%m_%d") = DATE_FORMAT(NOW() + INTERVAL -3 DAY, "%Y_%m_%d")) tempReward,
  {db.}player_roles np
WHERE tempReward.n_roleid = np.n_roleid
AND  np.s_source <> 'pc'
GROUP BY tempReward.n_roleid;
