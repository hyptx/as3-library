package com.hyperspatial.loaders
{
	import com.voidelement.images.ico.*;
	import flash.display.Sprite;
	import flash.net.*;
	import flash.events.Event;
	import flash.display.Bitmap;
	
	
	
	/**ICO loader class
	 * ...
	 * @author adam
	 */
	public class LoadICOFile extends Sprite 
	{
		public function LoadICOFile(url:String):void 
		{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.BINARY;
			loader.addEventListener(Event.COMPLETE, onCompleteLoad);
			loader.load(new URLRequest(url));
		}
		function onCompleteLoad(e:Event):void 
		{
			var loader:URLLoader = e.target as URLLoader;
			var decoder:ICODecoder = new ICODecoder();
			var arr:Array = decoder.decode(loader.data);
 
			for ( var i:int = 0; i < arr.length; i++) 
			{
				var data:ICOImageData = arr[i] as ICOImageData;
				if ((data.info.width == 32) && (data.info.height == 32)) 
				{
				// if 16×16 bit
				addChild(new Bitmap(data.image));
				}
			}
		}
	}
	
}