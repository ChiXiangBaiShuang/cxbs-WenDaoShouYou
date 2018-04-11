local ZHUANGBEIQIEHUAN
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("邮件发送")
require("日志记录")

function zhuangBeiQieHuan(zb_flag)
  if zb_flag == 1 then
    return
  end
  toZhuJieMian()
  tap(829, 384) --打开背包
  sleep(2000)
  x,
    y =
    findColor(
    {228, 358, 247, 383},
    "0|0|0xb88337,5|0|0xb88337,5|2|0xb88337,0|2|0xb88337,0|5|0xb88337,5|5|0xb88337,5|8|0xb88337,0|8|0xb88337",
    95,
    0,
    0,
    0
  )
  if x > -1 then --当前为第二套装备
  else --当前为第一套装备
    tap(227, 371)
  end
end

function zhuangBeiFuYuan(zb_flag)
  if zb_flag == 1 then
    return
  end
  toZhuJieMian()
  tap(829, 384) --打开背包
  sleep(2000)
  x,
    y =
    findColor(
    {228, 358, 247, 383},
    "0|0|0xb88337,5|0|0xb88337,5|2|0xb88337,0|2|0xb88337,0|5|0xb88337,5|5|0xb88337,5|8|0xb88337,0|8|0xb88337",
    95,
    0,
    0,
    0
  )
  if x > -1 then --当前为第二套装备
    tap(227, 371)
  end
end

local ZHUANGBEIQIEHUAN
