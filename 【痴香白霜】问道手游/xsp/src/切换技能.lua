local QIEHUANJINENG
require("界面数据")
require("检测")
require("点击")
require("通用函数")

function changeSkill(skillKind,skillNum)
	sysLog("切换技能:"..skillKind..","..skillNum)
	toZhuJieMian()
	tap(174, 31)
	sleep(1000)
	while checkInterface(interfaceDatas) ~= "巡逻" do
		toZhuJieMian()
		tap(174, 31)
		sleep(1000)
	end
	tap(353,377)  --打开技能选择界面
	sleep(1000)
	x,y =	findColor({0,0,854,480},skillData[skillKind][skillNum],90,0,0,0)
	if x>-1 then
		tap(x,y)
	else
		toast("没有找到技能图标")
		riZhiJiLu("没有找到技能图标~")
		tap(840,470)  --防止卡在巡逻界面
	end
end


skillData={
	{--辅助技能
		"0|0|0xf5fbfe,-7|0|0x6365a4,11|-3|0xeffeff,-16|14|0x505191,-17|-9|0x1f549f,11|-21|0x225eab",  					--一阶
		"0|0|0xcbf0bf,-3|-13|0xf7fcf6,-4|4|0xecebc9,-15|3|0x315a83,21|-13|0x111738,8|3|0xf1ead9,-1|8|0xfadaac",	--二阶
		"0|0|0xeafef7,-20|2|0x952508,20|2|0x93260e,-17|17|0x04125e,19|-14|0x131c6c,-19|-10|0x061560",  					--三阶
		"0|0|0xffffff,4|-7|0xd05ad6,-17|11|0xc56460,20|-17|0x641906,17|-20|0x721f0a,-15|-6|0x0c0b0b",   				--四阶
		"0|0|0xffffff,18|-11|0x439607,-16|-1|0x95c72a,-22|19|0x1e3d03,19|9|0xc88c65,6|10|0xadda77"   						--五阶
	},
	
	{--障碍技能
		"0|0|0xfdfbe1,-11|6|0xece565,-18|6|0x80815a,21|-7|0x7a7d55,-7|23|0x55271e,13|5|0xb6b594",          		--一阶
		"0|0|0x419da7,6|-14|0xf9ffff,-20|-4|0x415963,-20|12|0x4a4b64,19|19|0x070a0b,12|10|0x81c6c8",        		--二阶
		"0|0|0xf7ec43,8|1|0xfbee2a,-18|3|0x373346,8|1|0xfbee2a",	--三阶
		"0|0|0xfeffc4,-7|-2|0x28b695,3|-11|0xfffffb,7|-11|0xe1ff37,16|-9|0xeafcf6,15|-1|0x3e9293,8|10|0x5bb07e",--四阶
		"0|0|0xdcfdf7,-12|-3|0xffffff,-8|7|0x77cbc2,-17|2|0x2d8a85,20|-17|0x0a0f1e,14|-15|0xa09fb9"        --五阶
	},
	
	{--法术技能
		"0|0|0x7caa8a,-7|0|0xeaf3ed,-20|-9|0x1a7b95,6|-14|0x156280,13|-4|0x0a3c63,-22|7|0x0c3f61",    --一阶
		"0|0|0xe2dcab,5|1|0xb2a96a,-15|7|0x461b18,9|-5|0xfefaeb,25|-15|0x050202,21|18|0x0f0304",   --二阶
		"0|0|0xdac8b3,-9|3|0xe4d1bc,-13|11|0xe27758,-26|4|0x160859,7|-9|0xe6875a,11|-2|0xfff489",   --三阶
		"0|0|0xfdf9fd,-13|-1|0x85e7fc,0|-7|0x52c3ed,7|-13|0x8de9fc,11|-20|0xfcfafd,10|9|0x73076d",  --四阶
		"0|0|0xfefefe,-12|-4|0xe2fffe,-6|-3|0xb3508e,4|4|0xbf70a1,11|-2|0x4af1eb,14|-14|0xfcfefd"   --五阶
	},
	
	{--力系技能
		"0|0|0x4d403c,-10|-9|0x22120c,8|11|0x160904,5|-6|0x655450,-8|9|0x39312c",    --普攻
		"0|0|0xf4f0db,-12|4|0x514a4c,17|4|0x711e06,7|-15|0x706b66,-19|-16|0x150501",  --防御
		"0|0|0xfefef8,-15|-1|0xffffff,-11|5|0xd08cb1,22|-10|0xc95e14,9|8|0xfffffc",  --力破千钧
		"0|0|0xebebe5,-14|-7|0x176707,-12|-14|0x41a512,0|-11|0xd4e51b,12|-9|0x186c07,16|-6|0x4d9616"  --组合技能
	}
}







return QIEHUANJINENG