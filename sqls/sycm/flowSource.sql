select queries->>'$.selfUserId' as userid,queries->>'$.cateId' as cateid ,left( replace(queries->>'$.dateRange','%7C','|'),10) as starttime,right( replace(queries->>'$.dateRange','%7C','|'),10) as endtime,jt.Ppagename,jt.subpagename,dds.getrawnum(jt.sales) as sales,dds.getrawnum(jt.uv) as uv,dds.getrawnum(jt.buyercount) as buyercount,dds.getrawnum(jt.payrate/100) as payrate from ods.httpdatas ,json_table(decrypted_response,'$[*]' columns(
Ppagename varchar(100) path '$.pageName.value',
nested path '$.children[*]' columns(
subpagename varchar(100) path '$.pageName.value',
sales double path '$.selfShopTradeIndex.value',
uv double path '$.selfShopUvIndex.value',
payrate double path'$.selfShopPayRateIndex.value',
buyercount double path'$.selfShopPayByrCntIndex.value'

)

))jt
where domain='sycm.taobao.com' and `path`->>'$[1]'='rivalShop' and filename='getFlowSource.json' and queries->>'$.selfUserId'='1652769470'

union all

select queries->>'$.rivalUser1Id',queries->>'$.cateId',left( replace(queries->>'$.dateRange','%7C','|'),10) as starttime,right( replace(queries->>'$.dateRange','%7C','|'),10) as endtime,jt.Ppagename,jt.subpagename,dds.getrawnum(jt.sales),dds.getrawnum(jt.uv),dds.getrawnum(jt.buyercount) as buyercount,dds.getrawnum(jt.payrate/100) as payrate from ods.httpdatas ,json_table(decrypted_response,'$[*]' columns(
Ppagename varchar(100) path '$.pageName.value',
nested path '$.children[*]' columns(
subpagename varchar(100) path '$.pageName.value',
sales double path '$.rivalShop1TradeIndex.value',
uv double path '$.rivalShop1UvIndex.value',
payrate double path'$.rivalShop1PayRateIndex.value',
buyercount double path'$.rivalShop1PayByrCntIndex.value'

)

))jt
where domain='sycm.taobao.com' and `path`->>'$[1]'='rivalShop' and filename='getFlowSource.json'  and queries->>'$.selfUserId'='1652769470' and not isnull( queries->>'$.rivalUser1Id')

union all

select queries->>'$.rivalUser2Id',queries->>'$.cateId',left( replace(queries->>'$.dateRange','%7C','|'),10) as starttime,right( replace(queries->>'$.dateRange','%7C','|'),10) as endtime,jt.Ppagename,jt.subpagename,dds.getrawnum(jt.sales),dds.getrawnum(jt.uv),dds.getrawnum(jt.buyercount) as buyercount,dds.getrawnum(jt.payrate/100) as payrate from ods.httpdatas ,json_table(decrypted_response,'$[*]' columns(
Ppagename varchar(100) path '$.pageName.value',
nested path '$.children[*]' columns(
subpagename varchar(100) path '$.pageName.value',
sales double path '$.rivalShop2TradeIndex.value',
uv double path '$.rivalShop2UvIndex.value',
payrate double path'$.rivalShop2PayRateIndex.value',
buyercount double path'$.rivalShop2PayByrCntIndex.value'

)

))jt
where domain='sycm.taobao.com' and `path`->>'$[1]'='rivalShop' and filename='getFlowSource.json'  and queries->>'$.selfUserId'='1652769470' and not isnull( queries->>'$.rivalUser2Id')
#-----------------------------此SQL不包含汇总,为明细到二级来源---------------------------------------#
