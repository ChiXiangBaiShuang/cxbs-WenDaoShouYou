local BANGPAIRICHANGTIAOZHAN

require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")
function bangPaiRiChangTiaoZhan()
  sleep(1000)
  renWuChaZhao(data_BANGPAIRICHANGTIAOZHAN)
  sleep(500)
  if checkInterface(interfaceDatas) == "任务已完成" then
    return
  end

  while checkInterface(interfaceDatas) ~= "对话" do
    sleep(50)
    if isZhanJie(2) then
      renWuChaZhao(data_BANGPAIRICHANGTIAOZHAN)
      sleep(100)
      if checkInterface(interfaceDatas) == "任务已完成" then
        return
      end
    end
  end
  sleep(500)
  Dialog(3)
  sleep(500)
end

return BANGPAIRICHANGTIAOZHAN
