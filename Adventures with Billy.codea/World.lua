-- World.lua

World = class()
World.all = {}
World.zoomConstant = 0.5
World.camera = {x=1.0, y=1.0, pos=vec2(1,1), zoom=90*World.zoomConstant, target=nil}
World.pointSize = 0
World.zoom = tween(1, World.camera, {zoom=6}, tween.easing.linear)
tween.stop(World.zoom)

function World.doZoom(sec, value, options)
    tween.stop(World.zoom)
    World.zoom = tween(sec, World.camera, {zoom=value*World.zoomConstant}, tween.easing.cubicInOut)
end

function World:init(data, zoom)
    local z = zoom or 50
    assert(data)
    self.data = data
    self.zoom = z
    self.actionPoints = {}
    self.entities = {}
    self.highlights = {}
    table.insert(World.all, self)
end

function World:setActionPoint(x,y,action, r)
    assert(x,y,action)
    local ra = r or vec2(1,1)
    table.insert(self.actionPoints, {pos=vec2(x,y),func=action, range=ra})
    --table.insert(self.highlights, vec2(x,y))
end

function World:addEntity(entity, pos)
    if pos then entity.pos = pos end
    entity.world = self
    table.insert(self.entities, entity)
end

function World:gridPoint(pos,round)
    local r = false
    if round then r = true end
    local gridVec = vec2((pos.x+(World.camera.x*World.pointSize)-WIDTH/2)/World.pointSize, 
                         (pos.y+(World.camera.y*World.pointSize)-HEIGHT/2)/World.pointSize)
    if r then return vec2(math.floor(gridVec.x), math.floor(gridVec.y)) else return gridVec end
end

function World:pointGrid(pos)
    return vec2(-(World.camera.x+pos.x)*World.pointSize+WIDTH/2, 
                -(World.camera.y+pos.y)*World.pointSize+HEIGHT/2)
end

function World:getBlock(x, y)
    if self.data[x] then
        if self.data[x][y] then
            return self.data[x][y]
        end
    end
    return {}
end

function World:move(xF, yF, time)
    local t = time or DeltaTime
    if xF == 0 then
        tween(t, World.camera, {y=World.camera.y+yF})
    elseif yF == 0 then
        tween(t, World.camera, {x=World.camera.x+xF})
    else
        tween(t, World.camera, {x=World.camera.x+xF, y=World.camera.y+yF})
    end 
end

function World:draw()
    if World.camera.target then
        World.camera.x = World.camera.target.x
        World.camera.y = World.camera.target.y
    end
    World.pointSize = 200*World.camera.zoom/100
    pushMatrix() pushStyle()
    translate(WIDTH/2, HEIGHT/2)
    translate(-World.camera.x*World.pointSize, -World.camera.y*World.pointSize)
    for xValue,column in ipairs(self.data) do
        for yValue,block in ipairs(column) do
            spriteMode(CORNER)
            local xpos
            sprite(block.src, xValue*World.pointSize, yValue*World.pointSize, World.pointSize,World.pointSize)
            --self:coord(xValue, yValue)
        end
    end
    popStyle() popMatrix()
    for k,v in ipairs(self.entities) do v:draw() end
    for k,v in ipairs(self.highlights) do 
        pushStyle()
        fill(252, 255, 0, 136)
        rectMode(CORNER)
        local p = self:pointGrid(vec2(-v.x, -v.y))
        rect(p.x, p.y, World.pointSize, World.pointSize)
        self:coord(p.x, p.y)
        popStyle()
    end
    for e,r in ipairs(self.actionPoints) do
        if player.pos.x>=r.pos.x and player.pos.x<=r.pos.x+r.range.x and 
        player.pos.y>=r.pos.y and player.pos.y<=r.pos.y+r.range.y then
            r.func()
        end
    end
    player.speed = 6
end

function World:coord(x, y)
    local coord = "X"..x.."Y"..y
    pushStyle()
    blendMode(MULTIPLY)
    textMode(CORNER)
    fill(0)
    fontSize(World.pointSize/5)
    text(coord, x, y)
    popStyle()
end

function World:set(startPos)
    World.camera.x = startPos.x
    World.camera.y = startPos.y
    if Entity.target then
        World.camera.target = Entity.target.pos
    end
    World.doZoom(0.5, self.zoom)
    World.active = self
end