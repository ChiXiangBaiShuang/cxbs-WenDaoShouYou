local ZHURENWEILE
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")
function zhuRenWeiLe(reward_ZHURENWEILE, isTimes_ZHURENWEILE)
  sleep(1000)
  renWuChaZhao(data_ZHURENWEILE)
  sleep(500)
  if checkInterface(interfaceDatas) == "任务已完成" then
    return
  end

  while checkInterface(interfaceDatas) ~= "对话" do
    sleep(500)
    if isZhanJie(3) then
      renWuChaZhao(data_ZHURENWEILE)
      sleep(500)
      if checkInterface(interfaceDatas) ~= "活动" then
        return
      end
    end
  end
  Dialog(2) --点击扫荡
  sleep(500)
  if reward_ZHURENWEILE == "经验" then
    Dialog(1)
  else
    if reward_ZHURENWEILE == "道行" then
      Dialog(2)
    else
      Dialog(3)
    end
  end
  sleep(200)
  if isTimes_ZHURENWEILE == true then
    Dialog(1)
    sleep(200)
    tap(498, 288)
  else
    Dialog(2)
  end
end

return ZHURENWEILE
