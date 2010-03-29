/**
 * Robotlegs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.view.components
{
	import com.hubflanger.robotlegsdemo.model.vo.SectionVO;
	
	import flash.display.*;
	import flash.text.*;
	import flash.utils.Dictionary;
	
	/**
	 * The display container for the section content.
	 */	
	public class SectionContainer extends Sprite
	{
		private var sectionsHash:Dictionary = new Dictionary();
		private var textField:TextField;
		
		/**
		 * The constructor. 
		 * <p>
		 * Creates a Shape object as background. Creates a TextField 
		 * for the content copy.
		 */	
		public function SectionContainer()
		{
			var bg:Shape = new Shape();
			bg.graphics.beginFill(0xF9E5C2);
			bg.graphics.drawRect(0, 0, 550, 400);
			bg.graphics.endFill();
			addChild(bg); 
				
			var tf:TextFormat = new TextFormat();
			tf.font = "Helvetica";
			tf.color = 0x4B1E18;
			tf.size = 12;
			
			textField = new TextField();
			textField.x = 12;
			textField.y = 95;
			textField.width = 520;
			textField.height = 290;
			textField.multiline = true;
			textField.wordWrap = true;
			textField.defaultTextFormat = tf;
			addChild(textField);
		}
		
		/**
		 * Assigns a Dictionary object to the <code>sectionsHash</code> property.
		 *  
		 * @param hash A Dictionary instance containing <code>SectionVO</code>
		 * objects with Section IDs as key.
		 */		
		public function init(hash:Dictionary):void
		{
			sectionsHash = hash;
		}
		
		/**
		 * Retrieves the <code>SectionVO</code> object associated with the 
		 * Section ID and and populates the <code>textField</code> with the 
		 * value of its <code>content</code> property.
		 *
		 * @param str The String ID of the Section selected.
		 */
		public function update(id:String):void
		{
			var sectionVO:SectionVO = sectionsHash[id];
			textField.htmlText = sectionVO.content;
		}
	}
}