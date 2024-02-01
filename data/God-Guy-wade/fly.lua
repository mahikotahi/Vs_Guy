function onUpdate(elapsed)

    songPos = getSongPosition()

    local currentBeat = (songPos/5000)*(curBpm/60)

    --Player Notes

    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 320 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)

    noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 320 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)

    noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 320 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)

    noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 320 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)

    --Opponent Notes

    noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 - 2000, 6)

    noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 - 2000, 6)

    noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 - 2000, 6)

    noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 - 2000, 6)

    if curStep >= 0 then
  
      songPos = getSongPosition()
  
      -- local currentBeat = (songPos/1000)*(bpm/80)
    
      -- doTweenX(defaultBoyfriendX, 'boyfriend', -300-110*math.sin((currentBeat*0.25)*math.pi),0.001)
      doTweenY(defaultBoyfriendY, 'boyfriend', 300-110*math.sin((currentBeat*3)*math.pi),0.001)
      doTweenX(defaultOpponentX, 'dad', 300-110*math.sin((currentBeat*0.25)*math.pi),0.001)
      -- doTweenY(defaultOpponentY, 'dad', -300-110*math.sin((currentBeat*0.25)*math.pi),0.001)

    end
  
  end