local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module("vrp", "lib/Proxy")
local vRP = Proxy.getInterface("vRP")

local BASE = 'vrpex'

GlobalState.cl = {}

AddEventHandler("playerDropped", function(reason)
    local source = source
    local userId = BASE == 'vrpex' and vRP.getUserId(source) or vRP.Passport(source)
    local ped = GetPlayerPed(source)
    local cds = GetEntityCoords(ped)
    local temp = GlobalState.cl
    temp[userId] = { cds = cds, text = '~r~ID:[' .. userId .. "]  ~g~[MOTIVO]:" .. reason}
    GlobalState.cl = temp

    Citizen.SetTimeout(15000, function()
        if GlobalState.cl[userId] then
            local temp = GlobalState.cl
            temp[userId] = nil
        end
    end)
end)

--- [ DEBUG COMMAND ]
-- RegisterCommand('test',function(source)
--     local source = source
--     local userId = BASE == 'vrpex' and vRP.getUserId(source) or vRP.Passport(source)
--     local ped = GetPlayerPed(source)
--     local cds = GetEntityCoords(ped)
--     local temp = GlobalState.cl
--     temp[userId] = { cds = cds, text = '~r~ID:[' .. userId .. "]  ~g~[MOTIVO]:" .. 'DEBUG' }
--     GlobalState.cl = temp

--     Citizen.SetTimeout(15000, function()
--         if GlobalState.cl[userId] then
--             local temp = GlobalState.cl
--             temp[userId] = nil
--             print('limpou')
--         end
--     end)
-- end,false)
