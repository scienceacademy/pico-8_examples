--mobs
function makemob(x,y)
	local newmob={}
	newmob.x=x
	newmob.y=y
	newmob.spr=17
	newmob.frames={17,18}
	newmob.animspd=8
    newmob.health=2
	return newmob
end

function drawmobs()
	for m in all(mobs) do
		spr(m.spr,m.x,m.y)
	end
end

function updatemobs()
	for m in all(mobs) do
        if m.health<=0 then
            del(mobs,m)
            explode(m.x+2,m.y+2)
        end
		local f=flr(time()*m.animspd)%#m.frames+1
		m.spr=m.frames[f]
	end
end