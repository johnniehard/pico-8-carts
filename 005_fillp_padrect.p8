pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
cls()
col={} col2={}
col[1]=8 col[2]=9 col[3]=10
col2[1]=0x81 col2[2]=0x91 col2[3]=0x101
yp=10
yh=80
rectfill(0,0,128,128,1)
n=3

p=20 --padding
g=10 --gap
w=10 --width
w=(128-(p*2)-(g*n-2))/n

fillp(0b0101101001011010.1)
for i=0,n-1 do
 circfill(
 	p+(g*i+w*i)+w/2,
 	yp+yh,
 	20,col[i+1]
 )
end
fillp()
rectfill(0,0,128,yp+yh,1)
for i=0,n-1 do
 rectfill(
 	p+(g*i+w*i),
 	yp,
 	p+w+(g*i+w*i),
 	yp+yh, col[i+1]
 )
end

