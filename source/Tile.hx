package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Michael
 */
class Tile extends FlxSprite {

	
	var tileID : Int;
	var rotation : Int;
	
	var boardX : Int;
	var boardY : Int;
	
	public function new(X:Float, Y:Float, T:Int, BX:Int, BY:Int) {
		super(X, Y);
		
		boardX = BX;
		boardY = BY;
		
		rotation = 0;
		tileID = T;
		
		loadGraphic(Settings.TILES_IMAGE_PATH, true, 32, 32);
		animation.add("default", [tileID]);
		animation.play("default");
	}
	
	public function rotate() {
		rotation += 1;
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		//angle += (angle - rotation * 4) / 10;
		angle = rotation * 90;
	}
	
	public function getBoardCoordinates():String { 
		return Std.string(boardX) + "," + Std.string(boardY);
	}
	
}