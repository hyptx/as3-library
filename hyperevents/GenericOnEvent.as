package com.hyperspatial.hyperevents
{
	import flash.events.Event;

	public class GenericOnEvent extends Event
	{
		public static const GENERIC_ON:String = "Generic On";
		public var data:*; //variable of * type to hold any kind of data object

		public function GenericOnEvent(type:String)//, data:*)
		{
			//this.data = data;
			super(type);
		}
	}
}