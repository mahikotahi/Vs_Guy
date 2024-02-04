function cre()

	makeAnimatedLuaSprite('', 'icons/Hypno2 Health Icon', getProperty('iconP2.x'), getProperty('iconP2.y'))
	addAnimationByPrefix('', 'idle', 'Hypno2 Icon', 24, false)
	setObjectCamera('', 'hud')
	addLuaSprite('', true)

end

function up(elapsed)

	setObjectOrder('', getObjectOrder('iconP1') + 10)

	setProperty('.flipX', false)
	setProperty('.visible', true)
	setProperty('.x', getProperty('iconP2.x') - 30)
	setProperty('.angle', getProperty('iconP2.angle'))
	setProperty('.y', getProperty('iconP2.y') - 50)
	setProperty('.scale.x', getProperty('iconP2.scale.x') - 0)
	setProperty('.scale.y', getProperty('iconP2.scale.y') - 0)
	setProperty('.antialiasing',true)

	setProperty('iconP2.alpha', 0) 
    objectPlayAnimation('','idle');	

end