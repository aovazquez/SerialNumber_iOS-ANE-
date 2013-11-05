package
{	
	import flash.events.EventDispatcher;
	import flash.external.ExtensionContext;

	public class SerialNumberController
	{
		
		private static var extContext:ExtensionContext 		= null;
		private static var _instance:SerialNumberController = null;
		private static var _shouldCreateInstance:Boolean 	= false;
		
		public function SerialNumberController()
		{
			if (_shouldCreateInstance)
			{
				trace("Extension Context Created Constructor");
				extContext = ExtensionContext.createExtensionContext("com.hovanetworks.serialnumber","");
			}
			else
			{
				throw new Error("ERROR CONTEXT NOT INITIALIZED!!");  
			}   
		}
		
		public static function get instance():SerialNumberController {
			
			if(_instance == null)
			{
				_shouldCreateInstance = true; 
				_instance = new SerialNumberController();
				_shouldCreateInstance = false;
			}
			
			return _instance;
		} 
		
		//Method specified in XCode
		public function getSerial():String
		{  
			var str:String = extContext.call("getSerial") as String;
			return str;        
		}
		
		public function getUDID():String
		{  
			var str:String = extContext.call("getUdid") as String;
			return str;        
		}
	}
}