function makebul(x,y,vel)
	-- give new bullet a location and velocity (for spread bullets)
	local newbul={}
	newbul.x=x
	newbul.y=y
	newbul.spr=7
	newbul.vel=vel
	return newbul
end

function drawbuls()
	for b in all(bullets) do
		spr(b.spr,b.x,b.y)
	end
end

function updatebuls()
	for b in all(bullets) do
		b.x+=b.vel.x
		b.y+=b.vel.y
		-- delete if off top of screen
		if b.y<8 then
			del(bullets,b)
		end
		-- collide with mobs
		for m in all(mobs) do
			if collide(b,m) then
				m.health-=1
				del(bullets,b)
			end
		end
	end
end