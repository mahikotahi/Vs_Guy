local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false
playVideo = false;
playDialogue = true;

function onStartCountdown()

    cameraSetTarget("boyfriend")
    
    if not allowCountdown and isStoryMode then
		if playDialogue then
			startDialogue('dialogueS', 'breakfast');
			playDialogue = false;
            playVideo = true;
			return Function_Stop; --Prevents the song from starting naturally
		end
    end

    return Function_Continue;
end

function onEndSong()
    if not allowCountdown and isStoryMode then
		if playVideo then
            playVideo = false;
			startVideo('Waste-PostCutscene_audio');
			return Function_Stop; --Prevents the song from starting naturally
		end
    end

    return Function_Continue;
end