package com.hyperspatial.effects
{
	
	/**In and out fade
	 * ...
	 * @author adam
	 */
	public class InOut extends Fader 
	{
		public function InOut():void
		{
			trace("constructed InOut");
		}
		//Fade
		public function fade(obj:Object, inRate:int, outRate:int):Object
		{
			fadeIn(obj, outRate);
			
			return obj;
		}
	}
	
}