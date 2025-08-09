package;

import openfl.ui.Mouse;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.text.FlxText; 
import flixel.ui.FlxButton;
import flixel.util.FlxSpriteUtil;
import flixel.sound.FlxSound;

class PlayState extends FlxState
{
    var ship:Ship;
    var moorPoint:FlxSprite;

    var danger_rock1:FlxSprite;
    var danger_rock2:FlxSprite;
    var danger_rock3:FlxSprite;

    var anchor:Anchor; 

    var waterSurface:FlxSprite; 

    var rope:FlxSprite; 
    var ropeCut=false;
    var ropeColor:Int=0xDA45290C; 

    var returnButton:FlxButton;
    var restartButton:FlxButton;
    var restartButtonBool:Bool;
    var anchorButton:FlxButton;

    var win:Bool=false;
    var winText:FlxText;
    var nextLevelButton:FlxButton;
    var gameCursor:FlxSprite;

    var anchorSound:FlxSound;
    var shipSound:FlxSound;
    var buttonSound:FlxSound;
    var rocksHitSound:FlxSound;

    var currentLevel=5;

    override public function create()
    {
        super.create();
 
        anchorSound = FlxG.sound.load("assets/sounds/anchor.wav");
        shipSound = FlxG.sound.load("assets/sounds/ship.wav");
        buttonSound = FlxG.sound.load("assets/sounds/button.wav");
        rocksHitSound = FlxG.sound.load("assets/sounds/rocksHit.wav");

        var bg = new FlxSprite(0, 0);
        bg.loadGraphic("assets/images/bg.png");
        add(bg);

        moorPoint = new FlxSprite(FlxG.width / 2, 640-31); 
        moorPoint.loadGraphic("assets/images/rocks.png");
        moorPoint.immovable = true;

        if (currentLevel==1) {
            moorPoint.scale.set(4,4);
            moorPoint.x-=100; moorPoint.y-=60;
        }
        else if (currentLevel==3) {
            moorPoint.scale.set(0.5, 0.6);
            moorPoint.y+=10;
        }
        else if (currentLevel==5) {
            moorPoint.scale.set(0.5, 0.6);
            moorPoint.y+=10;
        }

        else if (currentLevel==7){
            moorPoint.scale.set(0.3, 0.4);
            moorPoint.y+=10;
        }

        else if(currentLevel==10){
            moorPoint.x=640-32;
            moorPoint.y=640-32;
        }

        else if(currentLevel==11){
            moorPoint.y=640-28;
        }
            
        moorPoint.updateHitbox();
        add(moorPoint);

        if (currentLevel==4){
            danger_rock1 = new FlxSprite(0, 640-32);
            danger_rock1.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock1.x=100;
            add(danger_rock1);
        }
        else if (currentLevel==5){
            danger_rock1 = new FlxSprite(0, 640-32);
            danger_rock1.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock1.x=300;
            add(danger_rock1);

            danger_rock2 = new FlxSprite(0, 640-32);
            danger_rock2.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock2.x=380;
            add(danger_rock2);

            danger_rock3 = new FlxSprite(0, 640-32);
            danger_rock3.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock3.x=430;
            add(danger_rock3);
        }

        else if (currentLevel==7){
            danger_rock1 = new FlxSprite(0, 640-32);
            danger_rock1.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock1.x=350;
            add(danger_rock1);

            danger_rock2 = new FlxSprite(0, 640-32);
            danger_rock2.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock2.x=380;
            add(danger_rock2);

            danger_rock3 = new FlxSprite(0, 640-32);
            danger_rock3.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock3.x=410;
            add(danger_rock3);
        }

        else if (currentLevel==8){
            danger_rock1 = new FlxSprite(0, 640-32);
            danger_rock1.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock1.x=350;
            add(danger_rock1);

            danger_rock2 = new FlxSprite(0, 640-32);
            danger_rock2.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock2.x=380;
            add(danger_rock2);

            danger_rock3 = new FlxSprite(0, 640-32);
            danger_rock3.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock3.x=410;
            add(danger_rock3);

            danger_rock3 = new FlxSprite(0, 640-32);
            danger_rock3.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock3.x=450;
            add(danger_rock3);
        }

        else if (currentLevel==9){
            danger_rock1 = new FlxSprite(0, 640-32);
            danger_rock1.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock1.x=350;
            add(danger_rock1);

            danger_rock2 = new FlxSprite(0, 640-32);
            danger_rock2.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock2.x=380;
            add(danger_rock2);

            danger_rock3 = new FlxSprite(0, 640-32);
            danger_rock3.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock3.x=410;
            add(danger_rock3);

            danger_rock3 = new FlxSprite(0, 640-32);
            danger_rock3.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock3.x=450;
            add(danger_rock3);

            danger_rock3 = new FlxSprite(0, 640-32);
            danger_rock3.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock3.x=480;
            add(danger_rock3);

            danger_rock3 = new FlxSprite(0, 640-32);
            danger_rock3.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock3.x=310;
            add(danger_rock3);

            danger_rock3 = new FlxSprite(0, 640-32);
            danger_rock3.loadGraphic("assets/images/dangeros_rocks.png");
            danger_rock3.x=260;
            add(danger_rock3);
        }


        ship = new Ship(-50, 100);
        add(ship);

        rope = new FlxSprite(0, 0);
        rope.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
        add(rope); 

        returnButton = new FlxButton(15, 30, "", back);
        returnButton.loadGraphic("assets/images/back.png");
        returnButton.scale.set(2, 2);
        returnButton.updateHitbox();
        add(returnButton);

        restartButton = new FlxButton(FlxG.width - 62, 30, "", resetGameButton);
        restartButton.loadGraphic("assets/images/restart.png");
        restartButton.scale.set(3, 3);
        restartButton.updateHitbox();
        add(restartButton);

        anchorButton = new FlxButton(FlxG.width/2, FlxG.height/2, "", anchorDrop);
        anchorButton.loadGraphic("assets/images/anchorButton.png");
        anchorButton.scale.set(3, 3);
        anchorButton.updateHitbox();
        add(anchorButton);

        nextLevelButton = new FlxButton(FlxG.width/2, FlxG.height/2, "", nextLevel);
        nextLevelButton.loadGraphic("assets/images/next.png");
        nextLevelButton.visible=false;
        add(nextLevelButton);
        

        var hintText = new FlxText(10, 0, FlxG.width - 20, "");

        if(currentLevel==1) hintText.text = "Level "+currentLevel+"\n\nPress\n'space' or anchor button\nto drop anchor\nIf anchor collide rocks you win";
        else if(currentLevel==2) hintText.text = "Level "+currentLevel+"\n\nSomething harder";
        else if(currentLevel==3) hintText.text = "Level "+currentLevel+"\n\nHarder and harder";
        else if(currentLevel==4) hintText.text = "Level "+currentLevel+"\n\nDanger Rock\ndont touch or it cuts your rope!!!";
        else if(currentLevel==5) hintText.text = "Level "+currentLevel+"\n\nNot a\nFINAL\nBOSS";
        else if(currentLevel==6) hintText.text = "Level "+currentLevel+"\n\nRelax";
        else if(currentLevel==7) hintText.text = "Level "+currentLevel+"\n\nNo relax";
        else if(currentLevel==8) hintText.text = "Level "+currentLevel+"\n\nIts coming";
        else if(currentLevel==9) hintText.text = "Level "+currentLevel+"\n\nVery close...";
        else if(currentLevel==10) hintText.text = "Level "+currentLevel+"\n\nthere nothing :)";
        else if(currentLevel==11) hintText.text = "Level "+currentLevel+"\n\nand there";
        else if(currentLevel==12) hintText.text = "Level "+currentLevel+"\n\nWhy you still playing?";
        else if(currentLevel==13) hintText.text = "Level "+currentLevel+"\n\nIs this game good?";
        else if(currentLevel==14) hintText.text = "Level "+currentLevel+"\n\nYour good player";
        else if(currentLevel==15) hintText.text = "Level "+currentLevel+"\n\nLast level";

        hintText.y = FlxG.height - hintText.height - 20; 
        add(hintText);

        winText = new FlxText(10, 0, "You Win\nThanks for playing\nThis is my first game jam and my first haxeFlixel game\n   Game made by Me\n   SFX:\n      Button press: by Universfield from Pixabayby\n      Horn: Jurij from Pixabay\n      Anchor sound: by freesound_community from Pixabay\n      Hit rocks: by LordSonny from Pixabay");
        winText.x = FlxG.width/2-winText.width;
        winText.y = FlxG.width/2-winText.height;
        winText.visible=false;
        add(winText);

        gameCursor = new FlxSprite();
        gameCursor.loadGraphic("assets/images/cursor.png");
        gameCursor.scale.set(3, 3);
        gameCursor.updateHitbox();

        add(gameCursor);

        FlxG.mouse.visible = false;
        

        resetGame();
    }

    function nextLevel(){
        var newLevel = new PlayState();
        newLevel.currentLevel=currentLevel+=1;
        FlxG.switchState(() -> newLevel);
        buttonSound.play();
    }

    function back(){
        FlxG.switchState(() -> new MenuState());
        buttonSound.play();
    }

    function resetGameButton() {restartButtonBool=true;}

    function resetGame():Void {
        buttonSound.play();
        FlxSpriteUtil.fill(rope, 0);
        if (anchor != null) {
            remove(anchor);
            anchor.destroy();
        }
        anchor = null;

        
        ship.reset(-50, 100); 
        nextLevelButton.visible = false;
        anchorButton.visible=true;
        anchorButton.active=true;
        FlxSpriteUtil.fill(rope, 0);
        ropeColor=0xDA45290C; 
        ropeCut=false;
        shipSound.play();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (anchor == null && FlxG.keys.justPressed.SPACE) {
            anchorDrop();
        }

        if (anchor != null) {
            var startX = ship.x + ship.width / 2-20;
            var startY = ship.y + ship.height-30;

            var endX = anchor.x + anchor.width / 2; 
            var endY = anchor.y;

            FlxSpriteUtil.fill(rope, 0);

            FlxSpriteUtil.drawLine(
                rope, 
                startX, startY,
                endX, endY,
                {thickness: 3,
            color: ropeColor} 
            );
        }


        if (anchor != null) {
            if (FlxG.overlap(anchor, moorPoint) && ropeCut==false) {
                if (!nextLevelButton.visible){
                    if(currentLevel==15) winText.visible=true;
                    else nextLevelButton.visible=true;
                }
                anchor.velocity.set(0, 0); 
                anchor.acceleration.set(0, 0);
                rocksHitSound.play();

                if(ship.x - anchor.x > 2) ship.velocity.x = -ship.speed;
                else if(anchor.x - ship.x > 2) ship.velocity.x = ship.speed;
                else ship.velocity.x = 0;
            }

            if (FlxG.overlap(anchor, danger_rock1) || FlxG.overlap(anchor, danger_rock2) || FlxG.overlap(anchor, danger_rock3)) {
                ropeCut=true;
                ropeColor=0x00FFFFFF; 
            }

        }

        if (restartButtonBool==true) {
            restartButtonBool=false;
            resetGame();
        }

        gameCursor.x = FlxG.mouse.x;
        gameCursor.y = FlxG.mouse.y;
    }

    function anchorDrop(){
         if (anchor == null){
            anchor = new Anchor(ship.x + ship.width / 2 - 20, ship.y + ship.height-30); 
            anchorButton.visible=false;
            anchorButton.active=false;
            anchor.visible=true;
            add(anchor);
            anchorSound.play();
        }
    }

}

class Ship extends FlxSprite
{
    public var speed:Float = 100; 

    public function new(x:Float, y:Float)
    {
        super(x, y);
        loadGraphic("assets/images/ship.png");
        scale.set(2,2);
        updateHitbox();
        velocity.x = speed; 
        
        this.origin.x = this.width / 2;
        this.origin.y = this.height / 2;
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

    override public function reset(x:Float, y:Float):Void {
        this.x = x;
        this.y = y;
        velocity.x = speed;
    }
}

class Anchor extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
        loadGraphic("assets/images/anchor.png");
        acceleration.y = 400;
        maxVelocity.y = 500; 
        
        this.origin.x = this.width / 2;
        this.origin.y = this.height / 2;
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}
