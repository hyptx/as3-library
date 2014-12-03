package com.hyperspatial.hyperevents
{
	import flash.events.Event;

	public class FullscreenMode extends Event
	{
		public static const FULLSCREEN_MODE:String = "Fullscreen";
		public var data:*; //variable of * type to hold any kind of data object

		public function FullscreenMode(type:String)//, data:*)
		{
			//this.data = data;
			super(type);
		}
	}
}