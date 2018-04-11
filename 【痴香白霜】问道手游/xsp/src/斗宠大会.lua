local DOUCHONGDAHUI

require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")
function douChongDaHui()
  renWuChaZhao(data_DOUCHONGDAHUI)
  sleep(200)
  if checkInterface(interfaceDatas) == "任务已完成" then
    return
  end

  while true do
    dcdh = checkInterface(interfaceDatas)
    sleep(50)
    if dcdh == "对话" then
      Dialog(1)
    end

    if isZhanJie(3) then
      renWuChaZhao(data_DOUCHONGDAHUI)
      sleep(200)
      if checkInterface(interfaceDatas) == "任务已完成" then
        return
      end
    end

    if dcdh == "确认" then
      riZhiJiLu("领取斗宠大会赛季奖励~")
      tap(499, 287) --确认领取斗宠大会赛季奖励
    end

    if dcdh == "斗宠大会" then
      sleep(100)
      tap(693, 89)
      sleep(500)
      if checkInterface(interfaceDatas) ~= "斗宠大会" then
        riZhiJiLu("进入斗宠大会观战~")
        tap(498, 288)
      else
        return
      end
    end
  end
end

return DOUCHONGDAHUI
