-- Halo Stats Bot.
-- Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

local Event = { }

-- Setup function called when a new game begins:
function Event:OnEnd()
    self:WriteFile(self.database)
end

register_callback(cb['EVENT_GAME_END'], 'OnEnd')

return Event