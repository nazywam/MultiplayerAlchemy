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
		], [
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
		], [
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
		]
	];

	public static var DIRECTIONS = [
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

	public static var BOARD_TILE_WIDTH	:Int = 8;
	public static var BOARD_TILE_HEIGHT	:Int = 8;
	
	public static var TILE_WIDTH		:Int = 64;
	public static var TILE_HEIGHT		:Int = 64;
	
	public static var SECONDS_PER_DEPTH :Float = 0;
	
	public static var TILES_IMAGE_PATH	:String = "assets/images/TilesDownscaled.png";
	
}

/*

[//left-up down-right
			[
				[0, 0, 0, 1],
				[0, 0, 1, 0],
				[0, 1, 0, 0],
				[1, 0, 0, 0]
			], [
				[0, 1, 0, 0],
				[1, 0, 0, 0],
				[0, 0, 0, 1],
				[0, 0, 1, 0]
			], [
				[0, 0, 0, 1],
				[0, 0, 1, 0],
				[0, 1, 0, 0],
				[1, 0, 0, 0]
			], [
				[0, 1, 0, 0],
				[1, 0, 0, 0],
				[0, 0, 0, 1],
				[0, 0, 1, 0]
			]
		]
		
		*/