-- WorldData.lua

Point = class()
function Point:init(name, src, collide)
    self.name = name
    self.src = src
    self.collide = collide or false
end

Music = {}
Music.change = function(m, v)
    music.stop()
    music(m, true, v)
end

function defineWorlds()
    sprite(asset.Grass)
local B = Point("block",asset.Wall,true)
local P = Point("path",asset.Grass)
local W = Point("wood",asset.Wood)
local b = Point("topblock",asset.WALL_BOTTOM, true) 
    
test = World({
{B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B},
{b,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{b,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{b,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},    
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,b,B,B,B,B,B,B,P,P,B,P,B,P,B,P,B,P,B,B,P,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,b,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,b,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,b,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,W,W,W,W,W,W,W,W,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,W,W,W,W,W,W,W,W,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,W,W,W,W,W,W,W,W,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,b,B,B,B,B,B,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,b,B,B,B,B,B,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,W,W,B,B,B,B,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,W,W,B,B,B,B,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,b,B,B,B,B,B,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,b,B,B,B,B,B,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,b,B,B,B,B,B,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,b,B,B,B,B,B,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,B,B,B,B,P,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,P,B},
{B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B,B}
}, 30)
test3 = World({
    {b,B,B,B,B,B,B,B,B,B,B,B,B,B},
    {b,W,W,W,W,W,W,W,W,W,W,W,W,b},
    {W,W,W,W,W,W,W,W,W,W,W,W,W,b},
    {W,W,W,W,W,W,b,B,B,W,W,W,W,b},
    {b,W,W,W,W,W,W,W,W,W,W,W,W,b},
    {b,W,W,W,W,W,W,b,W,W,W,W,W,b},
    {b,W,W,W,W,W,W,W,W,W,W,W,W,b},
    {b,W,W,W,W,W,W,W,W,W,W,W,W,b},
    {b,W,W,W,W,W,W,W,W,W,W,W,W,b},
    {b,W,W,W,W,W,W,W,W,W,W,W,W,b},
    {b,W,W,W,W,W,W,W,W,W,W,W,W,b},
    {b,W,W,W,W,W,W,W,W,W,W,W,W,b},
    {b,B,B,B,B,B,B,B,B,B,B,B,B,B}
}, 50)

test:setActionPoint(35, 25, function() player:changeWorld(test3, vec2(4,1.5)) sound(SOUND_RANDOM, 7363) --Music.change(asset.BobHouseShort, 0.1) end, vec2(2,1)
        
    end, vec2(2, 1))
test3:setActionPoint(3, 0, function() player:changeWorld(test, vec2(36,24.9)) music.stop() sound(SOUND_RANDOM, 7363)end, vec2(2,1))
bob = Entity(asset.NPC_BIGGREEN, vec2(10, 5), 5)
test3:addEntity(bob)

test:set(vec2(14.5,14.5))

test:addEntity(player, vec2(20, 16.5))
test:addEntity(Entity(asset.NPC_RED, vec2(16, 17), 2.5))
end
defineWorlds()