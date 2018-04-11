local NIANHUOSHANGREN
require("界面数据")
require("检测")
require("点击")
require("通用函数")
require("数字识别")
require("日志记录")

function cj_shuZiShiBie()
  local ocr,
    msg =
    createOCR(
    {
      type = "tesseract", -- 指定tesseract引擎
      path = "[external]", -- 使用开发助手/叉叉助手的扩展字库
      lang = "eng_ext" -- 使用英文增强字库(注意需要提前下载好)
    }
  )

  resetScreenScale()

  if width == 480 then
    OCRarea = {738, 240, 772, 258}
  else
    setScreenScale(480, 854)
    return -1
  end

  local code,
    text =
    ocr:getText(
    {
      psm = 7,
      rect = OCRarea,
      diff = {
        "0xe52e6b-0x101010",
        "0xe44d7c-0x101010",
        "0xe4537f-0x101010",
        "0xe53c73-0x101010",
        "0xe53e74-0x101010",
        "0xe4537f-0x101010",
        "0xe5326d-0x101010"
      },
      whitelist = "0123456789"
    }
  )
  ocr:release()

  num = tonumber(string.sub(text, 1, 3))
  if num ~= nil then
    return num
  end
  setScreenScale(480, 854)
  return -2
end

function gouMaiShangPin()
  toZhuJieMian()
  tap(733, 155)
  sleep(1000)
  while checkInterface(interfaceDatas) ~= "对话" do --去年货商人处购买商品
    sleep(1000)
  end
  Dialog(2)
  sleep(1000)
  Dialog(3) ---购买新衣裳
  sleep(1000)
  Dialog(1)
  sleep(1000)
  if checkInterface(interfaceDatas) == "确认" then
    tap(498, 287) --点击确定
  else
    lua_exit()
  end
end
_x = 250
Y = {79, 126, 176, 221, 270, 317}
function xunZhaoMaiJia()
  for page = 1, 2 do
    for i = 1, #Y do
      toZhuJieMian()
      tap(103, 31) --打开小地图
      sleep(1000)
      tap(225, 24) ---打开NPC小精灵
      sleep(1000)
      if page == 2 then
        slip(273, 318, 168, 82)
        sleep(1000)
      end
      tap(_x, Y[i]) --点击寻路至NPC
      sleep(500)
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
        y =
        findColor({0, 0, 853, 479}, "0|0|0xd30000,0|-9|0xf5e7d4,-8|0|0xeedecd,-1|7|0xe9d7c7,7|0|0xeedecd", 95, 0, 0, 0) --寻找界面关闭按钮位置2
      if x > -1 then
        tap(x, y)
      end
      keepScreen(false)
      sleep(1000)
      while checkInterface(interfaceDatas) ~= "对话" do
        sleep(1000)
      end
      Dialog(1) --查看价格
      sleep(1000)
      jiage = cj_shuZiShiBie()
      sysLog(jiage)
      while jiage >= 140 do
        Dialog(1) --出售
        sleep(1000)
        tap(498, 287) --点击确定
        gouMaiShangPin()
        _y = i
        _page = page
        toZhuJieMian()
        tap(103, 31) --打开小地图
        sleep(1000)
        tap(225, 24) ---打开NPC小精灵
        sleep(1000)
        if _page == 2 then
          slip(273, 318, 168, 82)
          sleep(1000)
        end
        tap(_x, Y[_y]) --点击寻路至NPC
        sleep(500)
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
          y =
          findColor(
          {0, 0, 853, 479},
          "0|0|0xd30000,0|-9|0xf5e7d4,-8|0|0xeedecd,-1|7|0xe9d7c7,7|0|0xeedecd",
          95,
          0,
          0,
          0
        ) --寻找界面关闭按钮位置2
        if x > -1 then
          tap(x, y)
        end
        keepScreen(false)
        sleep(1000)
        while checkInterface(interfaceDatas) ~= "对话" do
          sleep(1000)
        end
        Dialog(1) --查看价格
        sleep(1000)
        jiage = cj_shuZiShiBie()
      end
    end
  end
end

function nianHuoShangRen()
  sleep(1000)
  toZhuJieMian()
  while true do
    --gouMaiShangPin();
    xunZhaoMaiJia()
  end
end

return NIANHUOSHANGREN
