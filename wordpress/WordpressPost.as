package  com.hyperspatial.wordpress
{
	import flash.display.Sprite;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.*;
	import com.hyperspatial.hyperevents.PostEvent;
	
	/** Wordpress Post Class
	 * ...
	 * @author adam j nowak
	 */
	public class WordpressPost extends Sprite
	{
		public function WordpressPost() 
		{
			trace('Constructed Wordpress Post');
		}
		
		public function sendPost(url,data):void
		{
			var request:URLRequest = new URLRequest(url);
			var urlLoader:URLLoader = new URLLoader();
            var postVariables:URLVariables = new URLVariables();
			
			for(var key in data)
			{
				postVariables[key] = data[key];
			}
			
			request.method = URLRequestMethod.POST;
			request.data = postVariables;
			urlLoader.addEventListener(Event.COMPLETE, getResponse);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			try {
				urlLoader.load(request);
			}
			catch (error:Error) {
				trace("Error");
			}
			
		}
		
		function ioErrorHandler(evt:IOErrorEvent):void
		{
			dispatchEvent(new PostEvent(PostEvent.POSTED,"Error: Can't Connect - Check URL"));
		}
		
		function getResponse(evt:Event):void 
		{
			var loader:URLLoader = URLLoader(evt.target);
			
			if(loader.data.match('<')) dispatchEvent(new PostEvent(PostEvent.POSTED, "Error: Can't Connect - Check URL"));
			else 
			{
				var dataObj:URLVariables = new URLVariables(loader.data);
				dispatchEvent(new PostEvent(PostEvent.POSTED,dataObj['response']));
			}
		}
	}
}