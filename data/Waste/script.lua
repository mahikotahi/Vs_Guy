local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false
playVideo = true;
playDialogue = true;

function onStartCountdown()
    if not allowCountdown and isStoryMode then
        if playVideo then --Video cutscene plays first
			startVideo('redCutsene'); --Play video file from "videos/" folder
			playVideo = false;
			return Function_Stop; --Prevents the song from starting naturally
		elseif playDialogue then --Once the video ends it calls onStartCountdown again. Play dialogue this time
			startDialogue('dialogue', 'breakfast'); --"breakfast" is the dialogue music file from "music/" folder
			playDialogue = false;
			return Function_Stop; --Prevents the song from starting naturally
		end
    end

    return Function_Continue;
end

function onEndSong()
    if not allowCountdown and isStoryMode and not startedEndDialogue then
        setProperty('inCutscene', true);
        runTimer('startDialogueEnd', 0.8);
        startedEndDialogue = true;
        return Function_Stop;
    end

    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogueEnd' then
        startDialogue('dialogueEnd', 'breakfast');
    end
end