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
			//trace("NavigationMediator:constructor");
		}
		
		override public function onRegister():void
		{
			//trace("NavigationMediator:onRegister");
			nav.init(model.sectionsList);
			
			eventMap.mapListener(eventDispatcher, SystemEvent.SECTION_CHANGED, sectionChangeHandler);
			eventMap.mapListener(nav, MouseEvent.CLICK, navClickHandler);
			
			dispatch(new UserEvent(UserEvent.NAV_CLICK, ""));
		}
		
		private function navClickHandler(event:MouseEvent):void
		{
			//trace("NavigationMediator:navClickHandler");
			var btn:NavButton = event.target as NavButton;
			//trace("id: " + btn.id);
			dispatch(new UserEvent(UserEvent.NAV_CLICK, btn.id));
		}
		
		private function sectionChangeHandler(event:SystemEvent):void
		{
			nav.update(model.currentSection);
		}
	}
}