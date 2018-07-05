local CHONGWULILIAN
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")
function wuXueLiLian()
	
	HideTask()
	renWuChaZhao(data_WUXUELILIAN)
	sleep(200)
	if checkInterface(interfaceDatas) == "任务已完成" then
		return
	end
	
	while true do
		wxlljm = checkInterface(interfaceDatas)
		sleep(50)
		if wxlljm == "宠物商店" then
			tap(668, 435)
			sleep(100)
		end
		
		if wxlljm == "对话" then
			Dialog(1)
			sleep(200)
			if checkInterface(interfaceDatas) == "对话" then
				Dialog(1)
				sleep(500)
				if checkInterface(interfaceDatas) == "主界面" then
					toZhuJieMian()
					while checkInterface(interfaceDatas) ~= "任务" do
						tap(720, 95) --打开任务面板
						sleep(500)
					end
					sleep(500)
					tap(162, 75) --选择第一个任务
					sleep(500)
					tap(539, 437) --选择放弃任务
					sleep(500)
					tap(499, 287) --点击确认
					renWuChaZhao(data_WUXUELILIAN)
					sleep(500)
				end
			end
		end
		
		if wxlljm == "提交宠物" then
			tap(425, 384)
			sleep(500)
		end
		
		if wxlljm == "装备提交" then
			tap(428, 384) --点击提交
			sleep(500)
			tap(498, 288) --点击确认
		end
		
		if isZhanJie(1) then
			renWuChaZhao(data_WUXUELILIAN)
			sleep(200)
			if checkInterface(interfaceDatas) == "任务已完成" then
				return
			end
		end
		
		if wxlljm == "变身卡提交" then
			---放弃任务
			riZhiJiLu("武学历练：变身卡任务，放弃！")
			toZhuJieMian()
			while checkInterface(interfaceDatas) ~= "任务" do
				tap(720, 95) --打开任务面板
				sleep(200)
			end
			sleep(500)
			tap(162, 75) --选择第一个任务
			sleep(500)
			tap(539, 437) --选择放弃任务
			sleep(500)
			tap(499, 287) --点击确认
			renWuChaZhao(data_WUXUELILIAN)
			sleep(500)
		end
		
		if wxlljm == "商店" then
			tap(645, 427)
			sleep(200)
		end
	end
end

local CHONGWULILIAN
