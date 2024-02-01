function onCreate()
    makeLuaSprite("bh", 'black_hole', -600 * 20, -400 * 2)
    scaleLuaSprite("bh", 4.0,4.0)

    addLuaSprite("bh", true)

    makeLuaSprite("bh2", 'black_hole', -600 * 80, 0)
    scaleLuaSprite("bh2", 8.0,8.0)
    makeLuaSprite("bh3", 'while_hole', -600 * 40, 1000)
    scaleLuaSprite("bh3", 4.0,4.0)

    addLuaSprite("bh3", true)
    addLuaSprite("bh2", true)
end

---
--- @param elapsed float
---
function onUpdate(elapsed)
    local currentBeat = (songPos/1000)*(bpm/80)
    tweenmath = 300-110*math.sin((currentBeat*0.25)*math.pi),0.001
    
      -- doTweenX(defaultBoyfriendX, 'boyfriend', -300-110*math.sin((currentBeat*0.25)*math.pi),0.001)
    doTweenX('hi', 'bh3', tweenmath)
end