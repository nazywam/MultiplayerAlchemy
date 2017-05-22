package;

import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;

/**
 * ...
 * @author Michael
 */
class Tile extends FlxSprite {

	
	public var tileID : Int;
	public var rotation : Int;
	
	public var boardX : Int;
	public var boardY : Int;
	
	public var index : Int;

	public var fill : Int;
	public var previousFill : Int;
	public var depth : Int;
	
	public var starter : Bool;
	
	public var timer:FlxTimer;
	public var fillingStarted:Bool;
	public var visited : Array<Bool>;

	public function new(X:Float, Y:Float, T:Int, BX:Int, BY:Int) {
		super(X, Y);
		
		boardX = BX;
		boardY = BY;
		index = BY * Settings.BOARD_TILE_WIDTH + BX;
		
		previousFill = 0;
		rotation = 0;
		fill = 0;
		fillingStarted = false;
		starter = false;
		visited = [false, false, false, false];
		
		tileID = T;

		loadGraphic(Settings.TILES_IMAGE_PATH, true, Settings.TILE_WIDTH,Settings.TILE_HEIGHT);

		for(i in 0...50){ //TODO
			animation.add(Std.string(i), [i+1]);
		}
		animation.play(Std.string(tileID));

		timer = new FlxTimer();
	}
	
	public function setTileID(I:Int, R:Int){
		tileID = I;
		rotation = R;
		animation.play(Std.string(tileID));

		if(tileID == Settings.RED_STARTER_TILE){
			starter = true;
			fill = Std.random(3)+1;
		}
		updateRotation();
	}

	public function rotate() {
		rotation += 1;
		rotation %= 4;

		//buggy with fast turning
		if(rotation == 0){
			angle = -90;
		}
	
		updateRotation();
	}
	
	public function updateRotation() {
		FlxTween.angle(this, angle, rotation*90, .3, {ease:FlxEase.sineInOut});
		
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		if (fill != 0) {
			animation.play(Std.string(tileID  + 11));
			color = Settings.COLORS[fill];
		} else {
			animation.play(Std.string(tileID));
		}


		//angle += (rotation*90 - angle)/10;	
		//angle = rotation * 90;
	}
	
	public function getBoardCoordinates():String { 
		return Std.string(boardX) + "," + Std.string(boardY);
	}
	
}