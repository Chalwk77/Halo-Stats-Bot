--[[
--=====================================================================================================--
Script Name: Halo Stats Bot, for SAPP (PC & CE)
Description:

Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>
* Notice: You can use this document subject to the following conditions:
https://github.com/Chalwk77/HALO-SCRIPT-PROJECTS/blob/master/LICENSE
--=====================================================================================================--
]]--

local StatsBot = {

    json = loadfile('./Halo Stats Bot/SAPP/Utilities/json.lua')(),

    dependencies = {
        ['./Halo Stats Bot/'] = { 'settings' },
        ['./Halo Stats Bot/SAPP/Database/'] = { 'UpdateComponent' },
        ['./Halo Stats Bot/SAPP/Utilities/'] = { 'FileIO' },
        ['./Halo Stats Bot/SAPP/Events/'] = {
            'OnDeath',
            'OnEnd',
            'OnJoin',
            'OnQuit',
            'OnStart'
        }
    }
}

api_version = '1.12.0.0'

function StatsBot:LoadDependencies()

    local s = self
    for path, t in pairs(self.dependencies) do
        for _, file in pairs(t) do
            local f = loadfile(path .. file .. '.lua')()
            setmetatable(s, { __index = f })
            s = f
        end
    end

    self.database = self:LoadFile()
end

function OnScriptLoad()
    StatsBot:LoadDependencies()
    StatsBot:OnStart()
end

function OnStart()
    StatsBot:OnStart()
end

function OnEnd()
    StatsBot:OnEnd()
end

function OnJoin(p)
    StatsBot:OnJoin(p)
end

function OnQuit(p)
    StatsBot:OnQuit(p)
end

function OnDeath(v, k)
    StatsBot:OnDeath(v, k)
end

function OnScore(p)
    StatsBot.players[p]:OnScore()
end

function OnScriptUnload()
    -- N/A
end