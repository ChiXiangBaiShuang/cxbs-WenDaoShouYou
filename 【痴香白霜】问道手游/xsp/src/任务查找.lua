local RENWUCHAZHAO
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("日志记录")
function _renWuChaZhao(renwu)
	
	toZhuJieMian()
	show({detail="查找任务"})
	tap(272, 21) --打开活动面板
	sleep(1000)
	while checkInterface(interfaceDatas) ~= "活动" do
		toZhuJieMian()
		tap(272, 21) --打开活动面板
		sleep(1000)
	end
	for i = 1, 10 do
		keepScreen(false)
		keepScreen(true)
		x, y = findColor({218, 47, 740, 344}, renwu, 85, 0, 0, 0)
		if x > -1 then
			tap(x + 180, y)
			riZhiJiLu("任务查找成功！")
			return true
		else
			keepScreen(false)
			slip(480, 320, 480, 315) --翻到下一页
			keepScreen(true)
			x, y = findColor({218, 47, 740, 344}, renwu, 85, 1, 1, 0)
			if x > -1 then
				tap(x + 180, y)
				riZhiJiLu("任务查找成功！")
				return true
			else
				keepScreen(false)
				slip(480, 322, 480, 300) --翻到下一页
				keepScreen(true)
				x, y = findColor({218, 47, 740, 344}, renwu, 85, 1, 1, 0)
				if x > -1 then
					tap(x + 180, y)
					riZhiJiLu("任务查找成功！")
					return true
				end
			end
		end
		keepScreen(false)
	end
	riZhiJiLu("任务查找失败!")
	return false
end

function renWuChaZhao(renwu)
	count=0
	rw_flag = _renWuChaZhao(renwu)
	while rw_flag == false do
		count=count+1
		
		if count>3 then
			dialog("任务查找失败,请与作者联系", 0)
			riZhiJiLu("任务查找失败,请与作者联系")
			sendMassage(getRiZhi())
			lua_exit()
		end
		rw_flag = _renWuChaZhao(renwu)
	end
end
data_SHIMENRENWU =
"0|0|0xefd055-0x101010,-18|22|0x13448e-0x101010,9|12|0xe7c046-0x101010,-11|27|0x154d95-0x101010,-8|1|0xf1d458-0x101010,11|5|0xe6c044-0x101010,7|21|0xecd256-0x101010"
data_BANGPAIRENWU =
"0|0|0xfff1bb-0x101010,-12|14|0xdeab37-0x101010,8|14|0xe1b43a-0x101010,-1|23|0xe8bd3f-0x101010,67|-4|0x5b2f08,77|2|0x592d07-0x101010,86|2|0xf2e8d5-0x101010,91|-2|0xf2e8d5-0x101010"
data_CHUBAORENWU =
"0|0|0xf1f2f3-0x101010,0|5|0xa89261-0x101010,-10|29|0x10468e-0x101010,64|7|0x5b2f09-0x101010,74|1|0x5d320c-0x101010,76|1|0x582b04-0x101010,11|9|0xf7f8f9-0x101010"
data_XIUXING =
"0|0|0xdee0e1-0x101010,-1|19|0x0b3c85-0x101010,41|-6|0x562902-0x101010,14|11|0xf4feff-0x101010,76|-6|0x562902-0x101010,112|-3|0xf2e8d5-0x101010,113|-3|0xf2e8d5-0x101010,114|-3|0xf2e8d5-0x101010,115|-3|0xf2e8d5-0x101010,116|-3|0xf2e8d5-0x101010,117|-3|0xf2e8d5-0x101010"
data_JINGJICHANG =
"0|0|0xbebebe-0x101010,-6|2|0xffffff-0x101010,4|3|0xffffff-0x101010,4|10|0xb2b5af-0x101010,10|22|0xe5bd32-0x101010,-10|22|0xdcb227-0x101010,0|24|0x9c9c9c-0x101010"
data_ZHURENWEILE =
"0|0|0x7689af-0x101010,12|18|0xf8f8f9-0x101010,5|28|0xf3f6f9-0x101010,-11|32|0x164891-0x101010,-10|20|0xe8f0f7-0x101010,12|17|0xf8f8f9-0x101010,11|-2|0x6f84ac-0x101010,16|6|0xf6fdf8-0x101010"
data_BANGPAIRICHANGTIAOZHAN =
"0|0|0xffeeb1-0x101010,-9|14|0xe0ae39-0x101010,8|13|0xe0b33a-0x101010,87|-3|0x562902-0x101010,105|-2|0x562902-0x101010"
data_TONGTIANTA =
"0|0|0xa79160-0x101010,0|-5|0xf2f2f4-0x101010,9|4|0xf8f9f9-0x101010,-10|24|0x10478f-0x101010,66|-1|0x562902-0x101010,69|-3|0xf2e8d5-0x101010,70|-3|0xf2e8d5-0x101010,71|-3|0xf2e8d5-0x101010,72|-3|0xf2e8d5-0x101010,73|-3|0xf2e8d5-0x101010,74|-3|0xf2e8d5-0x101010"
data_XIUFARENWU =
"0|0|0xf6e988-0x101010,-22|-3|0x493824-0x101010,11|27|0x5e492f-0x101010,-10|9|0xf1eaad-0x101010,-8|17|0xf3fbff-0x101010"
data_DOUCHONGDAHUI=
"0|0|0xecead8-0x101010,-2|14|0x92723a-0x101010,-8|2|0xf7f4e9-0x101010,8|12|0xdbd7c5-0x101010,65|-5|0x562902-0x101010,77|-4|0x562902-0x101010,65|1|0xf2e9d5-0x101010"
data_SHIJUEZHEN =
"0|0|0xdcdedf-0x101010,1|10|0xf1faff-0x101010,-1|19|0x0c3d86-0x101010,14|11|0xf5feff-0x101010,41|-6|0x562902-0x101010,118|-2|0x5f340f-0x202020"
data_WUXUELILIAN =
"0|0|0xf0eddb-0x101010,1|13|0x9b7b3f-0x101010,-6|3|0xf7f5ea-0x101010,42|-5|0x562902-0x101010,42|3|0x562902-0x101010,64|-5|0x562902-0x101010,64|3|0x562902-0x101010,92|1|0x562902-0x101010"

return RENWUCHAZHAO
