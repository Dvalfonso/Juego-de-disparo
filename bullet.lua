windowWidth = love.graphics.getWidth()
windowHeight = love.graphics.getHeight()

Bullet = Object:extend()

function Bullet:new(x,y)
    self.image = love.graphics.newImage('assets/misil.png')
    self.x = x
    self.y = y
    self.speed = 700
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Bullet:checkCollision(obj)
    if self.x >= obj.x and self.x <= obj.x + obj.width and self.y >= obj.y and self.y <= obj.y + obj.height then
        self.dead = true
        obj.speed = obj.speed * 1.4
    end
end

function Bullet:update(dt)
    self.y = self.y + (self.y * dt)
end

function Bullet:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, 1, -1)
end