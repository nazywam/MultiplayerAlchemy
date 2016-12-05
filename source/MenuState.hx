package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import openfl.utils.ByteArray;


class MenuState extends FlxState {
	
	override public function create():Void {
		super.create();
		
		FlxG.log.redirectTraces = true;
		FlxG.autoPause = false;
		
		FlxG.switchState(new PlayState());
		
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}