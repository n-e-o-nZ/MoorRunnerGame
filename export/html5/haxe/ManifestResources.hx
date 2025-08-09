package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
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

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
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

		data = '{"name":null,"assets":"aoy4:sizei470094y4:typey5:SOUNDy2:idy26:assets%2Fsounds%2Fship.wavy9:pathGroupaR4hy7:preloadtgoR0i488526R1R2R3y28:assets%2Fsounds%2Fbutton.wavR5aR7hR6tgoR0i92238R1R2R3y28:assets%2Fsounds%2Fanchor.wavR5aR8hR6tgoR0i714318R1R2R3y30:assets%2Fsounds%2FrocksHit.wavR5aR9hR6tgoy4:pathy30:assets%2Fimages%2Fsettings.pngR0i236R1y5:IMAGER3R11R6tgoR10y30:assets%2Fimages%2Ftreasure.pngR0i252R1R12R3R13R6tgoR10y26:assets%2Fimages%2Fplay.pngR0i216R1R12R3R14R6tgoR10y29:assets%2Fimages%2Frestart.pngR0i182R1R12R3R15R6tgoR10y28:assets%2Fimages%2Flevels.pngR0i135R1R12R3R16R6tgoR10y26:assets%2Fimages%2Fnext.pngR0i196R1R12R3R17R6tgoR10y28:assets%2Fimages%2Fanchor.pngR0i209R1R12R3R18R6tgoR10y26:assets%2Fimages%2Fship.pngR0i290R1R12R3R19R6tgoR10y26:assets%2Fimages%2Fback.pngR0i223R1R12R3R20R6tgoR10y24:assets%2Fimages%2Fbg.pngR0i16337R1R12R3R21R6tgoR10y28:assets%2Fimages%2Fcursor.pngR0i136R1R12R3R22R6tgoR10y27:assets%2Fimages%2Frocks.pngR0i1129R1R12R3R23R6tgoR10y39:assets%2Fimages%2Ftreasure_and_rock.pngR0i1379R1R12R3R24R6tgoR10y36:assets%2Fimages%2Fdangeros_rocks.pngR0i757R1R12R3R25R6tgoR10y34:assets%2Fimages%2FanchorButton.pngR0i338R1R12R3R26R6tgoR0i39706R1y5:MUSICR3y28:flixel%2Fsounds%2Fflixel.mp3R5aR28y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR0i8220R1R27R3y26:flixel%2Fsounds%2Fbeep.mp3R5aR30y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR0i6840R1R2R3R31R5aR30R31hgoR0i33629R1R2R3R29R5aR28R29hgoR0i15744R1y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR3y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR0i29724R1R32R33y36:__ASSET__flixel_fonts_monsterrat_ttfR3y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR10y33:flixel%2Fimages%2Fui%2Fbutton.pngR0i222R1R12R3R38R6tgoR10y36:flixel%2Fimages%2Flogo%2Fdefault.pngR0i484R1R12R3R39R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_ship_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_button_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_anchor_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_rockshit_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_settings_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_treasure_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_restart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_levels_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_next_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_anchor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ship_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_rocks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_treasure_and_rock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dangeros_rocks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_anchorbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/sounds/ship.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_ship_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/button.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_button_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/anchor.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_anchor_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/rocksHit.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_rockshit_wav extends haxe.io.Bytes {}
@:keep @:image("assets/images/settings.png") @:noCompletion #if display private #end class __ASSET__assets_images_settings_png extends lime.graphics.Image {}
@:keep @:image("assets/images/treasure.png") @:noCompletion #if display private #end class __ASSET__assets_images_treasure_png extends lime.graphics.Image {}
@:keep @:image("assets/images/play.png") @:noCompletion #if display private #end class __ASSET__assets_images_play_png extends lime.graphics.Image {}
@:keep @:image("assets/images/restart.png") @:noCompletion #if display private #end class __ASSET__assets_images_restart_png extends lime.graphics.Image {}
@:keep @:image("assets/images/levels.png") @:noCompletion #if display private #end class __ASSET__assets_images_levels_png extends lime.graphics.Image {}
@:keep @:image("assets/images/next.png") @:noCompletion #if display private #end class __ASSET__assets_images_next_png extends lime.graphics.Image {}
@:keep @:image("assets/images/anchor.png") @:noCompletion #if display private #end class __ASSET__assets_images_anchor_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ship.png") @:noCompletion #if display private #end class __ASSET__assets_images_ship_png extends lime.graphics.Image {}
@:keep @:image("assets/images/back.png") @:noCompletion #if display private #end class __ASSET__assets_images_back_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cursor.png") @:noCompletion #if display private #end class __ASSET__assets_images_cursor_png extends lime.graphics.Image {}
@:keep @:image("assets/images/rocks.png") @:noCompletion #if display private #end class __ASSET__assets_images_rocks_png extends lime.graphics.Image {}
@:keep @:image("assets/images/treasure_and_rock.png") @:noCompletion #if display private #end class __ASSET__assets_images_treasure_and_rock_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dangeros_rocks.png") @:noCompletion #if display private #end class __ASSET__assets_images_dangeros_rocks_png extends lime.graphics.Image {}
@:keep @:image("assets/images/anchorButton.png") @:noCompletion #if display private #end class __ASSET__assets_images_anchorbutton_png extends lime.graphics.Image {}
@:keep @:file("/home/home/haxelib/flixel/6,1,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/home/haxelib/flixel/6,1,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/home/haxelib/flixel/6,1,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("/home/home/haxelib/flixel/6,1,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/home/home/haxelib/flixel/6,1,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/home/home/haxelib/flixel/6,1,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
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