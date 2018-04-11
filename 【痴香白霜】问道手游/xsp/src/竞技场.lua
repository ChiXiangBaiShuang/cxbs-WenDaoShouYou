local JINGJICHANG

require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")
function jingJiChang()
	sleep(1000)
	renWuChaZhao(data_JINGJICHANG)
	sleep(500)
	if checkInterface(interfaceDatas) == "任务已完成" then
		return
	end
	
	while true do
		if isZhanJie(2) then
			renWuChaZhao(data_JINGJICHANG)
			sleep(500)
			if checkInterface(interfaceDatas) == "任务已完成" then
				return
			end
		end
		ziDongZhanDou()
		if checkInterface(interfaceDatas) == "对话" then
			Dialog(1)
			sleep(500)
		end
		
		if checkInterface(interfaceDatas) == "竞技场" then
			sleep(500)
			tap(193,373) --选择试炼童子
			sleep(1000)
			if checkInterface(interfaceDatas) ~= "竞技场" then
				riZhiJiLu("进入竞技场战斗~")
				tap(498, 288)
				sleep(1000)
			else
				renWuChaZhao(data_JINGJICHANG)
				sleep(500)
				if checkInterface(interfaceDatas) == "任务已完成" then
					return
				end
			end
		end
	end
end

return JINGJICHANG
