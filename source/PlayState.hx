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
		
	var board:		 	Board;
	var background:		Background;
	var socket:		 	WebSocket;

	var clientId:		Int;
	var players: 	Array<Selection>;

	override public function create():Void {
		super.create();
	
		background = new Background(Settings.BOARD_TILE_WIDTH, Settings.BOARD_TILE_HEIGHT);
		add(background);

		board = new Board(Settings.BOARD_TILE_WIDTH, Settings.BOARD_TILE_HEIGHT);
		add(board);

		players = new Array<Selection>();
		for(i in 0...Settings.MAX_PLAYERS){
			players.push(null);
		}


		socket = new WebSocket("ws://nazywam.host:9000");
		
		
		socket.onopen = function() {
			//socket.send("Hello World!");	
		};
		
		socket.onmessage = function(message:MessageEvent) {
			var payload:String = message.data.substring(1, message.data.length);
			var payloadSplit = payload.split(',');

			switch (message.data[0]) {
				case 'I': //get my client ID
					clientId = Std.parseInt(payloadSplit[0]);
					var BX = Std.parseInt(payloadSplit[1]);
					var BY = Std.parseInt(payloadSplit[2]);
					
					players[clientId] = new Selection(BX, BY, board.tab);
					trace("Got id " + clientId);

				case 'N': //new player
					//id, posx, posy
					var id = Std.parseInt(payloadSplit[0]);
					var BX = Std.parseInt(payloadSplit[1]);
					var BY = Std.parseInt(payloadSplit[2]);

					trace("Player connected with id " + id);

					players[id] = new Selection(BX, BY, board.tab);

				case 'S': // get the map
					trace("Got map");
					board.loadFromString(payload);
					board.flow();
				
				case 'M': // client makes a move
					//id, posx, posy

					var id = Std.parseInt(payloadSplit[0]);
					var move = Std.parseInt(payloadSplit[1]);
					
					if (move == 4) {
						board.rotateTile(players[id].boardX, players[id].boardY);
						board.flow();	
					} else {
						players[id].boardX += Settings.MOVES[move][0];
						players[id].boardY += Settings.MOVES[move][1];
						players[id].updateMove();
					}
					
					
				case 'T': //new target
					trace("Got target");
					var BX = Std.parseInt(payloadSplit[0]);
					var BY = Std.parseInt(payloadSplit[1]);

					board.tab[BY][BX].setTileID(5, Std.random(4));
					
				case 'D'://client disconnected
					var clientId = Std.parseInt(payload);
					players[clientId] = null;
					
			}
		};		

	}

	function sendMyMove(move:Int) {
		socket.send("M" + Std.string(move));
	}
	
	function handleMoveKeys() {
		
		if(FlxG.keys.justPressed.LEFT){
			players[clientId].moveLeft();
			sendMyMove(Settings.MOVE_LEFT);
		}
		if(FlxG.keys.justPressed.UP){
			players[clientId].moveUp();
			sendMyMove(Settings.MOVE_UP);
		}
		if(FlxG.keys.justPressed.RIGHT){
			players[clientId].moveRight();
			sendMyMove(Settings.MOVE_RIGHT);
		}
		if(FlxG.keys.justPressed.DOWN){
			players[clientId].moveDown();
			sendMyMove(Settings.MOVE_DOWN);
		}
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		
		handleMoveKeys();

		if(FlxG.keys.justPressed.SPACE){
			board.rotateTile(players[clientId].boardX, players[clientId].boardY);
			board.flow();
			sendMyMove(Settings.MOVE_SPACE);
		}
		
		/*
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
		}*/
		
		if (FlxG.keys.justPressed.Q) {
			background.i = (background.i + 1) % 14;
		}
		
		background.highlitPlayers(players);
	}
}