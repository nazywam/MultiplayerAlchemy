package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Selection {

	public var boardX:	Int;
	public var boardY:	Int;

	var tiles:			Array<Array<Tile>>;
	var currentTile:	Tile;

	var color:			Int;

	public function new(C:Int, BX:Int, BY:Int, B:Array<Array<Tile>>){
		tiles = B;
		boardX = BX;
		boardY = BY;
		color = C;


		currentTile = tiles[boardY][boardX];
		//currentTile.color = color;
	}

	public function updateMove(){
		if(boardY < 0){
			boardY = 0;
		}
		if(boardX < 0){
			boardY = 0;
		}
		if(boardY >= tiles.length){
			boardY = tiles.length - 1;
		}
		if(boardX >= tiles[0].length){
			boardX = tiles[0].length -1;
		}

		//currentTile.color = FlxColor.WHITE;
		//currentTile = tiles[boardY][boardX];
		//currentTile.color = color;

	}

	public function moveUp(){
		boardY -= 1;
		updateMove();
	}
	public function moveLeft(){
		boardX -= 1;	
		updateMove();
	}
	public function moveRight(){
		boardX += 1;
		updateMove();
	}
	public function moveDown(){
		boardY += 1;
		updateMove();
	}

}