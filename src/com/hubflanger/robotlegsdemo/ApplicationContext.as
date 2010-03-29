/**
 * Robotlegs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
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
	
	/**
	 * The Context for the Robotlegs framework.
	 */	
	public class ApplicationContext extends Context
	{	
		/**
		 * The constructor.
		 * <p>
		 * We invoke the super constructor here passing along the application's 
		 * main display container as the contextView.
		 *  
		 * @param contextView
		 */		
		public function ApplicationContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		/**
		 * The <code>startup()</code> method is automatically invoked by the framework. 
		 * Here, we override it to map the Actors for the application. 
		 */		
		override public function startup():void
		{
			// Map a Singleton of SiteModel
			injector.mapSingleton(SiteModel);
			
			// Map an instance of SiteDataService
			injector.mapClass(ISiteDataService, SiteDataService);
			
			// Map the Views and Mediators
			mediatorMap.mapView(Header, HeaderMediator);
			mediatorMap.mapView(Navigation, NavigationMediator);
			mediatorMap.mapView(SectionContainer, SectionContainerMediator);
			
			// Map the Events and Commands
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, LoadDataCommand, ContextEvent, true);
			commandMap.mapEvent(SystemEvent.INIT_VIEW, InitViewCommand, SystemEvent, true);
			commandMap.mapEvent(UserEvent.NAV_CLICK, SectionSelectedCommand, UserEvent, false);
			
			// Invoke the superclass' startup() method
			super.startup();
		}
		
	}
}