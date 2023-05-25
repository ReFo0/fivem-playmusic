local musicPlaying = false
local musicId = nil

RegisterCommand('playmusic', function(source, args, rawCommand)
    if #args ~= 1 then
        TriggerClientEvent('chatMessage', source, 'You must specify a valid YouTube link.')
        return
    end

    if not musicPlaying then
        local youtubeLink = args[1]
        TriggerClientEvent('playMusic', -1, youtubeLink)
        musicPlaying = true
    else
        TriggerClientEvent('chatMessage', source, 'An existing music is already playing.')
    end
end, false)

RegisterCommand('stopmusic', function(source, args, rawCommand)
    if musicPlaying then
        TriggerClientEvent('stopMusic', -1)
        musicPlaying = false
    else
        TriggerClientEvent('chatMessage', source, 'No Existing Music Found.')
    end
end, false)
