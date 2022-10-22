-- Halo Stats Bot.
-- Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

local Event = { }

-- Called when a player scores.
-- @arg: [number] (id) - Player ID
function Event:OnScore()
    self:Update('score')
end

-- Register the event:
register_callback(cb['EVENT_SCORE'], 'OnScore')

return Event