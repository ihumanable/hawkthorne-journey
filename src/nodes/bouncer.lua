local Bouncer = {}

Bouncer.__index = Bouncer

local sprite = love.graphics.newImage('images/hippy.png')
sprite:setFilter('nearest', 'nearest')


local web = love.graphics.newImage('images/web.png')
web:setFilter('nearest', 'nearest')

function Bouncer.new(node, collider)
    local bouncer = {}
    setmetatable(bouncer, Bouncer)

    bouncer.collider = collider
    bouncer.bb = collider:addRectangle(node.x, node.y, node.width, node.height)
    bouncer.bb.node = bouncer
    collider:setPassive(bouncer.bb)

    bouncer.position = { x = node.x, y = node.y }

    bouncer.image = web

    bouncer.width = node.width
    bouncer.height = node.height

    return bouncer
end

function Bouncer:collide(player, dt, mtv_x, mtv_y)
    player.bouncing = true
end

function Bouncer:collide_end(player, dt)
    player.bouncing = false
    player.velocity.y = player.velocity.y * -1
end

function Bouncer:draw()
	love.graphics.draw(self.image, self.position.x, self.position.y, 0, self.width / self.image:getWidth(), self.height / self.image:getHeight())
end

return Bouncer


