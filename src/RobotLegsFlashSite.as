package
{
	import Georgia;
	import Helvetica;
	
	import flash.display.*;
	import flash.text.Font;
	
	import com.hubflanger.robotlegsdemo.ApplicationContext;
	
	public class RobotLegsFlashSite extends Sprite
	{
		protected var context:ApplicationContext;
		
		public function RobotLegsFlashSite()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var georgia:Font = new Georgia();
			var helvetica:Font = new Helvetica();
			
			context = new ApplicationContext(this);
		}
	}
}