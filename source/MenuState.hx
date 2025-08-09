package;

import flixel.sound.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.text.FlxText; 
import flixel.util.FlxSpriteUtil;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{
    var playButton:FlxButton;

    var gameCursor:FlxSprite;

    var ship:FlxSprite;

    var titleText:FlxText;

    override function create() {
        var bg = new FlxSprite(0, 0);
        bg.loadGraphic("assets/images/bg.png");
        add(bg);

        ship = new FlxSprite(-50, 100);
        ship.loadGraphic("assets/images/ship.png");
        add(ship);

        titleText = new FlxText(20, 0, 0, "MoorRunner", 22);
        titleText.alignment = CENTER;
        titleText.screenCenter(X);
        add(titleText);

        playButton = new FlxButton(0, 0, "", clickPlay);
        playButton.loadGraphic("assets/images/play.png");
        playButton.scale.set(2,2);
        playButton.updateHitbox;
        playButton.x = (FlxG.width / 2)-playButton.width;
        playButton.y = FlxG.height/2-playButton.height;
        add(playButton);

        gameCursor = new FlxSprite();
        gameCursor.loadGraphic("assets/images/cursor.png");
        gameCursor.scale.set(3, 3);
        gameCursor.updateHitbox();

        add(gameCursor);

        FlxG.mouse.visible = false;

    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        ship.velocity.x = 50;

        if (ship.x > FlxG.width) {
            ship.x = -ship.width;
        } else if (ship.x + ship.width < 0) {
            ship.x = FlxG.width;
        }

        gameCursor.x = FlxG.mouse.x;
        gameCursor.y = FlxG.mouse.y;
    }

    function clickPlay()
    {
	    FlxG.switchState(() -> new PlayState());
    }
}