local HAOAIDATI
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("任务查找")
require("日志记录")

local http = require("G_libs.socket.http")
local ltn12 = require("G_libs.socket.ltn12")
require("点击")
--require "STR_BASE"
local math_random = math.random
local function get_ran_key()
	math.randomseed(os.time())
	return math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)
end
local url = ""
function SendFile(MyUserStr, GameID, FilePath, TimeOut)  --发送图片文件到服务器
	--参数:----------密码串,游戏ID,发送的图片绝对路径,超时时间单位秒
	--成功：返回提交编号(如"1002_2521173385YLD60D")
	--失败：""(空，即网络连接超时导致)、#图片路径有误、#图片超限(目前限制800KB内)、#图片过小、#密码串有误、#GameID不存在、#题分不足、#网络错误等
	GameID = GameID or 5001
	TimeOut = TimeOut or 120
	http.TIMEOUT = timeout
	local files
	local file = io.open(FilePath,"rb")
	if file then
		files = file:read("*a")
		file:close()
	end
	local response_body = {}
	local boundary = "---------------------------7de3a916a0ab0"
	local datatable = {
		"--"..boundary.."\n",
		'Content-Disposition: form-data; name="userStr"\n\n',
		MyUserStr,
		"\n--"..boundary.."\n",
		'Content-Disposition: form-data; name="gameid"\n\n',
		GameID,
		"\n--"..boundary.."\n",
		'Content-Disposition: form-data; name="timeout"\n\n',
		TimeOut,
		"\n--"..boundary.."\n",
		'Content-Disposition: form-data; name="rebate"\n\n',
		--"1316|544EB611B23FD4DF",软件KEY
		"3731|4CB212DAE17D8B8B",
		"\n--"..boundary.."\n",
		'Content-Disposition: form-data; name="daili"\n\n',
		"Haoi",
		"\n--"..boundary.."\n",
		'Content-Disposition: form-data; name="kou"\n\n',
		"\n--"..boundary.."\n",
		'Content-Disposition: form-data; name="beizhu"\n\n',
		"\n--"..boundary.."\n",
		'Content-Disposition: form-data; name="ver"\n\n',
		"Web2",
		"\n--"..boundary.."\n",
		'Content-Disposition: form-data; name="key"\n\n',
		get_ran_key(),
		"\n--"..boundary.."\n",
		'Content-Disposition: form-data; name="img"; filename="post.png"\n',
		'Content-Type: image/png\n\n',
		files,
		"\n--"..boundary.."--"
	}
	local data = table.concat( datatable)
	--sysLog(data)
	function get_haoai_url()--这里的获取 url 地址 不对   应该包括 端口号 还有就是需要随机选其中一个服务器
		local res, code = http.request('http://2.haoi23.net/svlist.html')
		if code == 200 then
			local b = string.find(res,":")
			return string.sub(res,4,b+4)
		end
	end
	function get_haoai_url_host()--这里的获取 url 地址 不对   应该包括 端口号 还有就是需要随机选其中一个服务器
		local res, code = http.request('http://2.haoi23.net/svlist.html')
		if code == 200 then
			local b = string.find(res,":")
			return string.sub(res,4,b-1)
		end
	end
	url = get_haoai_url()
	local post_ = get_haoai_url_host()
	local headers = {
		["Accept"]= "*/*",
		["Accept-Language"] = "zh-cn",
		["Content-Type"] = "multipart/form-data; boundary=---------------------------7de3a916a0ab0",
		["Host"] = post_ ,
		["Content-Length"] = #data,
		["Accept-Encoding"] = "gzip, deflate",
		["User-Agent"] = "ben",
		["Connection"] = "Keep-Alive",
		["Expect"] = "100-continue"
	}
	
	local rep , code = http.request{
		url = "http://"..url.."/UploadAPI.aspx",
		method = "POST",
		headers = headers  ,
		source = ltn12.source.string(data),
		sink = ltn12.sink.table(response_body),
	}
	
	return response_body[1]
end

function GetAnswer (TID)--先把这里改改   host 是读取的url 里的 去掉冒号 后面的内容   你该我看着
	--TID:编号(SendFile函数获取),可选填；如果写空(""),软件会自动读取编号发送
	--获取服务器返回的答案
	local str = TID
	local str_ = "id="..str.."&r="..get_ran_key()
	local response_body = {}
	local headers = {
		["Accept"]= "*/*",
		["Accept-Language"] = "zh-cn",
		["Content-Type"] = "application/x-www-form-urlencoded",
		["Host"] = post_ ,
		["Content-Length"] = #str_,
		["Accept-Encoding"] = "gzip, deflate",
		["User-Agent"] = "ben",
		["Connection"] = "Keep-Alive",
		--["Expect"] = "100-continue"
	}
	
	local rep , code = http.request{
		url = "http://"..url.."/getanswer.aspx",
		method = "POST",
		headers = headers  ,
		source = ltn12.source.string(str_),
		
		sink = ltn12.sink.table(response_body),
	}
	return response_body[1]
end

--[[
local res = SendFile("cxbs903869836|YGIGGNNGFXO6RM2K", "X1008", "[public]验证码.png", 60)
sysLog(res)
mSleep(1000)
while true do
	local res = GetAnswer (res)
	if res then sysLog(res) mSleep(60000) break end
	mSleep(1000)
end
]]


init("0", 1); --以当前应用 Home 键在右边初始化
local ocr, msg = createOCR({
		type = "tesseract", -- 指定tesseract引擎
		path = "[external]", -- 使用开发助手/叉叉助手的扩展字库
		lang = "eng"
	})

rectAnswer={
	{357,397,615,423},--A
	{703,397,963,423},--B
	{361,473,625,500},--C
	{706,476,964,500} --D
}

chiose={};

function SHUADAODATI()
	setScreenScale(720,1280)
	while true do
		mSleep(500)
		x, y = findColor({247, 100, 1030, 620},
			"0|0|0xeadecb,-253|-11|0x7e4c2b,-430|-18|0x855230,-683|-4|0xc1b6a8,-611|439|0xc0b5a6",
			95, 0, 0, 0)
		if x > -1 then
			sysLog("检测到老君查岗界面")
			playAudio("提醒.mp3")
			snapshot("[public]验证码.png", 527,265,753,329); ---720P截取验证码部分
			local res = SendFile("cxbs903869836|YGIGGNNGFXO6RM2K", "X1008", "[public]验证码.png", 60)
			sysLog(res)
			
			for i=1,(#rectAnswer) do
				local code, text = ocr:getText({
						psm=7,
						rect = rectAnswer[i],
						diff = {"0x800000-0x101010","0x8d1a19-0x101010","0x9a3431-0x101010","0x860b0a=0x101010","0x850909-0x101010"},
						whitelist = "0123456789"
					})
				chiose[i]=string.gsub(text, "%D", "")
				sysLog("第"..i.."个选项的答案为："..chiose[i])
			end
			
			mSleep(1000)
			while true do
				local answer = GetAnswer (res)
				if answer then sysLog(answer) mSleep(3000) break end
				mSleep(1000)
			end
			for i=1,(#chiose) do
				if chiose[i]==answer then
					tap(rectAnswer[i][1]+15,rectAnswer[i][2]+15)
					mSleep(1000)
					break
				end
			end
		end
	end
	setScreenScale(480,854)
end

return HAOAIDATI