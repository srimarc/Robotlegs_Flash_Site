package com.hubflanger.robotlegsflash.controller
{
	import com.hubflanger.robotlegsflash.service.ISiteDataService;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadDataCommand extends Command
	{
		[Inject]
		public var siteDataService:ISiteDataService;
		
		override public function execute():void
		{
			trace("LoadDataCommand:execute");
			//dispatch(new MainEvent(MainEvent.FOCUS, employeeLoginService.loggedIn ? IEmployeeList : IEmployeeLogin));
		}
	}
}