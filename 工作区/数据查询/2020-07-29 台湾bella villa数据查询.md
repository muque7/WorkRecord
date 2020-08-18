### 2020-07-29 台湾bella villa数据查询

项目组：市场
 查询目的：更新受众表单
 查询内容：
 1、申请台湾bella villa用户中，时间是2019年11.1到2020年7.28，在游戏里有充值的用户的idfa和adid，以及他们付费的金额，第一列的是idfa和adid，第二列为付费金额。
 需求提出人：结萝
 期望完成时间：2020年7月29日

```sql
SELECT
  dl.advertising_id,
  pa.pay_dollar,
FROM
  villa_pf.v_player_attrs AS pa
JOIN
  villa_pf.v_device_list AS dl
USING
  (device_id)
WHERE
  pa.create_time BETWEEN '2019-11-01 00:00:00+0:00'
  AND '2020-07-29 00:00:00+0:00'
  AND pa.pay_dollar>0
  AND pa.attribute_lang ='zh'
  AND dl.create_time >= '1970-01-01 00:00:00+0:00'
  AND pa.last_act_time>='2019-11-01 00:00:00+0:00'
```

