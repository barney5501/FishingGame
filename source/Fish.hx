import flixel.FlxSprite;

class Fish extends FlxSprite
{
	var SPEED:Int;

	static var SPEEDFACTOR = 200;

	public var dir:Int;

	public var cought:Bool = false;

	public function new(x:Float = 0, y:Float = 0)
	{
		dir = Std.random(2); // 0=>rtl, 1=>ltr
		SPEED = Std.random(200) + SPEEDFACTOR;
		cought = false;
		super(x, y);
		loadGraphic(AssetPaths.BTfish__png);
		setPosition(1920 + 64, Std.random(500) + 500);
		drag.x = drag.y = 1600;
		setSize(width / 4, height / 2.5);
		if (dir == 1)
		{
			SPEED = -(Std.random(150) + 200);
			setPosition(-64, Std.random(500) + 500);
			facing = LEFT;
			flipX = true;
			setSize(width * 2, -(height * 2.5) / 1.5);
		}
		velocity.y = 50;
	}

	function swim()
	{
		velocity.x = -SPEED;
		if (x < -300 || x > 2500)
		{
			kill();
		}
	}

	override function update(elapsed:Float)
	{
		if (!cought)
			swim();
		super.update(elapsed);
	}

	override function kill()
	{
		alive = false;
		exists = false;
		super.kill();
	}

	public function faster()
	{
		if (SPEEDFACTOR <= 300)
			SPEEDFACTOR += 10;
	}
}
