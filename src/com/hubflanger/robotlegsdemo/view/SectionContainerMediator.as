package com.hubflanger.robotlegsdemo.view
{
	import com.hubflanger.robotlegsdemo.model.SiteModel;
	import com.hubflanger.robotlegsdemo.view.components.SectionContainer;
	import com.hubflanger.robotlegsdemo.events.SystemEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class SectionContainerMediator extends Mediator
	{
		[Inject]
		public var model:SiteModel;
		
		[Inject]
		public var container:SectionContainer;
		
		public function SectionContainerMediator()
		{
			//trace("SectionContainerMediator:constructor");
		}
		
		override public function onRegister():void
		{
			//trace("SectionContainerMediator:onRegister");
			container.init(model.sectionsHash);
			eventMap.mapListener(eventDispatcher, SystemEvent.SECTION_CHANGED, sectionChangeHandler);
		}
		
		private function sectionChangeHandler(event:SystemEvent):void
		{
			//trace("SectionContainerMediator:sectionChangeHandler");
			container.update(model.currentSection);
		}
	}
}