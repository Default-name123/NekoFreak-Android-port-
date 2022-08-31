function start (song)

end

function update (elapsed)
	if curStep >= 128 and curStep < 254 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 10 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
	if curStep >= 255 and curStep < 382 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 3 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
	if curStep >= 383 and curStep < 640 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 12 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
	if curStep >= 1024 and curStep < 1136 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 5 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
	if curStep >= 1152 and curStep < 1279 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 13 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
    end

	if curStep >= 1280 and curStep < 1407 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 5 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
	if curStep >= 1408 and curStep < 1664 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 15 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
end

function beatHit (beat)

end

function stepHit (beat)

end

function keyPressed (key)

end
