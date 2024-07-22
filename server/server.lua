local QBCore = exports['qb-core']:GetCoreObject()

-- Event til at håndtere når kortet bruges
RegisterNetEvent('Hondo_visitkort:use', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName('visit_kort')

    if item then
        -- Trigger input dialog på client hvis kortet ikke har metadata, lidt lååårt.
        if not item.metadata or not next(item.metadata) then
            TriggerClientEvent('Hondo_visitkort:showInputDialog', src, item)
        else
            -- Vis oplysninger hvis kortet allerede har metadata, crazy shit.
            TriggerClientEvent('Hondo_visitkort:showDetails', src, item)
        end
    end
end)

-- Event til at håndtere gemning af metadata, lad os håbe det gemmer.
RegisterNetEvent('Hondo_visitkort:saveMetadata', function(metadata)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName('visit_kort')

    if item then
        item.metadata = metadata
        Player.Functions.SetInventory(Player.PlayerData.items)
        TriggerClientEvent('QBCore:Notify', src, 'Firmakort opdateret!', 'success')
    end
end)