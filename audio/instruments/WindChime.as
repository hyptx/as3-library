package com.hyperspatial.audio.instruments
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.Timer;
		
	/**WindChime
	 * Methods
	 * 1= ringChime("force 1-10 here");
	 * 
	 * @author adam
	 */
	public class WindChime extends Sprite			
	{
		private var _soundFileLocation:String;
		private var _loaderReference:SimpleMp3Loader = new SimpleMp3Loader();
		private var _soundObjectReference:Sound = new Sound();
		private var _chimePlayControl:SoundChannel = new SoundChannel();
		private var _chimeVolumeLevel:SoundTransform = new SoundTransform();
		private var _strikingForce:Number;
		private var _reboundDelayFactor:Number;
		private var _numberOfRings:int = 1;
		
		
		public function WindChime(selectedFileLocation:String):void
		{
			trace("Constructed WindChime");
			 _soundFileLocation = selectedFileLocation;
			loadChimeSoundSample();
		}
		function loadChimeSoundSample():void
		{
			_loaderReference.mp3FileLocation = _soundFileLocation;
			setupObjectReference();
		}
		function setupObjectReference():void
		{
			_soundObjectReference = _loaderReference.mp3SoundObject;
			_loaderReference.mp3SoundObject.addEventListener(Event.COMPLETE, soundLoadCompleted);
		}
		function soundLoadCompleted(evt:Event):void
		{
			trace("Loaded the Chime sound file");
			//initializeTheChime();
		}
		public function strikeTheChime(selectedForce):void
		{
			var actualStrikeForce:Number = Math.round(selectedForce * 100);
			trace("\n" + actualStrikeForce / 10);
			
			_reboundDelayFactor = selectedForce * 700;
			_strikingForce = selectedForce;
			_chimeVolumeLevel.volume = _strikingForce;
			
			if (selectedForce < 0.5)
			{
				trace("Light");
				setupTheChime(1);
			}
			else if(selectedForce < 0.7)
			{
				trace("Medium");
				setupTheChime(2);
			}
			else
			{
				trace("Strong");
				setupTheChime(3);
			}
		}
		function setupTheChime(selectedNumberOfRings:int):void
		{
			_numberOfRings = selectedNumberOfRings;
			checkNumberOfRings();
		}
		function checkNumberOfRings():void
		{
			if (_numberOfRings == 1)
			{
				ringTheChime();
			}
			else if (_numberOfRings == 2)
			{
				ringTheChime();
				lowerVolumeLevel();
				runDelayTimer();
			}
			else if (_numberOfRings == 3)
			{
				ringTheChime();
				lowerVolumeLevel();
				runDelayTimer();
				_reboundDelayFactor = _reboundDelayFactor * 1.5;
			}
			else 
			{
				return;
			}
		}
		function runDelayTimer():void
		{
			var reboundDelayTimer:Timer = new Timer(_reboundDelayFactor, 0);
			
			_chimeVolumeLevel.volume = _strikingForce;
			reboundDelayTimer.addEventListener(TimerEvent.TIMER, timerHasFinished);
			reboundDelayTimer.start();
			
			function timerHasFinished(evt:Event):void
			{
				reboundDelayTimer.stop();
				ringTheChime();
				if (_numberOfRings == 3)
				{
					lowerVolumeLevel();
					runDelayTimer();
					_numberOfRings = 1;
				}
			}
		}
		function lowerVolumeLevel():void
		{
			_strikingForce = _strikingForce * .4;
		}
		function ringTheChime():void
		{
			trace(_chimeVolumeLevel.volume);
			_chimePlayControl = _soundObjectReference.play();
			_chimePlayControl.soundTransform = _chimeVolumeLevel;
			trace("Ding");
		}
	}
	
}