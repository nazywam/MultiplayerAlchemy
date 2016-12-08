package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.math.FlxPoint;


class Board extends FlxTypedGroup<Tile> {
	
	public var tab 				:Array<Array<Tile>>;

	var width					:Int;
	var height					:Int;
	
	public var fillStarters 	:Array<Tile>;
	
	public function new(H:Int, W:Int) {
		super();
		
		width = W;
		height = H;
		
		tab = new Array<Array<Tile>>();
		fillStarters = new Array<Tile>();

		for (i in 0...Settings.BOARD_TILE_HEIGHT) {
			var row = new Array<Tile>();
			
			for (j in 0...Settings.BOARD_TILE_WIDTH) {
				var t = new Tile(j * Settings.TILE_WIDTH, i * Settings.TILE_HEIGHT, 0, j, i);
				row.push(t);
				add(t);
			}
			tab.push(row);
		}	
	
	}
	
	public function rotateTile(BX:Int, BY:Int):Void {
		tab[BY][BX].rotate();
	}

	public function loadFromString(payload:String){
		//trace(payload);
		var d = payload.split(",");
		for(y in 0...height){
			for(x in 0...width){
				var t = d[(y*width+x)].split('.');
				var i = Std.parseInt(t[0]);
				var r = Std.parseInt(t[1]);
				tab[y][x].setTileID(i, r);
				if(i == Settings.RED_STARTER_TILE){
					fillStarters.push(tab[y][x]);
				}
			}
		}
	}

	
	function getTile(bx:Int, by:Int):Tile {
		if (bx < 0 || by < 0 || by >= tab.length || bx >= tab[0].length) {
			return null;
		}
		return tab[by][bx];
	}
	
	//rewrite to bfs
	function dfs(tile:Tile, inputDirection:Int, fill:Int, depth:Int){

		trace(tile.index);
		
		tile.timer.start(Settings.SECONDS_PER_DEPTH*depth, function(_){
			tile.fill = fill;
		});

		for (i in 0...4) {
			if(Settings.CONNECTIONS[tile.tileID][tile.rotation][inputDirection][i] == 1){
				var next = getTile(tile.boardX + Settings.DIRECTIONS[i][0], tile.boardY  + Settings.DIRECTIONS[i][1]);

				//TODO doesn't work for tiles with 2 streams
				if(next != null && !next.visited[(i+2)%4]){

					var hasGotInput = false;
					for (q in 0...4) {
						if(Settings.CONNECTIONS[next.tileID][next.rotation][(i+2)%4][q] != 0){
							hasGotInput = true;
						}
					}

					if (hasGotInput) {
						tile.visited[i] = true;	
						next.visited[(i+2)] = true;
						dfs(next, (i+2)%4, fill, depth+1);	
					}
				}

			}
		}
	}

	public function flow():Void {

		for (t in members) {
		
			for (x in 0...4) {
				t.visited[x] = false;
			}
			
			if(!t.starter){
				t.fill = 0;
			}
		}

		for(t in fillStarters){

			for (i in 0...4) {
				t.visited[i] = true;
				
				var flowNext = getTile(Settings.DIRECTIONS[i][0] + t.boardX, Settings.DIRECTIONS[i][1] + t.boardY);
				
				if (flowNext != null) {
					
					dfs(flowNext, (i+2)%4, t.fill, 1);		
				}
				
			}
		}
	}

	

 	override public function update(elapsed:Float) {
 		super.update(elapsed);
	}
}