local YOUJIANFASONG

local bb = require("badboy")
bb.loadluasocket()
function sendMassage(nr)
	if ScriptUser==nil then sysLog("用户邮箱为空") return end
	local smtp = bb.smtp
	from = "<cxbswdsy@126.com>" -- 发件人
	--发送列表
	rcpt = {
		"<"..ScriptUser..">"
	}
	mesgt = {
		headers = {
			to = ScriptUser, -- 收件人
			cc = "", -- 抄送
			subject = "痴香白霜の问道手游"
		},
		body = nr
	}
	r,
	e =
	smtp.send {
		server = "smtp.126.com", --smtp服务器地址
		user = "cxbswdsy@126.com",
		--smtp验证用户名
		password = "fannymagnet000", --smtp验证密码
		from = from,
		rcpt = rcpt,
		source = smtp.message(mesgt)
	}
	sysLog("邮件发送成功~")
end

return YOUJIANFASONG
