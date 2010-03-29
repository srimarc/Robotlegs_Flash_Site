/**
 * Robotlegs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.controller
{
	import com.hubflanger.robotlegsdemo.model.SiteModel;
	import com.hubflanger.robotlegsdemo.events.UserEvent;
	
	import org.robotlegs.mvcs.Command;
	
	/**
	 * Responds to the <code>UserEvent.NAV_CLICK</code> event
	 * dispatched by the <code>NavigationMediator</code>.
	 */	
	public class SectionSelectedCommand extends Command
	{
		/**
		 * Inject the <code>SiteModel</code> Singleton.
		 */	
		[Inject]
		public var model:SiteModel;
		
		/**
		 * Inject the <code>UserEvent</code> instance.
		 */	
		[Inject]
		public var event:UserEvent;
		
		/**
		 * If the <code>id</code> property of the custom event is 
		 * an empty string, set the <code>currentSection</code> property
		 * of the <code>SiteModel</code> Singleton to the default section
		 * ID. Otherwise, assign the custom event's ID to the 
		 * <code>currentSection</code> property.
		 */		
		override public function execute():void
		{
			if (event.id == "") {
				model.currentSection = model.defaultSection;
			} else {
				model.currentSection = event.id;
			}
		}
	}
}