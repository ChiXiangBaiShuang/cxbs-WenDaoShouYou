local SHUZISHIBIE
require("邮件发送")
require("日志记录")
 --
--[[
-1 分辨率不支持
-2 识别失败
]] function shuZiShiBie()
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
    OCRarea = {399, 98, 419, 113}
  else
    if width == 720 then
      OCRarea = {599, 148, 629, 170}
    else
      setScreenScale(480, 854)
      return -1
    end
  end

  local code,
    text =
    ocr:getText(
    {
      psm = 7,
      rect = OCRarea,
      diff = {
        "0x562a03-0x101010",
        "0x5f340f-0x101010",
        "0x876a4e-0x101010",
        "0x673f1c-0x101010",
        "0x714c2c-0x101010",
        "0x7a593b-0x101010",
        "0x785637-0x101010",
        "0x836448-0x101010",
        "0x85674b-0x101010",
        "0x977e66-0x101010",
        "0x84664a-0x101010",
        "0x90765d-0x101010",
        "0x886b50-0x101010",
        "0x836549-0x101010",
        "0x8c7157-0x101010"
      },
      whitelist = "0123456789"
    }
  )
  ocr:release()

  num = tonumber(string.sub(text, 1, 2))
  if num ~= nil then
    while true do
      if num <= 10 then
        setScreenScale(480, 854)
        return num
      else
        num = math.floor(num / 10)
      end
    end
  else
    setScreenScale(480, 854)
    return -2
  end
end

return SHUZISHIBIE
