package;

import flixel.util.FlxSave;


class Settings {

	public static var CONNECTIONS = [
		[[-1, 0, 0,-1], [-1, -1, 0, 0], [0, -1, -1, 0], [0, 0, -1, -1]],
		[[-1, 0,-1, 0], [0, -1, 0, -1], [-1, 0,-1, 0], [0, -1, 0, -1]],
		[[ 0, 1, 0, 1], [1, 0, 1, 0], [0, 1, 0, 1], [1, 0, 1 ,0]],
		[[ 0, 1, 1, 0], [1, 1, 0, 0], [0, 1, 1, 0], [1, 1, 0, 0]]
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
	
	public static var BOARD_TILE_WIDTH	:Int = 8;
	public static var BOARD_TILE_HEIGHT	:Int = 8;
	
	public static var TILE_WIDTH		:Int = 32;
	public static var TILE_HEIGHT		:Int = 32;
	
	
	
	public static var TILES_IMAGE_PATH	:String = "assets/images/Tiles.png";
	
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	public static var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	public static var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	public static var score:Int = 0;
	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saves:Array<FlxSave> = [];
}