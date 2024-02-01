rng = getRandomInt(1, 4)

function onCreate()
    makeLuaSprite("bfbox", 'black', getCharacterX("boyfriend") + 30, getCharacterY("boyfriend") + 210)
    scaleLuaSprite("bfbox", 0.5, 0.1)
    --setObjectCamera("eb", 'camHUD')
    --setScrollFactor("eb", 0.0, 0.0)

    --makeLuaText("bftext", "keithMan69420", 0, getCharacterX("boyfriend") + 30, getCharacterY("boyfriend") + 210)
    makeLuaText("bftext", "notBoyfriend", 0, 900, 30)
    setScrollFactor("bftext", 1.0, 1.0)
    makeLuaText("rgtext", "redMan420", 0, 280, 30)
    setScrollFactor("rgtext", 1.0, 1.0)

    --addLuaSprite("bfbox", true)

    if songName == 'Waste' or songName == 'Waste-wade' then
        addLuaText("bftext")
        addLuaText("rgtext")
    end
end