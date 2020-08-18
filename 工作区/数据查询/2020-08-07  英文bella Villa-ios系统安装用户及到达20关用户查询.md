2020-08-07  英文bella Villa-ios系统安装用户及到达20关用户查询

项目组：bella Villa

查询目的：做Tiktok的数据源

查询内容：分两张表分别拉取以下数据：

英文bella villa ios系统 2020.06.01-08.01 所有安装用户的idfa

英文bella villa ios系统 2020.06.01-08.01 所有到达20关用户的idfa

需求提出人：戈薇

期望完成时间：2020年8月7日

```sql
select
	dl.advertising_id,
	max(pa.lev)
from
	villa_pf.v_device_list as dl
	join
	villa_pf.v_player_attrs as pa
	using
	(device_id)
where
	pa.create_time between '2020-06-01 00:00:00+0:00' and '2020-08-01 00:00:00+0:00'
	and pa.attribute_lang = 'en'
	and pa.last_act_time >='2020-06-01 00:00:00+0:00'
	and dl.os_type='ios'
	and dl.create_time between '2020-06-01 00:00:00+0:00' and '2020-08-01 00:00:00+0:00'
group by dl.advertising_id
```

