pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x = 32 y = 80 a = 0

function _init()
	print("initializing")
end

function _update()
 a+=0.1
end
	
function _draw()
 cls()
	for i=1,40 do
		for j=1,40 do
 		pset(
 			x+j + cos(a*0.1)*32,
 			y-j + sin(a*0.1)*i,
 			i%16
 	 )
 	end
	end

end


