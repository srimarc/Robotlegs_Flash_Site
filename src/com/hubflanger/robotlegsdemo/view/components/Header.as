/**
 * Robotlegs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.view.components
{
	import flash.display.*;
	import flash.text.*;
	
	/**
	 * The display container for the header.
	 */	
	public class Header extends Sprite
	{
		private var label:TextField;
		
		/**
		 * The constructor. 
		 * <p>
		 * Creates a Shape object as background and a TextField label.
		 */		
		public function Header()
		{
			//trace("Header:constructor");
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
			
			label = new TextField();
			label.width = 550;
			label.height = 50;
			label.defaultTextFormat = tf;
			addChild(label);
		}
		
		/**
		 * and
		 * populates it with a String object.
		 *
		 * @param str A String matching the copy for the Header.
		 */		
		public function init(str:String):void
		{
			//trace("Header:init:" + str);
			label.text = str;
		}
	}
}