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
	import com.hubflanger.robotlegsdemo.view.components.Header;
	
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * A Mediator for the <code>Header</code> view component.
	 */	
	public class HeaderMediator extends Mediator
	{
		/**
		 * Inject the <code>SiteModel</code> Singleton.
		 */		
		[Inject]
		public var model:SiteModel;
		
		/**
		 * Inject the <code>Header</code> view component. 
		 */		
		[Inject]
		public var header:Header;
		
		/**
		 * The constructor. 
		 */		
		public function HeaderMediator()
		{
			//trace("HeaderMediator:constructor");
		}
		
		/**
		 * Override the onRegister() method. Invokes the <code>init</code> method 
		 * of the <code>Header</code> instance and passes the <code>header</code> 
		 * property of the <code>SiteModel</code> instance. 
		 */		
		override public function onRegister():void
		{
			//trace("HeaderMediator:onRegister:" + model.header);
			header.init(model.header);
		}
	}
}