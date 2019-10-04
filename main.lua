local Map = require 'core/map'
local gamera = require 'core/gamera'

function love.load()
  x = 64
  camx = 96
  mirrorx = 768
  y = 256
  camy = 256
  mirrory = 256

  cam = gamera.new(48, 48, 816, 608)

  playerImg = love.graphics.newImage('assets-1/player/base/Octopode_3.png')
  mirrorPlayerImg = love.graphics.newImage('assets-1/player/base/Octopode_2.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/limestone_6.png')
  cobaltM = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_flip.png')
  cobaltMirrorLeft = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_left.png')
  cobaltMirrorLeftT = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_left_top.png')
  cobaltMirrorRight = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_right.png')
  cobaltMirrorRightT = love.graphics.newImage('assets-1/dungeon/floor/limestone_6_mirror_right_top.png')
  hole = love.graphics.newImage('assets-1/dungeon/floor/hole.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')

  mapTemplate = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, hole, hole, wall,},
    {wall, cobalt, cobalt, hole, cobalt, cobalt, cobalt, cobalt, hole, hole, wall,},
    {wall, cobalt, cobalt, hole, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall,},
    {wall, cobalt, cobalt, cobalt, cobalt, cobalt, hole, cobalt, cobalt, cobalt, wall,},
    {wall, cobalt, hole, hole, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall,},
    {wall, cobaltMirrorRightT, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, cobaltMirrorRight, wall,},
    {wall, cobaltMirrorLeftT, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, cobaltMirrorLeft, wall,},
    {wall, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, wall,},
    {wall, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, wall,},
    {wall, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, wall,},
    {wall, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, wall,}, 
    {wall, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, cobaltM, wall,},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall,},
  }
  map = Map:new(mapTemplate)
end
  
function love.update(dt)
  if love.keyboard.isDown('right') then   -- if the 'right' key is being pressed...
    x = x + 4
    mirrorx = mirrorx - 4
  end
  if love.keyboard.isDown('down') then   -- if the 'down' key is being pressed...
    y = y + 4
    mirrory = mirrory + 4
  end
  if love.keyboard.isDown('left') then   -- if the 'left' key is being pressed...
    x = x - 4
    mirrorx = mirrorx + 4
  end
  if love.keyboard.isDown('up') then   -- if the 'up' key is being pressed...
    y = y - 4
    mirrory = mirrory - 4
  end
  cam:setPosition(x, y)
end

function love.draw()
  cam:draw(function(camx, camy)
  map:draw()
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(mirrorPlayerImg, mirrorx, mirrory)
  end)
end
