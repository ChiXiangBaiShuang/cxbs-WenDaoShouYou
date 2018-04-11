local XIUFARENWU
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")
function xiuFaRenWu(isZiQiHongMeng)
  show({detail = "开始修法任务"})
  renWuChaZhao(data_XIUFARENWU)
  sleep(200)
  if checkInterface(interfaceDatas) == "任务已完成" then
    return
  end

  while checkInterface(interfaceDatas) ~= "对话" do
    sleep(200)
    if isZhanJie(3) then
      renWuChaZhao(data_XIUFARENWU)
      sleep(200)
      if checkInterface(interfaceDatas) == "任务已完成" then
        return
      end
    end
  end
  Dialog(2) --选择扫荡
  sleep(200)
  if isZiQiHongMeng == true then
    Dialog(1) --选择提交紫气鸿蒙
    sleep(200)
    tap(498, 288) --点击确认
  else
    Dialog(2) --选择不提交紫气鸿蒙
  end
end
return XIUFARENWU
