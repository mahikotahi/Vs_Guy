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

    rng = getRandomInt(1, 10)

    if rng < 3 then
        setTextString("bftext", "notBoyfriend")
    elseif rng < 5 then
        setTextString("bftext", "xmlMan")
    elseif rng < 7 then
        setTextString("bftext", "Shortster")
    elseif rng < 9 then
        setTextString("bftext", "BestRapManEva")
    elseif rng < 11 then
        setTextString("bftext", "51ng3r43va")
    elseif rng == 60 then
        setTextString("bftext", "notKeith")
    elseif rng == 63 then
        setTextString("bftext", "notEvan")
    elseif rng == 64 then
        setTextString("bftext", "keith")
    elseif rng == 66 then
        setTextString("bftext", "evan")
    end

    --addLuaSprite("bfbox", true)

    if songName == 'Waste' or songName == 'Waste-wade' then
        addLuaText("bftext")
        addLuaText("rgtext")
    end
end

function onUpdate(elapsed)
    if songName == 'God Guy-wade' and curStep == 768 then
        makeLuaText("ggtext", "IM A GOD YOU CANT STOP ME", 0, 200, 30)
        setScrollFactor("ggtext", 1.0, 1.0)

        addLuaText("bftext")
        addLuaText("ggtext")
    end
    if songName == 'God Guy-wade' and curStep == 1024 then
        removeLuaText("bftext", true)
        removeLuaText("ggtext", true)
        --addLuaText("rgtext")
    end

    rng2 = getRandomInt(1, 100)

    if rng2 < 51 then
        rng = getRandomInt(1, 10)
    end

    if rng == 1 then
        setTextString("ggtext", "IM A GOD YOU CANT STOP ME")
    elseif rng == 3 then
        setTextString("ggtext", "IM A GOD IM A GOD IM A GO")
    elseif rng == 5 then
        setTextString("ggtext", "YOU CANT STOP ME YOU CANT")
    elseif rng == 7 then
        setTextString("ggtext", "HAHAHAHAHAHAHAHAHAHAHAHAH")
    elseif rng == 9 then
        setTextString("ggtext", "MY GAME NOW MY GAME NOW M")
    end
end