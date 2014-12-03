package com.hyperspatial.audio.players.mp3stateplayer
{
	import flash.media.Sound;
	
	/**Concrete Loading State
	 * 
	 * @author Adam J Nowak, Hyperspatial Design
	 */
	public class LoadingState implements IMp3Abstract
	{
		private var mp3Abstract:Mp3Abstract;
		
		public function LoadingState(selected:Mp3Abstract)
		{
			trace("Constructed LoadingState");
			this.mp3Abstract = selected;
		}
		public function loadTheSong():void
		{
			mp3Abstract.setState(mp3Abstract.getStoppedState());
			mp3Abstract.interfaceDisplayState = "stopped";
		}
		public function startTheSong(selectedSong:Sound):void
		{
			trace("...Loading");
		}
		public function stopTheSong():void
		{
			trace("...Loading");
		}
		public function pauseTheSong(selectedSong:Sound):void
		{
			trace("...Loading");
		}
		public function restartTheSong(selectedSong:Sound):void
		{
			trace("...Loading");
		}
	}
}