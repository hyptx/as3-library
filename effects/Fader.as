package com.hyperspatial.effects
{
	import flash.display.Sprite;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	
	/**Fader effect for objects
	 * 
	 * Public Methods:
	 * fadeIn(Object,int) int = frames to complete tween
	 * fadeOut(Object,int) int = frames to complete tween
	 * 
	 * Ex-  fader.fadeIn(myMovieClip,10);
	 *      fader.outTween.addEventListener(TweenEvent.MOTION_FINISH, removeCard);
	 * 
	 * Note: seems to need you to import effects.* to work
	 * Note: Import import fl.transitions.easing.* for event listeners
	 * 
	 * @author adam
	 */
	
	 public class Fader extends Sprite
	{
		public var inTween:Tween;
		public var outTween:Tween;
		
		public function Fader():void
		{
			trace("Constructed Fader");
		}
		public function fadeIn(inObj:Object,inRate:int):Object
		{
			inTween = new Tween(inObj, "alpha", Strong.easeIn, 0, 1, inRate, false);
			return inObj;
		}
		public function fadeOut(outObj:Object,outRate:int):Object
		{
			outTween = new Tween(outObj, "alpha", Strong.easeIn, 1, 0, outRate, false);
			return outObj;
		}
	}
}