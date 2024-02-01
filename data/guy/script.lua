local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false
playVideo = false;
playDialogue = true;

function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then
		if playDialogue then --Once the video ends it calls onStartCountdown again. Play dialogue this time
			startDialogue('dialogueS', 'breakfast'); --"breakfast" is the dialogue music file from "music/" folder
			playDialogue = false;
			return Function_Stop; --Prevents the song from starting naturally
		end
    end

    return Function_Continue;
end