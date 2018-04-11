local CHUBAOXIULIAN
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("邮件发送")
require("日志记录")

function chuBaoXiuLian(type_XIULIAN)
	currentTask="除暴修炼"
	sleep(1000)
	if quickChoice == "痴香白霜0o0" then
		buChongChuBei(1)
	end
	openShuangBei(true)
	---------------------------------------
	--------------存钱---------------------
	cunQian()
	---------------------------------
	riZhiJiLu("除暴修炼：开始喊话组队~")
	if type_XIULIAN == "修行" then
		zuDui(" 2040#R满次#G稳定的来咯~#51")
	else
		zuDui(" 2010#R满次#G稳定的来咯~#51")
	end
	riZhiJiLu("除暴修炼：队伍组建完成")
	-----------领取除暴任务-----------
	riZhiJiLu("除暴修炼：开始除暴任务~")
	renWuChaZhao(data_CHUBAORENWU)
	---------------------------------
	while true do
		sleep(1000)
		ziDongZhanDou()
		
		if checkInterface(interfaceDatas) == "对话" then
			Dialog(1)
			renWuChaZhao(data_CHUBAORENWU)
		else
			closeWuGuanPage()
		end
		
		if isZhanJie(1) then
			renWuChaZhao(data_CHUBAORENWU)
			sleep(500)
			if checkInterface(interfaceDatas) == "任务已完成" then
				break
			end
		end
	end
	riZhiJiLu("除暴修炼：除暴任务完成，开始" .. type_XIULIAN .. "任务！")
	
	if type_XIULIAN == "修行" then
		renWuChaZhao(data_XIUXING)
	else --十绝阵
		renWuChaZhao(data_SHIJUEZHEN)
	end
	
	while checkInterface(interfaceDatas) ~= "对话" do
		sleep(1000)
		if isZhanJie(3) then
			if type_XIULIAN == "修行" then
				renWuChaZhao(data_XIUXING)
			else --十绝阵
				renWuChaZhao(data_SHIJUEZHEN)
			end
		end
	end
	Dialog(1)
	sleep(1000)
	if checkInterface(interfaceDatas) == "对话" then --如果队伍人数剩余不足3人，则无法领取任务，按任务完成处理
		riZhiJiLu(type_XIULIAN .. "领取任务的时候队友跑了，不够三个人啦~")
		if isInTeam() == true then
			tap(176, 432) --离开队伍
			sleep(1000)
			tap(516, 300) --点击确认
		end
		openShuangBei(false)
		return
	end
	
	if type_XIULIAN == "修行" then
		renWuChaZhao(data_XIUXING)
	else --十绝阵
		renWuChaZhao(data_SHIJUEZHEN)
	end
	---------------------------------
	
	while true do
		sleep(1000)
		ziDongZhanDou()
		
		if isZhanJie(1) then
			if type_XIULIAN == "修行" then
				renWuChaZhao(data_XIUXING)
			else --十绝阵
				renWuChaZhao(data_SHIJUEZHEN)
			end
			sleep(500)
			if checkInterface(interfaceDatas) == "任务已完成" then
				break
			end
		end
		
		if checkInterface(interfaceDatas) == "对话" then
			Dialog(1)
			riZhiJiLu(type_XIULIAN .. "还没完成队友跑了，不够三个人啦~")
			break
		else
			closeWuGuanPage()
		end
		
	end
	
	if isInTeam() == true then
		tap(176, 432) --离开队伍
		sleep(1000)
		tap(516, 300) --点击确认
	end
	openShuangBei(false)
	currentTask=" "
end
return CHUBAOXIULIAN
