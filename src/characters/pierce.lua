local anim8 = require 'vendor/anim8'

local plyr = {}
plyr.name = 'pierce'
plyr.offset = 2
plyr.ow = 5
plyr.costumes = {
    {name='Pierce Hawthorne', sheet='images/pierce.png'},
    {name='Beastmaster', sheet='images/pierce_beast.png'},
    {name='Captain Kirk', sheet='images/pierce_kirk.png'},
    {name='Cookie Crisp Wizard', sheet='images/pierce_cookie.png'},
    {name='Janet Reno', sheet='images/pierce_janetreno.png'},
    {name='The Gimp', sheet='images/pierce_thegimp.png'},
    {name='Pillow Man', sheet='images/pierce_pillow.png'},
}

local beam = love.graphics.newImage('images/pierce_beam.png')

function plyr.new(sheet)
    local new_plyr = {}
    new_plyr.sheet = sheet
    new_plyr.sheet:setFilter('nearest', 'nearest')
    local g = anim8.newGrid(48, 48, new_plyr.sheet:getWidth(),
        new_plyr.sheet:getHeight())

    local warp = anim8.newGrid(36, 223, beam:getWidth(),
        beam:getHeight())

    new_plyr.beam = beam

    new_plyr.animations = {
        dead = {
            right = anim8.newAnimation('once', g('6,2'), 1),
            left = anim8.newAnimation('once', g('6,1'), 1)
        },
        jump = {
            right = anim8.newAnimation('once', g('7,2'), 1),
            left = anim8.newAnimation('once', g('7,1'), 1)
        },
        walk = {
            right = anim8.newAnimation('loop', g('2-5,2'), 0.16),
            left = anim8.newAnimation('loop', g('2-5,1'), 0.16)
        },
        idle = {
            right = anim8.newAnimation('once', g(1,2), 1),
            left = anim8.newAnimation('once', g(1,1), 1)
        },
        crouch = {
            right = anim8.newAnimation('once', g(1,2), 1),
            left = anim8.newAnimation('once', g(1,1), 1)
        },
        crouchwalk = { --state for walking towards the camera
            right = anim8.newAnimation('once', g(1,3), 1),
            left = anim8.newAnimation('once', g(1,3), 1)
        },
        gaze = {
            right = anim8.newAnimation('once', g(1,2), 1),
            left = anim8.newAnimation('once', g(1,1), 1)
        },
        gazewalk = { --state for walking away from the camera
            right = anim8.newAnimation('once', g(1,4), 1),
            left = anim8.newAnimation('once', g(1,4), 1)
        },
        warp = anim8.newAnimation('once', warp('1-4,1'), 0.08)
    }
    return new_plyr
end

return plyr
