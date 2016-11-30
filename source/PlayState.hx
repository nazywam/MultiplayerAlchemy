package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState {
	
	var board : Board;
	
	override public function create():Void {
		super.create();
		
		board = new Board(Settings.BOARD_TILE_WIDTH, Settings.BOARD_TILE_HEIGHT);
		add(board);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}