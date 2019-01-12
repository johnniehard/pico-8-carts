pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x = 64 y = 64
r = 1
pcol = 2
v = {}
v.x = 0
v.y = 0

function _update()
 if (btn(0)) v.x=-1
 if (btn(1)) v.x=1
 if (btn(2)) v.y=-1
 if (btn(3)) v.y=1
 x+=v.x
 y+=v.y
 
 if	(
 	pget(
 		x+(v.x+ ((r+1)*v.x) ),
 		y+(v.y+ ((r+1)*v.x) )
 	 )	== pcol
 	)
 then
 	hit()
	end
	
	v.x=0 v.y=0
end

function hit()
	pcol += 1
 pcol %= 12
 pcol += 2
end

function _draw()
	circfill(x,y,r,pcol)
end
