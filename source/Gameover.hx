import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class Gameover extends FlxState
{
	var background:FlxSprite;
	var score:FlxText;
	var text:FlxText;
	var back:FlxButton;

	public function new()
	{
		super();
		background = new FlxSprite();
		score = new FlxText();
		text = new FlxText();
		back = new FlxButton();
		back.loadGraphic(AssetPaths.BTfish__png);
		add(back); // background.loadGraphic()

		// background.screenCenter();
	}
}
