pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
//hello

// sprite scale
s=8

function player(x, y)
    local p = {}
    // location
    p.l={x=x,y=y}
    // next location
    p.nl={x=x,y=y}
    // acceleration
    p.a={x=0,y=0}
    // velocity, previous velocity
    p.v={x=0,y=0} p.pv={x=0,y=0}
    // max velocity
    p.mv=1
    // flip x
    p.fx=false
    // flip y
    p.fy=false
    // damping
    p.d=0
    // sprite number
    p.sn=2

    p.push = function(_, x, y)
        // add force to acceleration
        _.a.x+=x
        _.a.y+=y
    end

    p.update = function(_)
        // add acceleration to velocity
        _.v.x+=_.a.x
        _.v.y+=_.a.y
        // cap velocity
        if(_.v.x > _.mv) then _.v.x=_.mv end
        if(_.v.y > _.mv) then _.v.y=_.mv end
        if(_.v.x < -_.mv) then _.v.x=-_.mv end
        if(_.v.y < -_.mv) then _.v.y=-_.mv end
        // sprite flip
        if(_.v.x>0) then _.fx=false elseif(_.v.x<0) then _.fx=true end
        if(_.v.y>0) then _.fy=false elseif(_.v.y<0) then _.fy=true end
        // collision detection
        _.nl={x=_.l.x+_.v.x,y=_.l.y+_.v.y}
        mvalx=mget(pxs(_.nl.x),pxs(_.l.y))
        mvaly=mget(pxs(_.l.x),pxs(_.nl.y))
        // add velocity to location
        if(mvalx==0) then _.l.x+=_.v.x end
        if(mvaly==0) then _.l.y+=_.v.y end
        // damping
        _.pv={x=_.v.x,y=_.v.y}
        _.v.x*=_.d
        _.v.y*=_.d
        // clear acceleration
        _.a.x*=0
        _.a.y*=0

        _.animate(_)
    end

    p.animate = function(_)
        _.sn=2
        if(_.pv.y > 0) then _.sn=3
        elseif(_.pv.y < 0) then _.sn=4 end
    end

    p.draw = function(_)
        spr(_.sn,_.l.x-4, _.l.y-4,1,1,_.fx, false)
    end

    return p
end

// Helper functions
// pixels to sprite unit
function pxs(px)
    return (px-px%8)/8
end
// sprite unit to pixels
function spx(s)
    px=s*8
    return px-px%8
end

p=player(spx(1)+4, spx(1)+4)

function _update()
 if(btn(0)) then p.push(p,-1, 0) end
 if(btn(1)) then p.push(p,1, 0) end
 if(btn(2)) then p.push(p,0, -1) end
 if(btn(3)) then p.push(p,0, 1) end
 p.update(p)
end

function _draw()
    cls()

    map(0,0,0,0,16,16)

    rect(pxs(p.l.x)*s,pxs(p.l.y)*s,pxs(p.l.x)*s+7,pxs(p.l.y)*s+7,7)
    p.draw(p)

    print(pxs(p.l.x),0,0,7)
    
end

__gfx__
00000000dddddddd0099990000999900009999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000dddddddd0099990000999900009999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700dddddddd0066630000636300009999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000dddddddd0211110000111200002221000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000dddddddd0211110000112100002222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700dddddddd0211110000221100001222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000dddddddd0088880000888800008888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000dddddddd0080080000800800008008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
