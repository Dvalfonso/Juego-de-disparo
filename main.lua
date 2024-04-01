windowWidth = love.graphics.getWidth()
windowHeight = love.graphics.getHeight()

function love.load()
    Object = require 'classic'
    require 'player'
    require 'enemy'
    require 'bullet'

    listOfBullets = {}
    player = Player()
    enemy = Enemy()
end

function love.keypressed(key)
    player:keyPressed(key)
end


function love.update(dt)
    player:update(dt)
    enemy:update(dt)

    for i,v in ipairs(listOfBullets) do
        v:update(dt)
        v:checkCollision(enemy)

        if v.dead then
            table.remove(listOfBullets, i)
        end
    end
end

function love.draw()
    player:draw()
    enemy:draw()

    for i,v in ipairs(listOfBullets) do
        v:draw()
    end

    love.graphics.rectangle('line', 10, 10, windowWidth - 20, windowHeight - 20, 10, 10)
end