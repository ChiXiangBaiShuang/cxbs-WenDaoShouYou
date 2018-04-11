local YOUJIANFASONG

local bb = require("badboy")
bb.loadluasocket()
function sendMassage(nr)
	if user==nil then return end
	local smtp = bb.smtp
	from = "<amaodexiaochengxu@163.com>" -- 发件人
	--发送列表
	rcpt = {
		"<"..user..">"
	}
	mesgt = {
		headers = {
			to = "903869836@qq.com", -- 收件人
			cc = "<905728076@qq.com>", -- 抄送
			subject = "痴香白霜の问道"
		},
		body = nr
	}
	r,
	e =
	smtp.send {
		server = "smtp.163.com", --smtp服务器地址
		user = "amaodexiaochengxu@163.com",
		--smtp验证用户名
		password = "fannymagnet000", --smtp验证密码
		from = from,
		rcpt = rcpt,
		source = smtp.message(mesgt)
	}
	
end

return YOUJIANFASONG
