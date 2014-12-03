package com.hyperspatial.audio.players.mp3stateplayer
{
	import flash.media.Sound;
	
	/**Audio State Controler interface
	 * ...
	 * @author Adam J Nowak, Hyperspatial Design LLC
	 */
	public interface IMp3Abstract 
	{
		function loadTheSong():void;
		function startTheSong(selectedSong:Sound):void;
		function stopTheSong():void;
		function pauseTheSong(selectedSong:Sound):void;
		function restartTheSong(selectedSong:Sound):void;
	}
}