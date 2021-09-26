import flixel.FlxSprite;

class Bait extends FlxSprite
{
	var rodi:Rod;

	// var hasFish:Bool;

	public function new(rod:Rod)
	{
		super();
		rodi = rod;
		loadGraphic(AssetPaths.PT_0001_haka__png).screenCenter(X);
	}

	override function update(elapsed:Float)
	{
		y = rodi.y; // + rodi.height;
		x = rodi.x;
		super.update(elapsed);
	}

	// public function setHasFish(has:Bool)
	// {
	// 	hasFish = has;
	// }
	// public function getHasFish()
	// {
	// 	return hasFish;
	// }
}
