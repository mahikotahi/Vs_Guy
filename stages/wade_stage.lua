
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'stageback', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('stagefront', 'stagefront', -650, 600);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);

	makeLuaSprite('stagelight_left', 'stage_light', -125, -100);
	setScrollFactor('stagelight_left', 0.9, 0.9);
	scaleObject('stagelight_left', 1.1, 1.1);
		
	makeLuaSprite('stagelight_right', 'stage_light', 1225, -100);
	setScrollFactor('stagelight_right', 0.9, 0.9);
	scaleObject('stagelight_right', 1.1, 1.1);
	setProperty('stagelight_right.flipX', true); --mirror sprite horizontally

	makeLuaSprite('stagecurtains', 'stagecurtains', -500, -100);
	setScrollFactor('stagecurtains', 1.3, 1.3);
	scaleObject('stagecurtains', 0.9, 0.9);

	makeLuaSprite('light', 'light', 800, -2300);
	setScrollFactor('light', 1, 1);
	scaleObject('light', 0.8, 3);
	makeLuaSprite('light2', 'light', -50, -2300);
	setScrollFactor('light2', 1, 1);
	scaleObject('light2', 0.8, 3);
	setProperty('light2.flipX', true); --mirror sprite horizontally

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('light', true);
	addLuaSprite('light2', true);
	addLuaSprite('stagecurtains', true);
end