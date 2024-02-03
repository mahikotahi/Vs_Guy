local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false

function onEndSong()
    cameraSetTarget("boyfriend")
    
    if not allowCountdown and not isStoryMode and not startedFirstDialogue then
        setProperty('inCutscene', true);
        runTimer('start', 0.2);
        startedFirstDialogue = true;
        return Function_Stop;
    end

    return Function_Continue;
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'start' then
        --startDialogue('dialogueEnd', 'breakfast');
        startVideo("Cyster_PostCutscene");
    end
end