/**
 * Robot Legs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.controller
{
	import com.hubflanger.robotlegsdemo.model.SiteModel;
	import com.hubflanger.robotlegsdemo.view.components.*;
	
	import org.robotlegs.mvcs.Command;
	
	public class InitViewCommand extends Command
	{
		[Inject]
		public var model:SiteModel;
		
		override public function execute():void
		{
			//trace("InitViewCommand:execute");
			contextView.addChild(new SectionContainer());
			contextView.addChild(new Header());
			contextView.addChild(new Navigation());
		}
	}
}