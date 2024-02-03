function onCreatePost()

    if stringStartsWith(songName, 'God Guy') or songName =='Cyster' then
        setProperty('debugKeysChart', null); -- prevents key from doing anything
    end

end

function onUpdate()

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') and stringStartsWith(songName, 'God Guy') or songName =='Cyster' then
        loadSong('none');
    end

end