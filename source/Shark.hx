import flixel.FlxSprite;

class Shark extends FlxSprite
{
	var SPEED:Int = 300;
	var oWidth:Float;
	var oHeight:Float;

	public var dir:Int;

	public function new(x:Float = 0, y:Float = 0)
	{
		dir = Std.random(2); // 0=>rtl, 1=>ltr
		SPEED += Std.random(200);
		super(x, y);
		loadGraphic(AssetPaths.PTshark__png);
		oHeight = height;
		oWidth = width;
		setPosition(1920 + oWidth, Std.random(500) + 500);
		setSize(oWidth / 3, oHeight/3);
		offset.y = oHeight/3;
		if (dir == 1)
		{
			SPEED = -(Std.random(150) + 200);
			setPosition(-width, Std.random(500) + 500);
			flipX = true;
			offset.x = oWidth-(oWidth/3);
		}
	}

	public function swim()
	{
		velocity.x = -SPEED;
		if (x < -1000 || x > 3000)
		{
			kill();
		}
	}

	override function update(elapsed:Float)
	{
		swim();
		super.update(elapsed);
	}
}
