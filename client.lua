local toogle = false
RegisterCommand('cl',function()
    toogle = not toogle
    if toogle then
        Citizen.SetTimeout(15000, function()
            toogle = false
        end)
    end
end,false)

Citizen.CreateThread(function()
    while true do
        local idle = 1000
        print(json.encode(GlobalState.cl))
        if toogle then
            idle = 1
            for k,v in pairs(GlobalState.cl) do
                DrawText3Ds(v.cds.x, v.cds.y, v.cds.z, v.text, 350)
            end
        end
        Wait(idle)
    end
end)

function DrawText3Ds(x, y, z, text, size)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	SetTextFont(4)
	SetTextScale(0.35, 0.35)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x, _y)
	local factor = (string.len(text)) / size
	DrawRect(_x, _y + 0.0125, 0.01 + factor, 0.03, 0, 0, 0, 80)
end
