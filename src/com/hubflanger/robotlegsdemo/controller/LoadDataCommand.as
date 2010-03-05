/**
 * Robot Legs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.controller
{
	import com.hubflanger.robotlegsdemo.service.ISiteDataService;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadDataCommand extends Command
	{
		[Inject]
		public var siteDataService:ISiteDataService;
		
		override public function execute():void
		{
			//trace("LoadDataCommand:execute");
			siteDataService.loadData();
		}
	}
}