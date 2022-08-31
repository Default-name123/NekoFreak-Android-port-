package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author bbpanzu
 */
class EndingState extends FlxState
{

	var _goodEnding:Bool = false;
	
	public function new(goodEnding:Bool = true) 
	{
		super();
		_goodEnding = goodEnding;
		
	}
	
	override public function create():Void 
	{
		trace(PlayState.storyWeek);
		
		#if mobileC
		addVirtualPad(NONE, A);
		#end
		
		super.create();	
		var end:FlxSprite = new FlxSprite(0, 0);
		if (PlayState.storyWeek == 0)
        {
			FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
			end.loadGraphic(Paths.image("neko/ending1"));
        }
		else if (PlayState.storyWeek == 1)
        {
			FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
			end.loadGraphic(Paths.image("neko/ending2"));
        }
		else if (PlayState.storyWeek == 2)
        {
			FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
			end.loadGraphic(Paths.image("neko/ending3"));
        }
		add(end);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ACCEPT){
			FlxG.sound.play(Paths.sound('confirmMenu'));
			endIt();
		}
		
	}
	
	
	public function endIt(e:FlxTimer=null){
		trace("ENDING");
		FlxG.switchState(new StoryMenuState());
	}
	
}
