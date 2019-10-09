local Util = require 'core/util'
local Map = require 'core/map'
local gamera = require 'core/gamera'
function love.load()
  cam = gamera.new(0, 0, 2000, 2000) 
  cam:setPosition(400, 400)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  floorTile = love.graphics.newImage('assets-1/dungeon/floor/etched_5.png')
  altar     = love.graphics.newImage('assets-1/dungeon/floor/bog_green_1.png')
  template = { --a 3 x 3 map with the altar texture in the middle
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, altar, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTisle, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altars},
                 {floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar,floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
                 {floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar, floorTile, floorTile, floorTile, altar,  floorTile, floorTile, floorTile, altar},
  
  
  
                }  
map = Map:new(template)
w = 64   -- The player's width is 64
h = 64   -- The player's height is 64
hp = 100 -- Set the player's HP to 100 at the sstart of the game

end


function love.update(dt)
  if love.keyboard.isDown('up') then  
    y = y - 5
  end
  if love.keyboard.isDown('right') then  
    x = x + 5
  end
  if love.keyboard.isDown('left') then  
    x = x - 5
  end
if love.keyboard.isDown('down') then  
    y = y + 5
end
cam:setPosition(x,y)
 -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
 if cc(x, y, w, h,   0, 0, 54, 54) then  
  -- if true, decrease HP:
  hp = hp - 1
end
end
function love.draw()
 cam:draw(function(l,t,w,h)
    map:draw()
    love.graphics.print('', 0, 0)
    love.graphics.draw(playerImg, x, y)
    love.graphics.rectangle('line', 0 , 0, 64, 899) 
    love.graphics.rectangle('line', 0, 0, 64, 899)
    love.graphics.print(hp, 0, 0)
  end)
end





