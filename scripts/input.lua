---
--- @param elapsed float
---
function onUpdate(elapsed)
    if stringStartsWith(songName, "God Guy")then
        if keyboardReleased("L") then
            loadSong('Lone', -1)
        end
    end
end