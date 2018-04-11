local DIAOYU;
require("界面数据");
require("检测");
require("点击");
require("通用函数");
require("任务查找");
require("日志记录");
iddy = createHUD()     --创建一个HUD

function diaoYu_tap(x,y,m_time)
  touchDown(1,x,y);
  sleep(m_time);
  touchUp(1,x,y);
end
function diaoYu()
  
  while true do 
    界面检测(钓鱼界面);
    sleep(100);
    
    if 界面检测(钓鱼界面)=="未抛竿" then
      sleep(500);
      tap(426,240);
    end
    
    if 界面检测(钓鱼界面)=="捕获成功" then
      sleep(500);
      tap(427,433);
    end
    
    if 界面检测(钓鱼界面)=="等候提竿" then
      while true do
        sleep(100);
        if 界面检测(钓鱼界面)=="等候提竿" then
          x, y = findColor({427, 185, 427, 185}, "0|0|0x51bfc2-0x101010",95, 0, 0, 0)
          if x > -1 then
            tap(709,272);
            break;
          end
        else
          break;
        end
      end
    end
    
    if 界面检测(钓鱼界面)=="捕获中" then
      while true do
        if 界面检测(钓鱼界面)=="捕获中" then
          sleep(50);
          x_lv, y_lv = findColor({381, 39, 439, 324}, "0|0|0x8ed18e-0x101010,0|69|0x56ad56-0x101010,31|0|0x8ed08e-0x101010,31|68|0x58b158-0x101010",95, 0, 0, 0);--绿色区域
          
          x, y = findColor({381, 39, 439, 324}, "0|0|0xff9d00-0x101010,1|19|0xfcc926-0x101010",95, 0, 0, 0);--鱼向下
          if x>-1 then
            延时=8;
            showHUD(iddy,"下",30,"0xffff0000","光标.png",0,x-50,y,40,40);
            x_yv=x;
            y_yv=y;
          end
          x, y = findColor({381, 39, 439, 324}, "0|0|0xff9d00-0x101010,-1|-19|0xfcc926-0x101010",95, 0, 0, 0);--鱼向上
          if x>-1 then
            延时=20;
            showHUD(iddy,"上",30,"0xffff0000","光标.png",0,x-50,y,40,40);
            x_yv=x;
            y_yv=y;
          end
          
          if y_lv>y_yv then
            diaoYu_tap(708,273,math.sqrt(y_lv-y_yv)*延时);--点击控制
          end
        else
          break;
        end
      end
    end
  end
  
  
end

local DIAOYU;