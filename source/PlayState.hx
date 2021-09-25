package;

import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var rod:Rod;

	override public function create()
	{
		bgColor = FlxColor.CYAN;
		rod = new Rod();
		rod.screenCenter(X);
		add(rod);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
