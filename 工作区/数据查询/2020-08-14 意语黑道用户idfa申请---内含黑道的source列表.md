### 2020-08-14 意语黑道用户idfa申请



项目组：意语黑道

查询目的：上传FB做LAL

查询内容：

2019年7月到现在，所有SOURCE=apple search ads， 地区=意大利的用户IDFA 以及LTV

需求提出人：牙仔

期望完成时间：20200814

```sql
SELECT
  dl.advertising_id,
  SUM(pa.pay_dollar) AS LTV
FROM
  mafia1_pf.v_device_list AS dl
JOIN
  mafia1_pf.v_player_attrs AS pa
USING
  (device_id)
WHERE
  dl.source='Apple Search Ads'
  AND dl.country_code='IT'
  AND dl.create_time>='2019-07-01 00:00:00+0:00'
  AND pa.last_act_time>='2019-07-01 00:00:00+0:00'
GROUP BY
  dl.advertising_id
```





查询数据之前，找一下apple search ads对应的source

```sql
select
dinstinct(source)
from
mafia1_pf.v_device_list
where create_time>='2020-08-10'
```

| 行   | source              |
| :--- | :------------------ |
| 1    | Organic             |
| 2    | Facebook Ads        |
| 3    | yahoojapan_int      |
| 4    | lap_int             |
| 5    | ironsource_int      |
| 6    | cyberagent-rin      |
| 7    | vungle_int          |
| 8    | bytedanceglobal_int |
| 9    | thingortwo          |
| 10   | au_store            |
| 11   | YakuzaXMafiaCity_PR |
| 12   | officialweb         |
| 13   | FBbutton            |
| 14   | RU-FBButton         |
| 15   | Fanpage             |
| 16   | KOL-xiaox           |
| 17   | skyflag_int         |
| 18   | None                |
| 19   | kol_k7              |
| 20   | googleadwords_int   |
| 21   | snapchat_int        |
| 22   | tapjoy_int          |
| 23   | cawincentive_int    |
| 24   | Apple Search Ads    |
| 25   | exmox_int           |
| 26   | yandexdirect_int    |
| 27   | amazon              |
| 28   | official_web_IOS    |
| 29   | seedapp_int         |
| 30   | KOL-ll              |
| 31   |                     |
| 32   | digitalads_int      |
| 33   | blindferret_int     |
| 34   | Metaps              |
| 35   | restricted          |
| 36   | mail.ru_int         |
| 37   | smaad_int           |
| 38   | mistplay_int        |
| 39   | FBButton            |
| 40   | FBShare             |
| 41   | TR-FBButton         |
| 42   | onestore            |
| 43   | Twitter             |
| 44   | ad4game_int         |
| 45   | unityads_int        |
| 46   | Instagram Official  |