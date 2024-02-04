y = 200

function onCreate()
    local credits = "unknown"

    makeAnimatedLuaSprite('disc', 'spinning_disc', -300, y - 30);
	setScrollFactor('disc', 1, 1);
	scaleObject('disc', 1, 1)
	addAnimationByPrefix('disc', 'spin', 'spinTeamDisc')
    setObjectCamera("disc", 'camHUD')
    addLuaSprite("disc", true)

    makeLuaSprite("blackbar", 'black', -400, y)
    setObjectCamera("blackbar", 'camHUD')
    scaleLuaSprite("blackbar", 0.4, 0.08)

    if songName == 'Guy' then credits = 'portilizen' end
    if songName == 'Waste' then credits = 'portilizen' end
    if songName == 'God Guy' then credits = 'portilizen' end
    if songName == 'Lone' then credits = 'portilizen' end
    if songName == 'Huy' then credits = 'portilizen' end
    if songName == 'third-wheel' then credits = 'wade/sketch' end
    if stringEndsWith(songName, "-wade") then credits = 'wade/sketch' end 
    if songName == 'My-Life' then credits = 'xdelirium' end
    if songName == 'Discorm' then credits = 'xdelirium' end
    if songName == 'Cyster' then credits = 'thatOneGambei' end

    --luaDebugMode = true
    --debugPrint(songName)

    if songName == 'third-wheel' then
        makeLuaText("blacktext", songName .. '\ncovered by ' .. credits, 0, -300, y)
    else
        makeLuaText("blacktext", songName .. '\ncomposed by ' .. credits, 0, -300, y)
    end
    setTextAlignment("blacktext", 'left')
    addLuaSprite("blackbar", true)
    addLuaText('blacktext')
end

function onSongStart()
    doTweenX("bb", "blackbar",0, 1.0, "easeTo")
    doTweenX("bt", "blacktext", 0, 1.0, "easeTo")
    doTweenX("bd", "disc", 200, 1.0, "easeTo")
    runTimer("blacks", 4, 1)
end

---
--- @param tag string
--- @param loops integer
--- @param loopsLeft integer
---
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'blacks' then
        if songName == 'Cyster' then
            setTextString("blacktext", "GAMBEI IS MY GOD!")
        end

        doTweenX("bb2", "blackbar", -400, 1.0, "easeTo")
        doTweenX("bt2", "blacktext", -300, 1.0, "easeTo")
        doTweenX("bd2", "disc", -300, 1.0, "easeTo")
    end
end

---
--- @param tag string
--- @param ?vars ?
---
function onTweenCompleted(tag)
    if tag == 'bb2' then
        removeLuaSprite("blackbar", true)
        removeLuaSprite("blacktext", true)
        removeLuaSprite("disc", true)
    end
end