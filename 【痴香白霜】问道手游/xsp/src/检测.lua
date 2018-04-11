local _HuoDongJianCe
require("日志记录")
------------------------------------------------------------------
--[[
界面检测函数
配合界面数据文件使用
原代码设定在480*854分辨率的设备下开发脚本以适配其他分辨率
为提高性能，可将出现频率较高的界面放在前面
--]]
idJM = createHUD()

function _checkInterface(interfaceDatas)
	i = 1
	x,
	y =
	findColor(
		{658, 248, 806, 430},
		"0|0|0xf2e6c2,-7|0|0x8f0f0a,0|6|0x820f09,7|0|0x970f0b,0|-7|0x990d0c,-41|117|0x87c5b4,-73|110|0xa1d6cc,-9|111|0x9ed4ca",
		95,
		1,
		1,
		0
	)
	if x > -1 then
		tap(735, 387) --嗑药
		sleep(200)
	end
	keepScreen(true) --保持屏幕，提升性能
	while i <= (#interfaceDatas) do
		x, y = findColor(interfaceDatas[i][2], interfaceDatas[i][3], 95, 0, 0, 0)
		if x > -1 then
			Global_interface = interfaceDatas[i][1]
			show({})
			keepScreen(false) --判定结束，关闭保持屏幕
			
			if Global_interface == "免责声明" then
				tap(520, 299)
				sleep(500)
				riZhiJiLu("登录成功~")
				return "0"
			end
			
			if Global_interface == "战斗中~" then
				show({detail = "等候战斗结束"})
			end
			
			if Global_interface=="确认" then
				if	currentTask=="刷道" or currentTask=="除暴修炼" then
					tap(353,287)--取消
				else
					tap(495,287)--确认
				end	
			end
			if Global_interface == "剧情" then
				tap(771,51)
				sleep(100)
				return "0"
			end
			
			if Global_interface == "进入游戏" then
				sleep(3000)
				tap(426, 380)
				sleep(1500)
				return "0"
			end
			
			if Global_interface=="任务已完成" then
				x,
				y =
				findColor(
					{0, 0, 853, 479},
					"0|0|0xf2e6c2,-10|-1|0x89100a,12|0|0x86100a,0|-10|0x9a0d0c,1|8|0x820f09,7|6|0xf1e5c1,1|-10|0x990e0c",
					90,
					0,
					0,
					0
				) --寻找界面关闭按钮位置1
				if x > -1 then
					tap(x, y)
				end
			end
			if Global_interface == "顶号界面" then
				sleep(1000)
				tap(426, 301)
				sleep(500)
				riZhiJiLu("发生顶号，正在尝试重连~")
				return "0"
			end
			
			if Global_interface == "选角界面" then
				tap(738, 42)
				sleep(1000)
				return "0"
			end
			
			
			return Global_interface
		end
		i = i + 1
	end
	
	Global_interface = "      "
	show({})
	if Global_interface == "      " then
		keepScreen(true)
		x,
		y =
		findColor(
			{0, 0, 853, 479},
			"0|0|0xf2e6c2,-10|-1|0x89100a,12|0|0x86100a,0|-10|0x9a0d0c,1|8|0x820f09,7|6|0xf1e5c1,1|-10|0x990e0c",
			90,
			0,
			0,
			0
		) --寻找界面关闭按钮位置1
		keepScreen(false)
		if x > -1 then
			tap(x, y)
		end
		keepScreen(false)
		keepScreen(true)
		x, y = findColor({0, 0, 853, 479}, "0|0|0xd30000,0|-9|0xf5e7d4,-8|0|0xeedecd,-1|7|0xe9d7c7,7|0|0xeedecd", 95, 0, 0, 0) --寻找界面关闭按钮位置2
		if x > -1 then
			tap(x, y)
		end
		keepScreen(false)
	end
	return Global_interface
end

function checkInterface(interfaceDatas)
	local interface = _checkInterface(interfaceDatas)
	while true do
		if interface == "0" then
			interface = _checkInterface(interfaceDatas)
		else
			break
		end
	end
	return interface
end

function getNowTime() --获取当前时间表
	nowtime = os.date("*t", os.time())
	--sysLog("当前时间:"..nowtime.hour..":"..nowtime.min)
	return nowtime
end

return _HuoDongJianCe
