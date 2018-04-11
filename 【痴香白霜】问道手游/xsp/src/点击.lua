local _tap

math.randomseed(tostring(os.time()):reverse():sub(1, 7)) --添加随机数种子

Lx = 500
Ly = 300

function tap(x, y) --点击函数
  --idtap = createHUD();
  x = x - math.random(-5, 5) --点击坐标点随机范围
  y = y - math.random(-5, 5)

  --[[showHUD(idtap,"",30,"0xffff0000","光标.png",0,Lx,Ly,40,40);--显示点击光标
  for i=1,10 do
    sleep(2);
    showHUD(idtap,"",30,"0xffff0000","光标.png",0,Lx-(Lx-x)/10*i,Ly-(Ly-y)/10*i,40,40);--显示点击光标
  end
	sleep(10);
  showHUD(idtap,"",30,"0xffff0000","光标.png",0,x+1,y+1,40,40);--显示点击光标
	sleep(400);]]
  touchDown(1, x, y)
  sleep(5)
  touchUp(1, x, y)
  sleep(100)
  --hideHUD(idtap);
  --sleep(100);
end

function sleep(num) --暂停
  mSleep(num + math.random(-50, 50)) --暂停时间在参数上下波动
end

function slip(x1, y1, x2, y2) --从x1,y1滑动到x2,y2
  --idslip = createHUD();
  --showHUD(idslip,"",30,"0xffff0000","光标.png",0,x1-6,y1,40,40);
  touchDown(1, x1, y1)
  touchMove(1, x2, y2)
  --showHUD(idslip,"",30,"0xffff0000","光标.png",0,x2-6,y2,40,40);
  sleep(200)
  touchUp(1, x2, y2)
  --hideHUD(idslip);
end

return _tap
