Entity = class()
DOWN = 5
UP = 4
Entity.nearest = function()
    local dist = math.huge
    local nearEntity = nil
    for q,w in ipairs(World.active.entities) do
        local calc = player.pos:dist(w.pos)
        if calc < dist and w ~= player then
            nearEntity = w; dist = calc
        end
    end
    return nearEntity
end

function Entity:init(src, pos, size, params)
    assert(src, pos, size)
    self.world = nil
    self.pos = pos
    self.size = size
    self.moving = false
    self.tween = tween.delay(1)
    local p = params or {}
    self.action = p.action or function() end
    if type(src) == "table" then
        self.assets = src
        self.facing = p.facing or DOWN
        self.speed = p.speed or 6
    else
        self.src = src
    end
end

function Entity:move(xF, yF, time)
    local t = time or DeltaTime
    local e = Entity.nearest()
    local distanceFromEntity = e.pos:dist(vec2(self.pos.x+xF, self.pos.y+yF))
    local blocked = distanceFromEntity <= e.size*0.65
    if self.facing then
        if math.abs(xF) > math.abs(yF) then
            if xF > 0 then
                self.facing = RIGHT
                local point1 = vec2(math.floor(self.pos.x+self.size/3), math.floor(self.pos.y+self.size/10))
                if not blocked then blocked = World.active:getBlock(point1.x, point1.y).collide end
                point1 = vec2(math.floor(self.pos.x+self.size/3), math.floor(self.pos.y-self.size/3+0.1))
                if not blocked then blocked = World.active:getBlock(point1.x, point1.y).collide end
            else
                self.facing = LEFT
                local point1 = vec2(math.floor(self.pos.x-self.size/3), math.floor(self.pos.y+self.size/10))
                if not blocked then blocked = World.active:getBlock(point1.x, point1.y).collide end
                point1 = vec2(math.floor(self.pos.x-self.size/3), math.floor(self.pos.y-self.size/3+0.1))
                if not blocked then blocked = World.active:getBlock(point1.x, point1.y).collide end
            end
        else
            if yF > 0 then
                self.facing = UP or 9
                local point1 = vec2(math.floor(self.pos.x-self.size/5), math.floor(self.pos.y+0.1+self.size/10))
                if not blocked then blocked = World.active:getBlock(point1.x, point1.y).collide end
                point1 = vec2(math.floor(self.pos.x+self.size/5), math.floor(self.pos.y+0.1+self.size/10))
                if not blocked then blocked = World.active:getBlock(point1.x, point1.y).collide end
            else
                self.facing = DOWN or 8
                local point1 = vec2(math.floor(self.pos.x-self.size/5), math.floor(self.pos.y-self.size/3))
                if not blocked then blocked = World.active:getBlock(point1.x, point1.y).collide end
                point1 = vec2(math.floor(self.pos.x+self.size/5), math.floor(self.pos.y-self.size/3))
                if not blocked then blocked = World.active:getBlock(point1.x, point1.y).collide end
            end
        end
    end
    self.moving = not blocked
    if self.moving then
        if xF == 0 then
            self.tween = tween(t, self.pos, {y=self.pos.y+yF})
        elseif yF == 0 then
            self.tween = tween(t, self.pos, {x=self.pos.x+xF})
        else
            self.tween = tween(t, self.pos, {x=self.pos.x+xF, y=self.pos.y+yF})
        end 
    end
end

function Entity:draw(x, y)
    if Entity.target == self then World.camera.target = self.pos end
    local getSrc
    if self.src then
        getSrc = self.src
    elseif self.assets then
        if self.moving then
            local animFactor = self.speed/2
            if self.facing == DOWN then
                getSrc = self.assets.down:play(self.assets.down.fps*animFactor)
            elseif self.facing == UP then
                getSrc = self.assets.up:play(self.assets.up.fps*animFactor)
            elseif self.facing == RIGHT then
                getSrc = self.assets.right:play(self.assets.right.fps*animFactor)
            elseif self.facing == LEFT then
                getSrc = self.assets.left:play(self.assets.left.fps*animFactor)
            end
        else
            if self.facing == DOWN then
                getSrc = self.assets.down:getFrame()
            elseif self.facing == UP then
                getSrc = self.assets.up:getFrame()
            elseif self.facing == RIGHT then
                getSrc = self.assets.right:getFrame()
            elseif self.facing == LEFT then
                getSrc = self.assets.left:getFrame()
            end
        end
    end
    local p = self.world:pointGrid(-self.pos)
    sprite(getSrc, p.x, p.y, self.size*World.pointSize)
end

function Entity:changeWorld(worl, pos)
    local index = 0
    for k,v in ipairs(self.world.entities) do
        if v == self then index = k end
    end
    table.remove(self.world.entities, index)
    self.pos = pos
    self.world = worl
    if Entity.target == self then worl:set(pos) end
    table.insert(worl.entities, self)
end

player = Entity({
    down = SpriteAnimation({asset.BillyDownA,asset.BillyDownB,asset.BillyDownC,asset.BillyDownD,asset.BillyDownE,asset.BillyDownF,asset.BillyDownG,asset.BillyDownH,asset.BillyDownI,asset.BillyDownJ,asset.BillyDownK,asset.BillyDownL,asset.BillyDownM,asset.BillyDownN,asset.BillyDownO,asset.BillyDownP},{fps=12},{[16]=stepSound, [9]=stepSound}),
    up = SpriteAnimation({asset.BillyUp1,asset.BillyUp2,asset.BillyUp3,asset.BillyUp4,asset.BillyUp5,asset.BillyUp6,asset.BillyUp7,asset.BillyUp8,asset.BillyUp9,asset.BillyUp10,asset.BillyUp11,asset.BillyUp12,asset.BillyUp13,asset.BillyUp14,asset.BillyUp15,asset.BillyUp16}, {fps=12}, {[16]=stepSound, [9]=stepSound}),
    left = SpriteAnimation({asset.BillyLeftA, asset.BillyLeftB, asset.BillyLeftC, asset.BillyLeftD, asset.BillyLeftE, asset.BillyLeftF, asset.BillyLeftG, asset.BillyLeftH, asset.BillyLeftI, asset.BillyLeftJ, asset.BillyLeftK, asset.BillyLeftL, asset.BillyLeftM, asset.BillyLeftN, asset.BillyLeftO, asset.BillyLeftP, asset.BillyLeftQ, asset.BillyLeftR, asset.BillyLeftS, asset.BillyLeftT, asset.BillyLeftU},{fps=30},{[2]=function()stepSound()end}),
    right = SpriteAnimation({asset.BillyRightA,asset.BillyRightB,asset.BillyRightC,asset.BillyRightD,asset.BillyRightE,asset.BillyRightF,asset.BillyRightG,asset.BillyRightH,asset.BillyRightI,asset.BillyRightJ,asset.BillyRightK,asset.BillyRightL,asset.BillyRightM,asset.BillyRightN,asset.BillyRightO,asset.BillyRightP, asset.BillyRightQ, asset.BillyRightR, asset.BillyRightS, asset.BillyRightT, asset.BillyRightU},{fps=30},{[2]=function()stepSound()end})
}, vec2(20,20), 2.5, {facing=DOWN})
World.camera.target = player.pos
Entity.target = player
parameter.watch("player.pos")