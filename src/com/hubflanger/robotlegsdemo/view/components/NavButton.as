package com.hubflanger.robotlegsdemo.view.components
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class NavButton extends Sprite
	{
		public static const CLICK:String = "navButtonClick";
		
		private var _id:String;
		
		public function NavButton(str:String)
		{
			//trace("NavButton:constructor");
			_id = str;

			var bg:Shape = new Shape();
			bg.graphics.beginFill(0xFFFFFF);
			bg.graphics.drawRect(0, 0, 183, 30);
			bg.graphics.endFill();
			addChild(bg);
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Georgia";
			tf.color = 0x4F5D4E;
			tf.size = 12;
			tf.bold = true;
			
			var label:TextField = new TextField();
			label.x = 2;
			label.y = 5;
			label.width = 175;
			label.height = 25;
			label.autoSize = TextFieldAutoSize.CENTER;
			label.defaultTextFormat = tf;
			label.text = str;
			addChild(label);
			
			buttonMode = true;
			mouseChildren = false;
			addEventListener(MouseEvent.CLICK, mouseClickHandler);
		}
		
		private function mouseClickHandler(event:MouseEvent):void
		{
			// the event is bubbled up the display hierarchy
		}

		public function get id():String
		{
			return _id;
		}

	}
}