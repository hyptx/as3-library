package com.hyperspatial.audio.players.mp3stateplayer
{
	import flash.media.Sound;
	
	/**Concrete Stopped State
	 * 
	 * @author Adam J Nowak, Hyperspatial Design
	 */
	public class StoppedState implements IMp3Abstract 
	{
		private var mp3Abstract:Mp3Abstract;
		
		public function StoppedState(selected:Mp3Abstract)
		{
			trace("Constructed StoppedState");
			this.mp3Abstract = selected;
			displayDefaultButtons();
		}
		function displayDefaultButtons():void
		{
			mp3Abstract.interfaceDisplayState = "stopped";
		}
		public function loadTheSong():void
		{
			mp3Abstract.setState(mp3Abstract.getLoadingState());
			mp3Abstract.interfaceDisplayState = "loading";
		}
		public function startTheSong(selectedSong:Sound):void
		{
			mp3Abstract.setState(mp3Abstract.getPlayingState());
			mp3Abstract.interfaceDisplayState = "playing";
			mp3Abstract.initiateStart(selectedSong);
		}
		public function stopTheSong():void
		{
			trace("You're already stopped");
		}
		public function pauseTheSong(selectedSong:Sound):void
		{
			trace("Can't pause, song is stopped");
		}
		public function restartTheSong(selectedSong:Sound):void
		{
			trace("Can't replay, song is stopped");
		}
	}
}