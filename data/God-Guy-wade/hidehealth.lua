
function onCreate()
    setProperty('healthBar.alpha', tonumber(0))
    setProperty('iconP2.alpha', tonumber(0))
    setProperty('iconP1.alpha', tonumber(0))
    setTimeBarColors("cyan", "green")
end

---
--- @param elapsed float
---
function onUpdate(elapsed)
    setProperty('iconP1.x', tonumber(-150))
end
function onUpdatePost(elapsed)
    setProperty('iconP1.x', tonumber(-150))
end

