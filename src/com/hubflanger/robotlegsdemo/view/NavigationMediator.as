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
	
	public class NavigationMediator extends Mediator
	{
		[Inject]
		public var model:SiteModel;
		
		[Inject]
		public var nav:Navigation;
		
		public function NavigationMediator()
		{
			//
		}
		
		override public function onRegister():void
		{
			nav.init(model.sectionsList);
			
			eventMap.mapListener(eventDispatcher, SystemEvent.SECTION_CHANGED, sectionChangeHandler);
			eventMap.mapListener(nav, MouseEvent.CLICK, navClickHandler);
			
			dispatch(new UserEvent(UserEvent.NAV_CLICK, ""));
		}
		
		private function navClickHandler(event:MouseEvent):void
		{
			var btn:NavButton = event.target as NavButton;
			
			if (!btn.isSelected) 
				dispatch(new UserEvent(UserEvent.NAV_CLICK, btn.id));
		}
		
		private function sectionChangeHandler(event:SystemEvent):void
		{
			nav.update(model.currentSection);
		}
	}
}