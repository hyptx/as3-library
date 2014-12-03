package com.hyperspatial.hyperevents
{
	import flash.events.Event;

	public class EndEvent extends Event
	{
		public static const THE_END:String = "TheEnd";
		public var data:*; //variable of * type to hold any kind of data object

		public function EndEvent(type:String)//, data:*)
		{
			//this.data = data;
			super(type);
		}
	}
}