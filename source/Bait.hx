import flixel.FlxSprite;

class Bait extends FlxSprite
{
	var rodi:Rod;

	public var show:Bool;

	public function new(rod:Rod)
	{
		super();
		rodi = rod;
		show = true;
		loadGraphic(AssetPaths.PT_0001_haka__png).screenCenter(X);
		x -= 20;
	}

	override function update(elapsed:Float)
	{
		y = rodi.y + rodi.height - 70;
		super.update(elapsed);
	}

	public function dismiss()
	{
		show = false;
		alpha = 0;
	}

	public function restock()
	{
		show = true;
		alpha = 1;
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
