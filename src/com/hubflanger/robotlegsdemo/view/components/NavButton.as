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
	import flash.events.*;
	import flash.text.*;
	
	/**
	 * Creates a button for the <code>Navigation</code> display container.
	 */	
	public class NavButton extends Sprite
	{
		private var _id:String;
		private var _onBg:Shape;
		private var _isSelected:Boolean = false;
		
		/**
		 * The constructor.
		 * <p>
		 * Creates two Shape objects for the background. One for the "off" state and one 
		 * for the "selected" or rollover state.
		 * <p>
		 * Creates a TextField label for the button.
		 * <p>
		 * Accepts a String ID and a String for populating the <code>label</code> TextField.
		 * 
		 * @param id A String representing the ID for the button.
		 * @param labelStr A String representing copy for the button's label.
		 */		
		public function NavButton(id:String, labelStr:String)
		{
			_id = id;

			var bg:Shape = new Shape();
			bg.graphics.beginFill(0xFFFFFF);
			bg.graphics.drawRect(0, 0, 182, 30);
			bg.graphics.endFill();
			addChild(bg);
			
			_onBg = new Shape();
			_onBg.graphics.beginFill(0xF0F0F0);
			_onBg.graphics.drawRect(0, 0, 182, 30);
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
			label.text = labelStr;
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
		
		/**
		 * Invoked by the <code>Navigation</code> parent container when a 
		 * <code>SystemEvent.SECTION_CHANGED</code> event is received. Sets 
		 * the <code>_isSelected</code> property to true and the alpha of the 
		 * <code>_onBg</code> to 1 if the selected Section ID matches that of 
		 * this <code>NavButton</code> instance.
		 *  
		 * @param id The String ID of the Section selected.
		 */		
		public function update(id:String):void
		{
			if (_id == id) {
				_isSelected = true;
				_onBg.alpha = 1;
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