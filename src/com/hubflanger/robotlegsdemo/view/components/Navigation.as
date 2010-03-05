/**
 * Robot Legs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.view.components
{
	import com.hubflanger.robotlegsdemo.model.vo.SectionVO;
	
	import flash.display.Sprite;
	
	public class Navigation extends Sprite
	{
		private var sectionsList:Array = new Array();
		private var buttonsList:Array = new Array();
		
		public function Navigation() 
		{
			x = 0;
			y = 50;
		}
		
		public function init(arr:Array):void
		{
			sectionsList = arr;
			var sectionVO:SectionVO;
			var btn:NavButton;
			var xpos:Number = 0;
			
			for (var i:uint=0; i<sectionsList.length; i++) {
				sectionVO = sectionsList[i];
				
				btn = new NavButton(sectionVO.id);
				btn.x = xpos;
				addChild(btn);
				buttonsList.push(btn);
				xpos += btn.width;
			}
		}
		
		public function update(id:String):void
		{
			var btn:NavButton;
			
			for (var i:uint=0; i<buttonsList.length; i++) {
				btn = buttonsList[i];
				btn.update(id);
			}
		}
	}
}