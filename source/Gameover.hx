import flixel.ui.FlxSpriteButton;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class Gameover extends FlxState
{
	var background:FlxSprite;
	var scoreint:Int;
	var score:FlxText;
	var back:FlxSpriteButton;

	override function create() 
	{
		FlxG.mouse.visible = true;
		if(FlxG.sound.music!=null){
			FlxG.sound.music.stop();
			FlxG.sound.music = null;
		}
		scoreint = PlayState.score;
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.gameover__jpg);
		
		score = new FlxText(FlxG.width/5, 5*FlxG.height/8, 'SCORE: $scoreint');
		back = new FlxSpriteButton(4*FlxG.width/9, 5*FlxG.height/8, null, goback);
		
		score.setGraphicSize(Std.int(FlxG.width/8), Std.int(FlxG.height/14.2));
		score.updateHitbox();
		back.setGraphicSize(Std.int(FlxG.width/6), Std.int(FlxG.height/10.6));
		back.updateHitbox();
		back.createTextLabel("Back", null, 26, FlxColor.WHITE);
		back.label.setSize(Std.int(FlxG.width/6), Std.int(FlxG.height/10.6));
		back.label.centerOffsets();
		
		add(background);
		add(score);
		add(back);
		super.create();

	}

	function goback() {
		FlxG.switchState(new Menu());
	}
}
