package com.hyperspatial.hyperevents
{
	import flash.events.Event;

	public class FPLoaderEvent extends Event
	{
		public static const STRING_LOADED:String = "StringLoaded";
		public var data:*; //variable of * type to hold any kind of data object

		public function FPLoaderEvent(type:String, data:*)
		{
			this.data = data;
			super(type);
		}
	}
}