package com.hyperspatial.air.utilities
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.sampler.NewObjectSample;
	import flash.system.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.net.navigateToURL;
	import flash.utils.Timer;
	
	/**Air Installer Badge no app install
	 * ...
	 * @author adam
	 */
	public class AirInstaller extends MovieClip
	{
		private var _textWindow:TextField = new TextField();
		private var _greenDisplayFormat:TextFormat = new TextFormat();
		private var _warningDisplayFormat:TextFormat = new TextFormat();
		private var _blackDisplayFormat:TextFormat = new TextFormat();
		private var _boldDisplayFormat:TextFormat = new TextFormat();
		private var _btnContainer:Sprite = new Sprite();
		private var _sensiriBtn:Sensiri = new Sensiri();
		private var _drabBtn:Drab = new Drab();
		private var _silverBtn:Silver = new Silver();
		private var _airLoadBtn:GetAir = new GetAir();
		private var _airInstBtn:AutoAir = new AutoAir();
		private var _heading:HeadingGr = new HeadingGr();
		private var _clockTimer:Timer = new Timer(100);
		private var _ampm:String = "am";
		private var _hour:int = 0;
		private var _minute:String = "";
		private var _airSWF:Object; // This is the reference to the main class of air.swf
		
		//test var
		private var _airToggle:Boolean = false;
		
		public function AirInstaller():void
		{
			 
			var airSWFLoader:Loader = new Loader(); // Used to load the SWF 
			var loaderContext:LoaderContext = new LoaderContext();// Used to set the application domain  
 
			loaderContext.applicationDomain = ApplicationDomain.currentDomain; 
 
			airSWFLoader.contentLoaderInfo.addEventListener(Event.INIT, onInit); 
			airSWFLoader.load(new URLRequest("http://airdownload.adobe.com/air/browserapi/air.swf"),  
								loaderContext); 
 
		function onInit(e:Event):void  
		{ 
			_airSWF = e.target.content; 
			checkForAir();
		}
			
			//clock listener updater
			_clockTimer.addEventListener(TimerEvent.TIMER, updateTime);
			_clockTimer.start();
			
			//button defaults
			addChild(_btnContainer);
			_sensiriBtn.x = 30;
			_sensiriBtn.y = 32;
			_sensiriBtn.name = "sensiri";
			_btnContainer.addChild(_sensiriBtn);
			
			_drabBtn.x = 30;
			_drabBtn.y = 152;
			_drabBtn.name = "drab";
			_btnContainer.addChild(_drabBtn);
			
			_silverBtn.x = 30;
			_silverBtn.y = 272;
			_silverBtn.name = "silver";
			_btnContainer.addChild(_silverBtn);
			
			_airLoadBtn.x = 297;
			_airLoadBtn.y = 121;
			_airLoadBtn.name = "air load";
			_btnContainer.addChild(_airLoadBtn);
			
			_airInstBtn.x = 307;
			_airInstBtn.y = 95;
			_airInstBtn.name = "air install";
			_btnContainer.addChild(_airInstBtn);
			
			_airLoadBtn.visible = false;
			_airInstBtn.visible = false;
			
			_btnContainer.addEventListener(MouseEvent.MOUSE_OVER, btnOver);
			_btnContainer.addEventListener(MouseEvent.MOUSE_OUT, btnOut);
			_btnContainer.addEventListener(MouseEvent.CLICK, clickedBtn);
			
			
			//black text diplay defaults
			_blackDisplayFormat.size = 12;
			_blackDisplayFormat.font = "Verdana";
			_blackDisplayFormat.leftMargin = 4;
			
			_boldDisplayFormat.size = 12;
			_boldDisplayFormat.font = "Verdana";
			_boldDisplayFormat.leftMargin = 4;
			_boldDisplayFormat.bold = true;
			
			//green text diplay defaults
			_greenDisplayFormat.size = 12;
			_greenDisplayFormat.color = 0x006600;
			_greenDisplayFormat.font = "Verdana";
			_greenDisplayFormat.leftMargin = 4;
			
			//warning diplay defaults
			_warningDisplayFormat.size = 12;
			_warningDisplayFormat.color = 0x990000;
			_warningDisplayFormat.font = "Verdana";
			_warningDisplayFormat.leftMargin = 4;
			
			_textWindow.wordWrap = true;
			_textWindow.x = 260;
			_textWindow.y = 158;
			_textWindow.width = 262;
			_textWindow.height = 212;
			_textWindow.defaultTextFormat = _blackDisplayFormat;
			
			addChild(_textWindow);
			
		}
		//clock update
		function updateTime(evt:TimerEvent):void
		{
			var localDate:Date = new Date();
			_hour = localDate.getHours();
			//_minute = localDate.getMinutes();
			
			if (localDate.getMinutes() < 10)
			{
				_minute = String(0) +
				localDate.getMinutes();
			}
			else
			{
				_minute =
				String(localDate.getMinutes());
			}
			
			
			if (_hour > 12)
			{
				_hour = localDate.getHours() - 12;
				_ampm = "pm";
			}
			else
			{
				_ampm = "am";
			}
		}
		//hover states
		function btnOver(evt:MouseEvent):void
		{
			evt.target.alpha = .6;
		}
		function btnOut(evt:MouseEvent):void
		{
			evt.target.alpha = 1;
		}
		//click handler
		function clickedBtn(evt:MouseEvent):void
		{
			var pressedBtn:String = "" + evt.target.name;
			
			checkForAir();
			
			if (_airToggle == false)
			{
				_textWindow.defaultTextFormat = _blackDisplayFormat;
				switch(pressedBtn)
				{
					case "sensiri":
					_textWindow.defaultTextFormat = _warningDisplayFormat;
					_textWindow.appendText("* Sensiri needs Adobe Air to run");
					break;
					
					case "drab":
					_textWindow.defaultTextFormat = _warningDisplayFormat;
					_textWindow.appendText("* Sensiri Drab needs Adobe Air to run");
					break;
					
					case "silver":
					_textWindow.defaultTextFormat = _warningDisplayFormat;
					_textWindow.appendText("* Sensiri Silver needs Adobe Air to run");
					break;
					
					case "air load":
					gotoUrl("http://get.adobe.com/air/");
					_textWindow.text = _hour + ":" + _minute + " " + _ampm + " - Initiated Air download\n\n";
					break;
					
					case "air install":
					gotoUrl("http://airdownload.adobe.com/air/win/download/latest/AdobeAIRInstaller.exe");
					_textWindow.text = _hour + ":" + _minute + " " + _ampm + " - Initiated Air download\n\n";
					break;
				}
			}
			
			else
			{
				_textWindow.defaultTextFormat = _blackDisplayFormat;
				switch(pressedBtn)
				{
					case "sensiri":
					gotoUrl("https://secure.avangate.com/order/cart.php?PRODS=2609464&QTY=1&ORDERSTYLE=nLWonZTfkH4=&SRC=hyperspatial.com&SHOPURL=http://www.hyperspatial.com/pages/products.html");
					break;
			
					case "drab":
					gotoUrl("https://secure.avangate.com/order/cart.php?PRODS=2612162&QTY=1&ORDERSTYLE=nLWonZTfkH4=&SRC=hyperspatial.com&SHOPURL=http://www.hyperspatial.com/pages/products.html");
					break;
					
					case "silver":
					gotoUrl("https://secure.avangate.com/order/cart.php?PRODS=2632362&QTY=1&ORDERSTYLE=nLWonZTfkH4=&SRC=hyperspatial.com&SHOPURL=http://www.hyperspatial.com/pages/products.html");
					break;
				}	
			}		
				
		}
		//navigate to url
		function gotoUrl(urlAddress:String):void
		{
			var urlRequest:URLRequest = new URLRequest(urlAddress);
			navigateToURL(urlRequest, '_self');
		}
		//check air status
		function checkForAir():void
		{
			trace("ran check for air");
			var currentStatus:String = _airSWF.getStatus();
			_textWindow.defaultTextFormat = _blackDisplayFormat;
			_textWindow.text = "";
			_textWindow.text = _hour + ":" + _minute + " " + _ampm + " - Checked CPU for Adobe Air\n\n";
						
			//test air load
			/*if(_airToggle == false)
			{
				_textWindow.defaultTextFormat = _warningDisplayFormat;
				_textWindow.appendText("* Adobe Air must be installed before\n     downloading the Sensiri Player *\n\n");
				_textWindow.defaultTextFormat = _blackDisplayFormat;
				_textWindow.appendText("Click on the buttons above to get Adobe Air.\n\nThe Download Air Here button starts download instantly, then choose 'save' or 'run'. You can also goto Adobe.com and download manually.\n\n");
				_airLoadBtn.visible = true;
				_airInstBtn.visible = true;
				_airToggle = false;
				return;
			}*/
			if (currentStatus == "installed")
			{
				_textWindow.defaultTextFormat = _greenDisplayFormat;
				_textWindow.appendText("*Adobe Air is installed on this system*\n\n\n");
				_textWindow.defaultTextFormat = _boldDisplayFormat;
				_textWindow.appendText("Click one of the Sensiri images on the left to go to our shopping cart page.");
				_airLoadBtn.visible = false;
				_airInstBtn.visible = false;
				_airToggle = true;
			}
			else if  (currentStatus == "available")
			{
				_textWindow.defaultTextFormat = _warningDisplayFormat;
				_textWindow.appendText("* Adobe Air must be installed before\n     downloading the Sensiri Player *\n\n");
				_textWindow.defaultTextFormat = _blackDisplayFormat;
				_textWindow.appendText("Click on the buttons above to get Adobe Air.\n\nThe Download Air Here button starts download instantly, then choose 'save' or 'run'. You can also goto Adobe.com and download manually.\n\n");
				_airLoadBtn.visible = true;
				_airInstBtn.visible = true;
				_airToggle = false;
			}
			
			else if (currentStatus == "unavailable")
			{
				_textWindow.defaultTextFormat = _warningDisplayFormat;
				_textWindow.appendText("* Sorry:\n\nYour system is not capable of installing or running the Adobe Air runtime");
				_btnContainer.removeEventListener(MouseEvent.CLICK, clickedBtn);
			}
			else
			{
				return;
			}
			
		}
	}
	
}