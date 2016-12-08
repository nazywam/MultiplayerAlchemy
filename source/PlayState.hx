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
	var selection : Selection;
	
	
	override public function create():Void {
		super.create();
	
		board = new Board(Settings.BOARD_TILE_WIDTH, Settings.BOARD_TILE_HEIGHT);
		add(board);

		socket = new WebSocket("ws://nazywam.host:9000");
		socket.onopen = function() {
			socket.send("Ssss give me the map");	
		};
		
		socket.onmessage = function(message:MessageEvent) {
			var payload:String = message.data.substring(1, message.data.length);

			switch (message.data[0]) {
				case 'S': // get the map
					board.loadFromString(payload);
					board.flow();
				
				case 'M': // make a move
					var BX = Std.parseInt(payload.split(',')[0]);
					var BY = Std.parseInt(payload.split(',')[1]);
			
					board.rotateTile(BX, BY);
					board.flow();
			}
		};		


		selection = new Selection(8*Settings.TILE_WIDTH, 8*Settings.TILE_HEIGHT, 8, 8);
		add(selection);

	}

	function handleKeys(){
		if(FlxG.keys.justPressed.LEFT){
			selection.moveLeft();
		}
		if(FlxG.keys.justPressed.UP){
			selection.moveUp();
		}
		if(FlxG.keys.justPressed.RIGHT){
			selection.moveRight();
		}
		if(FlxG.keys.justPressed.DOWN){
			selection.moveDown();
		}
		if(FlxG.keys.justPressed.SPACE){
			board.rotateTile(selection.boardX, selection.boardY);
			socket.send("M" + board.tab[selection.boardY][selection.boardX].getBoardCoordinates());
			board.flow();
		}
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		
		handleKeys();

		if (FlxG.mouse.justPressed) {
			for (r in board.tab) {
				for(t in r){
					if (FlxG.mouse.overlaps(t)) {
						t.rotate();
						socket.send("M" + t.getBoardCoordinates());
						board.flow();
					}
				}
			}
		}	
	}
}