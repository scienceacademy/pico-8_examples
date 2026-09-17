--player functions
function initplayer()
	p={}
	p.x=63
	p.y=100
	p.gun_cooldown=0.2
	p.can_shoot=false
	p.last_shot=t()
end

function updateplayer()
	local v={x=0,y=0}
	if (btn(⬅️)) v.x-=1
	if (btn(➡️)) v.x+=1
	if (btn(⬆️)) v.y-=1
	if (btn(⬇️)) v.y+=1

	-- shoot if allowed
	if btn(🅾️) and p.can_shoot then
		p.can_shoot=false
		p.last_shot=t()
		add(bullets,makebul(p.x,p.y-4,{x=0,y=-4}))
	end

	-- reset gun cooldown
	if t()-p.last_shot > p.gun_cooldown then
		p.can_shoot=true
	end

	p.x+=v.x
	p.y+=v.y
	-- stay on screen
	if (p.x<0) p.x=0
	if (p.x>120) p.x=120
	if (p.y<0) p.y=0
	if (p.y>120) p.y=120
end

function drawplayer()
 spr(22, p.x, p.y)
end