function drawtitle()
    cls()
    drawstars()
    print("\^w\^tSHMUP!",50,20,10)
    print("press 🅾️",50,120,10)
end

function drawgameover()
    cls()
    drawstars()
    print("\^w\^tgame over",34,50,10)
end

function updatetitle()
    updatestars()
    if btnp(🅾️) then
        initgame()
        state=gamestates.game
    end
end

function updategameover()
    updatestars()
    if btnp(🅾️) then
        state=gamestates.title
    end
end