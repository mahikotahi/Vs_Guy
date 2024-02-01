function onCreate()
	-- background shit
	makeLuaSprite('nether', 'nether FNF Guy Wade', -800, -500);
	setScrollFactor('nether', 1, 1);
	scaleObject('nether', 2.2, 2.2)

	makeAnimatedLuaSprite('zombi', 'zombie wade', -800, -500);
	setScrollFactor('zombi', 1, 1);
	scaleObject('zombi', 2.2, 2.2)
	addAnimationByPrefix('zombi', 'bop', 'idle')
	--addAnimationByIndices('zombi', 'bop', 'idle', "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" , 30)
	--setProperty('zombi.antialising', false)

	makeLuaSprite('orange', 'donaldTrump', -770 * 3.5,-150 * 55);
	setScrollFactor('orange', 1, 1);
	scaleObject('orange', 6, 6)

	addLuaSprite('nether', false);
	addLuaSprite('zombi', true);
	-- addLuaSprite('orange', true);

	-- setProperty("", nil, false)

	--doTweenX('dad', 'dad.scale', 0.6, 0, 'linear')
	--doTweenY('dad', 'dad.scale', 0.6, 0, 'linear')
end

function onBeatHit()
	objectPlayAnimation('zombi', 'bop')
end