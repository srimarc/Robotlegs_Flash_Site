/**
 * Robotlegs Flash Site Demo
 * Copyright (c) 2010 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package
{
	import Georgia;
	import Helvetica;
	
	import flash.display.*;
	import flash.text.Font;
	
	import com.hubflanger.robotlegsdemo.ApplicationContext;
	
	/**
	 * The main application class.
	 */	
	public class RobotlegsFlashSite extends Sprite
	{
		protected var context:ApplicationContext;
			
		/**
		 * The constructor.
		 * <p> 
		 * Initializes the Robotlegs framework by creating an 
		 * <code>ApplicationContext</code> instance.
		 */		
		public function RobotlegsFlashSite()
		{
			// Sets the stage to NO_SCALE mode.
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// Register the fonts
			var georgia:Font = new Georgia();
			var helvetica:Font = new Helvetica();
			
			// Creates an instance of ApplicationContext
			context = new ApplicationContext(this);
		}
	}
}