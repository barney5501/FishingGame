import flixel.FlxSprite;
class Fish extends FlxSprite
{
	var SPEED:Int;

	static var SPEEDFACTOR = 200;

	public var dir:Int;

	public var cought:Bool = false;
	var oWidth:Float;
	var oHeight:Float;

	public function new(x:Float = 0, y:Float = 0)
	{
		dir = Std.random(2); // 0=>rtl, 1=>ltr
		SPEED = Std.random(200) + SPEEDFACTOR;
		cought = false;
		super(x, y);
		loadGraphic(AssetPaths.BTfish__png);
		oWidth = width;
		oHeight = height;
		setPosition(1920 + oWidth, Std.random(500) + 500);
		setSize(oWidth / 4, oHeight / 2.5);
		offset.y = oHeight / 2.5;
		if (dir == 1)
		{
			SPEED = -(Std.random(150) + 200);
			setPosition(-oWidth, Std.random(500) + 500);
			flipX = true;
			offset.x = oWidth-(oWidth/4);
		}
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
