package com.hubflanger.robotlegsdemo.controller
{
	import com.hubflanger.robotlegsdemo.model.SiteModel;
	import com.hubflanger.robotlegsdemo.events.UserEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class SectionSelectedCommand extends Command
	{
		[Inject]
		public var model:SiteModel;
		
		[Inject]
		public var event:UserEvent;
		
		override public function execute():void
		{
			//trace("SectionSelectedCommand:execute");
			if (event.id == "") {
				model.currentSection = model.defaultSection;
			} else {
				model.currentSection = event.id;
			}
		}
	}
}