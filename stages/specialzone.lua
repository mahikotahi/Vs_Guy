function onCreate()
	-- background shit
	makeLuaSprite('bg', 'specialzone/Background', -1000, -1000);
	setScrollFactor('bg', 1, 1);
	scaleObject('bg', 10, 10)
    
	makeLuaSprite('floor', 'specialzone/Floor', -800, -1060);
	setScrollFactor('floor', 1, 1);
	scaleObject('floor', 2, 3)    

	makeLuaSprite('ring', 'specialzone/Ring', -200, -400);
	setScrollFactor('ring', 0.9, 0.5);
	scaleObject('ring', 1, 1)

    addLuaSprite("bg", false)
	addLuaSprite('ring', false);
	addLuaSprite('floor', false);
end