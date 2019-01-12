pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x = 32 y = 80 a = 0

greeting = "hello earthling ♥"

print(greeting, 10, 10)

function _init()
	print("initializing")
end

function _update()
 a+=0.1
-- camera(0,()*10)
end
	
function _draw()
	fillp()
 -- cls()
	for i=1,40 do
		for j=1,40 do
 		pset(
 			x+j + cos(a*0.1)*32,
 			y-j + sin(a*0.1)*i,
 			i%16
 	 )
 	end
	end

	fillp(8+64+512+4096+ 8192+512)
	rectfill(0,0,40,40,0x12*a*0.1)
end


