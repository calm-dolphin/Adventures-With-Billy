SpriteAnimation = class()

function SpriteAnimation:init(frames, defaults, functions)
    assert(frames)
    local default = defaults or {}
    self.frames = frames
    self.startFrame = default.start or 1
    self.frameNum = self.startFrame
    self.fps = default.fps or 30
    self.loop = default.loop or tween.loop.forever
    self.timer = 1
    self.functionFrames = functions or {}
end

function SpriteAnimation:play(fps, loop)
    self.timer = self.timer + 1
    local frameRate = fps or self.fps
    local loopType = loop or self.loop
    if self.timer >= 1/(frameRate*DeltaTime) then
        self.timer = 0
        self.frameNum = self.frameNum + 1
        local optReturn = self.functionFrames[self.frameNum]
        if optReturn~=nil then optReturn = self.functionFrames[self.frameNum]() end
    end
    if loopType == tween.loop.forever then
        if self.frameNum == #self.frames + 1 then
            self.frameNum = 1
        end
    elseif loopType == tween.loop.once then
        if self.frameNum > #self.frames then return self.frames[#self.frames] end
    elseif loopType == tween.loop.pingpong then
        
    end
    return self.frames[self.frameNum], optReturn
end

function SpriteAnimation:getFrame(num)
    if num then
        return self.frames[num]
    else
        return self.frames[self.frameNum]
    end
end

