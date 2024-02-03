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

    makeLuaText("ggtext", "IM A GOD YOU CANT STOP ME", 0, 200, 30)
    setScrollFactor("ggtext", 1.0, 1.0)
    makeLuaText("bf2text", "notBoyfriend", 0, 1000, 180)
    setScrollFactor("bf2text", 1.0, 1.0)

    --addLuaSprite("bfbox", true)

    if songName == 'Waste' or songName == 'Waste-wade' then
        addLuaText("bftext")
        addLuaText("rgtext")
    elseif songName == 'Cyster' then
        makeLuaText("ggtext", "IM A GOD YOU CANT STOP ME", 0, 100, 180)
        addLuaText('ggtext');
        addLuaText('b2ftext');
    end
end

function onUpdate(elapsed)
    if songName == 'God Guy-wade' and curStep == 768 then

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
        setTextString("ggtext", "IM A GOD YOU CANT STOP ME IM A GOD YOU CANT STOP ME IM A GOD YOU CANT STOP ME IM A GOD YOU CANT STOP ME IM A GOD YOU CANT STOP ME IM A GOD YOU ")
        setTextString("b2ftext", "MY BITCH")
    elseif rng == 3 then
        setTextString("ggtext", "IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD IM A GOD")
        setTextString("b2ftext", "MY PET")
    elseif rng == 5 then
        setTextString("ggtext", "YOU CANT STOP ME YOU CANT STOP ME YOU CANT STOP ME YOU CANT STOP ME YOU CANT STOP ME YOU CANT STOP ME YOU CANT STOP ME YOU CANT STOP ME YOU CAN")
        setTextString("b2ftext", "IDIOT")
    elseif rng == 7 then
        setTextString("ggtext", "HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAH")
        setTextString("b2ftext", "FAGGOT")
    elseif rng == 9 then
        setTextString("ggtext", "MY GAME NOW MY GAME NOW MY GAME NOW MY GAME NOW MY GAME NOW MY GAME NOW MY GAME NOW MY GAME NOW MY GAME NOW MY GAME NOW MY GAME NOW MY GAME NOW")
        setTextString("b2ftext", "VICTIM")
    end

    if songName == 'Cyster' then
        -- makeLuaText("ggtext", "IM A GOD YOU CANT STOP ME", 0, defaultPlayerStrumX ..getRandomInt(0, 3), 180)
        setTextSize("ggtext", getRandomInt(16, 32))
        setTextWidth('ggtext', getRandomInt(64, 64))
        --setProperty("ggtext.y", getRandomInt(30, 160))
    end
end