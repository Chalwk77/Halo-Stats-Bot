local Component = {}

function Component:Update(c)

    -- only update this stat if it's enabled:
    if (not self.stats[c]) then
        return
    end

    local name = self.name
    local database = self.database
    database[name][c] = database[name][c] + 1
end

return Component