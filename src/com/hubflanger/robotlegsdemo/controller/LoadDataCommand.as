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