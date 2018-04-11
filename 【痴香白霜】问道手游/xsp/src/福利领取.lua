local FULILINGQU

require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")

function fuLiLingQu(fl_flag) --签到，会员元宝领取
  sleep(1000)
  riZhiJiLu("领取签到奖励~")
  
  if fl_flag == false then
    return
  end

  --签到第一个位置坐标
  fuli_firstX = 339
  fuli_firstY = 136
  toZhuJieMian()
  show({detail="领取签到奖励"})
  tap(24, 244) --打开福利面板
  sleep(1000)
  while checkInterface(interfaceDatas) ~= "福利" do
    sleep(500)
    toZhuJieMian()
    tap(24, 244) --打开福利面板
    sleep(400)
  end

  --每日签到
  -----------------------------------------------------------
  for i = 1, 2 do --尝试2次
    x, y = findColor({6, 5, 843, 470}, "0|0|0x7fd330,-8|1|0xecd9b7,-18|-8|0xfffedf,-22|7|0xf2f2d3", 94, 0, 0, 0)
    if x > -1 then
      tap(x, y)
      sleep(1000)
      --领取签到奖励
      x, y = findColor({292, 72, 763, 441}, "0|0|0xf7f560,2|0|0xf5f46b", 95, 0, 0, 0)
      if x > -1 then
        tap(x, y)
        break
      end
    end
  end
  -----------------------------------------------------------
  riZhiJiLu("领取会员元宝~")
  
  --领取会员元宝
  toZhuJieMian()
  show({detail="领取会员元宝"})
  tap(25, 143)
  sleep(1000)
  tap(761, 171)
  sleep(1000)
  tap(647, 434)
end

function shenMiDaLi() --神秘大礼抽取
  sleep(1000)
  riZhiJiLu("抽取神秘大礼~")
  show({detail="抽取神秘大礼"})
  --神秘大礼
  toZhuJieMian()
  tap(24, 244)
  sleep(1000)
  while checkInterface(interfaceDatas) ~= "福利" do
    sleep(500)
  end
  --领取神秘大礼
  x,
    y =
    findColor({6, 6, 299, 465}, "0|0|0xfff852,-12|0|0xfff75a,6|13|0x64220d,-7|14|0x9a3711,-17|10|0xb13712", 94, 0, 0, 0)
  if x > -1 then
    tap(x, y)
    sleep(1000)
    tap(510, 409)
  else
    sysLog("神秘大礼读取坐标失败,无法完成")
  end
end

function bangPaiFengLu() --帮派俸禄领取
  riZhiJiLu("领取帮派俸禄~")
  toZhuJieMian()
  show({detail="领取帮派俸禄"})
  tap(817, 443) --打开UI扩展面板
  sleep(500)
  tap(756, 452) --打开帮派面板
  sleep(500)
  tap(679, 437) --点击回总坛按钮
  sleep(1000)
  toZhuJieMian()
  tap(103, 31) --打开小地图
  sleep(500)
  tap(244, 82) --点击NPC小精灵
  sleep(500)
  tap(288, 326) --点击寻路至账房先生处
  sleep(500)
  while checkInterface(interfaceDatas) ~= "对话" do
    sleep(500)
    if isZhanJie(5) then
      bangPaiFengLu()
      return
    end
  end
  Dialog(1)
  toZhuJieMian()
end

return FULILINGQU
