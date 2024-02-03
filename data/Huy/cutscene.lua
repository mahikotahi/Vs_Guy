local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false

function onStartCountdown()
    cameraSetTarget("boyfriend")
    
    if not allowCountdown and isStoryMode and not startedFirstDialogue then
        setProperty('inCutscene', true);
        runTimer('start', 0.8);
        startedFirstDialogue = true;
        return Function_Stop;
    end

    return Function_Continue;
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'start' then
        --startDialogue('dialogueEnd', 'breakfast');
        startVideo("Huy_Cutscene");
    end
end