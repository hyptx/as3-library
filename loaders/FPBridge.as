package com.hyperspatial.loaders
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.*;
	import com.hyperspatial.hyperevents.FPLoaderEvent;
	
	
	/**Flash PHP Bridge Class
	 * 
	 * You must Extend this class!!! To get access to all the PHP Query Strings funcitonality
	 * 
	 * Functions:
	 *  
	 * 1) getPHPData(location:String):void
	 *  
	 * 2) postPHPData(location:String, arrayToPHP:URLVariables) - Send URLVariable Object
	 *   
	 * 
	 * Custom Events:
	 * 
	 * 1) FPLoaderEvent.STRING_LOADED - Fired when urlVariables loaded
	 * Access array data using Event.data
	 * 
	 * 
	 * @author Adam J Nowak, Hyperspatial Design
	 */
	public class FPBridge extends Sprite 
	{
		public function FPBridge():void
		{
			trace("Constructed FPBridge");
		}
		
		//Get Data
		public function getPHPData(location:String):void
		{
			trace("Getting");
			
			var urlRequest:URLRequest = new URLRequest(location);
			var urlLoader:URLLoader = new URLLoader();
			
			urlLoader.addEventListener(Event.COMPLETE, returnTheArray);
			urlLoader.load(urlRequest);
		}
		
		//Post Data
		public function postPHPData(location:String, arrayToPHP:URLVariables):void
		{
			trace("Posting");
			
			var urlLoader:URLLoader = new URLLoader();
			var urlRequest:URLRequest = new URLRequest(location);
			
			urlRequest.method = URLRequestMethod.POST;
			urlRequest.data = arrayToPHP;
			
			urlLoader.addEventListener(Event.COMPLETE, returnTheArray);
			
			try {
				urlLoader.load(urlRequest);
			} catch (evt:Error) {
				trace("A post error occured");
			}
		}
		
		//Return The Array
		function returnTheArray(evt:Event):void
		{
			trace("Returning");
			
			var urlLoader:URLLoader = URLLoader(evt.target);
			var arrayFromPHP:URLVariables = new URLVariables(urlLoader.data);
			
			dispatchEvent(new FPLoaderEvent(FPLoaderEvent.STRING_LOADED,arrayFromPHP));
		}
	}
}