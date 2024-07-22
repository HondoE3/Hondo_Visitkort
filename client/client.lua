local QBCore = exports['qb-core']:GetCoreObject()

-- Vis input dialog for firmakort detaljer, info info.
RegisterNetEvent('Hondo_visitkort:showInputDialog', function(item)
    local input = lib.inputDialog('Firmakort Detaljer', {
        { type = 'input', label = 'Firmanavn', placeholder = 'Indtast firmanavn' },
        { type = 'textarea', label = 'Beskrivelse', placeholder = 'Indtast Beskrivelse' },
        { type = 'input', label = 'Telefonnummer', placeholder = 'Indtast telefonnummer' },
        { type = 'input', label = 'URL', placeholder = 'Indtast URL (f.eks. Discord eller Imgur)' }
    })

    if input then
        local metadata = {
            company_name = input[1],
            description = input[2],
            phone = input[3],
            url = input[4]
        }

        TriggerServerEvent('Hondo_visitkort:saveMetadata', metadata)
    end
end)

-- Event til at vise firmakort detaljer.
RegisterNetEvent('Hondo_visitkort:showDetails', function(item)
    if item.metadata then
        lib.showContext({
            { title = item.metadata.company_name, description = item.metadata.description },
            { title = 'Telefon', description = item.metadata.phone },
            { title = 'URL', description = item.metadata.url }
        })
    else
        QBCore.Functions.Notify('Dette firmakort har ingen detaljer!', 'error')
    end
end)

-- Brug firmakortet, ellers yeet dette væk.
RegisterNetEvent('QBCore:Client:OnUseItem', function(item)
    if item.name == 'visit_kort' then
        TriggerServerEvent('Hondo_visitkort:use', item)
    end
end)