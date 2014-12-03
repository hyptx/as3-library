package com.hyperspatial.time
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	/**My core clock engine 12hr format
	 * vars:
	 * _ampm
	 * _hour
	 * _minute
	 * _seconds
	 * _clockDisplay   =  textfield
	 * ...
	 * @author adam
	 */
	public class Clock extends Sprite
	{
		public var _clockTimer:Timer = new Timer(1000);
		public var _clockDisplay:TextField = new TextField();
		public var _ampm:String;
		public var _hour:int;
		public var _minute:String;
		public var _seconds:int;
		private var _localDate:Date;
		
		public function Clock():void
		{
			//clock listener updater
			_clockTimer.addEventListener(TimerEvent.TIMER, updateTime);
			_clockTimer.start();
			
			_clockDisplay.width = 300;
			_clockDisplay.height = 40;
			addChild(_clockDisplay);
		}
		
		//Clock update
		function updateTime(evt:TimerEvent):void
		{
			_localDate = new Date();
			_seconds = _localDate.getSeconds();
			
			convertHr();
			convertMin();
			pingClock();
		}
		//Convert hours
		function convertHr():void
		{
			_hour = _localDate.getHours();
			
			if (_hour > 12)
			{
				_hour = _localDate.getHours() - 12;
				_ampm = "pm";
			}
			else if (_hour == 12)
			{
				_ampm = "pm";
			}
			else if (_hour == 0)
			{
				_hour = 12;
				_ampm = "am";
			}
			else
			{
				_ampm = "am";
			}
		}
		//Convert minutes/add zero
		function convertMin():void
		{
			if (_localDate.getMinutes() < 10)
			{
				_minute = String(0) +
				_localDate.getMinutes();
			}
			else
			{
				_minute =
				String(_localDate.getMinutes());
			}
		}
		//Ping clock
		function pingClock():void
		{
			_clockDisplay.text = _hour + ":" + _minute + " " + _ampm;
		}
	}
}