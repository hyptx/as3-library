package com.hyperspatial.hyperevents
{
	import flash.events.Event;

	public class ArrayFilledEvent extends Event
	{
		public static const ARRAY_FILLED:String = "ArrayFilled";
		public var data:*; //variable of * type to hold any kind of data object

		public function ArrayFilledEvent(type:String)//, data:*)
		{
			//this.data = data;
			super(type);
		}
	}
}