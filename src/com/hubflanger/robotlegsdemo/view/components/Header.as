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
	import flash.text.*;
	
	public class Header extends Sprite
	{
		public function Header()
		{
			//trace("Header:constructor");
		}
		
		public function init(str:String):void
		{
			//trace("Header:init:" + str);
			var bg:Shape = new Shape();
			bg.graphics.beginFill(0xBBB082);
			bg.graphics.drawRect(0, 0, 550, 50);
			bg.graphics.endFill();
			addChild(bg);
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Georgia";
			tf.color = 0x4F5D4E;
			tf.size = 24;
			tf.bold = true;
			tf.italic = true;
			
			var label:TextField = new TextField();
			label.width = 550;
			label.height = 50;
			label.defaultTextFormat = tf;
			label.text = str;
			addChild(label);
		}
	}
}