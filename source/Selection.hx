package;

import flixel.FlxSprite;

class Selection extends FlxSprite {

	public var boardX:Int;
	public var boardY:Int;

	public function new(X:Float, Y:Float, BX:Int, BY:Int){
		super(X, Y);
		boardX = BX;
		boardY = BY;

		loadGraphic(Settings.TILES_IMAGE_PATH, true, 32, 32);
		animation.add("default", [5]);
		animation.play("default");
	}


	public function moveUp(){
		boardY -= 1;
	}
	public function moveLeft(){
		boardX -= 1;	
	}
	public function moveRight(){
		boardX += 1;
	}
	public function moveDown(){
		boardY += 1;
	}

	override public function update(elapsed:Float){
		super.update(elapsed);

		x = boardX * Settings.TILE_WIDTH;
		y = boardY * Settings.TILE_HEIGHT;


	}

}