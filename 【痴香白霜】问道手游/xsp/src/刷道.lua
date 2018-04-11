local SHUADAO
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("数字识别")
require("日志记录")
require("装备切换")
newTaskFinished=false
doubleTimesInQUANJU_SHUADAO = false
doubleTimes_now = false
finishedCount_SHUADAO = 0
isHideTask = true
function shuaDaoJiFenJiangLi() --刷道积分领取，参数为检测刷道积分奖励轮次间隔
	show({detail="刷道积分奖励领取"})
	sleep(500)
	tap(8, 65) --打开战斗中扩展面板
	sleep(500)
	tap(79, 177) --点击打开刷道界面
	sleep(500)
	tap(720, 165) --选择积分选项卡
	sleep(500)
	while true do --检测是否有奖励可以领取
		sleep(500)
		x,
		y =
		findColor(
			{158, 83, 698, 407},
			"0|0|0x82bfa8,32|7|0x8dc29d,34|-9|0xa8dad2,-32|9|0x98caa4,-31|-9|0xa8dad2,-27|5|0x90c6a6,30|-4|0x9dd3c8",
			95,
			0,
			0,
			0
		)
		if x > -1 then
			tap(x, y)
			riZhiJiLu("刷道：成功领取强盗领赏令！")
		else
			tap(423, 66) --紫气鸿蒙点数
			sleep(500)
			while true do
				sleep(500)
				x,
				y =
				findColor(
					{158, 83, 698, 407},
					"0|0|0x82bfa8,32|7|0x8dc29d,34|-9|0xa8dad2,-32|9|0x98caa4,-31|-9|0xa8dad2,-27|5|0x90c6a6,30|-4|0x9dd3c8",
					95,
					0,
					0,
					0
				)
				if x > -1 then
					tap(x, y)
					riZhiJiLu("刷道：成功领取紫气鸿蒙点数！")
				else
					break
				end
			end
			break
		end
	end
	sleep(500)
	tap(695, 25) --关闭刷道界面
	sleep(500)
	tap(231, 61) --关闭战斗拓展面板
end

function shiJieHanHuaQingSao(sjhhqs_count) --世界喊话打扫居所，参数为喊话轮次间隔
	show({detail="世界喊话居所清扫"})
	sleep(200)
	tap(75, 366) --打开社交界面
	sleep(500)
	tap(32, 129) --点击世界频道
	sleep(500)
	tap(349, 36) --打开输入扩展面板
	sleep(500)
	slip(188, 332, 42, 332)
	sleep(500)
	if GameVersion=="公测" then
		tap(43, 244) --点击输入居所链接
	else
		tap(120,247)---内测
	end
	sleep(100)
	tap(394, 354) --点击表情
	sleep(100)
	tap(790, 450) --点击发送
	sleep(500)
	tap(799, 194) --关闭拓展面板
	sleep(500)
	tap(396, 232) --关闭社交界面
end

function isTimeToNewTask(newTaskTime)
	if newTaskFinished==true then return false end
	newTaskTime.hour=newTaskTime.hour or 5
	newTaskTime.min=newTaskTime.min or 5
	if SHUADAOToNewTask == true then ---刷道到5点5分开始日常任务检测代码
		sdnow = getNowTime()
		if sdnow.hour == newTaskTime.hour and sdnow.min >= newTaskTime.min then
			newTaskFinished=true
			riZhiJiLu("开始新一天的任务！")
			while isInTeam() == true do
				show({detail="离开队伍"})
				tap(176, 432) --离开队伍
				sleep(600)
				tap(498, 288) --点击确认
				sleep(500)
			end
			toZhuJieMian()
			x, y = findColor({671, 72, 852, 249}, "0|0|0xcbac7a,-61|105|0xa5d8cf,2|117|0x98d0c4,-98|63|0xf7e6c5", 95, 0, 0, 0)
			if x > -1 then
				tap(765, 221) --退出匹配队列
			end
			SHUADAOToNewTask=false
			return true
		end
	end
	return false
end

function _HunDuiShuaDao(type_SHUADAO, count_SHUADAO) --@type_SHUADAO 刷道类型    @count_SHUADAO 需要完成的刷道次数
	if count_SHUADAO < 1 then --如果刷道次数小于1,任务完成
		return true
	end
	toast("混队刷道到"..newTaskTime.hour.."点"..newTaskTime.min.."分开始日常任务")
	while isInTeam() == true do
		tap(176, 432) --离开队伍
		sleep(600)
		tap(498, 288) --点击确认
		sleep(500)
	end
	
	if isHideTask == true then
		HideTask()
		isHideTask = false
	end
	toZhuJieMian()
	while isInTeam() == true do
		tap(176, 432) --离开队伍
		sleep(600)
		tap(498, 288) --点击确认
		sleep(500)
	end
	tap(340, 112) --点击选择匹配活动按钮
	sleep(500)
	tap(193, 73) --点击-无
	sleep(200)
	tap(192, 221) --点击刷道
	sleep(500)
	if type_SHUADAO == "降妖" then
		tap(193, 269)
	else
		if type_SHUADAO == "伏魔" then
			tap(194, 307)
		else
			tap(192, 359) --飞仙渡邪
		end
	end
	
	sleep(1000)
	tap(676, 431) --点击开始匹配
	show({detail = "在匹配队列中"})
	toZhuJieMian()
	while checkInterface(interfaceDatas) ~= "战斗中~" do
		sleep(500)
		
		if isTimeToNewTask(newTaskTime) == true then  --检测是否到达执行新任务时间
			riZhiJiLu("退出刷道:刷道次数:"..finishedCount_SHUADAO)
			return true
		end
		
		keepScreen(true)
		--检测是否在匹配队列中
		x, y = findColor({671, 72, 852, 249}, "0|0|0xcbac7a,-61|105|0xa5d8cf,2|117|0x98d0c4,-98|63|0xf7e6c5", 95, 0, 0, 0)
		keepScreen(false)
		if x == -1 and checkInterface(interfaceDatas) == "主界面" then
			if isZhanJie(6) then
				riZhiJiLu("刷道：被请离队伍/队伍解散了/无法进入队长线路")
				return false
			end
		end
	end
	
	while true do
		sleep(500)
		shuaDao_JieMian=checkInterface(interfaceDatas)
		if isTimeToNewTask(newTaskTime) == true then   --检测是否到达执行新任务时间
			return true
		end
		
		if shuaDao_JieMian == "战斗中~" then
			-----识别当前战斗是否为刷道------
			sleep(500)
			tap(10, 60) --打开战斗中扩展面板
			sleep(1000)
			tap(189, 123) --打开任务界面
			sleep(1000)
			tap(194, 76) --选中第一个任务
			sleep(1000)
			x,
			y =
			findColor(
				{322, 219, 735, 403},
				"0|0|0x8b5d43,7|7|0xf6f7f9,0|7|0x8f846f,11|2|0x8b5d43,10|16|0xdbae4e,6|-4|0x821f1d",
				90,
				0,
				0,
				0
			)
			sleep(500)
			tap(729, 27) --关闭任务界面
			sleep(500)
			tap(231, 61) --关闭战斗拓展面板
			if x == -1 then --检测刷道积分图标
				show({task = type_SHUADAO .. " 非刷道战斗" })
				sleep(500)
				tap(10, 60) --打开战斗中扩展面板
				sleep(500)
				tap(32, 179) --打开队伍面板
				sleep(500)
				tap(176, 432) --离开队伍
				sleep(600)
				tap(498, 288) --点击确认
				toZhuJieMian()
				return false
			end
			finishedCount_SHUADAO = finishedCount_SHUADAO + 1 --刷道轮次计数
			shuadao_flag = 0
			show({task = type_SHUADAO .. " 第" .. finishedCount_SHUADAO .. "/" .. count_SHUADAO .. "轮"})
			--------------------------------
			if finishedCount_SHUADAO % 5 == 0 then
				shiJieHanHuaQingSao() --进行世界喊话清扫居所一次
			else
				if finishedCount_SHUADAO % 3 == 0 then
					shuaDaoJiFenJiangLi() --检测一次刷道积分奖励
				end
			end
			
			
			sysLog("刷道开双:"..tostring(isDoubleReward_SHUADAO))
			if isDoubleReward_SHUADAO == true then
				if doubleTimes_now == false then
					doubleTimes_now = true
					sleep(200)
					tap(8, 65) --打开战斗中扩展面板
					sleep(500)
					tap(134, 178) --打开巡逻
					sleep(2000)
					x,
					y =
					findColor(
						{14, 5, 842, 472},
						"0|0|0xc48b3a,231|-1|0xc48b3a,-70|47|0x62b376,-46|47|0xd5cec1,408|50|0xb28a50,-85|-282|0xb28a50",
						95,
						0,
						0,
						0
					)
					if x == -1 then
						tap(252, 432) --打开双倍
					end
					sleep(500)
					tap(729, 27) --关闭巡逻界面
					sleep(500)
					tap(231, 61) --关闭战斗拓展面板
				end
			else
				--不在全局双倍时间关闭双倍
				sdnow = getNowTime()
				sysLog("当前时间:"..nowtime.hour..":"..nowtime.min)
				if doubleTimesInQUANJU_SHUADAO == false and (sdnow.hour * 60 + sdnow.min - 1 < 1230 and sdnow.hour * 60 + sdnow.min > 1110)	then--全局双倍时间自动开双
					riZhiJiLu("doubleTimes_SHUADAO时间自动开双~")
					doubleTimesInQUANJU_SHUADAO = true
					sleep(200)
					tap(8, 65) --打开战斗中扩展面板
					sleep(500)
					tap(134, 178) --打开巡逻
					sleep(2000)
					x,
					y =
					findColor(
						{14, 5, 842, 472},
						"0|0|0xc48b3a,231|-1|0xc48b3a,-70|47|0x62b376,-46|47|0xd5cec1,408|50|0xb28a50,-85|-282|0xb28a50",
						95,
						0,
						0,
						0
					)
					if x == -1 then
						tap(252, 432) --打开双倍
					end
					sleep(500)
					tap(729, 27) --关闭巡逻界面
					sleep(500)
					tap(231, 61) --关闭战斗拓展面板
				end
				--全局双倍时间自动开双
				
				if doubleTimesInQUANJU_SHUADAO == true and sdnow.hour * 60 + sdnow.min - 1 > 1230 then --全局双倍结束关闭双倍
					riZhiJiLu("全局双倍时间结束,自动关闭双倍~")
					doubleTimes_SHUADAO = false
					sleep(200)
					tap(8, 65) --打开战斗中扩展面板
					sleep(500)
					tap(134, 178) --打开巡逻
					sleep(2000)
					x,
					y =
					findColor(
						{14, 5, 842, 472},
						"0|0|0xc48b3a,231|-1|0xc48b3a,-70|47|0x62b376,-46|47|0xd5cec1,408|50|0xb28a50,-85|-282|0xb28a50",
						95,
						0,
						0,
						0
					)
					if x > -1 then
						tap(252, 432) --关闭双倍
					end
					sleep(500)
					tap(729, 27) --关闭巡逻界面
					sleep(500)
					tap(231, 61) --关闭战斗拓展面板
				end
			end
			--开启/关闭双倍刷道			
			
			if finishedCount_SHUADAO == count_SHUADAO then ---完成刷道
				sleep(500)
				tap(10, 60) --打开战斗中扩展面板
				sleep(500)
				tap(32, 179) --打开队伍面板
				sleep(500)
				tap(176, 432) --离开队伍
				sleep(600)
				tap(498, 288) --点击确认
				shuadao_flag = 1
				toZhuJieMian()
				while isInTeam() == true do
					tap(176, 432) --离开队伍
					sleep(600)
					tap(498, 288) --点击确认
				end
				return true
			end
			--完成刷道
			toZhuJieMian()
		end
		
		if shuaDao_JieMian == "对话" then
			toZhuJieMian()
		end
		
		if isZhanJie(6) then
			return false
		end
	end
end

function HunDuiShuaDao(type_SHUADAO, count_SHUADAO)
	currentTask="刷道"
	zhuangBeiQieHuan(isSwitchEquipment)
	while true do
		if _HunDuiShuaDao(type_SHUADAO, count_SHUADAO) == true then
			riZhiJiLu("退出刷道:刷道次数:"..finishedCount_SHUADAO)
			finishedCount_SHUADAO=0
			break
		end
	end
	zhuangBeiFuYuan(isSwitchEquipment)
	doubleTimesInQUANJU_SHUADAO=false
	doubleTimes_SHUADAO = false
	doubleTimes_now = false
	isHideTask = true
	currentTask=" "
end

return SHUADAO
