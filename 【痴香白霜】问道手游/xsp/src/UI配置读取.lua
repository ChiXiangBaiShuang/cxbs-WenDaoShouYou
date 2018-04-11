local UISET
require("刷道")
require("助人为乐")
require("师门任务")
require("帮派日常挑战")
require("帮派任务")
require("竞技场")
require("通天塔")
require("修法任务")
require("福利领取")
require("通用函数")
require("斗宠大会")
require("除暴修炼")
require("武学历练")
require("邮件发送")
require("日志记录")
require("新春任务-年货商人")
require("居所清扫")
--[[
变量说明
SHUADAOToNewTask   刷道直到开始日常任务时间
count_SHUADAO       刷道次数
]]
SHUADAOToNewTask = false
function UIset()
	chioseTask = Global_result["任务选择"]
	count_SHUADAO = tonumber(Global_result["混队刷道次数"])
	user=Global_result["用户邮箱"]
	newTaskTime={}
	newTaskTime.hour=tonumber(Global_result["任务开始时间-小时"])
	ALL_newTaskTime_min={1,15,30,45}
	newTaskTime.min=tonumber(ALL_newTaskTime_min[tonumber(Global_result["任务开始时间-分"]+1)])
	
	if count_SHUADAO == nil then
		count_SHUADAO = 100
	end
	
	ALL_quickChoice = {"痴香白霜0o0", "天涯の小仙", "天涯の小晓", "自定义"}
	quickChoice = ALL_quickChoice[tonumber(Global_result["快捷选择"]) + 1]
	riZhiJiLu("快捷选择:"..quickChoice)
	
	XUECHI=tonumber(Global_result["血池补充"])
	sysLog(XUECHI.."血池")
	LINGCHI=tonumber(Global_result["灵池补充"])
	sysLog(LINGCHI.."灵池")
	ZHONGCHENG=tonumber(Global_result["忠诚补充"])
	
	ALL_GameVersion={"公测","内测"}
	GameVersion=ALL_GameVersion[tonumber(Global_result["区组选择"])+1]
	
	JUSUOQINGSAO=tonumber(Global_result["居所清扫"])
	
	sysLog(GameVersion)
	ALL_reward_ZHURENWEILE = {"经验", "道行", "潜能"}
	reward_ZHURENWEILE = ALL_reward_ZHURENWEILE[tonumber(Global_result["助人为乐奖励类型"]) + 1]
	
	ALL_TONGTIANTAprogress={"修炼层","挑战层"}
	TONGTIANTAprogress=ALL_TONGTIANTAprogress[tonumber(Global_result["通天塔任务进度"]) + 1]
	
	ALL_times_ZHURENWEILE = {false, true}
	isTimes_ZHURENWEILE = ALL_times_ZHURENWEILE[tonumber(Global_result["助人为乐倍数"]) + 1]
	
	ALL_reward_TONGTIANTA = {"经验", "道行"}
	reward_TONGTIANTA = ALL_reward_TONGTIANTA[tonumber(Global_result["通天塔奖励类型"]) + 1]
	
	ALL_type_SHUADAO = {"降妖", "伏魔", "飞仙渡邪"}
	type_SHUADAO = ALL_type_SHUADAO[tonumber(Global_result["刷道任务类型"]) + 1]
	
	ALL_doubleReward_SHUADAO = {true, false} --开双刷道选择
	isDoubleReward_SHUADAO = ALL_doubleReward_SHUADAO[tonumber(Global_result["is双倍"]) + 1]
	
	chioseMode = tonumber(Global_result["模式选择"])
	
	isSwitchEquipment = tonumber(Global_result["装备切换"])
	
	isWorldSpeak_cleanHouse = tonumber(Global_result["世界喊话居所清扫"])
	
	isReceiveReward_SHUADAO = tonumber(Global_result["刷道积分奖励领取"])
	
	All_times_XIUFARENWU = {true, false}
	isTimes_XIUFARENWU = All_times_XIUFARENWU[tonumber(Global_result["修法任务奖励倍数"]) + 1]
	
	ALL_useCard = {true, false}
	isUseCard = ALL_useCard[tonumber(Global_result["使用变身卡"]) + 1]
	
	ALL_receiveWelfare = {true, false}
	isReceiveWelfare = ALL_receiveWelfare[tonumber(Global_result["福利领取"]) + 1]
	
	ALL_type_XIULIAN = {"修行", "十绝阵"}
	type_XIULIAN = ALL_type_XIULIAN[tonumber(Global_result["修炼类型"]) + 1]
	
	
	
	
	if quickChoice == "痴香白霜0o0" then
		show({detail = "快捷选择:白霜"})
		chooseTask = "0@1@2@3@4@5@6@7@8@9"
		isUseCard = true
		isReceiveWelfare = true
		type_XIULIAN = "十绝阵"
		isDoubleReward_SHUADAO = false
		isSwitchEquipment = 1
		type_SHUADAO = "飞仙渡邪"
		isWorldSpeak_cleanHouse = 0
		isReceiveReward_SHUADAO = 0
		reward_ZHURENWEILE = "道行"
		isTimes_ZHURENWEILE = false
		reward_TONGTIANTA = "道行"
		isTimes_XIUFARENWU = false
		GameVersion="内测"
		XUECHI=3
		LINGCHI=3
		ZHONGCHENG=1
		JUSUOQINGSAO=0
		TONGTIANTAprogress="挑战层"
	end
	
	if quickChoice == "天涯の小仙" then
		show({detail = "快捷选择:小仙"})
		chooseTask = "0@1@2@3@4@5@6@7@8@9"
		isUseCard = false
		isReceiveWelfare = true
		type_XIULIAN = "修行"
		isDoubleReward_SHUADAO = false
		isSwitchEquipment = 0
		type_SHUADAO = "伏魔"
		isWorldSpeak_cleanHouse = 0
		isReceiveReward_SHUADAO = 0
		reward_ZHURENWEILE = "道行"
		isTimes_ZHURENWEILE = false
		reward_TONGTIANTA = "道行"
		isTimes_XIUFARENWU = false
		GameVersion="内测"
		XUECHI=1
		LINGCHI=1
		ZHONGCHENG=1
	end
	
	if quickChoice == "天涯の小晓" then
		show({detail = "快捷选择:小晓"})
		chooseTask = "0@1@2@3@4@5@6@7@8@9"
		isUseCard = false
		isReceiveWelfare = true
		type_XIULIAN = "修行"
		isDoubleReward_SHUADAO = false
		isSwitchEquipment = 1
		type_SHUADAO = "伏魔"
		isWorldSpeak_cleanHouse = 0
		isReceiveReward_SHUADAO = 0
		reward_ZHURENWEILE = "道行"
		isTimes_ZHURENWEILE = false
		reward_TONGTIANTA = "道行"
		isTimes_XIUFARENWU = false
		GameVersion=1
		XUECHI=0
		LINGCHI=0
		ZHONGCHENG=0
	end
	
	if chioseMode == 2 then
		wuXueLiLian() --武学历练
		lua_exit()
	end
	
	if chioseMode == 0 then --SHUADAOToNewTask执行任务
		SHUADAOToNewTask = true
		show({task = "混队刷道"}) --显示HUD内容
		HunDuiShuaDao(type_SHUADAO, 9999)
		zhiXingRenWu()
		return
	end
	zhiXingRenWu()
end

function zhiXingRenWu() ---执行任务函数
	while isInTeam() == true do
		show({detail="离开队伍"})
		tap(176, 432) --离开队伍
		sleep(600)
		tap(516, 300) --点击确认
		sleep(500)
	end
	
	if JUSUOQINGSAO==0 then
		juSuoQingSao()
	end
	fuLiLingQu(isReceiveWelfare)
	--yaoPinGouMai()
	useBianShenCard(isUseCard)
	nowWeekday = os.date("%w")
	if nowWeekday == "1" then --逢周一要做的事
		bangPaiFengLu() --领取帮派俸禄
		--wuXueLiLian() --武学历练
	end
	
	if string.find(chioseTask, "0") then
		
		riZhiJiLu("开始师门任务~")
		show({task = "师门任务"})
		shiMenRenWu()
		riZhiJiLu("完成师门任务~")
	end
	
	if string.find(chioseTask, "1") then
		riZhiJiLu("开始帮派任务~")
		show({task = "帮派任务"})
		bangPaiRenWu()
		riZhiJiLu("完成帮派任务~")
	end
	
	if string.find(chioseTask, "2") then
		riZhiJiLu("开始帮派日常挑战~")
		show({task = "帮派日常挑战"})
		bangPaiRiChangTiaoZhan()
		riZhiJiLu("完成帮派日常挑战~")
	end
	
	if string.find(chioseTask, "3") then
		riZhiJiLu("开始助人为乐~")
		show({task = "助人为乐"})
		zhuRenWeiLe(reward_ZHURENWEILE, isTimes_ZHURENWEILE)
		riZhiJiLu("完成助人为乐~")
	end
	
	if string.find(chioseTask, "4") then
		riZhiJiLu("开始竞技场~")
		show({task = "竞技场"})
		jingJiChang()
		riZhiJiLu("完成竞技场~")
	end
	
	if string.find(chioseTask, "5") then
		riZhiJiLu("开始斗宠大会~")
		show({task = "斗宠大会"})
		douChongDaHui()
		riZhiJiLu("完成斗宠大会~")
	end
	
	if string.find(chioseTask, "6") then
		riZhiJiLu("开始修法任务~")
		show({task = "修法任务"})
		xiuFaRenWu(isTimes_XIUFARENWU)
		riZhiJiLu("完成修法任务~")
	end
	
	if string.find(chioseTask, "7") then
		riZhiJiLu("开始通天塔~")
		show({task = "通天塔"})
		tongTianTa(reward_TONGTIANTA)
		riZhiJiLu("完成通天塔~")
	end
	
	if string.find(chioseTask, "8") then
		riZhiJiLu("开始除暴修炼~")
		show({task = "除暴修炼"})
		chuBaoXiuLian(type_XIULIAN)
		riZhiJiLu("完成除暴修炼~")
	end
	
	--领取活跃度奖励
	riZhiJiLu("领取活跃度奖励~")
	show({task = "活跃度奖励"})
	toZhuJieMian()
	tap(272, 21) --打开活动面板
	sleep(1000)
	tap(702, 381)
	sleep(500)
	tap(604, 381)
	sleep(500)
	tap(505, 378)
	sleep(500)
	tap(413, 379)
	sleep(500)
	tap(319, 381)
	sleep(500)
	tap(732, 388)
	sleep(500)
	tap(732, 388)
	sleep(500)
	toZhuJieMian()
	if string.find(chioseTask, "9") then
		riZhiJiLu("开始混队刷道~")
		show({task = "混队刷道"})
		HunDuiShuaDao(type_SHUADAO, count_SHUADAO)
		riZhiJiLu("结束混队刷道~")
	end
	show({task = "神秘大礼"})
	shenMiDaLi()
end

return UISET
