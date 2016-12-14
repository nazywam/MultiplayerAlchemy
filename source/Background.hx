package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.math.FlxPoint;


class Background extends FlxTypedGroup<FlxSprite> {
	
	public var tab 				:Array<Array<FlxSprite>>;

	var width					:Int;
	var height					:Int;

	public var i : Int;//14
	
	public function new(H:Int, W:Int){
		super();

		width = W;
		height = H;

		tab = new Array<Array<FlxSprite>>();

		i = 0;
		
		for(y in 0...height){
			var row = new Array<FlxSprite>();

			for(x in 0...width){
				var t = new FlxSprite(x * Settings.TILE_WIDTH, y * Settings.TILE_HEIGHT);
				t.loadGraphic(Settings.BACKGROUND_TILES_IMAGE_PATH, true, Settings.TILE_WIDTH, Settings.TILE_HEIGHT);
				
				for (i in 0...14) {
					t.animation.add(Std.string(i), [i]);
				}
				
				t.animation.play("0");
				row.push(t);
				add(t);
			}
			tab.push(row);
		}
	}

	public function highlitPlayers(players:Array<Selection>) {
		for(y in 0...height){
			for (x in 0...width) {
				tab[y][x].animation.play(Std.string(i));
			}
		}
		
		for (i in 0...players.length) {
			if (players[i] != null) {
				tab[players[i].boardY][players[i].boardX].animation.play(Std.string(i+1));
			}
		}
		
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
	
}