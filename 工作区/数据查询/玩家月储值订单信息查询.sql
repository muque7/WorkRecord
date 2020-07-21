订单创建时间	订单支付时间	订单创建日期	订单支付日期	储值美金	订单号	外部订单号	元宝数量	充值金额	订单状态	是否发放元宝	是否实际收款	设备ID	用户UID	虚拟余额	实际花费的虚拟余额	语言	货币类型	付款方式	玩家ID	玩家昵称	服务器昵称	国家	礼包名称	礼包价格	礼包货币类型
--台湾黑道google、apple储值订单
SELECT
  `po`.`create_time` AS `order_create_time`,
  `po`.`pay_time` AS `order_pay_time`,
  FROM_UNIXTIME(po.create_time) AS order_create_date,
  FROM_UNIXTIME(po.pay_time) AS order_pay_date,
  ROUND(po.pay_amount*po.exchange,2) AS pay_dollars,
  `po`.`order_sn`,
  `po`.`tradeseq`,
  `po`.`yuanbao_amount`,
  `po`.`pay_amount`,
  `po`.`order_status`,
  `po`.`offer_yuanbao`,
  `po`.`get_payment`,
  `po`.`device_id`,
  `po`.`pay_user_id`,
  `po`.`virtual_amount`,
  `po`.`cost_amount`,
  `po`.`attribute_lang`,
  `cy`.`currency_name`,
  `pm`.`method_name`,
  `cp`.`player_id`,
  `cp`.`player_name`,
  `sl`.`server_name`,
  CONCAT(pay_ip,'(',country_region,')') AS pay_ip_country,
  CONCAT(gl.giftbag_class,"-",gl.giftbag_name) AS giftbag_name,
  `gl`.`price` AS `gitftbag_price`,
  `gcy`.`currency_name` AS `giftbag_currency_name`
FROM
  `payment`.`pay_order` AS `po`
INNER JOIN
  `qiqiwu`.`server_list_new` AS `sl`
ON
  `sl`.`game_server_id` = `po`.`game_server_id`
  AND `sl`.`game_id` = `po`.`game_id`
INNER JOIN
  `total`.`create_player_93` AS `cp`
ON
  `cp`.`player_id` = `po`.`player_id`
INNER JOIN
  `payment`.`pay_method_new` AS `pm`
ON
  `pm`.`pay_type_id` = `po`.`pay_type_id`
  AND `pm`.`method_id` = `po`.`method_id`
LEFT JOIN
  `payment`.`giftbag_list` AS `gl`
ON
  `gl`.`game_id` = `po`.`game_id`
  AND `gl`.`giftbag_id` = `po`.`giftbag_id`
INNER JOIN
  `payment`.`currency` AS `cy`
ON
  `cy`.`currency_id` = `po`.`currency`
LEFT JOIN
  `payment`.`currency` AS `gcy`
ON
  `gcy`.`currency_id` = `gl`.`currency`
WHERE
  `po`.`game_id` = 93
  AND `po`.`pay_type_id` = 16
  AND `po`.`tradeseq` NOT LIKE('TEST%')
  AND po.get_payment=1
  AND `po`.`offer_yuanbao` = 1
  AND `po`.`create_time` >= UNIX_TIMESTAMP('2020-01-01 00:00:00')
  AND `po`.`create_time` <= UNIX_TIMESTAMP('2020-01-31 23:59:59')
  AND `po`.`order_sn` NOT IN(
  SELECT
    order_sn
  FROM
    `payment`.`refund_order`
  WHERE
    game_id=93
    AND refund_type='refund' )
ORDER BY
  `po`.`create_time` DESC

--导出是游戏时间
select
`po`.`create_time` as `order_create_time`,
`po`.`pay_time` as `order_pay_time`,
CONVERT_TZ(FROM_UNIXTIME(po.create_time),@@global.time_zone,'+00:00') as order_create_date,
CONVERT_TZ(FROM_UNIXTIME(po.pay_time),@@global.time_zone,'+00:00') as order_pay_date,
ROUND(po.pay_amount*po.exchange,2) as pay_dollars,
`po`.`order_sn`, `po`.`tradeseq`, `po`.`yuanbao_amount`, `po`.`pay_amount`, `po`.`order_status`,
`po`.`offer_yuanbao`, `po`.`get_payment`, `po`.`device_id`, `po`.`pay_user_id`,
`po`.`virtual_amount`, `po`.`cost_amount`, `po`.`attribute_lang`,
`cy`.`currency_name`,
`pm`.`method_name`,
`cp`.`player_id`, `cp`.`player_name`,
`sl`.`server_name`,
concat(pay_ip,'(',country_region,')') as pay_ip_country,
concat(gl.giftbag_class,"-",gl.giftbag_name) as giftbag_name, `gl`.`price` as `gitftbag_price`,
`gcy`.`currency_name` as `giftbag_currency_name`
from `payment`.`pay_order` as `po`
inner join `qiqiwu`.`server_list_new` as `sl` on `sl`.`game_server_id` = `po`.`game_server_id` and `sl`.`game_id` = `po`.`game_id`
inner join `total`.`create_player_93` as `cp` on `cp`.`player_id` = `po`.`player_id`
inner join `payment`.`pay_method_new` as `pm` on `pm`.`pay_type_id` = `po`.`pay_type_id` and `pm`.`method_id` = `po`.`method_id`
left join `payment`.`giftbag_list` as `gl` on `gl`.`game_id` = `po`.`game_id` and `gl`.`giftbag_id` = `po`.`giftbag_id`
inner join `payment`.`currency` as `cy` on `cy`.`currency_id` = `po`.`currency`
left join `payment`.`currency` as `gcy` on `gcy`.`currency_id` = `gl`.`currency`
where `po`.`game_id` = 93 and `po`.`pay_type_id` = 15 and `po`.`tradeseq` not like('TEST%') and po.get_payment=1 and `po`.`offer_yuanbao` = 1
and `po`.`create_time` >= 1588291200 and `po`.`create_time` <= 1590969599 and `po`.`order_sn` not in(
    select order_sn FROM `payment`.`refund_order` WHERE game_id=93 and refund_type='refund'
)
order by `po`.`order_id` DESC


-- 查询下载出来的是北京时间

set time_zone='+0:00';
select 
`po`.`create_time` as `order_create_time`, 
`po`.`pay_time` as `order_pay_time`, 
FROM_UNIXTIME(po.create_time) as order_create_date, 
FROM_UNIXTIME(po.pay_time) as order_pay_date, 
ROUND(po.pay_amount*po.exchange,2) as pay_dollars, 
`po`.`order_sn`, `po`.`tradeseq`, `po`.`yuanbao_amount`, `po`.`pay_amount`, `po`.`order_status`, 
`po`.`offer_yuanbao`, `po`.`get_payment`, `po`.`device_id`, `po`.`pay_user_id`, 
`po`.`virtual_amount`, `po`.`cost_amount`, `po`.`attribute_lang`, 
`cy`.`currency_name`, 
`pm`.`method_name`, 
`cp`.`player_id`, `cp`.`player_name`, 
`sl`.`server_name`, 
concat(pay_ip,'(',country_region,')') as pay_ip_country, 
concat(gl.giftbag_class,"-",gl.giftbag_name) as giftbag_name, `gl`.`price` as `gitftbag_price`,
`gcy`.`currency_name` as `giftbag_currency_name`
from `payment_61`.`pay_order` as `po` 
inner join `qiqiwu_61`.`server_list_new` as `sl` on `sl`.`game_server_id` = `po`.`game_server_id` and `sl`.`game_id` = `po`.`game_id` 
inner join `total`.`create_player_97` as `cp` on `cp`.`player_id` = `po`.`player_id` 
inner join `payment_61`.`pay_method_new` as `pm` on `pm`.`pay_type_id` = `po`.`pay_type_id` and `pm`.`method_id` = `po`.`method_id` 
left join `payment_61`.`giftbag_list` as `gl` on `gl`.`game_id` = `po`.`game_id` and `gl`.`giftbag_id` = `po`.`giftbag_id` 
inner join `payment_61`.`currency` as `cy` on `cy`.`currency_id` = `po`.`currency`
left join `payment_61`.`currency` as `gcy` on `gcy`.`currency_id` = `gl`.`currency` 
where `po`.`game_id` = 97 and `po`.`pay_type_id` = 15 and `po`.`tradeseq` not like('TEST%') and po.get_payment=1 and `po`.`offer_yuanbao` = 1
and `po`.`create_time` >= 1579478400 and `po`.`create_time` <= 1580515199 and `po`.`order_sn` not in(
    select order_sn FROM `payment_61`.`refund_order` WHERE game_id=97 and refund_type='refund'
) 
order by `po`.`order_id` DESC

--查询下载出来的是游戏时间

select
`po`.`create_time` as `order_create_time`,
`po`.`pay_time` as `order_pay_time`,
CONVERT_TZ(FROM_UNIXTIME(po.create_time),@@global.time_zone,'+00:00') as order_create_date,
CONVERT_TZ(FROM_UNIXTIME(po.pay_time),@@global.time_zone,'+00:00') as order_pay_date,
ROUND(po.pay_amount*po.exchange,2) as pay_dollars,
`po`.`order_sn`, `po`.`tradeseq`, `po`.`yuanbao_amount`, `po`.`pay_amount`, `po`.`order_status`,
`po`.`offer_yuanbao`, `po`.`get_payment`, `po`.`device_id`, `po`.`pay_user_id`,
`po`.`virtual_amount`, `po`.`cost_amount`, `po`.`attribute_lang`,
`cy`.`currency_name`,
`pm`.`method_name`,
`cp`.`player_id`, `cp`.`player_name`,
`sl`.`server_name`,
concat(pay_ip,'(',country_region,')') as pay_ip_country,
concat(gl.giftbag_class,"-",gl.giftbag_name) as giftbag_name, `gl`.`price` as `gitftbag_price`,
`gcy`.`currency_name` as `giftbag_currency_name`
from `payment_61`.`pay_order` as `po`
inner join `qiqiwu_61`.`server_list_new` as `sl` on `sl`.`game_server_id` = `po`.`game_server_id` and `sl`.`game_id` = `po`.`game_id`
inner join `total`.`create_player_97` as `cp` on `cp`.`player_id` = `po`.`player_id`
inner join `payment_61`.`pay_method_new` as `pm` on `pm`.`pay_type_id` = `po`.`pay_type_id` and `pm`.`method_id` = `po`.`method_id`
left join `payment_61`.`giftbag_list` as `gl` on `gl`.`game_id` = `po`.`game_id` and `gl`.`giftbag_id` = `po`.`giftbag_id`
inner join `payment_61`.`currency` as `cy` on `cy`.`currency_id` = `po`.`currency`
left join `payment_61`.`currency` as `gcy` on `gcy`.`currency_id` = `gl`.`currency`
where `po`.`game_id` = 97 and `po`.`pay_type_id` = 16 and `po`.`tradeseq` not like('TEST%') and po.get_payment=1 and `po`.`offer_yuanbao` = 1
and `po`.`create_time` >= 1581292800 and `po`.`create_time` <= 1582156799 and `po`.`order_sn` not in(
    select order_sn FROM `payment_61`.`refund_order` WHERE game_id=97 and refund_type='refund'
)
order by `po`.`order_id` DESC


set time_zone='+0:00';
select 
`po`.`create_time` as `order_create_time`, 
`po`.`pay_time` as `order_pay_time`, 
FROM_UNIXTIME(po.create_time) as order_create_date, 
FROM_UNIXTIME(po.pay_time) as order_pay_date, 
ROUND(po.pay_amount*po.exchange,2) as pay_dollars, 
`po`.`order_sn`, `po`.`tradeseq`, `po`.`yuanbao_amount`, `po`.`pay_amount`, `po`.`order_status`, 
`po`.`offer_yuanbao`, `po`.`get_payment`, `po`.`device_id`, `po`.`pay_user_id`, 
`po`.`virtual_amount`, `po`.`cost_amount`, `po`.`attribute_lang`, 
`cy`.`currency_name`, 
`pm`.`method_name`, 
`cp`.`player_id`, `cp`.`player_name`, 
`sl`.`server_name`, 
concat(pay_ip,'(',country_region,')') as pay_ip_country, 
concat(gl.giftbag_class,"-",gl.giftbag_name) as giftbag_name, `gl`.`price` as `gitftbag_price`,
`gcy`.`currency_name` as `giftbag_currency_name`
from `payment_61`.`pay_order` as `po` 
inner join `qiqiwu_61`.`server_list_new` as `sl` on `sl`.`game_server_id` = `po`.`game_server_id` and `sl`.`game_id` = `po`.`game_id` 
inner join `total`.`create_player_107` as `cp` on `cp`.`player_id` = `po`.`player_id` 
inner join `payment_61`.`pay_method_new` as `pm` on `pm`.`pay_type_id` = `po`.`pay_type_id` and `pm`.`method_id` = `po`.`method_id` 
left join `payment_61`.`giftbag_list` as `gl` on `gl`.`game_id` = `po`.`game_id` and `gl`.`giftbag_id` = `po`.`giftbag_id` 
inner join `payment_61`.`currency` as `cy` on `cy`.`currency_id` = `po`.`currency`
left join `payment_61`.`currency` as `gcy` on `gcy`.`currency_id` = `gl`.`currency` 
where `po`.`game_id` = 107 and `po`.`pay_type_id` = 16 and `po`.`tradeseq` not like('TEST%') and po.get_payment=1 and `po`.`offer_yuanbao` = 1
and `po`.`create_time` >= 1577836800 and `po`.`create_time` <= 1580515199 and `po`.`order_sn` not in(
    select order_sn FROM `payment_61`.`refund_order` WHERE game_id=107 and refund_type='refund'
)  
order by `po`.`create_time` DESC






set time_zone='+0:00';
select 
`po`.`create_time` as `order_create_time`, 
`po`.`pay_time` as `order_pay_time`, 
FROM_UNIXTIME(po.create_time) as order_create_date, 
FROM_UNIXTIME(po.pay_time) as order_pay_date, 
ROUND(po.pay_amount*po.exchange,2) as pay_dollars, 
`po`.`order_sn`, `po`.`tradeseq`, `po`.`yuanbao_amount`, `po`.`pay_amount`, `po`.`order_status`, 
`po`.`offer_yuanbao`, `po`.`get_payment`, `po`.`device_id`, `po`.`pay_user_id`, 
`po`.`virtual_amount`, `po`.`cost_amount`, `po`.`attribute_lang`, 
`cy`.`currency_name`, 
`pm`.`method_name`, 
`cp`.`player_id`, `cp`.`player_name`, 
`sl`.`server_name`, 
concat(pay_ip,'(',country_region,')') as pay_ip_country, 
concat(gl.giftbag_class,"-",gl.giftbag_name) as giftbag_name, `gl`.`price` as `gitftbag_price`,
`gcy`.`currency_name` as `giftbag_currency_name`
from `payment_29`.`pay_order` as `po` 
inner join `qiqiwu_29`.`server_list_new` as `sl` on `sl`.`game_server_id` = `po`.`game_server_id` and `sl`.`game_id` = `po`.`game_id` 
inner join `total`.`create_player_115` as `cp` on `cp`.`player_id` = `po`.`player_id` 
inner join `payment_29`.`pay_method_new` as `pm` on `pm`.`pay_type_id` = `po`.`pay_type_id` and `pm`.`method_id` = `po`.`method_id` 
left join `payment_29`.`giftbag_list` as `gl` on `gl`.`game_id` = `po`.`game_id` and `gl`.`giftbag_id` = `po`.`giftbag_id` 
inner join `payment_29`.`currency` as `cy` on `cy`.`currency_id` = `po`.`currency`
left join `payment_29`.`currency` as `gcy` on `gcy`.`currency_id` = `gl`.`currency` 
where `po`.`game_id` = 115 and `po`.`pay_type_id` = 16 and `po`.`tradeseq` not like('TEST%') and po.get_payment=1 and `po`.`offer_yuanbao` = 1 
and `po`.`create_time` >= 1577836800 and `po`.`create_time` <= 1580515199 and `po`.`order_sn` not in(
    select order_sn FROM `payment_29`.`refund_order` WHERE game_id=115 and refund_type='refund'
)  
order by `po`.`create_time` DESC