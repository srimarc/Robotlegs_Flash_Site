
package com.hubflanger.robotlegsdemo
{
	import com.hubflanger.robotlegsdemo.model.SiteModel;
	import com.hubflanger.robotlegsdemo.controller.*;
	import com.hubflanger.robotlegsdemo.service.*;
	import com.hubflanger.robotlegsdemo.events.*;
	import com.hubflanger.robotlegsdemo.view.*;
	import com.hubflanger.robotlegsdemo.view.components.*;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.base.ContextEvent;
	
	public class ApplicationContext extends Context
	{
		public function ApplicationContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			injector.mapSingleton(SiteModel);
			
			injector.mapClass(ISiteDataService, SiteDataService);
			
			mediatorMap.mapView(Header, HeaderMediator);
			mediatorMap.mapView(Navigation, NavigationMediator);
			mediatorMap.mapView(SectionContainer, SectionContainerMediator);
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, LoadDataCommand, ContextEvent, true);
			commandMap.mapEvent(SystemEvent.INIT_VIEW, InitViewCommand, SystemEvent, true);
			commandMap.mapEvent(UserEvent.NAV_CLICK, SectionSelectedCommand, UserEvent, false);
			
			super.startup();
		}
		
	}
}