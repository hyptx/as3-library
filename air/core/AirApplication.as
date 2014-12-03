package com.hyperspatial.air.core
{
	import flash.display.Sprite;
	
	/**Air Application native functionallity
	 * ...
	 * @author Adam J Nowak, Hyperspatial Design
	 */
	
	public class AirApplication extends Sprite 
	{
		public function AirApplication():void
		{
			trace("Constructed AirApplication");
		}
		
		public function moveUserInterface():void
		{
			stage.nativeWindow.startMove();
		}
		
		public function minimizeUserInterface():void
		{
			stage.nativeWindow.minimize();
		}
		
		public function closeUserInterface():void
		{
			stage.nativeWindow.close();
		}
	}
	
}