import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.FlxSprite;

class Jellyfish extends FlxSprite{
    var SPEED:Int = 250;
    var oWidth:Float;
	var oHeight:Float;
    public var jellySound:FlxSound;
    public var isBuzzing:Bool;
    public var dir:Int;
    var time:Int;
    var counter:Int;

    public function new(x:Float = 0, y:Float = 0)
    {
        counter = 0;
        time = Std.random(150)+100;
        isBuzzing = false;
        dir = Std.random(2); // 0=>rtl, 1=>ltr
        super(x,y);
        loadGraphic(AssetPaths.PTmeduzi__png);
        oHeight = height;
		oWidth = width;
        jellySound = FlxG.sound.load(AssetPaths.ElectricitySfx__ogg, 0.6);
        setPosition(1920+oWidth, Std.random(500) + 500);
        if (dir == 1)
        {
            SPEED = -(Std.random(250) + 200);
            setPosition(-oWidth, Std.random(500) + 500);
            flipX = true;
        }
    }

    override function update(elapsed:Float) {
        counter++;
        swim();
        if(counter == time)
            buzz();
        if(!jellySound.playing){
            loadGraphic(AssetPaths.PTmeduzi__png);
            isBuzzing = false;
        }
        super.update(elapsed);
    }

    public function swim()
    {
        velocity.x = -SPEED;
        if(x < -(oWidth+200) || x > 2500)
        {
            kill();
        }
    }


    function buzz() {
        loadGraphic(AssetPaths.PTsparky__png);
        jellySound.play();
        isBuzzing = true;    
        counter = 0;
    }
}