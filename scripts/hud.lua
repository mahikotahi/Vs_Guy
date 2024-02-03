function onCreate()
    makeLuaText("mod_version", "Vs Guy V4.0 DEVELOPMENT VERSION\nMade by Team Disc\nPsych Engine 0.7.3", 0, 0.0, 670.0)
    setScrollFactor("mod_version", 0.0, 0.0)
    setTextAlignment("mod_version", 'left')
    setObjectCamera("mod_version", 'camHUD')

    makeLuaSprite("logo", 'teamLogo', 180, 660)
    setScrollFactor("logo", 0.0, 0.0)
    scaleLuaSprite("logo", 0.4, 0.4)
    setObjectCamera("logo", 'camHUD')

    addLuaSprite("logo", true)
    addLuaText("mod_version")
end