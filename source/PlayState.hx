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

	public static var fishes:FlxTypedGroup<Fish>;
	public static var sharks:FlxTypedGroup<Shark>;

	var count = 0;
	var cought:Bool = false;
	var coughtFish:Fish;
	var score:Int = 0;
	var displayScore:FlxText;
	var worms:Int = 3;
	var displayWorms:FlxText;
	var maxFish:Int;

	/**Sounds**/
	var plop:FlxSound;

	var eat:FlxSound;
	var sharkEat:FlxSound;

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
		sharks = new FlxTypedGroup<Shark>();
		add(sea);
		add(seaweed);
		add(deck_up);
		add(rod);
		add(bait);
		add(sharks);
		add(fishes);
		add(deck_down);
		add(paper);
	}

	override public function create()
	{
		FlxG.mouse.visible = false;
		rod = new Rod();
		rod.screenCenter(X);
		bait = new Bait(rod);
		setScene(rod, bait);
		displayScore = new FlxText(560, 100, 100, "0", 32);
		displayScore.setFormat(null, 32, FlxColor.BLACK);
		add(displayScore);
		displayWorms = new FlxText(100, 20, 50, '3', 64);
		add(displayWorms);
		plop = FlxG.sound.load(AssetPaths.PlopSfx1__ogg, 1);
		eat = FlxG.sound.load(AssetPaths.FishEatSfx1__ogg, 1);
		sharkEat = FlxG.sound.load(AssetPaths.sharkeatingsfx__ogg, 1);
		maxFish = 5;
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(AssetPaths.FishingGameMainTheme__ogg, 1, true);
		}
		super.create();
	}

	function updateScoreText()
	{
		displayScore.text = '$score';
	}

	function updateWormsText()
	{
		displayWorms.text = '$worms';
	}

	function generatefish()
	{
		fishes.add(new Fish());
		if (fishes.length % 6 == 0)
		{
			fishes.getFirstAvailable().faster();
		}
	}

	function generateShark()
	{
		sharks.add(new Shark());
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(bait, fishes, catchFish);
		FlxG.overlap(bait, sharks, encounterShark);
		count++;
		if (count == 60)
			count = 0;
		if (count == Std.random(180) && fishes.countLiving() <= maxFish)
		{
			generatefish();
		}
		if (count == Std.random(500) && fishes.countDead() > 10)
			generateShark(); // if (count == Std.random(500))

		super.update(elapsed);
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
				maxFish = 5 + Std.int(score / 25);
			}
		}
		if (!bait.show && rod.y + rod.height < 150)
		{
			bait.restock();
		}
	}

	function encounterShark(bait:Bait, shark:Shark)
	{
		if (bait.alive && bait.exists && bait.show && shark.alive && shark.exists)
		{
			sharkEat.play();
			worms -= 1;
			updateWormsText();
			if (cought)
			{
				coughtFish.kill();
			}
			bait.dismiss();
		}
	}

	public function catchFish(bait:Bait, fish:Fish)
	{
		if (bait.alive && bait.exists && bait.show && fish.alive && fish.exists && !cought)
		{
			cought = true;
			fish.cought = true;
			coughtFish = fish;
			if (fish.dir == 1)
				fish.angle = -90;
			else
				fish.angle = 90;
			fish.updateHitbox();
			fish.velocity.x = 0;
			fish.screenCenter();
			eat.play();
		}
	}

	function gameover() {}
}
