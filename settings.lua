-- Simple Stats script by Jericho Crosby (Chalwk).
-- Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

return {

    -- Path to the database file:
    --
    database_path = "./Halo Stats Bot/SAPP/Database/database.json",

    -- Client data will be saved as a json array and
    -- the array index for each client will either be "IP", or "IP:PORT".
    -- Set to 1 for IP-only indexing.
    --
    client_index_type = 1,

    -- Individual stats can be enabled/disabled here:
    --
    stats = {
        ['joins'] = true,
        ['kills'] = true,
        ['score'] = true,
        ['deaths'] = true,
        ['suicides'] = true
    }
}