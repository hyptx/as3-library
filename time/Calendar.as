package com.hyperspatial.time
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	/**My core calendar engine
	 * vars:
	 * _year
	 * _month
	 * _date
	 * _day
	 * _calendarDisplay   =  textfield
	 * ...
	 * @author adam
	 */
	public class Calendar extends Sprite 
	{
		private var _calendarTimer:Timer = new Timer(100);
		private var _dayNum:int;
		private var _monthNum:int;
		public var _calendarDisplay:TextField = new TextField();
		public var _year:int;
		public var _month:String;
		public var _date:int;
		public var _day:String;
		public var _suffix:String = "th";
		
		public function Calendar():void
		{
			_calendarDisplay.width = 300;
			_calendarDisplay.height = 40;
			addChild(_calendarDisplay);
			updateCalendar();
		}
		//Update Calendar
		public function updateCalendar():void
		{
			var localDate:Date = new Date();
			_year = localDate.getFullYear();
			_monthNum = localDate.getMonth();
			_date = localDate.getDate();
			_dayNum = localDate.getDay();
			
			convertMonth(_monthNum);
			convertDay(_dayNum);
			checkSuffix(_date);
			pingCalendar();
		}
		//Convert month to String
		function convertMonth(rawMonth:int):void
		{
			switch(rawMonth)
				{
					case 0:
					_month = "January";
					break;
					case 1:
					_month = "February";
					break;
					case 2:
					_month = "March";
					break;
					case 3:
					_month = "April";
					break;
					case 4:
					_month = "May";
					break;
					case 5:
					_month = "June";
					break;
					case 6:
					_month = "July";
					break;
					case 7:
					_month = "August";
					break;
					case 8:
					_month = "September";
					break;
					case 9:
					_month = "October";
					break;
					case 10:
					_month = "November";
					break;
					case 11:
					_month = "December";
					break;
				}
		}
		//Convert day to String
		function convertDay(rawDay:int):void
		{
			switch(rawDay)
				{
					case 0:
					_day = "Sunday";
					break;
					case 1:
					_day = "Monday";
					break;
					case 2:
					_day = "Tuesday";
					break;
					case 3:
					_day = "Wednesday";
					break;
					case 4:
					_day = "Thursday";
					break;
					case 5:
					_day = "Friday";
					break;
					case 6:
					_day = "Saturday";
					break;
				}
		}
		//Check suffix
		function checkSuffix(rawDate:int):void
		{
			switch(rawDate)
				{
					case 1:
					_suffix = "st";
					break;
					case 2:
					_suffix = "nd";
					break;
					case 3:
					_suffix = "rd";
					break;
					case 21:
					_suffix = "st";
					break;
					case 22:
					_suffix = "nd";
					break;
					case 23:
					_suffix = "rd";
					break;
					case 31:
					_suffix = "st";
					break;
					default:
					_suffix = "th";
				}
		}
		//Change Calendar 
		function changeCalendar(evt:TimerEvent):void
		{
			updateCalendar();
		}
		//Ping Calendar
		function pingCalendar():void
		{
			_calendarDisplay.text = _day + ", " + _month + " " + _date + _suffix + " - " + _year;
		}
		
	}
	
}