package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Michael
 */
class Tile extends FlxSprite {

	
	var tileID : Int;
	var rotation : Int;
	
	var boardX : Int;
	var boardY : Int;
	
	public var fill : Int;

	public function new(X:Float, Y:Float, T:Int, BX:Int, BY:Int) {
		super(X, Y);
		
		boardX = BX;
		boardY = BY;
		
		rotation = 0;
		fill = 0;

		tileID = T;
		
		loadGraphic(Settings.TILES_IMAGE_PATH, true, 32, 32);

		for(i in 0...4){
			animation.add(Std.string(i), [i]);
		}
		animation.play(Std.string(tileID));
	}
	
	public function setTileID(I:Int, R:Int){
		tileID = I;
		rotation = R;
		animation.play(Std.string(tileID));
	}

	public function rotate() {
		rotation += 1;
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		color = Settings.COLORS[fill];		
		angle = rotation * 90;
	}
	
	public function getBoardCoordinates():String { 
		return Std.string(boardX) + "," + Std.string(boardY);
	}
	
}