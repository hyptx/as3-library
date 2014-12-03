package com.hyperspatial.loaders
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.events.IOErrorEvent;
	
	/**Image loader
	 * Methods:
	 * downloadImage(fileUrl:String)
	 * ...
	 * @author adam
	 */
	public class ImageLoader extends Sprite
	{
		public var imageUrlLoader:Loader = new Loader();
		
		//Constructor
		public function ImageLoader():void
		{
			trace("Constructed ImageLoader");
		}
		//Download the image
		public function downloadImage(fileUrl:String):void
		{
			imageUrlLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, LoadError);
			imageUrlLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, LoadedImage);
			imageUrlLoader.load(new URLRequest(fileUrl));
		}
		//Add the image 
		function LoadedImage(evt:Event):void
		{
			addChild(imageUrlLoader);
		}
		//IOError
		function LoadError(evt:IOErrorEvent):void
		{
			trace("There was an error loading the image file");
		}
	}
}