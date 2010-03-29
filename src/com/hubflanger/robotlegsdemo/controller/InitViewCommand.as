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
	import com.hubflanger.robotlegsdemo.view.components.*;
	
	import org.robotlegs.mvcs.Command;
	
	/**
	 * Responds to the <code>SystemEvent.INIT_VIEW</code> framework event.
	 */	
	public class InitViewCommand extends Command
	{
		/**
		 * Inject the <code>SiteModel</code> Singleton.
		 */	
		[Inject]
		public var model:SiteModel;
		
		/**
		 * Creates the <code>SectionContainer</code>, <code>Header</code> 
		 * and <code>Navigation</code> view components. In Robotlegs, the mappings in
		 * the MediatorMap allows a Mediator to be automatically created when its 
		 * view component is instantiated.
		 */		
		override public function execute():void
		{
			contextView.addChild(new SectionContainer());
			contextView.addChild(new Header());
			contextView.addChild(new Navigation());
		}
	}
}