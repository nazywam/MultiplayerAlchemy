package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import js.html.WebSocket;
import js.html.MessageEvent;

class PlayState extends FlxState {
	
	var board : Board;
	var socket : WebSocket;
	override public function create():Void {
		
		socket = new WebSocket("ws://192.168.1.105:9000");
		socket.onopen = function() {
			socket.send("Hey, it's me, ur client");	
		};
		
		socket.onmessage = function(message:MessageEvent) {
			var BX = Std.int(message.data.split(',')[0]);
			var BY = Std.int(message.data.split(',')[1]);
			
			board.rotate(BX, BY);
		};
		
		
		super.create();
		
		board = new Board(Settings.BOARD_TILE_WIDTH, Settings.BOARD_TILE_HEIGHT);
		add(board);
		
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		
		if (FlxG.mouse.justPressed) {
			for (r in board.tab) {
				for(t in r){
					if (FlxG.mouse.overlaps(t)) {
						t.rotate();
						socket.send(t.getBoardCoordinates());
					}
				}
			}
		}
	}
}