package com.hyperspatial.audio.players.mp3stateplayer
{
	import flash.media.Sound;
	
	/**Concrete Playing State
	 *
	 * @author Adam J Nowak, Hyperspatial Design
	 */
	public class PlayingState implements IMp3Abstract
	{
		private var mp3Abstract:Mp3Abstract;
		
		public function PlayingState(selected:Mp3Abstract)
		{
			trace("Constructed PlayingState");
			this.mp3Abstract = selected;
		}
		public function loadTheSong():void
		{
			mp3Abstract.setState(mp3Abstract.getLoadingState());
			mp3Abstract.interfaceDisplayState = "loading";
		}
		public function startTheSong(selectedSong:Sound):void
		{
			trace("Song is currently playing");
		}
		public function stopTheSong():void
		{
			mp3Abstract.setState(mp3Abstract.getStoppedState());
			mp3Abstract.interfaceDisplayState = "stopped";
			mp3Abstract.initiateStop();
		}
		public function pauseTheSong(selectedSong:Sound):void
		{
			mp3Abstract.setState(mp3Abstract.getPausedState());
			mp3Abstract.interfaceDisplayState = "paused";
			mp3Abstract.initiatePause(selectedSong);
		}
		public function restartTheSong(selectedSong:Sound):void
		{
			mp3Abstract.initiateRestart(selectedSong);
		}
	}
}