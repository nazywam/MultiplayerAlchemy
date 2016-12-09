package;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.math.FlxPoint;


class Background extends FlxTypedGroup<FlxSprite> {
	
	public var tab 				:Array<Array<FlxSprite>>;

	var width					:Int;
	var height					:Int;

	public function new(H:Int, W:Int){
		super();

		width = W;
		height = H;

		tab = new Array<Array<FlxSprite>>();

		for(y in 0...height){
			var row = new Array<FlxSprite>();

			for(x in 0...width){
				var t = new FlxSprite(x * Settings.TILE_WIDTH, y * Settings.TILE_HEIGHT);
				t.loadGraphic(Settings.BACKGROUND_TILES_IMAGE_PATH, true, Settings.TILE_WIDTH, Settings.TILE_HEIGHT);
				t.animation.add("default", [2]);
				t.animation.play("default");
				row.push(t);
				add(t);
			}
			tab.push(row);
		}
	}

}