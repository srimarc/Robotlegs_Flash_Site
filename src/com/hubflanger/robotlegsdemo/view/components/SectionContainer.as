package com.hubflanger.robotlegsdemo.view.components
{
	import com.hubflanger.robotlegsdemo.model.vo.SectionVO;
	
	import flash.display.*;
	import flash.text.*;
	import flash.utils.Dictionary;
	
	public class SectionContainer extends Sprite
	{
		private var sectionsHash:Dictionary = new Dictionary();
		private var textField:TextField;
		
		public function SectionContainer()
		{
			//trace("SectionContainer:constructor");
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
		
		public function init(hash:Dictionary):void
		{
			sectionsHash = hash;
		}
		
		public function update(id:String):void
		{
			var sectionVO:SectionVO = sectionsHash[id];
			textField.htmlText = sectionVO.content;
		}
	}
}