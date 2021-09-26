package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var rod:Rod;
	var bait:Bait;
	var fishes:FlxTypedGroup<Fish>;
	var count = 0;
	var cought:Bool = false;
	var coughtFish:Fish;
	var score:Int = 0;
	var displayScore:FlxText;

	/**Sounds**/
	var plop:FlxSound;

	var eat:FlxSound;

	var maxFish:Int;

	function setScene(rod:Rod, bait:Bait)
	{
		var sea:FlxSprite = new FlxSprite();
		sea.loadGraphic(AssetPaths.PT_0005_bg__png);
		var seaweed = new FlxSprite();
		seaweed.loadGraphic(AssetPaths.PT_0004_seaweed__png);
		var deck_down = new FlxSprite();
		deck_down.loadGraphic(AssetPaths.PT_0003_down__png);
		var deck_up = new FlxSprite();
		deck_up.loadGraphic(AssetPaths.PT_0002_up__png);
		var paper = new FlxSprite();
		paper.loadGraphic(AssetPaths.PT_0001_paper__png);
		fishes = new FlxTypedGroup<Fish>();
		add(sea);
		add(seaweed);
		add(deck_up);
		add(rod);
		add(bait);
		add(fishes);
		add(deck_down);
		add(paper);
		// deck_down.
	}

	override public function create()
	{
		rod = new Rod();
		rod.screenCenter(X);
		bait = new Bait(rod);
		setScene(rod, bait);
		displayScore = new FlxText(560, 100, 100, "0", 32);
		displayScore.setFormat(null, 32, FlxColor.BLACK);
		add(displayScore);

		plop = FlxG.sound.load(AssetPaths.PlopSfx1__ogg, 1);
		eat = FlxG.sound.load(AssetPaths.FishEatSfx1__ogg, 1);
		maxFish = 5;
		super.create();
	}

	function updateScoreText()
	{
		displayScore.text = '$score';
	}

	function generatefish()
	{
		fishes.add(new Fish());
	}

	override public function update(elapsed:Float)
	{
		count++;
		if (count == 60)
			count = 0;
		if (count == Std.random(240) && fishes.length <= maxFish)
		{
			generatefish();
		}
		super.update(elapsed);
		FlxG.overlap(bait, fishes, catchFish);

		if (cought)
		{
			coughtFish.y = bait.y + bait.height - 64;
			if (coughtFish.y < 150)
			{
				cought = false;
				coughtFish.cought = false;
				coughtFish.kill();
				score++;
				plop.play();
				updateScoreText();
			}
		}
	}

	public function catchFish(bait:Bait, fish:Fish)
	{
		if (bait.alive && bait.exists && fish.alive && fish.exists && !cought)
		{
			cought = true;
			fish.cought = true;
			coughtFish = fish;
			fish.angle = 90;
			fish.velocity.x = 0;
			fish.screenCenter();
			eat.play();
		}
	}
}
