package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxG;

/**
 * ...
 * @author Michael
 */
class Board extends FlxTypedGroup<Tile> {

	public var tab 		:Array<Array<Tile>>;

	var width			:Int;
	var height			:Int;
	
	public var fillStarters 	:Array<Tile>;
	
	var queue : FlxTypedGroup<Tile>;
	
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
		
		queue = new FlxTypedGroup<Tile>();
		
	}
	
	public function rotate(BX:Int, BY:Int):Void {
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
	
	
	
	//Don't touch that!
	public function flow() {
		queue.clear();
		
		for (t in fillStarters) {
			queue.add(t);
		}
		
		var visited = new Array<Bool>();
		for (t in members) {
			visited.push(false);
			
			if (!t.starter) {
				t.fill = 0;
			}
		}
		
		
		
		while(queue.members.length > 0) {
			var top:Tile = queue.members.pop();
			
			for (i in 0...4) {
				
				var connection = Settings.CONNECTIONS[top.getTileID()][top.rotation][i];
				
				if (connection != -1) {
					
					var flowNext = getTile(Settings.DIRECTIONS[i][0] + top.boardX, Settings.DIRECTIONS[i][1] + top.boardY);
					
					if (flowNext != null && ! visited[flowNext.index]) {
						
						if (Settings.CONNECTIONS[flowNext.getTileID()][flowNext.rotation][(i + 2) % 4] != -1) {
							flowNext.fill = top.fill;
							queue.add(flowNext);
							visited[flowNext.index] = true;	
						}
					}
				}
			}
			
		}
		
	}
	
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		flow();
	}
}