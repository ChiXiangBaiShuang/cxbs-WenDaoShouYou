local JUSUOQINGSAO
require("检测")
require("点击")
require("通用函数")

function juSuoQingSao()
	JUSUOQINGSAO_i=0
	toZhuJieMian()
	while true do
		sleep(500)
		if isZhanJie(2) then
			tap(75, 366) --打开社交界面
			sleep(1000)
			tap(33, 131) --进入世界频道
			sleep(1000)
			x, y = findColor({70, 59, 137, 462}, 
				"0|0|0x4c351a",
				95, 0, 0, 0)
			if x > -1 then
				tap(x+10,y+10)--点击玩家头像
			end
			sleep(1500)
			tap(449,321)  --查看空间
			sleep(1000)
			tap(761,295)--居所
			sleep(1000)
			tap(389,423)--协助清扫
			toZhuJieMian()
			JUSUOQINGSAO_flag=1
		end
		
		if checkInterface(interfaceDatas)=="对话" and JUSUOQINGSAO_flag==1 then
			JUSUOQINGSAO_flag=0
			Dialog(1)
			JUSUOQINGSAO_i=JUSUOQINGSAO_i+1
			toast("居所清扫次数:"..JUSUOQINGSAO_i.."/10")
			sleep(3000)
		end
		
		if JUSUOQINGSAO_i>=10 then
			return
		end
		
	end
	
end


return JUSUOQINGSAO