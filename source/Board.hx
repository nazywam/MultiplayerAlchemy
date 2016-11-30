package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Michael
 */
class Board extends FlxGroup {

	private var tab 	:Array<Array<Tile>>;

	var width			:Int;
	var height			:Int;
	
	public function new(H:Int, W:Int) {
		super();
		
		width = W;
		height = H;
		
		
		tab = new Array<Array<Tile>>();
		
		for (i in 0...Settings.BOARD_TILE_HEIGHT) {
			var row = new Array<Tile>();
			
			for (j in 0...Settings.BOARD_TILE_WIDTH) {
				var t = new Tile(j * Settings.TILE_WIDTH, i * Settings.TILE_HEIGHT);
				row.push(t);
				add(t);
			}
			tab.push(row);
		}
	}
	
}