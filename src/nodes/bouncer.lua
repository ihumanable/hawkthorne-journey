local Bouncer = {}

Bouncer.__index = Bouncer

function Bouncer.new(node, collider)
    local bouncer = {}
    setmetatable(bouncer, Bouncer)

    bouncer.collider = collider
    bouncer.bb = collider:addRectangle(node.x, node.y, node.width, node.height)
    bouncer.bb.node = bouncer
    collider:setPassive(bouncer.bb)

    bouncer.position = { x = node.x, y = node.y }

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
    self.bb:draw()
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle('fill', self.position.x, self.position.y, self.width, self.height)
    love.graphics.setColor(r, g, b, a)
end

return Bouncer


