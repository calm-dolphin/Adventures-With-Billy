-- Main.lua

viewer.mode = FULLSCREEN_NO_BUTTONS
viewer.preferredFPS = 30

backSound = function() sound(SOUND_PICKUP, 48756) end
downSound = function() sound(SOUND_PICKUP, 48749) end
upSound = function() sound(SOUND_PICKUP, 48744) end
stepSound = function()
    local pos = vec2(math.floor(player.pos.x), math.floor(player.pos.y))
    local block = World.active:getBlock(pos.x, pos.y)
    local choice = math.random(1, 10)
    if block.name == "path" then
        if choice > 8 then
            sound(SOUND_HIT, 2324, 0.5)
        elseif choice > 5 then
            sound(SOUND_HIT, 2384, 0.5)
        elseif choice > 2 then
            sound(SOUND_HIT, 2294, 0.5)
        else
            sound(SOUND_HIT, 2405, 0.5)
        end
    elseif block.name == "wood" then
        sound(SOUND_HIT, 2431, 0.5)
    end 
end

buttonColor = color(0, 100)

local unhit = function(func)
    return function(toucher, currentHit, touch)
        if (not currenthit) and toucher.captured == touch.id then
            func()
        end
    end
end

optionsScreen = Unit.screen({fill=Unit.color.sky}, {
    Unit.button({fill=color(255),touchEvents={Unit.te.onTap(function() titleScreen:set() backSound()end)},
        frameManager=Unit.fm.tl{x=75,y=75}})
})

infoScreen = Unit.screen({fill=Unit.color.sky}, {
    Unit.button({fill=color(255),frameManager=Unit.fm.tl{x=75,y=75},
        touchEvents={Unit.te.onTap(function() titleScreen:set() backSound()end)},})
})

gameScreen = Unit.screen({fill=color(0,0)}, {
    Unit.button({fill=buttonColor,frameManager=Unit.fm.tl{x=75,y=75},text="Back",textFill=color(255),
        touchEvents={Unit.te.onTap(function() 
            titleScreen:set() 
            World.camera.zoom=100 
            World.doZoom(0.4, World.active.zoom) 
            tween.stop(World.zoom) 
            backSound() 
        end)},
    }),
    Unit.button({fill=buttonColor, frameManager=Unit.fm.bl{x=150,y=225},text="O",textFill=color(255),
        touchEvents={unhit(function() player.moving = false end)},layer=2,share=true,rotate=45,
        hold=function() Entity.target:move(0, player.speed*DeltaTime)end}),
    Unit.button({fill=buttonColor, frameManager=Unit.fm.bl{x=225,y=150},text="O",textFill=color(255),
        touchEvents={unhit(function() player.moving = false end)},layer=2,share=true,rotate=45,
        hold=function() Entity.target:move(player.speed*DeltaTime, 0)end}),
    Unit.button({fill=buttonColor, frameManager=Unit.fm.bl{x=150,y=75},text="O",textFill=color(255),
        touchEvents={unhit(function() player.moving = false end)},layer=2,share=true,rotate=45,
        hold=function() Entity.target:move(0, -player.speed*DeltaTime)end}),
    Unit.button({fill=buttonColor, frameManager=Unit.fm.bl{x=75,y=150},text="O",textFill=color(255),
        touchEvents={unhit(function() player.moving = false end)},layer=2,share=true,rotate=45,
        hold=function() Entity.target:move(-player.speed*DeltaTime, 0)end}),
    Unit.button({fill=buttonColor,text="RUN",textFill=Unit.color.white, hold=function() player.speed = 9 end,
        frameManager=Unit.fm.br{x=99,y=99}})
})

titleScreen = Unit.screen({fill=Unit.color.sky}, {
    Unit.textPanel({fill=color(255), text="Adventures with Billy", y=0.9, w=1,size=30,stroke=Unit.color.sky,strokeWidth=9}),
    Unit.panel({fill=color(83, 156, 224),w=1,x=0,y=0,h=0.2,drawMode=CORNER},{
        Unit.button({x=0.25,h=0.5,text="Info",fill=color(255),
            touchEvents={Unit.te.onTap(function() infoScreen:set() upSound()end)}}),
        Unit.button({h=0.5,text="Play",fill=color(255),
            touchEvents={Unit.te.onTap(function() gameScreen:set() tween.play(World.zoom) sound(SOUND_JUMP, 25788)end)}}),
        Unit.button({x=0.75,h=0.5,text="Options",fill=color(255),
            touchEvents={Unit.te.onTap(function() optionsScreen:set() upSound()end)}})
    }),
})

function setup()
    Unit.setup()
    World.camera.zoom = 100 
    World.doZoom(0.4, World.active.zoom) 
    tween.stop(World.zoom)
    World.camera.target = player.pos
    smooth()
end

function draw()
    if Unit.currentScreen == gameScreen then
        background(0)
        World.active:draw()
    end
    Unit.draw()
end

function sizeChanged(w, h) Unit.sizeChanged(w, h) end
function touched(touch) Unit.touched(touch) end
function hover(gesture) end
function scroll(gesture) end
function keyboard(key) end