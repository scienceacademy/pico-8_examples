function spawn_particle(x, y, sx, sy, life, size, color, sprite)
	local new_part = {
		x = x,
		y = y,
		sx = sx,
		sy = sy,
		life = life,
		size = size,
		c = color,
		sprite = sprite
	}
	add(particles, new_part)
end

function update_particles()
	for p in all(particles) do
		p.x += p.sx
		p.y += p.sy
		p.life -= 1
		if p.life <= 0 then
			del(particles, p)
		end
	end
end

function draw_particles()
	for p in all(particles) do
		if p.sprite then
			spr(p.sprite, p.x, p.y)
		else
			circfill(p.x, p.y, p.size, p.c)
		end
	end
end

function explode(x, y)
	for i=1,30 do
		local cols={9,10,8}
		spawn_particle(x, y,rnd(4)-2,rnd(4)-2,6,1,cols[flr(rnd(3))+1])
	end
end
