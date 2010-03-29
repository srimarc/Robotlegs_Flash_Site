/**
 * Robotlegs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.controller
{
	import com.hubflanger.robotlegsdemo.service.ISiteDataService;
	
	import org.robotlegs.mvcs.Command;
	
	/**
	 * Responds to the <code>ContextEvent.STARTUP_COMPLETE</code> framework event.
	 */	
	public class LoadDataCommand extends Command
	{
		/**
		 * Creates an instance of SiteDataService via dependency injection.
		 */		
		[Inject]
		public var siteDataService:ISiteDataService;
		
		/**
		 * Calls the loadData() method of the SiteDataService instance.
		 */		
		override public function execute():void
		{
			siteDataService.loadData();
		}
	}
}