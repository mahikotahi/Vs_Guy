-- i stole from myself lmao
x = 500
y = 30
rank = "A"

function spritesInit()
    black()

    
    addSprite('therank', 'ranks', 0, 0, true, 1, 1)
    addSpriteAnimation('therank', 'A', 'RANK A PLAY', 24, false)
    addSpriteAnimation('therank', 'B', 'RANK B PLAY', 24, false)
    addSpriteAnimation('therank', 'C', 'RANK C PLAY', 24, false)
    addSpriteAnimation('therank', 'D', 'RANK D PLAY', 24, false)
    addSpriteAnimation('therank', 'F', 'RANK F PLAY', 24, false)
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


        --spritesInit()
        --addLuaSprite('b', true)
        --addLuaSprite('therank', true)
        --addLuaSprite(rank.. value1, true)
        --objectPlayAnimation('therank', rank)

-- i dont think i will be able to do this