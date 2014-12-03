package com.hyperspatial.hyperevents
{
	import flash.events.Event;

	public class PlayEvent extends Event
	{
		public static const STARTED_PLAY:String = "Started Play";
		
		public function PlayEvent(type:String)
		{
			super(type);
		}
	}
}