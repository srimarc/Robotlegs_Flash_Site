/**
 * Robot Legs Flash Site Demo
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
		 * Override the onRegister() method. Invokes the <code>init</code> method 
		 * of the <code>Navigation</code> instance and passes the 
		 * <code>sectionsList</code> property of the <code>SiteModel</code> instance. 
		 * <p>
		 * Maps listeners to the <code>SystemEvent.SECTION_CHANGED</code> and 
		 * the <code>NavButton.CLICK</code> events.
		 * <p>
		 * Dispatches a <code>UserEvent.NAV_CLICK</code> event to initiate display 
		 * of the default section content.
		 */	
		override public function onRegister():void
		{
			nav.init(model.sectionsList);
			
			eventMap.mapListener(eventDispatcher, SystemEvent.SECTION_CHANGED, sectionChangeHandler);
			eventMap.mapListener(nav, MouseEvent.CLICK, navClickHandler);
			
			dispatch(new UserEvent(UserEvent.NAV_CLICK, ""));
		}
		
		/**
		 * Handler for the <code>NavButton.CLICK</code> event dispatched
		 * when a <code>NavButton</code> instance is clicked.
		 * 
		 * @param event An Event instance.
		 */		
		private function navClickHandler(event:MouseEvent):void
		{
			event.stopPropagation();
			var btn:NavButton = event.target as NavButton;
			
			if (!btn.isSelected) 
				dispatch(new UserEvent(UserEvent.NAV_CLICK, btn.id));
		}
		
		/**
		 * Handler for the <code>SystemEvent.SECTION_CHANGED</code> event.
		 * <p>
		 * Invokes the <code>update()</code> method of the <code>Navigation</code>
		 * view component passing the <code>currentSection</code> property of the
		 * <code>SiteModel</code> Singleton.
		 * 
		 * @param event A <code>SystemEvent</code> instance.
		 */		
		private function sectionChangeHandler(event:SystemEvent):void
		{
			nav.update(model.currentSection);
		}
	}
}