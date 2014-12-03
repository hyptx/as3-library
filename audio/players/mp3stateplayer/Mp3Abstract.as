package com.hyperspatial.audio.players.mp3stateplayer
{
	import com.hyperspatial.loaders.Mp3Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import com.hyperspatial.hyperevents.*;
	
	/**Abstract Audio State Controler
	 * 
	 * Public Methods:
	 * 
	 * loadSongFromServer(soundFileLocation:String)
	 * 
	 * Accessors:
	 * 
	 * set interfaceDisplayState(selectedMode:String) = passes string to the interfaceDisplay
	 *
	 * @author Adam J Nowak, Hyperspatial Design
	 */
	
	public class Mp3Abstract extends Mp3PlayControl
	{
		public var interfaceDisplay:InterfaceDisplay = new InterfaceDisplay();
		public var mp3Loader:Mp3Loader = new Mp3Loader();
		public static const THEEND:String = "TheEnd";
		
		private var loadingState:IMp3Abstract;
		private var playingState:IMp3Abstract;
		private var stoppedState:IMp3Abstract;
		private var pausedState:IMp3Abstract;
		private var currentState:IMp3Abstract;
		
		public var soundObjectReference:Sound;
		
		public function Mp3Abstract():void
		{
			trace("Constructed Mp3Abstract");
			loadingState = new LoadingState(this);
			playingState = new PlayingState(this);
			stoppedState = new StoppedState(this);
			pausedState = new PausedState(this);
			currentState = stoppedState;
			addChild(interfaceDisplay);
		}
		public function loadTheSong():void
		{
			currentState.loadTheSong();
		}
		public function startTheSong(selectedSong:Sound):void
		{
			currentState.startTheSong(selectedSong);
			soundPlayControl.addEventListener(Event.SOUND_COMPLETE, endOfSongProceedure);
			//dispatchEvent(new PlayEvent(PlayEvent.STARTED_PLAY));
		}
		public function stopTheSong():void
		{
			currentState.stopTheSong();
		}
		public function pauseTheSong(selectedSong:Sound):void
		{
			currentState.pauseTheSong(selectedSong);
		}
		public function restartTheSong(selectedSong:Sound):void
		{
			currentState.restartTheSong(selectedSong);
		}
		public function getLoadingState():IMp3Abstract
		{
			return this.loadingState;
		}
		public function getPlayingState():IMp3Abstract
		{
			return this.playingState;
		}
		public function getStoppedState():IMp3Abstract
		{
			return this.stoppedState;
		}
		public function getPausedState():IMp3Abstract
		{
			return this.pausedState;
		}
		public function setState(selectedState:IMp3Abstract):void
		{
			this.currentState = selectedState;
			//trace("State = " + currentState);
		}
		public function getState():IMp3Abstract
		{
			return currentState;
		}
		//End of Abstraction
		
		public function set interfaceDisplayState(selectedMode:String):void
		{
			interfaceDisplay.displayState = selectedMode;
		}
		public function loadSongFromServer(soundFileLocation:String):void
		{
			loadTheSong();
			mp3Loader.mp3FileLocation = soundFileLocation;
			mp3Loader.mp3SoundObject.addEventListener(Event.COMPLETE, assignSongToSoundObject);
		}
		function assignSongToSoundObject(evt:Event):void
		{
			loadTheSong();
			soundObjectReference = mp3Loader.mp3SoundObject;
			setupEventListeners();
		}
		function setupEventListeners():void
		{
			addEventListener(MouseEvent.CLICK, processStageClicks);
		}
		function processStageClicks(evt:Event):void
		{
			switch (evt.target.name) 
			{
				case "playButton":
				startTheSong(soundObjectReference);
				break;
				case "pauseButton":
				pauseTheSong(soundObjectReference);
				break;
				case "backButton":
				restartTheSong(soundObjectReference);
				break;
				case "volumeUp":
				raiseVolume(0.1);
				break;
				case "volumeDown":
				lowerVolume(0.1);
				break;
				default:
				return;
			}
		}
		function endOfSongProceedure(evt:Event):void
		{
			var data:String = "test data";
			
			trace("the end");
			dispatchEvent(new EndEvent(EndEvent.THE_END));//, data
		}
	}	
}