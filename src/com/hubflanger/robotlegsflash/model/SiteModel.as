package com.hubflanger.robotlegsflash.model
{
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	public class SiteModel extends Actor
	{
		public var sectionsArray:Array = new Array();
		public var sectionsHash:Dictionary = new Dictionary();
		
		public function SiteModel()
		{
			super();
			trace("SiteModel:constructor");
		}
	}
}