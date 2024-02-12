unit JSContext_iOSApi;

interface

{$IFDEF IOS}
uses
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;
  instancetype=Pointer;
  JSValue=Pointer;
  _NSObject=Pointer;

	{
	 * Copyright (C) 2013 Apple Inc. All rights reserved.
	 *
	 * Redistribution and use in source and binary forms, with or without
	 * modification, are permitted provided that the following conditions
	 * are met:
	 * 1. Redistributions of source code must retain the above copyright
	 *    notice, this list of conditions and the following disclaimer.
	 * 2. Redistributions in binary form must reproduce the above copyright
	 *    notice, this list of conditions and the following disclaimer in the
	 *    documentation and/or other materials provided with the distribution.
	 *
	 * THIS SOFTWARE IS PROVIDED BY APPLE INC. ``AS IS'' AND ANY
	 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
	 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
	 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE INC. OR
	 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
	 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
	 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
	 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
	 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	 }











	{!
	@interface
	@discussion An instance of JSContext represents a JavaScript execution environment. All
	 JavaScript execution takes place within a context.
	 JSContext is also used to manage the life-cycle of objects within the
	 JavaScript virtual machine. Every instance of JSValue is associated with a
	 JSContext via a strong reference. The JSValue will keep the JSContext it
	 references alive so long as the JSValue remains alive. When all of the JSValues
	 that reference a particular JSContext have been deallocated the JSContext
	 will be deallocated unless it has been previously retained.
	}
	//NS_CLASS_AVAILABLE(10_9, 7_0)
	JSContext=interface(NSObject)//
	['{015D3E49-844C-4C60-9645-6CD3F8A55300}']

		{!
		@methodgroup Creating New JSContexts
		}
		{!
		@method
		@abstract Create a JSContext.
		@result The new context.
		}
		{-} function init:instancetype;cdecl;

		{!
		@method
		@abstract Create a JSContext in the specified virtual machine.
		@param virtualMachine The JSVirtualMachine in which the context will be created.
		@result The new context.
		}

//		{-} function initWithVirtualMachine(virtualMachine:JSVirtualMachine{*}):instancetype;cdecl;

		{!
		@methodgroup Evaluating Scripts
		}
		{!
		@method
		@abstract Evaluate a string of JavaScript code.
		@param script A string containing the JavaScript code to evaluate.
		@result The last value generated by the script.
		}

//		{-} function evaluateScript(script:NSString{*}):JSValue{*};cdecl;

		{!
		@method
		@abstract Evaluate a string of JavaScript code, with a URL for the script's source file.
		@param script A string containing the JavaScript code to evaluate.
		@param sourceURL A URL for the script's source file. Used by debuggers and when reporting exceptions. This parameter is informative only: it does not change the behavior of the script.
		@result The last value generated by the script.
		}
		[MethodName('evaluateScript:withSourceURL:')]
		{-} function evaluateScriptwithSourceURL(script:NSString{*};sourceURL:NSURL{*}):JSValue{*};cdecl;

		{!
		@methodgroup Callback Accessors
		}
		{!
		@method
		@abstract Get the JSContext that is currently executing.
		@discussion This method may be called from within an Objective-C block or method invoked
		 as a callback from JavaScript to retrieve the callback's context. Outside of
		 a callback from JavaScript this method will return nil.
		@result The currently executing JSContext or nil if there isn't one.
		}

		{!
		@method
		@abstract Get the JavaScript function that is currently executing.
		@discussion This method may be called from within an Objective-C block or method invoked
		 as a callback from JavaScript to retrieve the callback's context. Outside of
		 a callback from JavaScript this method will return nil.
		@result The currently executing JavaScript function or nil if there isn't one.
		}

		{!
		@method
		@abstract Get the <code>this</code> value of the currently executing method.
		@discussion This method may be called from within an Objective-C block or method invoked
		 as a callback from JavaScript to retrieve the callback's this value. Outside
		 of a callback from JavaScript this method will return nil.
		@result The current <code>this</code> value or nil if there isn't one.
		}

		{!
		@method
		@abstract Get the arguments to the current callback.
		@discussion This method may be called from within an Objective-C block or method invoked
		 as a callback from JavaScript to retrieve the callback's arguments, objects
		 in the returned array are instances of JSValue. Outside of a callback from
		 JavaScript this method will return nil.
		@result An NSArray of the arguments nil if there is no current callback.
		}

		{!
		@methodgroup Global Properties
		}
		{!
		@property
		@abstract Get the global object of the context.
		@discussion This method retrieves the global object of the JavaScript execution context.
		 Instances of JSContext originating from WebKit will return a reference to the
		 WindowProxy object.
		@result The global object.
		}
		function globalObject:JSValue{*};cdecl;
		procedure setGlobalObject(globalObject:JSValue{*});cdecl;

		{!
		@property
		@discussion The <code>exception</code> property may be used to throw an exception to JavaScript.

		 Before a callback is made from JavaScript to an Objective-C block or method,
		 the prior value of the exception property will be preserved and the property
		 will be set to nil. After the callback has completed the new value of the
		 exception property will be read, and prior value restored. If the new value
		 of exception is not nil, the callback will result in that value being thrown.

		 This property may also be used to check for uncaught exceptions arising from
		 API function calls (since the default behaviour of <code>exceptionHandler</code> is to
		 assign an uncaught exception to this property).

		 If a JSValue originating from a different JSVirtualMachine than this context
		 is assigned to this property, an Objective-C exception will be raised.
		}
		function exception:JSValue{*};cdecl;
		procedure setException(exception:JSValue{*});cdecl;

		{!
		@property
		@discussion If a call to an API function results in an uncaught JavaScript exception, the
		 <code>exceptionHandler</code> block will be invoked. The default implementation for the
		 exception handler will store the exception to the exception property on
		 context. As a consequence the default behaviour is for unhandled exceptions
		 occurring within a callback from JavaScript to be rethrown upon return.
		 Setting this value to nil will result in all uncaught exceptions thrown from
		 the API being silently consumed.
		}
//		function context, JSValue exception):void(^exceptionHandler)(JSContext{*};cdecl;
//		procedure setContext, JSValue exception)(context, JSValue exception):void(^exceptionHandler)(JSContext{*});cdecl;
//
//		{!
//		@property
//		@discussion All instances of JSContext are associated with a single JSVirtualMachine. The
//		 virtual machine provides an "object space" or set of execution resources.
//		}
//		function virtualMachine:JSVirtualMachine{*};cdecl;
//		procedure setVirtualMachine(virtualMachine:JSVirtualMachine{*});cdecl;

		{!
		@property
		@discussion Name of the JSContext. Exposed when remote debugging the context.
		}
		function name {NS_AVAILABLE(10_10, 8_0)}:NSString{*};cdecl;
		procedure setName {NS_AVAILABLE(10_10, 8_0)}(name {NS_AVAILABLE(10_10, 8_0)}:NSString{*});cdecl;







		{!
		method
		@abstract Get a particular property on the global object.
		@param key
		@result The JSValue for the global object's property.
		}
		{-} function objectForKeyedSubscript(key:id):JSValue{*};cdecl;

		{!
		method
		@abstract Set a particular property on the global object.
		@param object
		@param key
		}
		[MethodName('setObject:forKeyedSubscript:')]
		{-} procedure setObjectforKeyedSubscript(_object:id;key:_NSObject{ <NSCopying>}{*});cdecl;












//		function JSGlobalContextRef:JSGlobalContextRef;cdecl;
//		procedure setJSGlobalContextRef(JSGlobalContextRef:JSGlobalContextRef);cdecl;

	end;

	JSContextClass=interface(NSObjectClass)//
	['{BFC2D55E-8E01-4B5E-B92F-7DF7132C86D4}']
		{+} function currentContext:JSContext{*};cdecl;
		{+} function currentCallee {NS_AVAILABLE(10_10, 8_0)}:JSValue{*};cdecl;
		{+} function currentThis:JSValue{*};cdecl;
		{+} function currentArguments:NSArray{*};cdecl;

//		{+} function contextWithJSGlobalContextRef(jsGlobalContextRef:JSGlobalContextRef):JSContext{*};cdecl;

	end;

	TJSContext=class(TOCGenericImport<JSContextClass,JSContext>)
	end;





//	{!
//	@category
//	@discussion Instances of JSContext implement the following methods in order to enable
//	 support for subscript access by key and index, for example:
//
//	@textblock
//	    JSContext *context;
//	    JSValue *v = context[@"X"]; // Get value for "X" from the global object.
//	    context[@"Y"] = v;          // Assign 'v' to "Y" on the global object.
//	@/textblock
//
//	 An object key passed as a subscript will be converted to a JavaScript value,
//	 and then the value converted to a string used to resolve a property of the
//	 global object.
//	}
//	JSContext=interface()//SubscriptSupport
//	['{3277BE88-8D5E-4BB5-BDC6-D8D1EF171EC1}']
//
//		{!
//		method
//		@abstract Get a particular property on the global object.
//		@param key
//		@result The JSValue for the global object's property.
//		}
//		{-} function objectForKeyedSubscript(key:id):JSValue{*};cdecl;
//
//		{!
//		method
//		@abstract Set a particular property on the global object.
//		@param object
//		@param key
//		}
//		[MethodName('setObject:forKeyedSubscript:')]
//		{-} procedure setObjectforKeyedSubscript(_object:id;key:NSObject <NSCopying>{*});cdecl;
//
//	end;
//
//	JSContextClass=interface(Class)//SubscriptSupport
//	['{0DCD11E9-3E9C-4043-8021-EB81D55928F5}']
//	end;
//
//	TJSContext=class(TOCGenericImport<JSContextClass,JSContext>)
//	end;

//	{!
//	@category
//	@discussion These functions are for bridging between the C API and the Objective-C API.
//	}
//	JSContext=interface()//JSContextRefSupport
//	['{F09FD016-8AF4-4364-90F5-68CD53520D02}']
//
//		{!
//		@method
//		@abstract Create a JSContext, wrapping its C API counterpart.
//		@param jsGlobalContextRef
//		@result The JSContext equivalent of the provided JSGlobalContextRef.
//		}
//
//		{!
//		@property
//		@abstract Get the C API counterpart wrapped by a JSContext.
//		@result The C API equivalent of this JSContext.
//		}
//		function JSGlobalContextRef:JSGlobalContextRef;cdecl;
//		procedure setJSGlobalContextRef(JSGlobalContextRef:JSGlobalContextRef);cdecl;
//	end;
//
//	JSContextClass=interface(Class)//JSContextRefSupport
//	['{E145428C-B005-40A2-B585-BFA1DCF99F9D}']
//		{+} function contextWithJSGlobalContextRef(jsGlobalContextRef:JSGlobalContextRef):JSContext{*};cdecl;
//	end;
//
//	TJSContext=class(TOCGenericImport<JSContextClass,JSContext>)
//	end;
//
//


{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function JSContext_FakeLoader : JSContext; cdecl; external '/System/Library/Frameworks/JavaScriptCore.framework/JavaScriptCore' name 'OBJC_CLASS_$_JSContext';
//function JSContext_FakeLoader : JSContext; cdecl; external '/System/Library/Frameworks/JavaScriptCore.framework/JavaScriptCore' name 'OBJC_CLASS_$_JSContext';
//function JSContext_FakeLoader : JSContext; cdecl; external '/System/Library/Frameworks/JavaScriptCore.framework/JavaScriptCore' name 'OBJC_CLASS_$_JSContext';
{$O+}


{$ENDIF}

end.


