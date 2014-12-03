package com.hyperspatial.audio.components
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.utils.Timer;
	import fl.controls.*;
	import fl.events.*;
	
	/**Mp3 audio loop fixit, removes trailer gap flash adds
	 * call constructor by passing filename string  "test.mp3"
	 * 
	 * @author adam
	 */
	public class EndPointLoop extends Sprite
	{
		private var _soundUrl:String;
		private var _soundRequest:URLRequest;
		private var _theSound:Sound = new Sound();
		private var _soundControl:SoundChannel = new SoundChannel();
		private var _timer:Timer;
		private var _endPoint:Number = 0;
		private var _input:TextInput = new TextInput();
		private var _displayText:TextField = new TextField();
		
		//constructor
		public function EndPointLoop(url:String):void
		{
			//text input stuff
			_input.x = 74;
			_input.y = 88;
			_input.text = "Type the Factor";
			_input.addEventListener(ComponentEvent.ENTER, changeEndPoint);
			addChild(_input);
			
			//text field stuff
			_displayText.x = 220;
			_displayText.y = 10;
			_displayText.width = 300;
			_displayText.height = 400;
			addChild(_displayText);
			
			//sound stuff
			_soundUrl = url;
			_soundRequest = new URLRequest(_soundUrl);
			_theSound.load(_soundRequest);
			_theSound.addEventListener(Event.COMPLETE, loaded);
		}
		//wait to finish load
		private function loaded(evt:Event):void
		{
			_displayText.appendText("Sample Length = " + _theSound.length + " milsec.\n");
			timers();
		}
		//new snip and text input
		function changeEndPoint(evt:Event):void
		{
			_endPoint = evt.target.text;
			_input.text = "";
						
			
			if (_endPoint < -_theSound.length)
			{
				_displayText.appendText("\nOut of range, can't trim that much.\n");
				_endPoint = 0;
			}
			else if (_endPoint < 0)
			{
				_displayText.appendText("\nSubtracted " + _endPoint + " milsec. from endpoint.\n");
			}
			else if (_endPoint >= 0)
			{
				_displayText.appendText("\nAdded " + _endPoint + " milsec. to endpoint.\n");
			}
			else
			{
				_displayText.appendText("\nPlease Type a Number.\n");
				_endPoint = 0;
			}
		
			_timer.stop();
			_timer = null;
			timers();
		}		
		//timer looping
		function timers():void
		{
			//main timer loop
			_timer = new Timer(_theSound.length+_endPoint);
			_timer.addEventListener("timer", startLoop); 
			
			function startLoop(e:Event):void 
			{
				_displayText.appendText(" * ");
				_soundControl = _theSound.play(); 
			}
			
			_timer.start();
	
			//init timer loop
			var initialTimer:Timer = new Timer(0, 1);
			initialTimer.addEventListener("timer", initLoop);
			
			function initLoop(e:Event):void 
			{
				_soundControl = _theSound.play();
				initialTimer = null;
			}	
			
			initialTimer.start();
		}
	}
}

