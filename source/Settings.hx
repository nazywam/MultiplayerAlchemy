package;

import flixel.util.FlxSave;


class Settings {
	
	public static var CONNECTIONS = [
	
		[//down to left
			[
				[0, 0, 0, 0],
				[0, 0, 1, 0],
				[0, 1, 0, 0],
				[0, 0, 0, 0]
			], [
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 1],
				[0, 0, 1, 0]
			], [
				[0, 0, 0, 1],
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[1, 0, 0, 0]
			], [
				[0, 1, 0, 0],
				[1, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0]
			]
		], [//left to right
			[
				[0, 0, 0, 0],
				[0, 0, 0, 1],
				[0, 0, 0, 0],
				[0, 1, 0, 0]
			], [
				[0, 0, 1, 0],
				[0, 0, 0, 0],
				[1, 0, 0, 0],
				[0, 0, 0, 0]
			], [
				[0, 0, 0, 0],
				[0, 0, 0, 1],
				[0, 0, 0, 0],
				[0, 1, 0, 0]
			], [
				[0, 0, 1, 0],
				[0, 0, 0, 0],
				[1, 0, 0, 0],
				[0, 0, 0, 0]
			]
		], [//up-left-right-down
			[
				[0, 1, 1, 1],
				[1, 0, 1, 1],
				[1, 1, 0, 1],
				[1, 1, 1, 0]
			], [
				[0, 1, 1, 1],
				[1, 0, 1, 1],
				[1, 1, 0, 1],
				[1, 1, 1, 0]
			], [
				[0, 1, 1, 1],
				[1, 0, 1, 1],
				[1, 1, 0, 1],
				[1, 1, 1, 0]
			], [
				[0, 1, 1, 1],
				[1, 0, 1, 1],
				[1, 1, 0, 1],
				[1, 1, 1, 0]
			]
		], [//down-left-up
			[
				[0, 1, 1, 0],
				[1, 0, 1, 0],
				[1, 1, 0, 0],
				[0, 0, 0, 0]
			], [
				[0, 0, 0, 0],
				[0, 0, 1, 1],
				[0, 1, 0, 1],
				[0, 1, 1, 0]
			], [
				[0, 0, 1, 1],
				[0, 0, 0, 0],
				[1, 0, 0, 1],
				[1, 0, 1, 0]
			], [
				[0, 1, 0, 1],
				[1, 0, 0, 1],
				[0, 0, 0, 0],
				[1, 1, 0, 0]
			]
		], [//spawn
			[
				[0, 1, 1, 1],
				[1, 0, 1, 1],
				[1, 1, 0, 1],
				[1, 1, 1, 0]
			], [
				[0, 1, 1, 1],
				[1, 0, 1, 1],
				[1, 1, 0, 1],
				[1, 1, 1, 0]
			], [
				[0, 1, 1, 1],
				[1, 0, 1, 1],
				[1, 1, 0, 1],
				[1, 1, 1, 0]
			], [
				[0, 1, 1, 1],
				[1, 0, 1, 1],
				[1, 1, 0, 1],
				[1, 1, 1, 0]
			]
		], [//finish
			[
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 1]
			], [
				[1, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0]
			], [
				[0, 0, 0, 0],
				[0, 1, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 0, 0]
			], [
				[0, 0, 0, 0],
				[0, 0, 0, 0],
				[0, 0, 1, 0],
				[0, 0, 0, 0]
			]
		]
	];

	public static var MOVE_UP		:Int=0;	
	public static var MOVE_RIGHT	:Int=1;
	public static var MOVE_DOWN		:Int=2;
	public static var MOVE_LEFT		:Int=3; 
	public static var MOVE_SPACE	:Int=4; 
	
	
	public static var MOVES = [
		[0, -1],
		[1,  0],
		[0,  1],
		[-1, 0]
	];
	
	public static var COLORS = [
		0xFFFFFFFF,
		0xFFFF0000,
		0xFF00FF00,
		0xFF0000FF
	];
	
	public static var RED_STARTER_TILE   : Int = 4;

	public static var BOARD_TILE_WIDTH	:Int = 16;
	public static var BOARD_TILE_HEIGHT	:Int = 16;
	
	public static var TILE_WIDTH		:Int = 64;
	public static var TILE_HEIGHT		:Int = 64;
	
	public static var SECONDS_PER_DEPTH :Float = .06;
	
	public static var TILES_IMAGE_PATH	:String = "assets/images/TilesDownscaled.png";
	public static var BACKGROUND_TILES_IMAGE_PATH	:String = "assets/images/BackgroundTilesDownscaled.png";

	public static var MAX_PLAYERS		:Int = 8;
	public static var PLAYER_COLOR 		:Int = 0xFF00FF00;
	public static var OTHER_PLAYER_COLOR:Int = 0xFFFF0000;


}
