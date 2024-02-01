rng = getRandomInt(1, 4)

function onCreate()
    makeLuaSprite("eb", 'black', getProperty(defaultBoyfriendX), getProperty(defaultBoyfriendY))
    scaleLuaSprite("eb", 0.3, 0.05)
    setObjectCamera("eb", 'camHUD')
    addLuaSprite("eb", true)
    setScrollFactor("eb", 0.0, 0.0)
end