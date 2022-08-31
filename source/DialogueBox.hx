package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), 0xffc08bc1);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.5, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 1);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
                
			case 'the-date':
				hasDialog = true;
                box.frames = Paths.getSparrowAtlas('neko/lia_speech');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [11], "", 24);
                box.width = 200;
                box.height = 200;
                box.y = 395;
                box.x = 0;
			case 'red-flag':
				hasDialog = true;
                box.frames = Paths.getSparrowAtlas('neko/lia_speech');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [11], "", 24);
                box.width = 200;
                box.height = 200;
                box.y = 395;
                box.x = 0;
			case 'gtfo':
				hasDialog = true;
                box.frames = Paths.getSparrowAtlas('neko/lia_speech');
				box.animation.addByPrefix('normalOpen', 'speech bubble loud open', 24, false);
				box.animation.addByIndices('normal', 'AHH speech bubble', [11], "", 24);
                box.width = 200;
                box.height = 200;
                box.y = 315;
                box.x -= 30;
                
			case 'left-swipe':
				hasDialog = true;
                box.frames = Paths.getSparrowAtlas('neko/mia_speech');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [11], "", 24);
                box.width = 200;
                box.height = 200;
                box.y = 410;
                box.x = 0;
			case 'trippin':
				hasDialog = true;
                box.frames = Paths.getSparrowAtlas('neko/mia_speech');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [11], "", 24);
                box.width = 200;
                box.height = 200;
                box.y = 410;
                box.x = 0;
                
			case 'smol':
				hasDialog = true;
                box.frames = Paths.getSparrowAtlas('neko/kia_speech');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [11], "", 24);
                box.width = 200;
                box.height = 200;
                box.y = 410;
                box.x = 0;
			case 'frontin':
				hasDialog = true;
                box.frames = Paths.getSparrowAtlas('neko/kia_speech');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [11], "", 24);
                box.width = 200;
                box.height = 200;
                box.y = 410;
                box.x = 0;

			case 'hubris':
				hasDialog = true;
                box.frames = Paths.getSparrowAtlas('neko/kia_speech');
				box.animation.addByPrefix('normalOpen', 'speech bubble loud open', 24, false);
				box.animation.addByIndices('normal', 'AHH speech bubble', [11], "", 24);
                box.width = 200;
                box.height = 200;
                box.y = 315;
                box.x = 0;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
            
		switch (PlayState.SONG.song.toLowerCase())
        {
            case 'the-date':
                portraitLeft = new FlxSprite(-90, 225);
                portraitLeft.frames = Paths.getPackerAtlasJson('neko/lia_portraits');
                portraitLeft.animation.addByPrefix('enter', 'happy', 24, false);
                portraitLeft.updateHitbox();
                portraitLeft.scrollFactor.set();
                add(portraitLeft);
                FlxTween.tween(portraitLeft, { x: 370 }, 1, {type:FlxTween.ONESHOT});
                portraitLeft.visible = false;         

                portraitRight = new FlxSprite(-90, 225);
                portraitRight.frames = Paths.getPackerAtlasJson('neko/bf_portraits');
                portraitRight.animation.addByPrefix('enter', 'happy', 24, false);
                portraitRight.updateHitbox();
                portraitRight.scrollFactor.set();
                add(portraitRight);
                FlxTween.tween(portraitRight, { x: 600 }, 1, {type:FlxTween.ONESHOT});
                portraitRight.visible = false;        
            case 'red-flag':
                portraitLeft = new FlxSprite(-90, 225);
                portraitLeft.frames = Paths.getPackerAtlasJson('neko/lia_portraits');
                portraitLeft.animation.addByPrefix('enter', 'what', 24, false);
                portraitLeft.updateHitbox();
                portraitLeft.scrollFactor.set();
                add(portraitLeft);
                FlxTween.tween(portraitLeft, { x: 370 }, 1, {type:FlxTween.ONESHOT});
                portraitLeft.visible = false;        
                
                portraitRight = new FlxSprite(-90, 225);
                portraitRight.frames = Paths.getPackerAtlasJson('neko/bf_portraits');
                portraitRight.animation.addByPrefix('enter', 'confused', 24, false);
                portraitRight.updateHitbox();
                portraitRight.scrollFactor.set();
                add(portraitRight);
                FlxTween.tween(portraitRight, { x: 600 }, 1, {type:FlxTween.ONESHOT});
                portraitRight.visible = false;     
			case 'gtfo':
                portraitLeft = new FlxSprite(-90, 225);
                portraitLeft.frames = Paths.getPackerAtlasJson('neko/lia_portraits');
                portraitLeft.animation.addByPrefix('enter', 'bloody', 24, false);
                portraitLeft.updateHitbox();
                portraitLeft.scrollFactor.set();
                add(portraitLeft);
                FlxTween.tween(portraitLeft, { x: 370 }, 1, {type:FlxTween.ONESHOT});
                portraitLeft.visible = false;         

                portraitRight = new FlxSprite(-90, 225);
                portraitRight.frames = Paths.getPackerAtlasJson('neko/bf_portraits');
                portraitRight.animation.addByPrefix('enter', 'scared', 24, false);
                portraitRight.updateHitbox();
                portraitRight.scrollFactor.set();
                add(portraitRight);
                FlxTween.tween(portraitRight, { x: 600 }, 1, {type:FlxTween.ONESHOT});
                portraitRight.visible = false;     
			case 'left-swipe':
                portraitLeft = new FlxSprite(-90, 225);
                portraitLeft.frames = Paths.getPackerAtlasJson('neko/mia_portraits');
                portraitLeft.animation.addByPrefix('enter', 'happy', 24, false);
                portraitLeft.updateHitbox();
                portraitLeft.scrollFactor.set();
                add(portraitLeft);
                FlxTween.tween(portraitLeft, { x: 370 }, 1, {type:FlxTween.ONESHOT});
                portraitLeft.visible = false;       
                
                portraitRight = new FlxSprite(-90, 225);
                portraitRight.frames = Paths.getPackerAtlasJson('neko/bf_portraits');
                portraitRight.animation.addByPrefix('enter', 'happy', 24, false);
                portraitRight.updateHitbox();
                portraitRight.scrollFactor.set();
                add(portraitRight);
                FlxTween.tween(portraitRight, { x: 600 }, 1, {type:FlxTween.ONESHOT});
                portraitRight.visible = false;    
			case 'trippin':
                portraitLeft = new FlxSprite(-90, 225);
                portraitLeft.frames = Paths.getPackerAtlasJson('neko/mia_portraits');
                portraitLeft.animation.addByPrefix('enter', 'sad', 24, false);
                portraitLeft.updateHitbox();
                portraitLeft.scrollFactor.set();
                add(portraitLeft);
                FlxTween.tween(portraitLeft, { x: 370 }, 1, {type:FlxTween.ONESHOT});
                portraitLeft.visible = false;               

                portraitRight = new FlxSprite(-90, 225);
                portraitRight.frames = Paths.getPackerAtlasJson('neko/bf_portraits');
                portraitRight.animation.addByPrefix('enter', 'confused', 24, false);
                portraitRight.updateHitbox();
                portraitRight.scrollFactor.set();
                add(portraitRight);
                FlxTween.tween(portraitRight, { x: 600 }, 1, {type:FlxTween.ONESHOT});
                portraitRight.visible = false;                      
			case 'smol':
                portraitLeft = new FlxSprite(-90, 225);
                portraitLeft.frames = Paths.getPackerAtlasJson('neko/kia_portraits');
                portraitLeft.animation.addByPrefix('enter', 'neutral', 24, false);
                portraitLeft.updateHitbox();
                portraitLeft.scrollFactor.set();
                add(portraitLeft);
                FlxTween.tween(portraitLeft, { x: 370 }, 1, {type:FlxTween.ONESHOT});
                portraitLeft.visible = false;        
                
                portraitRight = new FlxSprite(-90, 225);
                portraitRight.frames = Paths.getPackerAtlasJson('neko/bf_portraits');
                portraitRight.animation.addByPrefix('enter', 'happy', 24, false);
                portraitRight.updateHitbox();
                portraitRight.scrollFactor.set();
                add(portraitRight);
                FlxTween.tween(portraitRight, { x: 600 }, 1, {type:FlxTween.ONESHOT});
                portraitRight.visible = false;                    
			case 'frontin':
                portraitLeft = new FlxSprite(-90, 225);
                portraitLeft.frames = Paths.getPackerAtlasJson('neko/kia_portraits');
                portraitLeft.animation.addByPrefix('enter', 'angry', 24, false);
                portraitLeft.updateHitbox();
                portraitLeft.scrollFactor.set();
                add(portraitLeft);
                FlxTween.tween(portraitLeft, { x: 370 }, 1, {type:FlxTween.ONESHOT});
                portraitLeft.visible = false;    
                
                portraitRight = new FlxSprite(-90, 225);
                portraitRight.frames = Paths.getPackerAtlasJson('neko/bf_portraits');
                portraitRight.animation.addByPrefix('enter', 'annoyed', 24, false);
                portraitRight.updateHitbox();
                portraitRight.scrollFactor.set();
                add(portraitRight);
                FlxTween.tween(portraitRight, { x: 600 }, 1, {type:FlxTween.ONESHOT});
                portraitRight.visible = false;        
			case 'hubris':
                portraitLeft = new FlxSprite(-90, 225);
                portraitLeft.frames = Paths.getPackerAtlasJson('neko/kia_portraits');
                portraitLeft.animation.addByPrefix('enter', 'shaggy', 24, false);
                portraitLeft.updateHitbox();
                portraitLeft.scrollFactor.set();
                add(portraitLeft);
                FlxTween.tween(portraitLeft, { x: 370 }, 1, {type:FlxTween.ONESHOT});
                portraitLeft.visible = false;        
                
                portraitRight = new FlxSprite(-90, 225);
                portraitRight.frames = Paths.getPackerAtlasJson('neko/bf_portraits');
                portraitRight.animation.addByPrefix('enter', 'confused', 24, false);
                portraitRight.updateHitbox();
                portraitRight.scrollFactor.set();
                add(portraitRight);
                FlxTween.tween(portraitRight, { x: 600 }, 1, {type:FlxTween.ONESHOT});
                portraitRight.visible = false;                        
		}
        
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);
		portraitLeft.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 40);
		dropText.font = 'VCR OSD Mono';
		dropText.color = 0xff656565;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 40);
		swagDialogue.font = 'VCR OSD Mono';
		swagDialogue.color = 0xff1b1b1b;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
		
		#if android
		skipB = new FlxUIButton((FlxG.width-140)-20,20,"Skip");
		skipB.setLabelFormat("Nokia Cellphone FC Small", 25, 0xFF222222);
		skipB.resize(140, 50);
		invTouch = new FlxUIButton(0, skipB.y+skipB.height+10);
		invTouch.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
		add(invTouch);
		add(skipB);
		#end
		
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (!isEnding)
		{
			var next:Bool;
			var skip:Bool;

			next = FlxG.keys.justPressed.SPACE #if android || invTouch.justPressed #end;
			skip = FlxG.keys.justPressed.S #if android || skipB.justPressed #end;

			if (skip)
			{
				FlxG.sound.play(Paths.sound('clickText'), 0.8);
				endDialogue();
			}
			
		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (PlayerSettings.player1.controls.ACCEPT && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.5;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':
				portraitLeft.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
