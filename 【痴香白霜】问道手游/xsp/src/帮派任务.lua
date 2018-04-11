local BANGPAIREWU

require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")
function bangPaiRenWu()
	sleep(1000)
	renWuChaZhao(data_BANGPAIRENWU)
	sleep(500)
	if checkInterface(interfaceDatas) == "任务已完成" then
		return
	end
	
	while true do
		bpjm = checkInterface(interfaceDatas)
		sleep(50)
		if bpjm == "对话" then
			Dialog(1)
		end
		
		if bpjm == "装备提交" then
			tap(428, 384) --点击提交
			sleep(500)
			tap(498, 288) --点击确认
		end
		
		if bpjm == "宠物商店" then
			tap(668, 435)
		end
		
		if bpjm == "商店" then
			tap(645, 427)
		end
		
		if bpjm == "提交宠物" then
			tap(425, 384)
			sleep(500)
			tap(498, 288)
		end
		
		if bpjm == "主界面" then
			if isZhanJie(3) then
				bangPaiRenWu()
				return
			end
		end
	end
end

return BANGPAIREWU
