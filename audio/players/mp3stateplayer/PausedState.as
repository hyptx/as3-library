package com.hyperspatial.audio.players.mp3stateplayer
{
	import flash.media.Sound;
	
	/**Concrete Paused State
	 * 
	 * @author Adam J Nowak, Hyperspatial Design
	 */
	public class PausedState implements IMp3Abstract
	{
		private var mp3Abstract:Mp3Abstract;
		
		public function PausedState(selected:Mp3Abstract)
		{
			trace("Constructed PausedState");
			this.mp3Abstract = selected;
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
			trace("Can't stop the song here");
		}
		public function pauseTheSong(selectedSong:Sound):void
		{
			mp3Abstract.setState(mp3Abstract.getPausedState());
			mp3Abstract.interfaceDisplayState = "playing";
			mp3Abstract.initiateStart(selectedSong);
		}
		public function restartTheSong(selectedSong:Sound):void
		{
			mp3Abstract.setState(mp3Abstract.getPlayingState( ));
			mp3Abstract.interfaceDisplayState = "playing";
			mp3Abstract.initiateRestart(selectedSong);
		}
	}
}