import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Rod extends FlxSprite
{
	

	public function new()
	{
		super();
		// makeGraphic(16, 256, FlxColor.BROWN);
		loadGraphic(AssetPaths.PT_0002_line__png);
	}

	override function update(elapsed:Float)
	{
		y = FlxG.mouse.y - height;
		super.update(elapsed);
	}
}
