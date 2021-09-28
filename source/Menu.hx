import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;

class Menu extends FlxState
{
	var background:FlxSprite;
	var title:FlxSprite;
	var play:FlxButton;

	override function create()
	{
		if(FlxG.sound.music!=null)
			FlxG.sound.music.stop();
		background = new FlxSprite(0, 0, AssetPaths.rekacopy__jpg);
		title = new FlxSprite(50, 50, AssetPaths.PARGIT__png);
		play = new FlxButton(FlxG.width / 8, 3 * FlxG.height / 4, null, startGame);
		add(background);
		add(title);
		add(play);
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.mouse.x > play.x
			&& FlxG.mouse.x < (play.x + play.width)
			&& FlxG.mouse.y > play.y
			&& FlxG.mouse.y < (play.y + play.height))
		{
			play.loadGraphic(AssetPaths.PLAY2__png);
		}
		else
		{
			play.loadGraphic(AssetPaths.PLAY__png);
		}
		super.update(elapsed);
	}

	function startGame()
	{
		FlxG.sound.play(AssetPaths.FishEatSfx1__ogg, 1, false);
		FlxG.switchState(new PlayState());
	}
}
