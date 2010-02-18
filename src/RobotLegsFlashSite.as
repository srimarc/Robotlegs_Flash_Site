package
{
	import flash.display.Sprite;
	
	import com.hubflanger.robotlegsflash.ApplicationContext;
	
	public class RobotLegsFlashSite extends Sprite
	{
		protected var context:ApplicationContext;
		
		public function RobotLegsFlashSite()
		{
			context = new ApplicationContext(this);
		}
	}
}