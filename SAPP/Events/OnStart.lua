-- Halo Stats Bot.
-- Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

local Event = { }

-- Setup function called when a new game begins:
function Event:OnStart()

    if (get_var(0, '$gt') == 'n/a') then
        return
    end

    self.players = {}

    for i = 1, 16 do
        if player_present(i) then
            self:OnJoin(i)
        end
    end
end

register_callback(cb['EVENT_GAME_START'], 'OnStart')

return Event