package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import openfl.utils.ByteArray;
import sys.net.WebSocket;

class MenuState extends FlxState {
	
	override public function create():Void {
		super.create();
		
		FlxG.switchState(new PlayState());
		
		
		/*
		 * var ws = new WebSocket(
		var ws = new WebSocket("ws://127.0.0.1:8080/test", "http://127.0.0.1/origin");
		ws.onTextPacket.add(function(text:String) {
			trace(text);
		});
		var slot = ws.onBinaryPacket.add(function(data:ByteArray) {
			trace(data);
			slot.dispose();
		});
		ws.sendText("Hello World!");
		ws.sendBinary(new ByteArray());
		//ws.close();*/
		
		
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}