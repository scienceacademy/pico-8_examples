--stars
function makestars()
	stars={}
	for i=1,100 do
		local newstar={}
		newstar.x=flr(rnd(128))
		newstar.y=flr(rnd(128))
		newstar.spd=rnd(1.5)+0.5
		add(stars,newstar)
	end
end

function updatestars()
	for s in all(stars) do
		s.y+=s.spd
		if s.y>128 then
			s.y-=128
		end
	end
end

function drawstars()
	for s in all(stars) do
		local c=6
		if s.spd < 1 then
			c=5
		elseif s.spd<1.5 then
			c=13
		end
		pset(s.x,s.y,c)
	end
end
