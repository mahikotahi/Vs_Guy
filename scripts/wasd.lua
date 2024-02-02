curSelected = 0
lastSelected = nil

minSelect = 0
maxSelect = 3

options = {'Resume', 'Restart', 'Options', 'Exit'}

mouseOverlapOption = nil
optionCooldown = 0

substatesCreate = {
	['customPause'] = function()
		startTween('curSelectAlpha', 'curSelect', {alpha = 1}, 0.25, {ease = 'quadOut'})
		startTween('songTxtAlpha', 'songTxt', {alpha = 1}, 0.25, {ease = 'quadOut'})
		startTween('diffAlpha', 'diff', {alpha = 1}, 0.25, {ease = 'quadOut'})
		startTween('deathCountAlpha', 'deathCount', {alpha = 1}, 0.25, {ease = 'quadOut'})
		for i = 1, #options do startTween('option' .. i .. 'Alpha', 'option' .. i, {alpha = 1}, 0.25, {ease = 'quadOut'}) end

		runHaxeCode([[
			FlxTween.tween(bg, {alpha: 1}, 0.25, {ease: FlxEase.quadOut});
			FlxTween.tween(bgGrid, {alpha: 1}, 0.25, {ease: FlxEase.quadOut});

			pauseMusic = new FlxSound();
			if(PlayState.songName != null) pauseMusic.loadEmbedded(Paths.music(PlayState.songName), true, true);
			else if (PlayState.songName != 'None') pauseMusic.loadEmbedded(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), true, true);

			pauseMusic.volume = 0;
			FlxG.sound.list.add(pauseMusic);
			-- pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));
		]])

		setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
	end
}

substatesUpdate = {
	['customPause'] = function(elapsed)
		if keyJustPressed('UP') or keyJustPressed('DOWN') then changeSelection(keyJustPressed('UP') and -1 or 1) end

		for i = 1, #options do
			mouseOverlapOption = mouseOverlap('option' .. i)
			if not mouseOverlapOption and optionCooldown >= 0 then optionCooldown = (optionCooldown - elapsed) end
			if mouseOverlapOption and optionCooldown <= 0 and curSelected ~= (i - 1) then 
				optionCooldown = 0.1
				curSelected = i - 1
				changeSelection()
			end	
		end

		runHaxeCode('if (pauseMusic.volume < 0.5) pauseMusic.volume += 0.01 * ' .. elapsed)

		if keyboardJustPressed('ENTER') or (mouseOverlap('option' .. curSelected + 1) and mouseClicked()) then
			setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
			startTween('curSelectAlpha', 'curSelect', {alpha = 0}, 0.25, {ease = 'quadOut'})
			startTween('songTxtAlpha', 'songTxt', {alpha = 0}, 0.25, {ease = 'quadOut'})
			startTween('diffAlpha', 'diff', {alpha = 0}, 0.25, {ease = 'quadOut'})
			startTween('deathCountAlpha', 'deathCount', {alpha = 0}, 0.25, {ease = 'quadOut'})
			for i = 1, #options do startTween('option' .. i .. 'Alpha', 'option' .. i, {alpha = 0}, 0.25, {ease = 'quadOut'}) end
			runHaxeCode([[
				FlxTween.tween(bg, {alpha: 0}, 0.25, {ease: FlxEase.quadOut});
				FlxTween.tween(bgGrid, {alpha: 0}, 0.25, {ease: FlxEase.quadOut});
			]])

			switch(curSelected, {
				[0] = function() closeCustomSubstate() end,
				[1] = function() restartSong() end,
				[2] = function()
					runHaxeCode([[
						game.paused = true;
						game.vocals.volume = 0;
						OptionsState.onPlayState = true;
						MusicBeatState.switchState(new OptionsState());
						if(ClientPrefs.data.pauseMusic != 'None') {
							FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.data.pauseMusic)), pauseMusic.volume);
							FlxTween.tween(FlxG.sound.music, {volume: 0.7}, 0.8);
							FlxG.sound.music.time = pauseMusic.time;
						}
					]])
				end,
				[3] = function() exitSong() end
			})
		end
	end
}

substatesDestroy = {
	['customPause'] = function()
		runHaxeCode('pauseMusic.destroy();')
	end
}

function changeSelection(dir)
	dir = dir or 0

	if (curSelected + dir) ~= curSelected then lastSelected = curSelected end
	curSelected = curSelected + dir

	if curSelected < minSelect then curSelected = maxSelect
	elseif curSelected > maxSelect then curSelected = minSelect end

	playSound('scrollMenu')
	if lastSelected ~= curSelected then 
		startTween('curSelectPos', 'curSelect', 
			{x = (getProperty('option' .. curSelected + 1 .. '.x') + getProperty('option' .. curSelected + 1 .. '.width')) + 10,
			y = getProperty('option' .. curSelected + 1 .. '.y')},
			0.1, {ease = 'quadOut'}
		)
	end
end

function onPause()
	openCustomSubstate('customPause', true)
	return Function_Stop
end

function onCreatePost()
	luaDebugMode = true
	addHaxeLibrary('MusicBeatState', 'backend')
	addHaxeLibrary('OptionsState', 'options')
	addHaxeLibrary('FlxBackdrop', 'flixel.addons.display')
	addHaxeLibrary('FlxGridOverlay', 'flixel.addons.display')
	addHaxeLibrary('FlxSound', 'flixel.sound')
	addHaxeLibrary('Std')

	runHaxeCode([[
		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0xBB000000);
		bg.alpha = 0;
		game.add(bg);
		bg.cameras = [game.camOther];

		bgGrid = new FlxBackdrop(FlxGridOverlay.createGrid(80, 80, 160, 160, true, 0x11FFFFFF, 0x0));
		bgGrid.alpha = 0;
		game.add(bgGrid);
		bgGrid.cameras = [game.camOther];
		debugPrint(''); // ??????????? why the fuck does this crash without it
	]])

	for i = 1, #options do
		makeLuaText('option' .. i, options[i], 0, 20, (i * 80) + 130)
		setTextFont('option' .. i, 'PhantomMuff.ttf')
		setTextSize('option' .. i, 40)
		addLuaText('option' .. i)
		setObjectCamera('option' .. i, 'other')
		setProperty('option' .. i .. '.alpha', 0)
	end

	makeLuaText('curSelect', '<', 0, (getProperty('option' .. curSelected + 1 .. '.x') + getProperty('option' .. curSelected + 1 .. '.width')) + 10, getProperty('option' .. curSelected + 1 .. '.y'))
	setTextFont('curSelect', 'PhantomMuff.ttf')
	setTextSize('curSelect', 40)
	addLuaText('curSelect')
	setObjectCamera('curSelect', 'other')
	setProperty('curSelect.alpha', 0)

	makeLuaText('songTxt', 'Song: ' .. songName, 300, screenWidth - 310, 15)
	setTextFont('songTxt', 'PhantomMuff.ttf')
	setTextSize('songTxt', 30)
	setTextAlignment('songTxt', 'right')
	addLuaText('songTxt')
	setObjectCamera('songTxt', 'other')
	setProperty('songTxt.alpha', 0)

	makeLuaText('diff', 'Difficulty: ' .. difficultyName, 300, getProperty('songTxt.x'), getProperty('songTxt.y') + 40)
	setTextFont('diff', 'PhantomMuff.ttf')
	setTextSize('diff', 30)
	setTextAlignment('diff', 'right')
	addLuaText('diff')
	setObjectCamera('diff', 'other')
	setProperty('diff.alpha', 0)

	makeLuaText('deathCount', 'Blueballed: ' .. getPropertyFromClass('states.PlayState', 'deathCounter'), 300, getProperty('diff.x'), getProperty('diff.y') + 40)
	setTextFont('deathCount', 'PhantomMuff.ttf')
	setTextSize('deathCount', 30)
	setTextAlignment('deathCount', 'right')
	addLuaText('deathCount')
	setObjectCamera('deathCount', 'other')
	setProperty('deathCount.alpha', 0)
end

function onCustomSubstateCreate(t) if substatesCreate[t] then substatesCreate[t]() end end
function onCustomSubstateUpdate(t, elapsed) if substatesUpdate[t] then substatesUpdate[t](elapsed) end end
function onCustomSubstateDestroy(t) if substatesDestroy[t] then substatesDestroy[t]() end end
function switch(case, cases) if cases[case] ~= nil then return cases[case]() elseif cases.default ~= nil then return cases.default() end end
function mouseOverlap(obj, offsetX, offsetY)
	offsetX = offsetX or 0
	offsetY = offsetY or 0
	local overlapX = (getMouseX('other') + offsetX) >= getProperty(obj .. '.x') and (getMouseX('other') + offsetX) <= getProperty(obj .. '.x') + getProperty(obj .. '.width')
	local overlapY = (getMouseY('other') + offsetY) >= getProperty(obj .. '.y') and (getMouseY('other') + offsetY) <= getProperty(obj .. '.y') + getProperty(obj .. '.height')
	return overlapX and overlapY
end