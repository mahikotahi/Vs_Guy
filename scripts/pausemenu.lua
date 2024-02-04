pausemenuartLocation = 'pausemenuart/'
art = 'boy'
myMisses = 0
myCombo = 0
x = 500
y = 30
rng = getRandomFloat(1, 10)
animatedart = false
maxalphatweenlen = 2
displayedArt = 'boy'

function spritesInit()
    black()

    
    addSprite('port', 'port', 0, 0, false, 1, 1)
    addSprite('gambei', 'gambei', 0, 0, false, 1, 1)
    addSprite('zlambei', 'zlambei', 0, 0, false, 1, 1)
    addSprite('xdelirium', 'xdelirium', 0, 0, false, 1, 1)

    addSprite('boy', 'bf', 0, 0, false, 1, 1)
    addSprite('boymiss', 'bfmiss', 0, 0, false, 1, 1)
    addSprite('boycombo', 'bf combo', 0, 0, false, 1, 1)

    addSprite('obf', 'ourplebf', 60, 150, false, 1, 1)
    addSprite('obfm', 'ourplebfmiss', 60, 150, false, 1, 1)
    addSprite('obfc', 'ourplebfcombo', 60, 150, false, 1, 1)

    addSprite('goy', 'grf', 0, 0, false, 1, 1)
    addSprite('goymiss', 'grfmiss', 0, 0, false, 1, 1)
    addSprite('goycombo', 'grfcombo', 0, 0, false, 1, 1)

    addSprite('cyster', 'cyster_shake', -400, -200, true, 1, 1)
    addSpriteAnimation('cyster', 'idle', 'Cyster Shake', 24, true);

    addSprite('db', 'DistractionBitch', -800, -160, false, 10, 4)

    addSprite('botplay', 'botplay cyster', 0, 0, fakse, 0.5, 0.5)
end

function addSprite(name, spritename, xOffset, yOffset, animated, scaleX, scaleY)
    if animated then
        makeAnimatedLuaSprite(name, pausemenuartLocation.. spritename, x + xOffset, y + yOffset, "sparrow")
    else
        makeLuaSprite(name, pausemenuartLocation.. spritename, x + xOffset, y + yOffset)
    end
    setObjectCamera(name, 'other')
    scaleLuaSprite(name, scaleX, scaleY)
end

function addSpriteAnimation(obj, name, prefix, fps, loop)
    addAnimationByPrefix(obj, name, prefix, fps, loop)
end

function black()
    makeLuaSprite("b", 'black', 0, 0)
    scaleLuaSprite("b", 4.0,4.0)
    setObjectCamera("b", 'other')
end

function onPause()
    spritesInit()
    addLuaSprite('b', true)
    displayedArt = art
    addLuaSprite(displayedArt, true)
end

function onResume()
    removeLuaSprite('b', true)
    if animatedart then 
        objectPlayAnimation(displayedArt, "idle")
        doTweenAlpha('alphaTween', art, 0, getRandomFloat(0.4, maxalphatweenlen, ''), "circInOut")
    elseif not animatedart then
        removeLuaSprite(displayedArt, true)
    end
end

function onUpdate(elapsed)

    rng = getRandomFloat(1, 10)

    if myMisses <= 0 then myMisses = 0 end

    art = 'boy'

    if myMisses >= 5 then art = 'boymiss' end
    if myCombo >= 10 then art = 'boycombo' end

    if stringStartsWith(dadName, 'cyster') and rng <= 3 then art = 'cyster' end

    if stringStartsWith(songName, "God Guy") and rng <= 6 then art = 'db' end

    if songName == 'Huy' then art = 'obf' end
    if songName == 'Huy'and myMisses >= 5 then art = 'obfm' end
    if songName == 'Huy'and myCombo >= 10 then art = 'obfc' end

    if songName == 'My-Life' then art = 'goy' end
    if songName == 'My-Life'and myMisses >= 5 then art = 'goymiss' end
    if songName == 'My-Life'and myCombo >= 10 then art = 'goycombo' end

    rng = getRandomFloat(1, 100000)
    --art = 'xdelirium' -- rare things require testing
    if rng == 1 then art = 'port' end
    if rng == 2 then art = 'gambei' end
    if rng == 4 then art = 'zlambei' end
    if rng == 6 then art = 'xdelirium' end

    if botPlay then art = 'botplay' end

    fadeoutCheck()
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    myCombo = myCombo + 1
    myMisses = myMisses - 1
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    myCombo = 0
    myMisses = myMisses + 1
end

function fadeoutCheck()
    animatedart = false
    maxalphatweenlen = 2
    if art == 'cyster' then animatedart = true maxalphatweenlen = 6 end
    if art == 'db' then animatedart = true maxalphatweenlen = 12 end
end

function onTweenCompleted(tag)
    if tag == 'alphaTween' then 
        removeLuaSprite(displayedArt, true)
    end
end