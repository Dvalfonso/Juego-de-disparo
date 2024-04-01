windowWidth = love.graphics.getWidth()
windowHeight = love.graphics.getHeight()

Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("assets/duck.png")
    self.speed = 500
    self.height = self.image:getHeight() * 0.5
    self.width = self.image:getWidth() * 0.5
    self.x = ((windowWidth - self.width) / 2) 
    self.y = 40
end

function Player:keyPressed(key)
    if key == "space" then
        table.insert(listOfBullets, Bullet(self.x + self.width * 0.35, self.y + self.height * 1.5))
    end
end

function Player:update(dt)
    if dt then -- Verifica si dt no es nil
        if love.keyboard.isDown("left") then
            self.x = self.x - (self.speed * dt)
        elseif love.keyboard.isDown("right") then
            self.x = self.x + (self.speed * dt)
        end
    end

    if self.x < 10 then
        self.x = 10
    elseif (self.x + self.width) > windowWidth -10 then
        self.x = (windowWidth -10) - self.width
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y, 0,0.5, 0.5)
end


return player