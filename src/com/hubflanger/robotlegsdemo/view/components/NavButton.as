/**
 * Robot Legs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.view.components
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	public class NavButton extends Sprite
	{
		public static const CLICK:String = "navButtonClick";
		
		private var _id:String;
		private var _onBg:Shape;
		private var _isSelected:Boolean = false;
		
		public function NavButton(str:String)
		{
			_id = str;

			var bg:Shape = new Shape();
			bg.graphics.beginFill(0xFFFFFF);
			bg.graphics.drawRect(0, 0, 183, 30);
			bg.graphics.endFill();
			addChild(bg);
			
			_onBg = new Shape();
			_onBg.graphics.beginFill(0xF0F0F0);
			_onBg.graphics.drawRect(0, 0, 183, 30);
			_onBg.graphics.endFill();
			_onBg.alpha = 0;
			addChild(_onBg);
			
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
			
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
		}
		
		private function mouseOverHandler(event:MouseEvent):void
		{
			if (!_isSelected) 
				_onBg.alpha = 100;
		}
		
		private function mouseOutHandler(event:MouseEvent):void
		{
			if (!_isSelected) 
				_onBg.alpha = 0;
		}
		
		public function update(str:String):void
		{
			if (_id == str) {
				_isSelected = true;
				_onBg.alpha = 100;
			} else {
				_isSelected = false;
				_onBg.alpha = 0;
			}			
		}

		public function get id():String
		{
			return _id;
		}

		public function get isSelected():Boolean
		{
			return _isSelected;
		}
	}
}