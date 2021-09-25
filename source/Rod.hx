import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Rod extends FlxSprite
{
	static inline var SPEED = 1000;

	public function new()
	{
		super();
		makeGraphic(16, 256, FlxColor.BROWN);
		drag.y = 0;
	}

	override function update(elapsed:Float)
	{
		y = FlxG.mouse.y - 32;
		super.update(elapsed);
	}
}
