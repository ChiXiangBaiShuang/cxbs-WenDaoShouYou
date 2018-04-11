local SHIMENRENWU
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")
function shiMenRenWu()
	renWuChaZhao(data_SHIMENRENWU)
	sleep(200)
	if checkInterface(interfaceDatas) == "任务已完成" then
		return
	end
	
	while true do
		ziDongZhanDou()
		if isZhanJie(4) then
			renWuChaZhao(data_SHIMENRENWU)
			sleep(200)
			if checkInterface(interfaceDatas) == "任务已完成" then
				return
			end
		end
		sleep(50)		
		smjm = checkInterface(interfaceDatas)
		if smjm == "对话" then
			Dialog(1)
			if isZhanJie(1) then
				renWuChaZhao(data_SHIMENRENWU)
				sleep(200)
				if checkInterface(interfaceDatas) == "任务已完成" then
					return
				end
			end
		end
		
		if smjm == "商店" then
			tap(645, 427)
		end
		
		if smjm == "提交宠物" then
			tap(425, 384)
			sleep(500)
			tap(518, 287)
		end
		
		if smjm == "宠物商店" then
			tap(668, 435)
		end
		
		if smjm == "捐钱" then
			local count_JUANQIAN = 1
			sleep(100)
			tap(349, 225) --减钱
			sleep(100)
			tap(349, 225) --减钱
			sleep(200)
			tap(424, 307) --点击确定
			sleep(1000)
			while checkInterface(interfaceDatas) ~= "主界面" do
				if checkInterface(interfaceDatas)=="捐钱" then
					count_JUANQIAN = count_JUANQIAN + 1
					tap(504, 225) --加钱
					sleep(200)
					tap(424, 307) --确定
					sleep(200)
				end
				if count_JUANQIAN > 7 then
					while checkInterface(interfaceDatas) ~= "主界面" do
						if checkInterface(interfaceDatas)=="捐钱" then
							tap(349, 225) --减钱
							sleep(200)
							tap(424, 307) --确定
							sleep(200)
						end
					end
					break
				end
			end
		end
	end
end

return SHIMENRENWU
