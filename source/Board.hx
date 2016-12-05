package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Michael
 */
class Board extends FlxGroup {

	public var tab 		:Array<Array<Tile>>;

	var width			:Int;
	var height			:Int;
	
	var fillStarters 	:Array<Tile>;

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
	}
	
	public function rotate(BX:Int, BY:Int):Void {
		tab[BY][BX].rotate();
	}

	public function loadFromString(payload:String){
		trace(payload);
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
	
}