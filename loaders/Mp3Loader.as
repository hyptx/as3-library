package com.hyperspatial.loaders
{
	import flash.display.Sprite;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	/**Mp3 Loader, is a simple tool to load an mp3
	 * 
	 * G/Setter:
	 * get mp3SoundObject();
	 * set mp3FileLocation("filelocation.mp3"); = this initiates the load
	 * 
	 * @author Adam J Nowak, Hyperspatial Design
	 */
	public class Mp3Loader extends Sprite
	{
		private var _mp3SoundObject:Sound;
		private var _mp3FileLocation:String;
		
		public function Mp3Loader():void
		{
			trace("Constructed Mp3Loader");
		}
		public function set mp3FileLocation(fileChoiceByUser:String):void
		{
			_mp3FileLocation = fileChoiceByUser;
			loadTheSoundFile();
		}
		public function loadTheSoundFile():void
		{
			var soundFileURL:URLRequest = new URLRequest(_mp3FileLocation);
			
			_mp3SoundObject = new Sound;
			_mp3SoundObject.load(soundFileURL);
		}
		public function get mp3FileLocation():String
		{
			return _mp3FileLocation;
		}
		public function get mp3SoundObject():Sound
		{
			return _mp3SoundObject;
		}
	}
}