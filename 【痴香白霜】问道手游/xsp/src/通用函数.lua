local TONGYONGHANSHU
require("检测")
require("点击")
require("界面数据")
require("日志记录")

function toZhuJieMian() --返回到游戏主界面
	sleep(100)
	while checkInterface(interfaceDatas) ~= "主界面" do
		sleep(100)
		while checkInterface(interfaceDatas) == "战斗" do
			sleep(500)
		end
		
		if checkInterface(interfaceDatas) == "对话" then
			tap(823, 32) --关闭对话框
			sleep(100)
			if checkInterface(interfaceDatas) == "主界面" then
				return
			end
		end
		
		if checkInterface(interfaceDatas) == "社交" then
			tap(396, 232)
			sleep(100)
			if checkInterface(interfaceDatas) == "主界面" then
				return
			end
		else
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
			x,
			y = findColor({0, 0, 853, 479}, "0|0|0xd30000,0|-9|0xf5e7d4,-8|0|0xeedecd,-1|7|0xe9d7c7,7|0|0xeedecd", 95, 0, 0, 0) --寻找界面关闭按钮位置2
			if x > -1 then
				tap(x, y)
			end
			keepScreen(false)
		end
	end
end

function isZhanJie(second) --站街判定函数,参数s的单位为秒,角色位置在s秒内未改变判定为站街.
	second = second or 3
	local count_time = 0
	if checkInterface(interfaceDatas) == "主界面" then
		show({detail = "站街判定:" .. string.format("%0.1f", second) .. "秒"})
		local c1 = getColor(6, 4)
		local c2 = getColor(800, 43)
		local c3 = getColor(42, 366)
		while checkInterface(interfaceDatas) == "主界面" do
			sleep(50)
			if c1 == getColor(6, 4) or c2 == getColor(800, 43) or c3 == getColor(42, 366) then
				show({detail = "站街判定:" .. string.format("%0.1f", second - count_time) .. "秒"})
				count_time = count_time + 0.1*(Global_width/480)*(Global_width/480)
			else
				return false
			end
			if count_time >= second then
				return true
			end
		end
	end
	return false
end

function isInTeam() --判定是否处于组队状态
	show({detail="检测是否在队伍中"})
	if checkInterface(interfaceDatas) == "队伍" then
	else
		toZhuJieMian()
		while checkInterface(interfaceDatas) ~= "队伍" do
			toZhuJieMian()
			tap(841, 94)
			sleep(1000)
		end
	end
	x, y = findColor({126, 152, 165, 176}, "0|0|0xffe24d", 95, 0, 0, 0) --检测队长标志是否存在
	if x > -1 then
		return true
	end
	return false
end

function isFullTeam() --判定队伍是否满员
	show({detail="检测队伍是否满员"})
	if checkInterface(interfaceDatas) == "队伍" then
	else
		toZhuJieMian()
		while checkInterface(interfaceDatas) ~= "队伍" do
			toZhuJieMian()
			tap(841, 94)
			sleep(1000)
		end
	end
	
	x, y = findColor({624, 151, 665, 177}, "0|0|0xfcdb4a,0|-4|0xffec7d,-10|-1|0xffe24d", 95, 0, 0, 0)
	if x > -1 then
		return false
	else
		return true
	end
end

function ziDongZhanDou() --自动战斗
	
	if checkInterface(interfaceDatas) == "战斗中~" then
		x,
		y =
		findColor(
			{5, 4, 846, 470},
			"0|0|0xf9ea9e,9|0|0xf9ec9f,27|-1|0xfdeeaa,-1|12|0x37250d,25|12|0x452f14,9|3|0xf7df88,0|3|0xf5e086",
			90,
			0,
			0,
			0
		)
		if x > -1 then
			show({detail="自动战斗"})
			tap(815, 447)
			sleep(500)
		end
	end
end

function openShuangBei(flag) ---双倍点数开关函数
	show({detail="双倍开/关"})
	toZhuJieMian()
	tap(174, 31)
	sleep(1000)
	while checkInterface(interfaceDatas) ~= "巡逻" do
		toZhuJieMian()
		tap(174, 31)
		sleep(1000)
	end
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
		now = true
	else
		now = false
	end
	
	if flag ~= now then
		tap(252, 432)
	end
	
	x,
	y =
	findColor({116, 414, 167, 442}, "0|0|0x62b376,22|2|0xd8d0c3,2|-5|0x62b376,19|10|0xd3cfbc,1|1|0x62b376", 95, 0, 0, 0) --打开驱魔香
	if x == -1 then
		tap(x, y)
	end
	toZhuJieMian()
end

function useBianShenCard(isUse) --使用变身卡
	
	if isUse == false then
		return
	end
	show({detail="使用变身卡"})
	toZhuJieMian()
	tap(827, 382) --打开背包
	sleep(1000)
	tap(760, 406) --打开卡套
	sleep(1000)
	tap(214, 84) --选择置顶变身卡
	sleep(1000)
	tap(672, 436) --点击使用
	sleep(1000)
	tap(518, 301)
	sleep(1000)
	toZhuJieMian()
end

function hanHua(hhtext) --喊话函数
	show({detail="喊话"})
	toZhuJieMian()
	tap(75, 366) --打开社交界面
	sleep(1000)
	show({detail="世界频道喊话"})
	tap(33, 131) --进入世界频道
	sleep(1000)
	tap(150, 36) --点击打开输入框
	sleep(500)
	inputText("#CLEAR#") --删除输入框中的文字（假设输入框中已存在文字）
	sleep(500)
	inputText(hhtext .. hhtext .. hhtext .. hhtext .. "#ENTER#")
	sleep(500)
	show({detail="当前频道喊话"})
	tap(33, 80) --进入当前频道
	sleep(1000)
	tap(150, 36) --点击打开输入框
	sleep(500)
	inputText("#CLEAR#") --删除输入框中的文字（假设输入框中已存在文字）
	sleep(500)
	inputText(hhtext .. hhtext .. hhtext .. hhtext .. "#ENTER#")
	toZhuJieMian()
end

function zuDui(hhtext) --自动组队
	show({detail="组建队伍"})
	toZhuJieMian()
	tap(28, 29) --打开大地图
	sleep(500)
	tap(356, 291) --点击天墉城
	sleep(500)
	toZhuJieMian()
	if isInTeam() == true then
		tap(176, 432) --离开队伍
		sleep(1000)
		tap(498, 288) --点击确认
	end
	
	sleep(500)
	tap(177, 430) --点击创建队伍
	sleep(500)
	hanHua(hhtext)
	while true do
		sleep(1000)
		if isFullTeam() == false then
			tap(372, 68)
			sleep(500)
			while true do ---检测是否有人申请组队
				sleep(100)
				keepScreen(true)
				x,
				y =
				findColor(
					{348, 150, 397, 194},
					"0|0|0xb28a50,-5|-8|0xf4eddf,-7|2|0xb28a50,-4|5|0xb28a50,1|8|0xd2bd9c,-9|7|0xd6c0a0",
					95,
					0,
					0,
					0
				) ---检测是否有人申请组队
				keepScreen(false)
				if x > -1 then
					tap(x, y)
					sleep(500)
				else
					tap(165, 66) --点击我的队伍
					sleep(500)
					if isFullTeam() == false then
						hanHua(hhtext)
					end
					break
				end
			end
		else
			if isFullTeam() == true then
				return
			end
		end
	end
end

function Dialog(dhkxx)
	show({detail="选择对话框:"..dhkxx})
	if GameVersion=="公测" then--公测
		if dhkxx == 1 then
			tap(682,302)
		end
		
		if dhkxx == 2 then
			tap(682,352)
		end
		
		if dhkxx == 3 then
			tap(683,399)
		end
	end
	if	GameVersion=="内测" then
		if dhkxx == 1 then
			tap(677, 333)
		end
		
		if dhkxx == 2 then
			tap(677, 382)
		end
		
		if dhkxx == 3 then
			tap(677, 429)
		end
	end
end

function HideTask()
	if checkInterface(interfaceDatas)=="任务" then
		
	else
		toZhuJieMian()
		show({detail="隐藏任务栏任务"})
		while checkInterface(interfaceDatas) ~= "任务" do
			tap(720, 95) --打开任务面板
			sleep(500)
		end
	end
	YCRW_i = 1
	while YCRW_i < 3 do
		while true do
			sleep(100)
			x,
			y =
			findColor(
				{109, 34, 319, 462}, 
				"0|0|0xc9dfc9,-6|0|0xc9dfc9,-14|-23|0xacccb0,-1|-24|0xcae0cf,-5|19|0xc8dec4,-7|27|0xc4baad,-22|3|0xc4baad,-3|-32|0xc3b9ab",
				95,
				0,
				0,
				0
			)
			if x > -1 then --已选中的任务
				tap(x, y) --选中任务
				sleep(50)
				tap(398, 437) --点击隐藏任务
				sleep(50)
			else
				sleep(50)
				x,
				y =
				findColor(
					{101, 25, 314, 463}, 
					"0|0|0xdfd2c1,6|1|0xdfd2c0,-6|-22|0xb3a894,-5|-22|0xb3a994,11|-32|0xc2b7a8,-13|-2|0xc4baad,-1|27|0xc4baad",
					95,
					0,
					0,
					0
				)
				--未选中的任务
				if x > -1 then
					tap(x, y) --选中任务
					sleep(50)
					tap(398, 437) --点击隐藏任务
					sleep(50)
				else
					break
				end
			end
		end
		YCRW_i = YCRW_i + 1
		if YCRW_i < 3 then
			slip(197, 399, 193, 137)
		end
	end
	toZhuJieMian()
end

function qiangGongShi()
	while true do
		tap(683, 437)
		sleep(100)
		x,
		y =
		findColor(
			{236, 27, 596, 438},
			"0|0|0xf2e6c2,0|-7|0x95110b,-9|0|0x88100a,1|7|0x820f09,8|0|0x920f0b,-196|217|0xcea03d,-199|260|0x86c4b2,-41|263|0x82bfa8,-237|10|0xc2b7a8,1|302|0xc4baad",
			95,
			0,
			0,
			0
		)
		if x > -1 then
			while true do
				tap(427, 329)
				sleep(50)
			end
		end
	end
end

function taoLiZhanDou() --逃离战斗
	while checkInterface(interfaceDatas) == "战斗中~" do
		sleep(500)
		x, y = findColor({782, 407, 850, 478}, "0|0|0xacacb9,-16|33|0x7e4b17,25|34|0x7d4e1a", 95, 0, 0, 0)
		if x > -1 then --取消自动战斗
			tap(x, y)
		end
		sleep(100)
		x,
		y =
		findColor({394, 409, 483, 475}, "0|0|0xdb9a39,7|9|0xdc9934,10|24|0xb0611c,9|9|0xcf882e,10|8|0xca8836", 95, 0, 0, 0)
		if x > -1 then --选择逃跑
			tap(x, y)
		else
			sleep(100)
			x, y = findColor({700, 409, 784, 475}, "0|0|0xf4fbf9,-20|3|0x5b6671,15|-2|0xb1b69c,11|20|0x748982", 95, 0, 0, 0)
			if x > -1 then --宠物释放自动战斗技能
				tap(812, 233)
				x, y = findColor({37, 36, 380, 394}, "0|0|0xf0b800", 95, 0, 0, 0)
				if x > -1 then
					tap(x, y - 60)
				end
			end
		end
	end
end

function cunQian()
	riZhiJiLu("除暴修炼：去把钱存到钱庄里，世界喊话就不怕啦(｡•ˇ‸ˇ•｡)")
	toZhuJieMian()
	show({detail="到钱庄存钱"})
	tap(28, 29) --打开大地图
	sleep(1000)
	tap(664, 136) --点击东海渔村
	sleep(2000)
	toZhuJieMian()
	tap(103, 31) --打开小地图
	sleep(2000)
	tap(256, 26) --打开NPC精灵
	sleep(2000)
	tap(281, 174) --点击寻路至钱庄老板
	sleep(2000)
	while checkInterface(interfaceDatas) ~= "对话" do
		sleep(1000)
		if isZhanJie(3) then
			cunQian()
			return
		end
	end
	Dialog(3) ---点击存钱
	sleep(1000)
	tap(521, 321) --选择存钱
	sleep(1000)
	tap(649, 286) --点击最大
	sleep(1000)
	tap(649, 345) --点击确定
	toZhuJieMian()
end

function buChongChuBei(yaoPin)  --yaoPin 1-高级血池  2-高级灵池  3-驯兽诀
	if yaoPin>=4 then return end
	toZhuJieMian()
	tap(764,31)--打开角色面板
	sleep(1000)
	tap(664,387)--点击补充储备
	sleep(500)
	if yaoPin==3 then
		tap(683,340)--前往杂货店
	else	
		tap(574,340)--前往药店
	end
	while true do
		sleep(500)
		if checkInterface(interfaceDatas)=="商店" then
			if yaoPin==1 then
				tap(163,160) --点击高级血池
			else
				if yaoPin==2 then
					tap(371,235)
				end
			end
			sleep(500)
			tap(642,425)--点击购买
			buChongChuBei(yaoPin+1)
			return
		end
		
		if checkInterface(interfaceDatas)=="对话" then
			Dialog(1)
		end
		
		if isZhanJie(2) then
			tap(764,31)--打开角色面板
			sleep(1000)
			tap(664,387)--点击补充储备
			sleep(500)
			if yaoPin==3 then
				tap(683,340)--前往杂货店
			else	
				tap(574,340)--前往药店
			end
		end
	end
end

function yaoPinGouMai()
	if XUECHI==0 and LINGCHI==0 and ZHONGCHENG==0 then return end
	show({detail="补充储备"})
	gouMaiYaoPin=false
	gouMaiXunShouJue=false
	local xuechi={"","0|0|0xcb3434,-10|25|0x851717,5|28|0x9e1b1b","0|0|0xeb0404,-19|7|0x4b7ea4,-3|17|0x88c8e2,11|4|0xa90808","0|0|0xf5e246,-5|-13|0xcb3434,-22|4|0xb78b12,-15|13|0xb98e13,3|18|0xa27c10"}
	local lingchi={"","0|0|0x0a01e3,0|-11|0xcbc8f9,-14|11|0x1f1b83","0|0|0x1b10f1,-14|9|0x6ca2c3,16|6|0x1913a3,0|21|0xb0e9f8","0|0|0xf3dd45,2|-11|0xcbc7f9,-22|3|0xb7850f,-1|8|0xd5b526"}
	xunshoujue={"","0|0|0x463623,-3|21|0xb06b28,9|6|0x4a2119,32|14|0xd9d5c7,20|28|0xcf8a7a,18|16|0xded7c9"}
	shopping={xuechi[XUECHI+1],lingchi[LINGCHI+1]}
	if shopping[1]=="" and shopping[2]=="" then
		
	else
		toZhuJieMian()
		tap(764,31)--打开角色面板
		sleep(500)
		tap(664,387)--点击补充储备
		sleep(200)
		tap(574,340)--前往药店
		while checkInterface(interfaceDatas)~="对话" do
			sleep(100)
			if isZhanJie(1) then
				toZhuJieMian()
				tap(764,31)--打开角色面板
				sleep(500)
				tap(664,387)--点击补充储备
				sleep(200)
				tap(574,340)--前往药店
			end
		end
		while true do
			sleep(50)
			local interface=checkInterface(interfaceDatas)
			if interface=="对话" then
				Dialog(1)
			end
			
			if interface=="商店" then
				sleep(100)
				for i=1,2 do
					if shopping[i]~="" then
						sysLog("shopping"..i)
						x, y = findColor({125, 53, 541, 445}, 
							shopping[i],
							95, 0, 0, 0)
						if x > -1 then
							sysLog("shopping"..i)
							tap(x,y)
							sleep(50)
							tap(633,303)--点击数量
							sleep(100)
							tap(575,91)--点击1
							sleep(50)
							tap(705,231)--点击确定
							sleep(50)
							tap(642,425)--点击购买
							sleep(200)
						end
						sleep(100)
					end
				end
				toZhuJieMian()
				break
			end
		end
	end
	
	
	if ZHONGCHENG==0 then return end
	if xunshoujue[ZHONGCHENG+1]~="" then
		sysLog("购买驯兽诀")
		toZhuJieMian()
		sleep(1000)
		tap(764,31)--打开角色面板
		sleep(500)
		tap(664,387)--点击补充储备
		sleep(200)
		tap(683,340)--前往杂货店
		while checkInterface(interfaceDatas)~="对话" do
			sleep(100)
			if isZhanJie(1) then
				toZhuJieMian()
				tap(764,31)--打开角色面板
				sleep(500)
				tap(664,387)--点击补充储备
				sleep(200)
				tap(683,340)--前往杂货店
			end
		end
	end
	
	while true do
		sleep(50)
		local interface=checkInterface(interfaceDatas)
		if interface=="对话" then
			Dialog(1)
		end
		if interface=="商店" then
			sleep(500)
			tap(166,94)
			sleep(100)
			tap(643,303)--点击数量
			sleep(100)
			tap(575,91)--点击1
			sleep(100)
			tap(705,245)--点击确定
			sleep(100)
			tap(642,425)--点击购买
			sleep(100)
			toZhuJieMian()
			return
		end
	end
end

function closeWuGuanPage()
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
	x,
	y = findColor({0, 0, 853, 479}, "0|0|0xd30000,0|-9|0xf5e7d4,-8|0|0xeedecd,-1|7|0xe9d7c7,7|0|0xeedecd", 95, 0, 0, 0) --寻找界面关闭按钮位置2
	if x > -1 then
		tap(x, y)
	end
	keepScreen(false)
end





return TONGYONGHANSHU
