import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class Fish extends FlxSprite
{
	static inline var SPEED = 200;

	public var cought:Bool = false;

	public function new(x:Float = 0, y:Float = 0)
	{
		cought = false;
		super(x, y);
		loadGraphic(AssetPaths.BTfish__png);
		setPosition(1920 + 64, Std.random(500) + 500);
		drag.x = drag.y = 1600;
	}

	function swim()
	{
		velocity.x = -SPEED;
		if (x < -100)
			kill();
	}

	override function update(elapsed:Float)
	{
		if (!cought)
			swim();
		super.update(elapsed);
	}
}
