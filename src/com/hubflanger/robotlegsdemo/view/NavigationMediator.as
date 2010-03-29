/**
 * Robotlegs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.view
{
	import com.hubflanger.robotlegsdemo.model.SiteModel;
	import com.hubflanger.robotlegsdemo.view.components.Navigation;
	import com.hubflanger.robotlegsdemo.view.components.NavButton;
	import com.hubflanger.robotlegsdemo.events.*;
	
	import flash.events.*;
	
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * A Mediator for the <code>Navigation</code> view component.
	 */	
	public class NavigationMediator extends Mediator
	{
		/**
		 * Inject the <code>SiteModel</code> Singleton.
		 */	
		[Inject]
		public var model:SiteModel;
		
		/**
		 * Inject the <code>Navigation</code> view component. 
		 */	
		[Inject]
		public var nav:Navigation;
		
		/**
		 * The constructor. 
		 */	
		public function NavigationMediator()
		{
			//
		}
		
		/**
		 * Override the onRegister() method to perform setup tasks on the
		 * view component when the Mediator is registered with the framework.
		 */	
		override public function onRegister():void
		{
			// Invokes the view component's init() method and passes the 
			// SiteModel's sectionsList property.
			nav.init(model.sectionsList);
			
			// Maps listeners to the SystemEvent.SECTION_CHANGED and 
		 	// the NavButton.CLICK events.
			eventMap.mapListener(eventDispatcher, SystemEvent.SECTION_CHANGED, sectionChangeHandler);
			eventMap.mapListener(nav, NavButton.CLICK, navClickHandler);
			
			// Dispatches a UserEvent.NAV_CLICK event to initiate display 
			// of the default section content.
			dispatch(new UserEvent(UserEvent.NAV_CLICK, ""));
		}
		
		/**
		 * Handler for the <code>NavButton.CLICK</code> event dispatched
		 * when a <code>NavButton</code> instance is clicked.
		 */		
		private function navClickHandler(event:Event):void
		{
			event.stopPropagation();
			var btn:NavButton = event.target as NavButton;
			
			// Sends a UserEvent.NAV_CLICK framework event 
			if (!btn.isSelected) 
				dispatch(new UserEvent(UserEvent.NAV_CLICK, btn.id));
		}
		
		/**
		 * Handler for the <code>SystemEvent.SECTION_CHANGED</code> event.
		 * <p>
		 * Invokes the <code>update()</code> method of the <code>Navigation</code>
		 * view component passing the <code>currentSection</code> property of the
		 * <code>SiteModel</code> Singleton.
		 */		
		private function sectionChangeHandler(event:SystemEvent):void
		{
			nav.update(model.currentSection);
		}
	}
}