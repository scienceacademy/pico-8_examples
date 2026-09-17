gamestates={
	title=0,
	game=1,
	gameover=2
}
state=gamestates.title
--poke(0X5F5C, 255)

function _init()
	makestars()
end

function initgame()
	initplayer()
	mobs={}
	bullets={}
	particles={}
	for i=1,6 do
		add(mobs,makemob(i*20-5,20))
	end
end

function _update()
	if state==gamestates.title then
		updatetitle()
	elseif state==gamestates.game then
		updateplayer()
		updatestars()
		updatemobs()
		updatebuls()
		update_particles()
		for m in all(mobs) do
			if collide(m,p) then
				state=gamestates.gameover
			end
		end
	elseif state==gamestates.gameover then
		updategameover()
	end

end

function _draw()
	if state==gamestates.title then
		drawtitle()
	elseif state==gamestates.game then
		cls()
		drawstars()
		drawplayer()
		drawmobs()
		drawbuls()
		draw_particles()
	elseif state==gamestates.gameover then
		drawgameover()
	end
end