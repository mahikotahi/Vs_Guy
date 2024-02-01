function onSongStart()
    doTweenAlpha("distraction", "alpha", 100, 2.0, "linear")
end

function onCountdownStarted()
    makeLuaSprite("distraction", "distractionBitch", 0, defaultPlayerStrumY)
    scaleLuaSprite("distraction", 2, 2)
    doTweenAlpha("distraction", "alpha", 0, 0.0, "linear")
    --addLuaSprite("distraction", true)
end

---
--- @param elapsed float
---
function onUpdate(elapsed)
    doTweenX("distract", "distraction", defaultPlayerStrumX0 - 320 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 0.0, "linear")
end