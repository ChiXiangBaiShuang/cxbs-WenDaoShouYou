local RIZHIJILU
firstLog = true
function riZhiJiLu(word)
  if firstLog == true then
    file = io.open("[public]log_cxbs_wdsy.txt", "w+")
		file:write(os.date("%Y年%m月%d日 %A 感谢您使用痴香白霜的问道手游辅助！\n\n"))
    firstLog = false
  else
    file = io.open("[public]log_cxbs_wdsy.txt", "a+")
  end
	file:write(os.date("%X  | ") .. word .. "\n")
  file:close()
end

function getRiZhi()
  local file = io.open("[public]log_cxbs_wdsy.txt", "r")
  riZhi = file:read("*a")
  return riZhi
end

return RIZHIJILU
