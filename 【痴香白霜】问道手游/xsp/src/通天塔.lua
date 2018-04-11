local TONGTIANTA

require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")
function tongTianTa(reward)
	renWuChaZhao(data_TONGTIANTA)
	sleep(200)
	if checkInterface(interfaceDatas) == "任务已完成" then
		return
	end
	
	while true do
		sleep(50)
		if checkInterface(interfaceDatas) == "对话" then
			sleep(2000)
			if checkInterface(interfaceDatas) == "对话" then
				Dialog(1)
				sleep(200)
				if checkInterface(interfaceDatas) == "对话" then
					if reward == "经验" then
						Dialog(1)
						riZhiJiLu("通天塔：开始挑战，奖励：经验")
					else
						Dialog(2)
						riZhiJiLu("通天塔：开始挑战，奖励：道行")
					end
					sleep(1000)
					toZhuJieMian()
					tap(742, 200) --点击任务栏任务
					sleep(100)
				end
			end
		end
		
		if isZhanJie(5) then
			renWuChaZhao(data_TONGTIANTA)
			sleep(200)
			if checkInterface(interfaceDatas) == "任务已完成" then
				return
			end
		end
		if checkInterface(interfaceDatas) == "修炼层完成" then --完成突破层的挑战
			if TONGTIANTAprogress=="修炼层" then return end
			riZhiJiLu("通天塔：完成修炼层挑战，进入突破层挑战~")
			sleep(200)
			tap(508, 330) --点击挑战下层
			sleep(200)
			while true do
				ziDongZhanDou()
				sleep(200)
				if checkInterface(interfaceDatas) == "对话" then
					Dialog(1)
				end
				
				if isZhanJie(1) then
					x,
					y =
					findColor({637, 71, 851, 179}, "0|0|0xb28a50,-5|-4|0xeee4d4,6|-2|0xeadecb,-172|-71|0xf4dabb", 95, 0, 0, 0)
					if x > -1 then --检测是否还在通天塔中
						tap(760, 216) --挑战下层
					else
						return
					end
				end
			end
		end
		ziDongZhanDou()
	end
end

return TONGTIANTA
