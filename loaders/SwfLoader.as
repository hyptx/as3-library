package com.hyperspatial.loaders
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.LoaderInfo;
	
	
	/**Dynamic Swf Loader, tool to load a .swf at runtime and access its methods and properties
	 * 
	 * Methods:
	 * set swfFileLocation("filelocation.swf"); = this initiates the load
	 * 
	 * get externalSwfLoader(); = Loader needed for accessing event.COMPLETE
	 * get swfDisplayObject(); = Display Object needed to addChild
	 * get swfComObject(); = Object needed to access methods, properties and clicks
	 *
	 * 
	 * @author Adam J Nowak, Hyperspatial Design
	 */
	public class SwfLoader extends Sprite
	{
		private var _externalSwfLoader:Loader = new Loader();
		private var _swfFileLocation:String;
		private var _swfDisplayObject:DisplayObject;
		private var _swfComObject:Object;
		
		public function SwfLoader():void
		{
			trace("Constructed SwfLoader");
		}
		public function set swfFileLocation(fileChoiceByUser:String):void
		{
			_swfFileLocation = fileChoiceByUser;
			loadExternalSwf();
		}
		function loadExternalSwf():void
		{
			externalSwfLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, createSwfObjects);
			externalSwfLoader.load(new URLRequest(_swfFileLocation));
		}
		function createSwfObjects(evt:Event):void
		{
			var loaderInfo:LoaderInfo = evt.target as LoaderInfo;
			
			_swfDisplayObject = evt.target.content;
			_swfComObject = loaderInfo.content;
		}
		public function get externalSwfLoader():Loader
		{
			return _externalSwfLoader;
		}
		public function get swfFileLocation():String
		{
			return _swfFileLocation;
		}
		public function get swfDisplayObject():DisplayObject
		{
			return _swfDisplayObject;
		}
		public function get swfComObject():Object
		{
			return _swfComObject;
		}
	}
}