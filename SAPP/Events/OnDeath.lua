-- Halo Stats Bot.
-- Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

local Event = { }

-- Called when a player dies.
-- @arg: [number] (id) - Player ID
function Event:OnDeath(Victim, Killer)

    local victim = tonumber(Victim)
    local killer = tonumber(Killer)

    local v = self.players[victim]
    local k = self.players[killer]

    local pvp = (killer > 0 and victim ~= killer and k and v)
    local suicide = (killer == victim)

    if (pvp) then
        k:Update('kills')
        v:Update('deaths')
    elseif (suicide) then
        v:Update('suicides')
    end
end

-- Register the event:
register_callback(cb['EVENT_DIE'], 'OnDeath')

return Event