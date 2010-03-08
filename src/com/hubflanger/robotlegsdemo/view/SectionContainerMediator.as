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
	
	/**
	 * A Mediator for the <code>SectionContainer</code> view component.
	 */	
	public class SectionContainerMediator extends Mediator
	{
		/**
		 * Inject the <code>SiteModel</code> Singleton.
		 */	
		[Inject]
		public var model:SiteModel;
		
		/**
		 * Inject the <code>SectionContainer</code> view component. 
		 */	
		[Inject]
		public var container:SectionContainer;
		
		/**
		 * The constructor. 
		 */	
		public function SectionContainerMediator()
		{
			//
		}
		
		/**
		 * Override the onRegister() method. Invokes the <code>init</code> method 
		 * of the <code>SectionContainer</code> instance and passes the 
		 * <code>sectionsHash</code> property of the <code>SiteModel</code> instance. 
		 * <p>
		 * Maps a listener to the <code>SystemEvent.SECTION_CHANGED</code> event.
		 */	
		override public function onRegister():void
		{
			container.init(model.sectionsHash);
			eventMap.mapListener(eventDispatcher, SystemEvent.SECTION_CHANGED, sectionChangeHandler);
		}
		
		/**
		 * The handler for the <code>SystemEvent.SECTION_CHANGED</code> event.
		 * 
		 * @param event An instance of <code>SystemEvent</code>
		 */		
		private function sectionChangeHandler(event:SystemEvent):void
		{
			container.update(model.currentSection);
		}
	}
}