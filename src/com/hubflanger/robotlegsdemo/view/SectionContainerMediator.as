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
			//
		}
		
		override public function onRegister():void
		{
			container.init(model.sectionsHash);
			eventMap.mapListener(eventDispatcher, SystemEvent.SECTION_CHANGED, sectionChangeHandler);
		}
		
		private function sectionChangeHandler(event:SystemEvent):void
		{
			container.update(model.currentSection);
		}
	}
}