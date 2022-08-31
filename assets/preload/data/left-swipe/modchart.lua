function start (song)

end

function update (elapsed)
	if curStep >= 128 and curStep < 384 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 5 * math.cos((currentBeat + i*0.4) * math.pi), i)
			end
	end
	if curStep >= 512 and curStep < 768 then
		local currentBeat = (songPos / 1000)*(bpm/60)
			for i=0, 7 do
				setActorY(defaultStrum0Y + 5 * math.cos((currentBeat + i*0.5) * math.pi), i)
			end
	end
end

function beatHit (beat)

end

function stepHit (beat)

end

function keyPressed (key)

end
