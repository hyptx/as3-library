package com.hyperspatial.shapes.generic{

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	//class section
	public class TheObject extends Sprite {

		//public variables 
		public var el1:String = "neutronium";

		//contructor function
		public function TheObject() {

			trace("Ran Constructor, The Object");

		}
		//local functions

		//test function
		public function runIt() {
			trace("ran run it in object");
		}
		//test passing of strings
		public function splitAtom(atom1:String, atom2:String):void {
			trace("atom 1 is " + atom1);
			trace("atom 2 is " + atom2);
		}
	}
}