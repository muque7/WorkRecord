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