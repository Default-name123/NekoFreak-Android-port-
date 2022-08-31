function start (song)

end

function update (elapsed)
	if curStep >= 128 and curStep < 255 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 10 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
	if curStep >= 256 and curStep < 288 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 6 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
	if curStep >= 320 and curStep < 352 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 6 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
	if curStep >= 384 and curStep < 511 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 10 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
	if curStep >= 512 and curStep < 640 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 4 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
	if curStep >= 668 and curStep < 671 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 20 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end

	if curStep >= 672 and curStep < 798 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 12 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end

	if curStep >= 799 and curStep < 831 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 7 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end

	if curStep >= 863 and curStep < 896 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 7 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end

	if curStep >= 928 and curStep < 1055 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 13 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end

	if curStep >= 1056 and curStep < 1244 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 7 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
    
end

function beatHit (beat)

end

function stepHit (beat)

end

function keyPressed (key)

end
