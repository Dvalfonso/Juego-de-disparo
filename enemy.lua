windowWidth = love.graphics.getWidth()
windowHeight = love.graphics.getHeight()

Enemy = Object:extend()

function Enemy:new()
    self.image = love.graphics.newImage('assets/horse.png')
    self.speed = 100
    self.height = self.image:getHeight() * 0.5
    self.width = self.image:getWidth() * 0.5
    self.x = (windowWidth - self.width) / 2
    self.y = windowHeight - 100
end

function Enemy:update(dt)
    self.x = self.x + (self.speed * dt)

    if self.x > (windowWidth - self.width - 10) then
        self.x = (windowWidth - self.width - 10)
        self.speed = -self.speed
    elseif self.x < 10 then
        self.x = 10
        self.speed = -self.speed
    end

end

function Enemy:draw()
    love.graphics.draw(self.image, self.x, self.y, 0,0.5, 0.5)
end