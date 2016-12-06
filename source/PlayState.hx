package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import js.html.WebSocket;
import js.html.MessageEvent;

class PlayState extends FlxState {
		
	var board : Board;
	var socket : WebSocket;
	
	override public function create():Void {
		super.create();
	
		board = new Board(Settings.BOARD_TILE_WIDTH, Settings.BOARD_TILE_HEIGHT);
		add(board);

		socket = new WebSocket("ws://192.168.1.102:9000");
		socket.onopen = function() {
			socket.send("Ssss give me the map");	
		};
		
		socket.onmessage = function(message:MessageEvent) {
			var payload:String = message.data.substring(1, message.data.length);

			switch (message.data[0]) {
				case 'S': // get the map
					board.loadFromString(payload);

				case 'M': // make a move
					var BX = Std.parseInt(payload.split(',')[0]);
					var BY = Std.parseInt(payload.split(',')[1]);
			
					board.rotate(BX, BY);
			}
		};		
		
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		
		if (FlxG.mouse.justPressed) {
			for (r in board.tab) {
				for(t in r){
					if (FlxG.mouse.overlaps(t)) {
						t.rotate();
						socket.send("M" + t.getBoardCoordinates());
						//board.flow();
					}
				}
			}
		}	
	}
}