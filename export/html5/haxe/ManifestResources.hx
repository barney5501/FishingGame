package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y40:assets%2Fimages%2Fbgsprites%2FBTfish.pngR2i4793R3y5:IMAGER5R7R6tgoR0y42:assets%2Fimages%2Fbgsprites%2FPTmeduzi.pngR2i5160R3R8R5R9R6tgoR0y41:assets%2Fimages%2Fbgsprites%2FPTshark.pngR2i10650R3R8R5R10R6tgoR0y42:assets%2Fimages%2Fbgsprites%2Fptsparky.pngR2i31556R3R8R5R11R6tgoR0y48:assets%2Fimages%2Fbgsprites%2FPT_0000_bucket.pngR2i16556R3R8R5R12R6tgoR0y46:assets%2Fimages%2Fbgsprites%2FPT_0000_worm.pngR2i5521R3R8R5R13R6tgoR0y46:assets%2Fimages%2Fbgsprites%2FPT_0001_haka.pngR2i7355R3R8R5R14R6tgoR0y47:assets%2Fimages%2Fbgsprites%2FPT_0001_paper.pngR2i16023R3R8R5R15R6tgoR0y46:assets%2Fimages%2Fbgsprites%2FPT_0002_line.pngR2i4806R3R8R5R16R6tgoR0y44:assets%2Fimages%2Fbgsprites%2FPT_0002_up.pngR2i18950R3R8R5R17R6tgoR0y46:assets%2Fimages%2Fbgsprites%2FPT_0003_down.pngR2i19074R3R8R5R18R6tgoR0y49:assets%2Fimages%2Fbgsprites%2FPT_0004_seaweed.pngR2i18526R3R8R5R19R6tgoR0y44:assets%2Fimages%2Fbgsprites%2FPT_0005_bg.pngR2i23720R3R8R5R20R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R21R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R22R6tgoR2i14330R3y5:SOUNDR5y39:assets%2Fsounds%2Felectricity%20sfx.oggy9:pathGroupaR24hR6tgoR2i14330R3R23R5y36:assets%2Fsounds%2FElectricitySfx.oggR25aR26hR6tgoR2i8286R3R23R5y42:assets%2Fsounds%2Ffish%20eat%20sfx%201.oggR25aR27hR6tgoR2i8286R3R23R5y33:assets%2Fsounds%2FFishEatSfx1.oggR25aR28hR6tgoR2i23271R3R23R5y36:assets%2Fsounds%2Fplop%20sfx%201.oggR25aR29hR6tgoR2i10064R3R23R5y36:assets%2Fsounds%2Fplop%20sfx%202.oggR25aR30hR6tgoR2i11273R3R23R5y36:assets%2Fsounds%2Fplop%20sfx%203.oggR25aR31hR6tgoR2i23271R3R23R5y30:assets%2Fsounds%2FPlopSfx1.oggR25aR32hR6tgoR2i10064R3R23R5y30:assets%2Fsounds%2FPlopSfx2.oggR25aR33hR6tgoR2i11273R3R23R5y30:assets%2Fsounds%2FPlopSfx3.oggR25aR34hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R35R6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3R25aR37y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R36R5y28:flixel%2Fsounds%2Fflixel.mp3R25aR39y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R23R5R38R25aR37R38hgoR2i33629R3R23R5R40R25aR39R40hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R41R42y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R8R5R47R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R8R5R48R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_btfish_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_ptmeduzi_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_ptshark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_ptsparky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0000_bucket_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0000_worm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0001_haka_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0001_paper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0002_line_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0002_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0003_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0004_seaweed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0005_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_electricity_sfx_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_electricitysfx_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_fish_eat_sfx_1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_fisheatsfx1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_plop_sfx_1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_plop_sfx_2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_plop_sfx_3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_plopsfx1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_plopsfx2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_plopsfx3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/bgsprites/BTfish.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_btfish_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PTmeduzi.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_ptmeduzi_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PTshark.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_ptshark_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/ptsparky.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_ptsparky_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PT_0000_bucket.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0000_bucket_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PT_0000_worm.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0000_worm_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PT_0001_haka.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0001_haka_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PT_0001_paper.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0001_paper_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PT_0002_line.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0002_line_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PT_0002_up.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0002_up_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PT_0003_down.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0003_down_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PT_0004_seaweed.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0004_seaweed_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bgsprites/PT_0005_bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_bgsprites_pt_0005_bg_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/electricity sfx.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_electricity_sfx_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/ElectricitySfx.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_electricitysfx_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/fish eat sfx 1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_fish_eat_sfx_1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/FishEatSfx1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_fisheatsfx1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/plop sfx 1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_plop_sfx_1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/plop sfx 2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_plop_sfx_2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/plop sfx 3.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_plop_sfx_3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/PlopSfx1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_plopsfx1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/PlopSfx2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_plopsfx2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/PlopSfx3.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_plopsfx3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,10,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
