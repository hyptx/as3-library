package com.hyperspatial.hyperevents
{
	import flash.events.Event;

	public class PostEvent extends Event
	{
		public static const POSTED:String = "Posted";
		public var data:*;

		public function PostEvent(type:String,data:*)
		{
			this.data = data;
			super(type);
		}
	}
}