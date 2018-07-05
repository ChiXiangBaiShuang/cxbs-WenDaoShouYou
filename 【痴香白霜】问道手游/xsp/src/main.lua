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
require("UI")
require("切换技能")
require("好爱答题")
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
currentTask = " "
setScreenScale(480, 854) --在480,854分辨率的手机中开发了脚本
---------------------------------------------------------------------
---------------------------------------------------------------------
--测试部分
function onBeforeUserExit()
	riZhiJiLu("人为结束脚本运行！")
	sendMassage(getRiZhi())
end

if getUserID() == "null" then
	--测试代码写在这里
	
end

----------------------------------------------------------------------
----------------------------------------------------------------------
riZhiJiLu("痴香白霜の问道手游 开始运行")
MyUIJson = json.decode(curUI)
MyUIJson["height"] = Global_width * 0.9
MyUIJson["width"] = Global_height * 0.7
uijson = json.encode(MyUIJson)

ret, Global_result = showUI(uijson)
if ret == 0 then
	lua_exit()
end

UIset()
riZhiJiLu("脚本运行结束~")
sendMassage(getRiZhi())
