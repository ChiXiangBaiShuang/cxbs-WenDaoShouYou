init("0", 1) --以当前应用 Home 键在右边初始化

--[[
问道手游

--]]
-----------------------------初始化操作------------------------------
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("UI配置读取")
require("武学历练")
require("数字识别")
require("福利领取")
require("邮件发送")
require("日志记录")
require("新春任务-年货商人")

--[[
全局变量一览
Global_width		脚本运行环境屏幕宽度
Global_height		脚本运行环境屏幕高度
Global_interface	当前游戏界面
Global_OSType		当前用户操作系统类型
Global_HUD			全局HUD
Global_task			当前任务
Global_detail		当前任务详情
Global_result		UI选择结果
]]
local bb = require("badboy")
bb.loaduilib()
local json = bb.getJSON()

Global_interface = "未定义"
Global_width, Global_height = getScreenSize()
Global_OSType = getOSType()
Global_HUD = createHUD()
Global_task = "痴香白霜0o0"
Global_datail = "脚本开始执行~"
function show(data)
	data.task = data.task or Global_task
	data.detail = data.detail or Global_datail
	Global_task = data.task
	Global_datail = data.detail
	showHUD(
		Global_HUD,
		"[" .. Global_task .. "] [" .. Global_interface .. "] [" .. Global_datail .. "]",
		(Global_width / 480) * 12, --字体大小
		"0xff00ffff", ----字体颜色
		"0x00000000", -----背景颜色
		0, ---起始位置 0,0
		0, ---显示位置x
		470, ----显示位置y
		854, ---显示大小width
		18 ----显示大小height
	)
end
currentTask=" "
setScreenScale(480, 854) --在480,854分辨率的手机中开发了脚本
---------------------------------------------------------------------
---------------------------------------------------------------------
--测试部分
if getUserID() == "null" then
	--测试代码写在这里
	GameVersion="内测"
	buChongChuBei(1)
	lua_exit()
end
----------------------------------------------------------------------
----------------------------------------------------------------------
riZhiJiLu("痴香白霜の问道 脚本开始运行~\n")
MyUIJson =
json.decode(
	string.gsub(
		'{   "style" : "default",   "config" : "save_【痴香白霜】问道手游.dat",   "width" : 560,   "height" : 480,   "cancelscroll" : true,   "cancelname" : "退出",   "okname" : "确定",   "views" : [      {         "text" : "【设置】",         "type" : "Page",         "views" : [            {               "align" : "center",               "color" : "0,0,0",               "size" : "50",               "text" : "【痴香白霜】问道手游",               "bg" :"255,255,255",               "type" : "Label"            },            {               "align" : "center",               "color" : "255,0,0",               "size" : "10",               "text" : "完成设置后点击确定就可以解放双手啦~",               "bg" : "255,255,255",               "type" : "Label"            },						{               "align" : "center",               "color" : "0,0,0",               "size" : "30",               "text" : "【快捷设置】(请勾选自定义!)",               "bg" : "255,255,255",               "type" : "Label"            },						{	            "id" : "快捷选择",	            "list" : "痴香白霜0o0,天涯の小仙,天涯の小晓,自定义",	            "select" : "0",	            "size" : "15",	            "type" : "RadioGroup",	            "orientation" : "horizontal",	            "color" : "0,0,0"            },            {               "align" : "center",               "color" : "0,0,0",               "size" : "30",               "text" : "【模式选择】",               "bg" : "255,255,255",               "type" : "Label"            },						{	            "id" : "模式选择",	            "list" : "混队刷道到指定时间开始日常任务,直接开始日常任务,武学历练",	            "select" : "0",	            "size" : "15",	            "type" : "RadioGroup",	            "orientation" : "horizontal",	            "color" : "0,0,0"            },		{               "align" : "center",               "color" : "0,0,0",               "size" : "30",               "text" : "【游戏版本】",               "bg" : "255,255,255",               "type" : "Label"					},		{	            "id" : "区组选择",	            "list" : "公测区,内测区",	            "select" : "0",	            "size" : "15",	            "type" : "RadioGroup",	            "orientation" : "horizontal",	            "color" : "0,0,0"            },            {               "align" : "center",               "color" : "0,0,0",               "size" : "30",               "text" : "【选择任务】",               "bg" : "255,255,255",               "type" : "Label"            },            {               "id" : "任务选择",               "list" : "1.师门任务  ,2.帮派任务 ,3.帮派挑战  ,4.助人为乐  ,5.竞 技 场  ,6.斗宠大会  ,7.修法任务  ,8.通 天 塔  ,9.带队修炼  ,10.混队刷道",               "select" : "0@1@2@3@4@5@6@7@8@9",               "size" : "15",               "type" : "CheckBoxGroup",               "orientation" : "horizontal",               "color" : "0,0,0"            },            {               "align" : "center",               "color" : "0,0,0",               "size" : "30",               "text" : "【任务参数设置】",               "bg" : "255,255,255",               "type" : "Label"            },            {               "id" : "line",               "type" : "Line",               "color" : "200,200,200",               "height" : 2,               "width" : 400            },{               "align" : "center",               "color" : "0,0,0",               "size" : "30",               "text" : "【开始日常任务时间】",               "bg" : "255,255,255",               "type" : "Label"            },						{	            "id" : "group1",	            "width" :550,	            "height" : 150,	            "type" : "LinearLayout",	            "views" : [	            	{	                "id" : "任务开始时间-小时",	                "list" : "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23",	                "select" : "5",	                "size" : "15",	                "type" : "ComboBox",	                "width" :150                },								{	                "align" : "left",	                "color" : "0,0,0",	                "size" : "20",	                "text" : "点",	                "bg" : "255,255,255",	                "type" : "Label",	                "width" : 50                },								{	                "id" : "任务开始时间-分",	                "list" : "01,15,30,45",	                "select" : "0",	                "size" : "15",	                "type" : "ComboBox",	                "width" : 200               },								{	                "align" : "left",	                "color" : "0,0,0",	                "size" : "20",	                "text" : "分",	                "bg" : "255,255,255",	                "type" : "Label",	                "width" : 50               }	            ]            },            {               "align" : "center",               "color" : "0,0,0",               "size" : "25",               "text" : "【新的一天开始的时候需要我做什么~】",               "bg" : "255,255,255",               "type" : "Label"            },            {               "id" : "使用变身卡",               "list" : "开始任务前使用置顶变身卡,不使用变身卡",               "select" : "0",               "size" : "15",               "type" : "RadioGroup",               "orientation" : "horizontal",               "color" : "200,0,200"            }, {               "id" : "居所清扫",							"list" : "随机清扫世界居所,不需要清扫世界居所",               "select" : "0",               "size" : "15",               "type" : "RadioGroup",               "orientation" : "horizontal",               "color" : "150,0,200"            },           {               "id" : "福利领取",               "list" : "领取每日签到和会员元宝 ,不需要领取每日签到和会员元宝",               "select" : "0",               "size" : "15",               "type" : "RadioGroup",               "orientation" : "horizontal",               "color" : "0,200,200"            },{               "align" : "center",               "color" : "0,0,0",               "size" : "15",               "text" : "【储备补充】",               "bg" : "255,255,255",               "type" : "Label"            },						{	            "id" : "血池补充",	            "list" : "不需要血池,血池,中级血池,高级血池",	            "select" : "0",	            "size" : "15",	            "type" : "RadioGroup",	            "orientation" : "horizontal",	            "color" : "0,0,0"            },						{	            "id" : "灵池补充",	            "list" : "不需要灵池,灵池,中级灵池,高级灵池",	            "select" : "0",	            "size" : "15",	            "type" : "RadioGroup",	            "orientation" : "horizontal",	            "color" : "0,0,0"            },						{	            "id" : "忠诚补充",	            "list" : "不购买驯兽诀,购买驯兽诀",	            "select" : "0",	            "size" : "15",	            "type" : "RadioGroup",	            "orientation" : "horizontal"            },            {               "id" : "line",               "type" : "Line",               "color" : "200,200,200",               "height" : 2,               "width" : 400            },            {               "align" : "center",               "color" : "0,0,0",               "size" : "25",               "text" : "【设置任务和奖励类型】",               "bg" : "255,255,255",               "type" : "Label"            },            {               "align" : "center",               "color" : "0,0,0",               "size" : "15",               "text" : "【带队修炼】",               "bg" : "255,255,255",               "type" : "Label"            },            {               "id" : "修炼类型",               "list" : "修炼任务类型：修行,修炼任务类型：十绝阵",               "select" : "1",               "size" : "15",               "type" : "RadioGroup",               "orientation" : "horizontal",               "color" : "200,200,0"            },            {               "align" : "center",               "color" : "0,0,0",               "size" : "15",               "text" : "【混队刷道】",               "bg" : "255,255,255",               "type" : "Label"            },            {               "id" : "is双倍",               "list" : "开启双倍刷道,关闭双倍刷道",               "select" : "1",               "size" : "15",               "type" : "RadioGroup",               "orientation" : "horizontal",               "color" : "200,50,200"            },						{	            "id" : "装备切换",	            "list" : "切换至第二套装备,不需要切换至第二套装备",	            "select" : "0",	            "size" : "15",	            "type" : "RadioGroup",	            "orientation" : "horizontal",	            "color" : "100,60,60"            },            {               "id" : "刷道任务类型",               "list" : "刷道：降妖,刷道：伏魔,刷道：飞仙渡邪",               "select" : "2",               "size" : "15",               "type" : "RadioGroup",               "orientation" : "horizontal",               "color" : "100,100,125"            },						{	            "id" : "世界喊话居所清扫",	            "list" : "世界喊话居所清扫,不需要世界喊话居所清扫",	            "select" : "0",	            "size" : "15",	            "type" : "RadioGroup",	            "orientation" : "horizontal",	            "color" : "52,100,125"            },						{	            "id" : "刷道积分奖励领取",	            "list" : "自动领取刷道积分奖励,不需要自动领取刷道积分奖励",	            "select" : "0",	            "size" : "15",	            "type" : "RadioGroup",	            "orientation" : "horizontal",	            "color" : "50,50,225"            },            {               "id" : "混队刷道次数",               "align" : "center",               "color" : "255,255,0",               "kbtype" : "number",               "prompt" : "在这里填写混队刷道次数，默认100",               "size" : "15",               "text" : "",               "type" : "Edit"            },            {               "align" : "center",               "color" : "0,0,0",               "size" : "15",               "text" : "【助人为乐】",               "bg" : "255,255,255",               "type" : "Label"            },            {               "id" : "助人为乐奖励类型",               "list" : "经验奖励,道行奖励,潜能奖励",               "select" : "1",               "size" : "15",               "type" : "RadioGroup",               "orientation" : "horizontal",               "color" : "125,0,200"            },            {               "id" : "助人为乐倍数",               "list" : "单倍奖励,多倍奖励",               "select" : "0",               "size" : "15",               "type" : "RadioGroup",               "orientation" : "horizontal",               "color" : "0,125,200"            },            {               "align" : "center",               "color" : "0,0,0",               "size" : "15",               "text" : "【通天塔】",               "bg" : "255,255,255",               "type" : "Label"            },            {               "id" : "通天塔奖励类型",               "list" : "经验奖励,道行奖励",               "select" : "0",               "size" : "15",               "type" : "RadioGroup",               "orientation" : "horizontal",               "color" : "150,155,15"            },{	            "id" : "通天塔任务进度",	            "list" : "只完成修炼层,自动刷挑战层",	            "select" : "1",	            "size" : "15",	           "type" : "RadioGroup",	            "orientation" : "horizontal",	            "color" : "0,0,0"            },	{	            "align" : "center",	            "color" : "0,0,0",	            "size" : "15",	            "text" : "【修法任务】",	            "bg" : "255,255,255",	            "type" : "Label"            },						{	            "id" : "修法任务奖励倍数",	            "list" : "使用紫气鸿蒙,不使用紫气鸿蒙",	            "select" : "0",	            "size" : "15",	            "type" : "RadioGroup",	            "orientation" : "horizontal",	            "color" : "40,140,125"            }         ]      },{         "text" : "【反馈】",         "type" : "Page",         "views" : [            {               "align" : "center",               "color" : "0,0,0",               "size" : "20",               "text" : "填上你的邮箱,脚本执行完成后就能收到邮件提醒",               "bg" : "255,255,255",               "type" : "Label"            },						{	            "id" : "Edit1",	            "align" : "left",	            "color" : "0,0,0",	            "kbtype" : "string",	            "prompt" : "填上邮箱地址",	            "size" : "15",	            "text" : "",	            "type" : "Edit"            }         ]		}   ]}',
		"\n",
		""
	)
)
MyUIJson["height"] = Global_width * 0.9
MyUIJson["width"] = Global_height * 0.7
uijson = json.encode(MyUIJson)

ret, Global_result = showUI(uijson)
if ret == 0 then
	lua_exit()
end

function beforeUserExit()
	if getUserID() ~= "null" then
		riZhiJiLu("人为结束脚本运行！")
		sendMassage(getRiZhi())
	end
end
UIset()
riZhiJiLu("脚本运行结束~")
sendMassage(getRiZhi())
