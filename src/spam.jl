str = """
luandui005316391@163.com----yuanchensiduan
ya8962387803460@163.com----fu48235903650
si198024575074@163.com----du54469492
nuojiagan0219649@163.com----cibi70
zhangxianfeitan@163.com----kangguaisong06
songcouxia375@163.com----dangdeng
renshi14657@163.com----shanyuanjie83
xia93682604@163.com----sishizai0715
xinglaxian6@163.com----zhang8677722594
xintao663875@163.com----cikengjie74174
lanyi1436@163.com----tuijiao886
weisong96130605@163.com----jingyaxindao0
shan0274937@163.com----yuan8672551800
keya428359@163.com----raodiliangchi
wei15720@163.com----suhelu6071468
qiaofu4927694@163.com----chao75207398117
huigu7841@163.com----shanciluan92233
yirongshao00@163.com----ang455
boliang10000122@163.com----menfu21276067
chuiyunaopang@163.com----fanyidao77504
tanwennuegai260@163.com----yituchuang85
siyuan723734363@163.com----deshuo691
gangu5428@163.com----weizhangbutan2
yidi16965259703@163.com----lieci3045067
kongzhaicheng@163.com----chanouhangan524
toushi274@163.com----dijing128471223
chaosong102731@163.com----ganmengji
weileizhi@163.com----beiyueyaben5
beijiaofeibi567@163.com----yong4476913
caihuan6439967@163.com----doumulu
yueyansong01422@163.com----que5099852348
fanshou2834125@163.com----liao63191115607
yunyong318@163.com----cicheng19393
heihuanqiangzhuo@163.com----bengmimeine3151
jureng9952812792@163.com----jiupantanzhan6
yatangshan539140@163.com----tecang761988220
kong128731435700@163.com----jiemi51552
yilaoxiahuang6@163.com----wo163091282
shangshi419113@163.com----chuiliangweng31
taobafenzhe0570@163.com----shanwo5189
ji0099123@163.com----xiemei35031936
zibengpansi5@163.com----citaosi
rongzhan589@163.com----hetuohuangshi41
zhuohuiwotang832@163.com----xinjianteng4153
gazong4407951287@163.com----ye878579
dizituotuo264@163.com----xiong981285
jiesijiu328912@163.com----ang296049560
kanyuanxiong593@163.com----mujiqianmen532
lanjiu3230@163.com----tuohan011662385
kenhanpami02@163.com----aotaoxie27
aolumu78191@163.com----hangzongcangli
cibo128@163.com----bei57721
"""

accounts = eachmatch(r"^(.+)----(.+)$"m, str) |> collect

function spam(tos; subject="", text="", files=[])
  i = rand(1:length(accounts))
  from = accounts[i][1]
  passwd = accounts[i][2]
  smtp_server = "smtp.163.com"
  sendmail(from, passwd, tos, smtp_server, subject, text, files)
end
