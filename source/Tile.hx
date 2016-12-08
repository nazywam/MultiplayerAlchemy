package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author Michael
 */
class Tile extends FlxSprite {

	
	public var tileID : Int;
	public var rotation : Int;
	
	public var boardX : Int;
	public var boardY : Int;
	
	public var fill : Int;

	public var index : Int;
	
	public var starter : Bool;
	
	public var timer:FlxTimer;
	public var visited : Array<Bool>;

	public function new(X:Float, Y:Float, T:Int, BX:Int, BY:Int) {
		super(X, Y);
		
		boardX = BX;
		boardY = BY;
		index = BY * Settings.BOARD_TILE_WIDTH + BX;
		
		rotation = 0;
		fill = 0;
		starter = false;
		visited = [false, false, false, false];
		
		tileID = T;

		loadGraphic(Settings.TILES_IMAGE_PATH, true, Settings.TILE_WIDTH,Settings.TILE_HEIGHT);

		for(i in 0...30){ //TODO
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
	}

	public function rotate() {
		rotation += 1;
		rotation %= 4;
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		if (fill != 0) {
			animation.play(Std.string(tileID  + 6));
		} else {
			animation.play(Std.string(tileID));
		}
		angle = rotation * 90;
	}
	
	public function getBoardCoordinates():String { 
		return Std.string(boardX) + "," + Std.string(boardY);
	}
	
}