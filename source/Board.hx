package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.math.FlxPoint;


class Board extends FlxTypedGroup<Tile> {

	public var tab 		:Array<Array<Tile>>;

	var width			:Int;
	var height			:Int;
	
	public var fillStarters 	:Array<Tile>;
	
	var visited : Array<Bool>;
	
	public function new(H:Int, W:Int) {
		super();
		
		width = W;
		height = H;
		
		tab = new Array<Array<Tile>>();

		for (i in 0...Settings.BOARD_TILE_HEIGHT) {
			var row = new Array<Tile>();
			
			for (j in 0...Settings.BOARD_TILE_WIDTH) {
				var t = new Tile(j * Settings.TILE_WIDTH, i * Settings.TILE_HEIGHT, 0, j, i);
				row.push(t);
				add(t);
			}
			tab.push(row);
		}

		fillStarters = [tab[1][1], tab[6][6]];
		tab[1][1].fill = 1;
		tab[6][6].fill = 2;
		
		tab[1][1].starter= true;
		tab[6][6].starter= true;
		
	
		visited = new Array<Bool>();

		for(i in 0...members.length){
			visited.push(false);
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

		//tile.timer.start(Settings.SECONDS_PER_DEPTH*depth, function(_){
			tile.fill = fill;
		//});

		for(i in 0...4){
			if(Settings.CONNECTIONS[tile.tileID][tile.rotation][inputDirection][i] == 1){
				var next = getTile(tile.boardX + Settings.DIRECTIONS[i][0], tile.boardY  + Settings.DIRECTIONS[i][1]);
				if(next != null && !visited[next.index]){

					var hasGotInput = false;
					for(q in 0...4){
						if(Settings.CONNECTIONS[next.tileID][next.rotation][(i+2)%4][q] != 0){
							hasGotInput = true;
						}
					}

					if(hasGotInput){
						visited[next.index] = true;
						dfs(next, (i+2)%4, fill, depth+1);	
					}
				}

			}
		}
	}

	public function flow():Void {

		for(t in members){
			visited[t.index] = false;
			if(!t.starter){
				t.fill = 0;
			}
		}


		for(t in fillStarters){
			visited[t.index] = true;
			
			for (i in 0...4) {
				
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