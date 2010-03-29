/**
 * Robotlegs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.hubflanger.robotlegsdemo.service
{
	import com.hubflanger.robotlegsdemo.model.vo.SectionVO;
	import com.hubflanger.robotlegsdemo.model.SiteModel;
	import com.hubflanger.robotlegsdemo.events.SystemEvent;
	
	import flash.events.Event;
	import flash.net.*;
	
	import org.robotlegs.mvcs.Actor;
		
	/**
	 * A Service class that handles loading and parsing of the site's xml data.
	 */	
	public class SiteDataService extends Actor implements ISiteDataService
	{
		/**
		 * Inject the <code>SiteModel</code> Singleton.
		 */		
		[Inject]
		public var model:SiteModel;

		public function SiteDataService()
		{
			//
		}
		
		/**
		 * Loads the data.xml file using a URLLoader instance.
		 */		
		public function loadData():void 
		{
			//trace("SiteDataService:loadData");
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loadCompleteHandler);
			loader.load(new URLRequest("assets/data.xml"));
		}
		
		/**
		 * Handler for the URLLoader's Event.COMPLETE event.
		 * <p>
		 * Parses the xml data and stores the <code>SectionVO</code> objects in 
		 * the <code>SiteModel</code> Singleton.
		 * <p>
		 * Dispatches a <code>SystemEvent.INIT_VIEW</code> event.
		 * 
		 * @param event
		 */		
		private function loadCompleteHandler(event:Event):void 
		{
			var loader:URLLoader = event.target as URLLoader;
			loader.removeEventListener(Event.COMPLETE, loadCompleteHandler);

			var xml:XML = new XML(event.target.data);
			model.header = xml.header.text();
			
			var sections:XMLList = xml.sections.section;
			
			for each (var section:XML in sections) {
				var sectionVO:SectionVO = new SectionVO(section.@id,
														section.label.toString(),
														section.content.toString());
				
				model.sectionsList.push(sectionVO);
				model.sectionsHash[sectionVO.id] = sectionVO;
			}
			
			model.defaultSection = model.sectionsList[0].id;
			
			dispatch(new SystemEvent(SystemEvent.INIT_VIEW, false));
		}
	}
}