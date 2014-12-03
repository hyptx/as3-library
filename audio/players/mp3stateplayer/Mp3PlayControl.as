package com.hyperspatial.audio.players.mp3stateplayer
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import com.hyperspatial.hyperevents.*;
	
	/**Simple Play Controler
	 * 
	 * Public methods:
	 * 
	 * initiateStart(songReference:Sound);
	 * initiateStop(songReference:Sound);
	 * initiatePause(songReference:Sound);
	 * initiateRestart(songReference:Sound);
	 * raiseVolume(amount:Number);
	 * lowerVolume(amount:Number);
	 * setVolume(amount:Number);
	 * ...
	 * @author Adam J Nowak, Hyperspatial Design
	 */
	public class Mp3PlayControl extends Sprite
	{
		public var soundPlayControl:SoundChannel = new SoundChannel();
		
		private var pausedPosition:Number;
		private var pauseToggleSwitch:Boolean = false;
		private var soundLevelControl:SoundTransform = new SoundTransform();
		private var currentVolume:Number = 0.9;
		private var leftLevel:LeftLevel = new LeftLevel();
		private var rightLevel:LeftLevel = new LeftLevel();
		
		public function Mp3PlayControl():void
		{
			trace("Constructed Mp3PlayControl");
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			leftLevel.x = 103.2;
			leftLevel.y = 84.2;
			addChild(leftLevel);
			
			rightLevel.x = 154;
			rightLevel.y = 164;
			addChild(rightLevel);
		}
		
		function onEnterFrame(event:Event):void
		{
			var left:Number = soundPlayControl.leftPeak * 150;
			var right:Number = soundPlayControl.rightPeak * 100;
			leftLevel.width = left;
			rightLevel.width = right;
        } 
		
		public function initiateStart(soundToPlay:Sound):void
		{
			if (pauseToggleSwitch)
			{
				soundPlayControl = soundToPlay.play(pausedPosition);
				pauseToggleSwitch = false;
			}
			else 
			{
				soundPlayControl = soundToPlay.play();
				dispatchEvent(new PlayEvent(PlayEvent.STARTED_PLAY));
			}
			soundPlayControl.soundTransform = soundLevelControl;
		}
		public function initiateStop():void
		{
			pauseToggleSwitch = false;
			soundPlayControl.stop();
		}
		public function initiatePause(soundToPause:Sound):void
		{
			if (pauseToggleSwitch)
			{
				soundPlayControl = soundToPause.play(pausedPosition);
				pauseToggleSwitch = false;
			}
			else 
			{
				pausedPosition = soundPlayControl.position;
				soundPlayControl.stop();
				pauseToggleSwitch = true;
			}
			soundPlayControl.soundTransform = soundLevelControl;
		}
		public function initiateRestart(soundToStop:Sound):void
		{
			pauseToggleSwitch = false;
			soundPlayControl.stop();
			initiateStart(soundToStop);
		}
		public function raiseVolume(amount:Number):void
		{
			currentVolume += amount;
			if (currentVolume > 1)
			{
				currentVolume = 1;
			}
			soundLevelControl.volume = currentVolume;
			soundPlayControl.soundTransform = soundLevelControl;
		}
		public function lowerVolume(amount:Number):void
		{
			currentVolume -= amount;
			if (currentVolume < 0)
			{
				currentVolume = 0;
			}
			soundLevelControl.volume = currentVolume;
			soundPlayControl.soundTransform = soundLevelControl;
		}
		public function setVolume(amount:Number):void
		{
			currentVolume = amount;
			if (currentVolume < 0)
			{
				currentVolume = 0;
			}
			if (currentVolume > 1)
			{
				currentVolume = 1;
			}
			soundLevelControl.volume = currentVolume;
			soundPlayControl.soundTransform = soundLevelControl;
		}
	}
}