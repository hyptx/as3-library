package com.hyperspatial.hyperevents
{
	import flash.events.Event;

	public class GenericOffEvent extends Event
	{
		public static const GENERIC_OFF:String = "Generic Off";
		public var data:*; //variable of * type to hold any kind of data object

		public function GenericOffEvent(type:String)//, data:*)
		{
			//this.data = data;
			super(type);
		}
	}
}