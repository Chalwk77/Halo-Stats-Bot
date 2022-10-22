-- Halo Stats Bot.
-- Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

local Event = { }

-- Constructor function for this player:
function Event:NewPlayer(o)

    setmetatable(o, { __index = self })
    self.__index = self

    local name = o.name
    self.database[name] = self.database[name] or {
        joins = 0,
        kills = 0,
        score = 0,
        deaths = 0,
        suicides = 0
    }

    o:Update('joins')

    return o
end

-- Called when a joins.
-- Creates a new player object:
-- @arg: [number] (id) - Player ID
function Event:OnJoin(id)
    self.players[id] = self:NewPlayer({
        name = get_var(id, '$name'),
        id = id
    })
end

-- Register the event:
register_callback(cb['EVENT_JOIN'], 'OnJoin')

return Event