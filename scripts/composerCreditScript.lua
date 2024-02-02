y = 200

function onCreate()
    local credits = ""

    makeAnimatedLuaSprite('disc', 'spinning_disc', -300, y - 30);
	setScrollFactor('disc', 1, 1);
	scaleObject('disc', 1, 1)
	addAnimationByPrefix('disc', 'spin', 'spinTeamDisc')
    setObjectCamera("disc", 'camHUD')
    addLuaSprite("disc", true)

    makeLuaSprite("blackbar", 'black', -300, y)
    setObjectCamera("blackbar", 'camHUD')
    scaleLuaSprite("blackbar", 0.3, 0.05)

    if songName == 'Guy' or songName == 'Waste' or songName == 'God Guy' or songName == 'Lone'then
        credits = "Song composed by portilizen"
    elseif songName == 'Guy-wade' or songName == 'Waste-wade' or songName == 'God Guy-wade' then
        scaleLuaSprite("blackbar", 0.32, 0.05)
        credits = "Song composed by wade/sketch" 
    elseif songName == 'My-Life' then
        scaleLuaSprite("blackbar", 0.32, 0.05)
        credits = "Song composed by xdelirium" 
    elseif songName == 'Cyster' then
        scaleLuaSprite("blackbar", 0.34, 0.05)
        credits = "Song composed by thatOneGambei" 
    end

    --luaDebugMode = true
    --debugPrint(songName)

    makeLuaText("blacktext",credits, 0, -300, y)


    addLuaSprite("blackbar", true)
    addLuaText('blacktext')
end

function onSongStart()
    doTweenX("bb", "blackbar", 0, 1.0, "easeTo")
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
        doTweenX("bb2", "blackbar", -300, 1.0, "easeTo")
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

