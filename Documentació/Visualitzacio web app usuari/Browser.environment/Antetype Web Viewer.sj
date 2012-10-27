@STATIC;1.0;p;15;AppController.jt;15907;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;11;GDProject.ji;11;GDLibrary.ji;15;GDLookAndFeel.ji;7;NSSet.ji;9;NSArray.ji;10;GDScreen.ji;10;GDWidget.ji;10;GDCanvas.ji;17;GDImageResource.ji;12;CTGradient.ji;17;NSMutableString.ji;21;NSMutableDictionary.ji;29;GDNonBlockingOperationQueue.ji;23;GDScreenChangeManager.jt;15569;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDProject.j",YES);
objj_executeFile("GDLibrary.j",YES);
objj_executeFile("GDLookAndFeel.j",YES);
objj_executeFile("NSSet.j",YES);
objj_executeFile("NSArray.j",YES);
objj_executeFile("GDScreen.j",YES);
objj_executeFile("GDWidget.j",YES);
objj_executeFile("GDCanvas.j",YES);
objj_executeFile("GDImageResource.j",YES);
objj_executeFile("CTGradient.j",YES);
objj_executeFile("NSMutableString.j",YES);
objj_executeFile("NSMutableDictionary.j",YES);
objj_executeFile("GDNonBlockingOperationQueue.j",YES);
objj_executeFile("GDScreenChangeManager.j",YES);
var _1=0;
updateProgressBy=function(_2){
_1+=_2;
if(_1>100){
_1=100;
}
document.getElementById("progress-hook").style.width=_1+"%";
};
updateLabelDirect=function(_3){
var _4=document.getElementById("label-hook");
_4.firstChild.replaceData(0,_4.firstChild.nodeValue.length,_3);
};
updateLabel=function(_5,_6){
var _7="Loading ";
if(_5!=null){
_7+=_5;
}
if(_5!=null&&_6!=null){
_7+=" - ";
}
if(_6!=null){
_7+=_6;
}
updateLabelDirect(_7);
};
var _8="";
globalResourcesURL=function(){
return _8;
};
setGlobalResourcesURL=function(_9){
_8=_9;
};
var _a=objj_allocateClassPair(CPObject,"AppController"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("project"),new objj_ivar("toolbarItems"),new objj_ivar("canvas"),new objj_ivar("loadedResources"),new objj_ivar("firstScreenLoaded"),new objj_ivar("mainWindow")]);
objj_registerClassPair(_a);
class_addMethods(_a,[new objj_method(sel_getUid("project"),function(_c,_d){
with(_c){
return project;
}
}),new objj_method(sel_getUid("setProject:"),function(_e,_f,_10){
with(_e){
project=_10;
}
}),new objj_method(sel_getUid("preloadToolbarImages"),function(_11,_12){
with(_11){
objj_msgSend(GDProject,"imageWithFileName:size:","previousscreen.png",CGSizeMake(16,16));
objj_msgSend(GDProject,"imageWithFileName:size:","nextscreen.png",CGSizeMake(16,16));
}
}),new objj_method(sel_getUid("preloadImages"),function(_13,_14){
with(_13){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_13,sel_getUid("imageDidLoad:"),CPImageDidLoadNotification,nil);
loadedResources=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
var _15=objj_msgSend(objj_msgSend(project,"projectLibrary"),"resources");
var _16=objj_msgSend(_15,"allValues");
for(var i=0;i<objj_msgSend(_16,"count");i++){
objj_msgSend(objj_msgSend(_16,"objectAtIndex:",i),"load");
}
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(objj_msgSend(objj_msgSend(project,"projectLibrary"),"resources"),"allValues");
for(var i=0;i<objj_msgSend(_1a,"count");i++){
if(objj_msgSend(objj_msgSend(_1a,"objectAtIndex:",i),"image")==objj_msgSend(_19,"object")){
var _1b=objj_msgSend(_1a,"objectAtIndex:",i);
objj_msgSend(loadedResources,"setObject:forKey:",_1b,objj_msgSend(_1b,"identifier"));
break;
}
}
if(objj_msgSend(_1a,"count")>0&&objj_msgSend(loadedResources,"count")>=objj_msgSend(_1a,"count")){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_17,CPImageDidLoadNotification,nil);
if(firstScreenLoaded){
objj_msgSend(canvas,"setNeedsDisplay:",YES);
}
}
}
}),new objj_method(sel_getUid("buildMainWindow"),function(_1c,_1d){
with(_1c){
mainWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask);
var _1e=objj_msgSend(mainWindow,"contentView");
objj_msgSend(_1e,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(mainWindow,"setDelegate:",_1c);
objj_msgSend(mainWindow,"setAcceptsMouseMovedEvents:",YES);
objj_msgSend(mainWindow,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.8,0.8,0.8,1));
var _1f=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",objj_msgSend(_1e,"bounds"));
objj_msgSend(_1f,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_1f,"setAutohidesScrollers:",YES);
objj_msgSend(_1f,"setAutoresizesSubviews:",YES);
canvas=objj_msgSend(objj_msgSend(GDCanvas,"alloc"),"initWithFrame:",objj_msgSend(_1e,"bounds"));
objj_msgSend(_1f,"setDocumentView:",canvas);
objj_msgSend(_1e,"addSubview:",_1f);
var _20=objj_msgSend(objj_msgSend(CPToolbar,"alloc"),"initWithIdentifier:","My Toolbar");
objj_msgSend(_1c,"buildToolbarItems");
objj_msgSend(mainWindow,"setToolbar:",_20);
objj_msgSend(_20,"setDelegate:",_1c);
}
}),new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_21,_22,_23){
with(_21){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_21,sel_getUid("screenChangedNotification:"),"GDScreenChangedNotificationName",nil);
firstScreenLoaded=NO;
setGlobalResourcesURL(objj_msgSend(CPURL,"URLWithString:relativeToURL:","Resources/",objj_msgSend(CPURL,"URLWithString:",document.location.href)));
objj_msgSend(_21,"preloadToolbarImages");
var _24=document.location.href;
if(objj_msgSend(_24,"hasSuffix:","index.html")){
_24=objj_msgSend(_24,"stringByDeletingLastPathComponent");
}
var _25=objj_msgSend(objj_msgSend(_24,"lastPathComponent"),"stringByReplacingOccurrencesOfString:withString:","%20"," ");
updateLabelDirect("Loading "+_25+" ...");
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",0.5,function(){
var _26=[];
project=objj_msgSend(objj_msgSend(_21,"class"),"loadFromResourceFile:key:","project.xml","project");
updateProgressBy(10);
objj_msgSend(_21,"preloadImages");
var _27=objj_msgSend(project,"orderedScreensCount");
for(var i=0;i<_27;i++){
var _28="screen-"+i+".json";
(function(_29,i){
var _2a=objj_msgSend(CPFunctionOperation,"functionOperationWithFunction:",function(){
var _2b=objj_msgSend(GDModelObject,"loadJSONFromFile:",_29);
var _2c=objj_msgSend(GDModelObject,"fromJSONObject:inProject:",_2b,project);
objj_msgSend(objj_msgSend(project,"orderedScreens"),"insertObject:atIndex:",_2c,i);
updateProgressBy(45/_27);
});
objj_msgSend(_26,"addObject:",_2a);
})(_28,i);
}
var _2d=objj_msgSend(CPFunctionOperation,"functionOperationWithFunction:",function(){
objj_msgSend(_21,"buildMainWindow");
});
objj_msgSend(_26,"addObject:",_2d);
for(var i=0;i<_27;i++){
(function(i){
var _2e=objj_msgSend(CPFunctionOperation,"functionOperationWithFunction:",function(){
objj_msgSend(objj_msgSend(canvas,"screenChangeManager"),"cacheScreen:",objj_msgSend(objj_msgSend(project,"orderedScreens"),"objectAtIndex:",i));
updateProgressBy(45/_27);
});
objj_msgSend(_26,"addObject:",_2e);
})(i);
}
objj_msgSend(objj_msgSend(_26,"lastObject"),"setCompletionFunction:",function(){
updateLabelDirect("Opening "+_25+" ...");
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",0.2,function(){
objj_msgSend(canvas,"setScreen:",objj_msgSend(objj_msgSend(project,"orderedScreens"),"objectAtIndex:",0));
firstScreenLoaded=YES;
objj_msgSend(mainWindow,"orderFront:",_21);
},NO);
});
var _2f=objj_msgSend(objj_msgSend(GDNonBlockingOperationQueue,"alloc"),"init");
objj_msgSend(_2f,"addOperations:waitUntilFinished:",_26,NO);
},NO);
}
}),new objj_method(sel_getUid("windowDidResize:"),function(_30,_31,_32){
with(_30){
objj_msgSend(objj_msgSend(canvas,"screenChangeManager"),"windowSizeChanged");
}
}),new objj_method(sel_getUid("buildToolbarItem:selector:enumerator:"),function(_33,_34,_35,_36,_37){
with(_33){
var _38=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_35);
var _39=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,100,20));
objj_msgSend(_39,"setPullsDown:",NO);
var _3a=nil;
while((_3a=objj_msgSend(_37,"nextObject"))!=nil){
objj_msgSend(_39,"addItemWithTitle:",objj_msgSend(_3a,"name"));
}
objj_msgSend(_39,"sizeToFit");
objj_msgSend(_39,"setFrameSize:",CGSizeMake(150,objj_msgSend(_39,"frame").size.height));
objj_msgSend(_39,"setTarget:",_33);
objj_msgSend(_39,"setAction:",_36);
objj_msgSend(_38,"setMinSize:",objj_msgSend(_39,"frame").size);
objj_msgSend(_38,"setView:",_39);
return _38;
}
}),new objj_method(sel_getUid("buildToolbarItems"),function(_3b,_3c){
with(_3b){
toolbarItems=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
var _3d=objj_msgSend(objj_msgSend(project,"lookAndFeels"),"objectEnumerator");
var _3e=objj_msgSend(_3b,"buildToolbarItem:selector:enumerator:","LookAndFeel",sel_getUid("lookAndFeelChanged:"),_3d);
objj_msgSend(_3e,"setLabel:","Look&Feel");
var _3f=objj_msgSend(_3e,"view");
var _40=objj_msgSend(objj_msgSend(project,"currentLookAndFeel"),"name");
objj_msgSend(_3f,"selectItemWithTitle:",_40);
objj_msgSend(toolbarItems,"setObject:forKey:",_3e,"LookAndFeel");
var _41=objj_msgSend(objj_msgSend(project,"orderedScreens"),"objectEnumerator");
var _42=objj_msgSend(_3b,"buildToolbarItem:selector:enumerator:","Screens",sel_getUid("screenChanged:"),_41);
objj_msgSend(_42,"setLabel:","Screens");
objj_msgSend(toolbarItems,"setObject:forKey:",_42,"Screens");
var _43=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:","NextScreen");
objj_msgSend(_43,"setTarget:",_3b);
objj_msgSend(_43,"setAction:",sel_getUid("nextScreen:"));
objj_msgSend(_43,"setLabel:","Next");
var _44=objj_msgSend(GDProject,"imageWithFileName:size:","nextscreen.png",CGSizeMake(16,16));
objj_msgSend(_43,"setImage:",_44);
objj_msgSend(toolbarItems,"setObject:forKey:",_43,"NextScreen");
var _45=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:","PrevScreen");
objj_msgSend(_45,"setTarget:",_3b);
objj_msgSend(_45,"setAction:",sel_getUid("previousScreen:"));
objj_msgSend(_45,"setLabel:","Previous");
var _46=objj_msgSend(GDProject,"imageWithFileName:size:","previousscreen.png",CGSizeMake(16,16));
objj_msgSend(_45,"setImage:",_46);
objj_msgSend(toolbarItems,"setObject:forKey:",_45,"PrevScreen");
var _47=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:","Fullscreen");
var _48=objj_msgSend(GDProject,"imageWithFileName:size:","full-screen.png",CGSizeMake(16,16));
objj_msgSend(_47,"setImage:",_48);
objj_msgSend(_47,"setTarget:",_3b);
objj_msgSend(_47,"setAction:",sel_getUid("enterFullScreen:"));
objj_msgSend(_47,"setLabel:","Full Screen");
objj_msgSend(toolbarItems,"setObject:forKey:",_47,"Fullscreen");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_49,_4a,_4b){
with(_49){
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
}
}),new objj_method(sel_getUid("objectWithHash:inCollection:"),function(_4f,_50,_51,_52){
with(_4f){
var _53=objj_msgSend(_52,"objectEnumerator");
var _54=nil;
while(_54=objj_msgSend(_53,"nextObject")){
if(objj_msgSend(_54,"hash")==_51){
return _54;
}
}
return nil;
}
}),new objj_method(sel_getUid("lookAndFeelChanged:"),function(_55,_56,_57){
with(_55){
var _58=objj_msgSend(_57,"indexOfSelectedItem");
var _59=objj_msgSend(objj_msgSend(project,"lookAndFeels"),"objectAtIndex:",_58);
if(_59==nil){
return;
}
objj_msgSend(project,"setCurrentLookAndFeel:",_59);
objj_msgSend(canvas,"reloadScreen");
}
}),new objj_method(sel_getUid("screenPopUp"),function(_5a,_5b){
with(_5a){
var _5c=objj_msgSend(objj_msgSend(mainWindow,"toolbar"),"visibleItems");
for(var i=0;i<_5c.length;i++){
if(objj_msgSend(_5c[i],"itemIdentifier")==="Screens"){
return objj_msgSend(_5c[i],"view");
}
}
return nil;
}
}),new objj_method(sel_getUid("enterFullScreen:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(mainWindow,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(objj_msgSend(mainWindow,"toolbar"),"setVisible:",NO);
objj_msgSend(mainWindow,"makeFirstResponder:",canvas);
var _60=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(200,0,200,20));
objj_msgSend(_60,"setStringValue:","Press ESC to exit full screen  ");
objj_msgSend(_60,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_60,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",15));
objj_msgSend(_60,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_60,"sizeToFit");
var _61=objj_msgSend(mainWindow,"contentView");
var _62=objj_msgSend(_61,"frame").size.width;
var _63=CGRectMake(_62-objj_msgSend(_60,"frame").size.width,0,objj_msgSend(_60,"frame").size.width,objj_msgSend(_60,"frame").size.height);
objj_msgSend(_60,"setFrame:",_63);
objj_msgSend(_61,"addSubview:positioned:relativeTo:",_60,CPWindowAbove,_5d);
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",3,function(){
objj_msgSend(_60,"removeFromSuperview");
},NO);
}
}),new objj_method(sel_getUid("exitFullScreen:"),function(_64,_65,_66){
with(_64){
objj_msgSend(mainWindow,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.8,0.8,0.8,1));
objj_msgSend(objj_msgSend(mainWindow,"toolbar"),"setVisible:",YES);
}
}),new objj_method(sel_getUid("screenChanged:"),function(_67,_68,_69){
with(_67){
var _6a=objj_msgSend(_69,"indexOfSelectedItem");
var _6b=objj_msgSend(objj_msgSend(project,"orderedScreens"),"objectAtIndex:",_6a);
objj_msgSend(canvas,"setScreen:",_6b);
}
}),new objj_method(sel_getUid("nextScreen:"),function(_6c,_6d,_6e){
with(_6c){
var _6f=objj_msgSend(canvas,"screen");
var _70=objj_msgSend(objj_msgSend(project,"orderedScreens"),"indexOfObject:",_6f);
if(++_70==objj_msgSend(objj_msgSend(project,"orderedScreens"),"count")){
_70=0;
}
var _71=objj_msgSend(objj_msgSend(project,"orderedScreens"),"objectAtIndex:",_70);
objj_msgSend(canvas,"setScreen:",_71);
}
}),new objj_method(sel_getUid("previousScreen:"),function(_72,_73,_74){
with(_72){
var _75=objj_msgSend(canvas,"screen");
var _76=objj_msgSend(objj_msgSend(project,"orderedScreens"),"indexOfObject:",_75);
if(--_76<0){
_76=objj_msgSend(objj_msgSend(project,"orderedScreens"),"count")-1;
}
var _77=objj_msgSend(objj_msgSend(project,"orderedScreens"),"objectAtIndex:",_76);
objj_msgSend(canvas,"setScreen:",_77);
}
}),new objj_method(sel_getUid("screenChangedNotification:"),function(_78,_79,_7a){
with(_78){
var _7b=objj_msgSend(canvas,"screen");
var _7c=objj_msgSend(objj_msgSend(project,"orderedScreens"),"indexOfObject:",_7b);
objj_msgSend(objj_msgSend(_78,"screenPopUp"),"selectItemAtIndex:",_7c);
}
}),new objj_method(sel_getUid("toolbarDefaultItemIdentifiers:"),function(_7d,_7e,_7f){
with(_7d){
return ["LookAndFeel","Screens",CPToolbarFlexibleSpaceItemIdentifier,"PrevScreen","NextScreen","Fullscreen"];
}
}),new objj_method(sel_getUid("toolbarAllowedItemIdentifiers:"),function(_80,_81,_82){
with(_80){
return objj_msgSend(toolbarItems,"allKeys");
}
}),new objj_method(sel_getUid("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_83,_84,_85,_86,_87){
with(_83){
return objj_msgSend(toolbarItems,"objectForKey:",_86);
}
})]);
class_addMethods(_b,[new objj_method(sel_getUid("loadFromResourceFile:key:"),function(_88,_89,_8a,key){
with(_88){
var url=objj_msgSend(CPURL,"URLWithString:relativeToURL:",_8a,globalResourcesURL());
var _8b=objj_msgSend(CPURLRequest,"requestWithURL:",url);
var _8c=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_8b,nil);
CPLog("initialize keyedUnarchiver");
var _8d=objj_msgSend(objj_msgSend(CPKeyedUnarchiver,"alloc"),"initForReadingWithData:",_8c);
_8c=null;
objj_msgSend(_8d,"finishDecoding");
CPLog("start decoding");
var o=objj_msgSend(_8d,"decodeObjectForKey:",key);
return o;
}
}),new objj_method(sel_getUid("imageWithName:size:"),function(_8e,_8f,_90,_91){
with(_8e){
var url=objj_msgSend(CPURL,"URLWithString:relativeToURL:",_90,globalResourcesURL());
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(url,"path"),_91);
}
})]);
p;20;CGContextAdditions.jt;8307;@STATIC;1.0;I;15;AppKit/AppKit.jt;8268;
objj_executeFile("AppKit/AppKit.j",NO);
CGContextSetFillColorWithAlpha=function(_1,_2,_3){
CGContextSetAlpha(_1,_3);
CGContextSetFillColor(_1,objj_msgSend(_2,"colorWithAlphaComponent:",1));
};
CGContextSetStrokeColorWithAlpha=function(_4,_5,_6){
CGContextSetAlpha(_4,_6);
CGContextSetStrokeColor(_4,objj_msgSend(_5,"colorWithAlphaComponent:",1));
};
CGContextAddCounterClockwiseRect=function(_7,_8){
CGContextMoveToPoint(_7,_8.origin.x,_8.origin.y);
CGContextAddLineToPoint(_7,_8.origin.x,_8.origin.y+_8.size.height);
CGContextAddLineToPoint(_7,_8.origin.x+_8.size.width,_8.origin.y+_8.size.height);
CGContextAddLineToPoint(_7,_8.origin.x+_8.size.width,_8.origin.y);
CGContextAddLineToPoint(_7,_8.origin.x,_8.origin.y);
};
patternWithPhaseFor=function(_9,_a){
if(_a<=0||_9.length<=1){
return new Array(_9,true);
}
var _b=0;
for(var i=0;i<_9.length;i++){
_b+=_9[i];
}
while(_a>_b){
_a-=_b;
}
var _c=true;
var _d=true;
var _e=new Array();
for(var i=0;i<_9.length;i++){
if(_a<=0){
_e.push(_9[i]);
}else{
_a-=_9[i];
if(_a<=0){
_e.push((-1)*_a);
_d=_c;
}
}
_c=!_c;
}
return new Array(_e,_d);
};
outputPhaseForLength=function(_f,_10,_11){
var _12=0;
for(var i=0;i<_10.length;i++){
_12+=_10[i];
}
while(_11>_12){
_11-=_12;
}
var _13=_12-_11;
if(_f<_13){
return _f+_11;
}
var _14=_f-_13;
var _15=floorf(_14);
var _16=_14-_15;
return _15%_12+_16;
};
CGContextAddDashedArc=function(_17,x,y,_18,_19,_1a,_1b,_1c,_1d){
var lt=function(a,b){
return a<=b;
};
var gt=function(a,b){
return a>=b;
};
var _1e=function(a,b){
return Math.min(a,b);
};
var _1f=function(a,b){
return Math.max(a,b);
};
var add=function(a,b){
return a+b;
};
var _20=function(a,b){
return a-b;
};
var _21=gt;
var _22=add;
var cap=_1e;
if(_1b){
_21=lt;
_22=_20;
cap=_1f;
}
var _23=_19,_24=_1a;
if(_1b){
if(_1a>_19){
_24=_1a-2*M_PI;
}
}else{
if(_19>_1a){
_23=_19-2*M_PI;
}
}
var _25=_24;
var _26=patternWithPhaseFor(_1c,_1d);
var _27=_26[0],_28=_26[1],_29=0;
var _2a=0,_2b=true;
var _2c,len;
while(!_21(_23,_25)){
if(_29<_27.length){
len=_27[_29];
_2c=_28;
}else{
len=_1c[_2a];
_2c=_2b;
}
var _2d=len/_18;
_24=cap(_22(_23,_2d),_25);
var sa=_23;
var ea=_24;
if(sa<0){
sa+=2*M_PI;
}
if(ea<0){
ea+=2*M_PI;
}
if(_2c){
CGContextAddArc(_17,x,y,_18,sa,ea,!_1b);
}else{
CGContextMoveToPoint(_17,x+_18*Math.cos(ea),y+_18*Math.sin(ea));
}
if(_29<_27.length){
_28=!_28;
_29=_29+1;
}else{
_2b=!_2b;
_2a=(_2a+1)%_1c.length;
}
_23=_24;
}
};
CGContextAddDashedLine=function(_2e,_2f,_30,toX,toY,_31,_32){
var lt=function(a,b){
return a<=b;
};
var gt=function(a,b){
return a>=b;
};
var _33=function(a,b){
return Math.min(a,b);
};
var _34=function(a,b){
return Math.max(a,b);
};
var _35={thereYet:gt,cap:_33};
var _36={thereYet:gt,cap:_33};
if(_30-toY>0){
_36.thereYet=lt;
_36.cap=_34;
}
if(_2f-toX>0){
_35.thereYet=lt;
_35.cap=_34;
}
CGContextMoveToPoint(_2e,_2f,_30);
var _37=_2f;
var _38=_30;
var _39=0,_3a=true;
var _3b=patternWithPhaseFor(_31,_32);
var _3c=_3b[0],_3d=_3b[1],_3e=0;
var len,_3f;
var _40=Math.atan2(toY-_30,toX-_2f);
while(!(_35.thereYet(_37,toX)&&_36.thereYet(_38,toY))){
if(_3e<_3c.length){
len=_3c[_3e];
_3f=_3d;
}else{
len=_31[_39];
_3f=_3a;
}
var _41=_37;
var _42=_38;
_37=_35.cap(toX,_37+(Math.cos(_40)*len));
_38=_36.cap(toY,_38+(Math.sin(_40)*len));
if(_41==_37&&_42==_38){
break;
}
if(_3f){
CGContextAddLineToPoint(_2e,_37,_38);
}else{
CGContextMoveToPoint(_2e,_37,_38);
}
if(_3e<_3c.length){
_3d=!_3d;
_3e=_3e+1;
}else{
_3a=!_3a;
_39=(_39+1)%_31.length;
}
}
};
CGContextStrokeDashedPath=function(_43,_44,_45,_46){
if(!_43||CGPathIsEmpty(_44)){
return;
}
CGContextBeginPath(_43);
var _47=_46;
var _48=_44.start;
for(var i=0;i<_44.count;i++){
var _49=_44.elements[i];
switch(_49.type){
case kCGPathElementMoveToPoint:
CGContextMoveToPoint(_43,_49.x,_49.y);
if(i>0){
_47=0;
}
_48=CGPointMake(_49.x,_49.y);
break;
case kCGPathElementAddLineToPoint:
CGContextAddDashedLine(_43,_48.x,_48.y,_49.x,_49.y,_45,_47);
_47=outputPhaseForLength(sqrtf(powf(_49.x-_48.x,2)+powf(_49.y-_48.y,2)),_45,_47);
_48=CGPointMake(_49.x,_49.y);
break;
case kCGPathElementAddArc:
CGContextAddDashedArc(_43,_49.x,_49.y,_49.radius,_49.startAngle,_49.endAngle,_49.clockwise,_45,_47);
var _4a=_49.endAngle-_49.startAngle;
if(_4a<0){
_4a+=2*M_PI;
}
var _4b=_4a*_49.radius;
_47=outputPhaseForLength(_4b,_45,_47);
_48=CGPointMake(_49.x+cosf(_49.endAngle)*_49.radius,_49.y+sinf(_49.endAngle)*_49.radius);
break;
case kCGPathElementAddQuadCurveToPoint:
CGContextAddQuadraticCurveToPoint(_43,_49.cpx,_49.cpy,_49.x,_49.y);
_47=0;
_48=CGPointMake(_49.x,_49.y);
break;
case kCGPathElementAddCurveToPoint:
CGContextAddCurveToPoint(_43,_49.cp1x,_49.cp1y,_49.cp2x,_49.cp2y,_49.x,_49.y);
_47=0;
_48=CGPointMake(_49.x,_49.y);
break;
case kCGPathElementAddArcTo:
CGContextAddArcToPoint(_43,_49.x1,_49.y1,_49.x2,_49.y2,_49.radius);
_47=0;
break;
case kCGPathElementCloseSubpath:
CGContextClosePath(_43);
break;
}
}
CGContextStrokePath(_43);
};
CGContextDrawRadialGradient=function(_4c,_4d,_4e,_4f,_50,_51,_52){
var _53=_4d.colors,_54=_53.length,_55=_4c.createRadialGradient(_4e.x,_4e.y,_4f,_50.x,_50.y,_51);
while(_54--){
_55.addColorStop(_4d.locations[_54],to_string(_53[_54]));
}
_4c.fillStyle=_55;
_4c.fill();
};
CGContextSetRGBShadowColor=function(_56,_57){
var _58=objj_msgSend(_57,"components");
var _59=_58[3]!=1;
var _5a=(_59?"rgba(":"rgb(")+parseInt(_58[0]*255)+", "+parseInt(_58[1]*255)+", "+parseInt(_58[2]*255)+(_59?(", "+_58[3]):"")+")";
_56.shadowColor=_5a;
};
CGContextSetAntetypeTextShadow=function(_5b,_5c,_5d,_5e,_5f,_60){
var _61=_5d*(M_PI/180);
var _62=sinf(_61);
var _63=(-1)*cosf(_61);
var _64=(1/sqrtf((_62*_62)+(_63*_63)));
var _65=floorf(_62*_64*_5c);
var _66=floorf(_63*_64*_5c);
CGContextSetShadow(_5b,CGSizeMake(_65,_66),_5f);
CGContextSetRGBShadowColor(_5b,objj_msgSend(_60,"colorWithAlphaComponent:",_5e));
};
CGContextSetAntetypeDropShadow=function(_67,_68,_69,_6a,_6b,_6c){
CGContextSetAntetypeTextShadow(_67,_68,_69,_6a,_6b,_6c);
};
CGContextSetAntetypeInnerShadow=function(_6d,_6e,_6f,_70,_71,_72){
var _73=_6f*(M_PI/180);
var _74=sinf(_73);
var _75=(-1)*cosf(_73);
var _76=(1/sqrtf((_74*_74)+(_75*_75)));
var _77=floorf(_74*_76*_6e);
var _78=floorf(_75*_76*_6e);
_77=_77*(-1);
_78=_78*(-1);
CGContextSetShadow(_6d,CGSizeMake(_77,_78),_71);
CGContextSetRGBShadowColor(_6d,objj_msgSend(_72,"colorWithAlphaComponent:",_70));
};
var _79=new Array();
getClearCanvas=function(_7a){
var _7b=null;
if(_79.length>0){
_7b=_79.pop();
_7b.width=_7a.width;
_7b.height=_7a.height;
}else{
_7b=document.createElement("canvas");
_7b.width=_7a.width;
_7b.height=_7a.height;
}
return _7b;
};
returnCanvas=function(_7c){
_79.push(_7c);
};
CGContextBeginTransparencyLayer=function(_7d,_7e,_7f){
var _80=getClearCanvas(_7e.size);
var _81=_80.getContext("2d");
setupTransparencyLayerFeature(_81);
_7d.layerStack.push(_80);
_7d.contextStack.push(_81);
_7d.opacityStack.push(_7d.globalAlpha);
_7d.positionStack.push(_7e.origin);
CGContextTranslateCTM(_7d,-_7e.origin.x,-_7e.origin.y);
if(_7f!=null){
CGContextBeginPath(_81);
CGContextAddRect(_81,_7f);
CGContextClip(_81);
}
CGContextSetAlpha(_7d,1);
return _81;
};
CGContextEndTransparencyLayer=function(_82){
if(_82.layerStack.length==0){
console.log("Called CGContextEndTransparencyLayer() without matching CGContextBeginTransparencyLayer()");
return;
}
var _83=_82.layerStack[_82.layerStack.length-1];
var _84=_82.opacityStack[_82.opacityStack.length-1];
var _85=_82.positionStack[_82.positionStack.length-1];
var _86=null;
if(_82.layerStack.length==1){
_86=_82;
}else{
_86=_82.contextStack[_82.contextStack.length-2];
}
CGContextSetAlpha(_86,_84);
_86.drawImage(_83,_85.x,_85.y);
returnCanvas(_83);
_82.layerStack.pop();
_82.contextStack.pop();
_82.opacityStack.pop();
_82.positionStack.pop();
};
CGContextGetCurrentContext=function(_87){
if(_87.contextStack.length==0){
return _87;
}else{
return CGContextGetCurrentContext(_87.contextStack[_87.contextStack.length-1]);
}
};
var _88=null;
updateGlobalCurrentContext=function(){
_88=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
};
GDGetCurrentContext=function(){
return CGContextGetCurrentContext(_88);
};
setupTransparencyLayerFeature=function(_89){
if(_89.layerStack==null){
_89.layerStack=new Array();
_89.contextStack=new Array();
_89.opacityStack=new Array();
_89.positionStack=new Array();
}
};
p;23;CPEnumeratorAdditions.jt;497;@STATIC;1.0;I;25;Foundation/CPEnumerator.jt;449;
objj_executeFile("Foundation/CPEnumerator.j",NO);
var _1=objj_getClass("CPEnumerator");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPEnumerator\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("gdAllObjects"),function(_3,_4){
with(_3){
var _5=objj_msgSend(CPMutableArray,"array");
var _6=nil;
while((_6=objj_msgSend(_3,"nextObject"))!=nil){
objj_msgSend(_5,"addObject:",_6);
}
return _5;
}
})]);
p;22;CPIndexPathAdditions.jt;681;@STATIC;1.0;I;24;Foundation/CPIndexPath.jt;634;
objj_executeFile("Foundation/CPIndexPath.j",NO);
var _1=objj_getClass("CPIndexPath");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexPath\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("indexPathByRemovingFirstIndex"),function(_3,_4){
with(_3){
if(objj_msgSend(_3,"length")>1){
var _5=objj_msgSend(objj_msgSend(_3,"indexes"),"subarrayWithRange:",CPMakeRange(1,objj_msgSend(_3,"length")-1));
return objj_msgSend(objj_msgSend(_3,"class"),"indexPathWithIndexes:",_5);
}
return objj_msgSend(objj_msgSend(_3,"class"),"indexPathWithIndexes:",objj_msgSend(CPArray,"array"));
}
})]);
p;12;CTGradient.jt;3526;@STATIC;1.0;I;16;AppKit/CPColor.jI;20;Foundation/CPCoder.ji;20;CGContextAdditions.jt;3436;
objj_executeFile("AppKit/CPColor.j",NO);
objj_executeFile("Foundation/CPCoder.j",NO);
objj_executeFile("CGContextAdditions.j",YES);
var _1=objj_allocateClassPair(CPObject,"CTGradient"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("gradient")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("gradient"),function(_3,_4){
with(_3){
return gradient;
}
}),new objj_method(sel_getUid("setGradient:"),function(_5,_6,_7){
with(_5){
gradient=_7;
}
}),new objj_method(sel_getUid("initWithJSON:"),function(_8,_9,_a){
with(_8){
var _b=[];
var _c=[];
var _d=_a["count"];
var i=0;
var _e=CGColorSpaceCreateDeviceRGB();
var _f=_a["colorStops"];
while(_d--!=0){
var red=_f[i++];
var _10=_f[i++];
var _11=_f[i++];
var _12=_f[i++];
var _13=_f[i++];
if(_13>1){
_13=1;
}
if(_13<0){
_13=0;
}
var _14=CGColorCreate(_e,[red,_10,_11,_12]);
_b.push(_14);
_c.push(_13);
}
gradient=CGGradientCreateWithColors(_e,_b.reverse(),_c.reverse());
return _8;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_15,_16,_17){
with(_15){
var _18=[];
var _19=[];
var _1a=objj_msgSend(_17,"decodeIntForKey:","CTGradientElementCount");
var i=0;
var _1b=CGColorSpaceCreateDeviceRGB();
while(_1a--!=0){
var red=objj_msgSend(_17,"decodeFloatForKey:","$"+i++);
var _1c=objj_msgSend(_17,"decodeFloatForKey:","$"+i++);
var _1d=objj_msgSend(_17,"decodeFloatForKey:","$"+i++);
var _1e=objj_msgSend(_17,"decodeFloatForKey:","$"+i++);
var _1f=objj_msgSend(_17,"decodeFloatForKey:","$"+i++);
if(_1f>1){
_1f=1;
}
if(_1f<0){
_1f=0;
}
var _20=CGColorCreate(_1b,[red,_1c,_1d,_1e]);
_18.push(_20);
_19.push(_1f);
}
gradient=CGGradientCreateWithColors(_1b,_18.reverse(),_19.reverse());
return _15;
}
}),new objj_method(sel_getUid("fillRect:angle:"),function(_21,_22,_23,_24){
with(_21){
var _25=GDGetCurrentContext();
var x,y;
var _26,_27,_28;
var _29;
var _2a,_2b;
var _2c=_24*M_PI/180;
if(fabsf(tan(_2c))<=1){
x=NSWidth(_23);
y=NSHeight(_23);
_26=sin(_2c);
_27=cos(_2c);
_28=tan(_2c);
_29=x/fabsf(_27)+(y-x*fabsf(_28))*fabsf(_26);
_2a=_29*_27/2;
_2b=_29*_26/2;
}else{
x=NSHeight(_23);
y=NSWidth(_23);
_26=sin(_2c-90*M_PI/180);
_27=cos(_2c-90*M_PI/180);
_28=tan(_2c-90*M_PI/180);
_29=x/fabsf(_27)+(y-x*fabsf(_28))*fabsf(_26);
_2a=-_29*_26/2;
_2b=_29*_27/2;
}
var _2d=CGPointMake(NSMidX(_23)-_2a,NSMidY(_23)-_2b);
var _2e=CGPointMake(NSMidX(_23)+_2a,NSMidY(_23)+_2b);
CGContextBeginPath(_25);
CGContextAddRect(_25,_23);
CGContextClosePath(_25);
CGContextDrawLinearGradient(_25,gradient,_2d,_2e,0);
}
}),new objj_method(sel_getUid("radialFillRect:"),function(_2f,_30,_31){
with(_2f){
var _32=GDGetCurrentContext();
CGContextBeginPath(_32);
CGContextAddRect(_32,_31);
CGContextClosePath(_32);
var _33,_34;
var _35,_36;
_33=_34=CGPointMake(NSMidX(_31),NSMidY(_31));
_35=0;
if(NSHeight(_31)>NSWidth(_31)){
_36=NSHeight(_31)/2;
}else{
_36=NSWidth(_31)/2;
}
CGContextDrawRadialGradient(_32,gradient,_33,_35,_34,_36,0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("unifiedDarkGradient"),function(_37,_38){
with(_37){
var _39=objj_msgSend(objj_msgSend(_37,"alloc"),"init");
var _3a=CGColorSpaceCreateDeviceRGB();
var _3b=CGGradientCreateWithColors(_3a,[CGColorCreate(_3a,[0.68,0.68,0.68,1]),CGColorCreate(_3a,[0.83,0.83,0.83,1])],[0,1]);
objj_msgSend(_39,"setGradient:",_3b);
return _39;
}
}),new objj_method(sel_getUid("gradientFromJSON:"),function(_3c,_3d,_3e){
with(_3c){
return objj_msgSend(objj_msgSend(_3c,"alloc"),"initWithJSON:",_3e);
}
})]);
p;18;GDAbstractHandle.jt;3447;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;GDRenderObject.jt;3359;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDRenderObject.j",YES);
var _1=objj_allocateClassPair(GDRenderObject,"GDAbstractHandle"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("owner"),new objj_ivar("hitZone"),new objj_ivar("projectController"),new objj_ivar("startPoint")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithOwner:screenChangeManager:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDAbstractHandle").super_class},"initWithFigure:screenChangeManager:",nil,_6);
if(_3==nil){
return nil;
}
owner=objj_msgSend(_5,"retain");
return _3;
}
}),new objj_method(sel_getUid("isHandle"),function(_7,_8){
with(_7){
return YES;
}
}),new objj_method(sel_getUid("isSelectable"),function(_9,_a){
with(_9){
return NO;
}
}),new objj_method(sel_getUid("isMovable"),function(_b,_c){
with(_b){
return YES;
}
}),new objj_method(sel_getUid("isDropTarget"),function(_d,_e){
with(_d){
return NO;
}
}),new objj_method(sel_getUid("updateBounds"),function(_f,_10){
with(_f){
}
}),new objj_method(sel_getUid("updateHitZone"),function(_11,_12){
with(_11){
}
}),new objj_method(sel_getUid("handleAtPoint:"),function(_13,_14,p){
with(_13){
if(CGRectContainsPoint(objj_msgSend(_13,"hitZone"),p)){
return _13;
}
return nil;
}
}),new objj_method(sel_getUid("cursor"),function(_15,_16){
with(_15){
return objj_msgSend(CPCursor,"crosshairCursor");
}
}),new objj_method(sel_getUid("setBounds:"),function(_17,_18,r){
with(_17){
bounds=r;
}
}),new objj_method(sel_getUid("bounds"),function(_19,_1a){
with(_19){
return bounds;
}
}),new objj_method(sel_getUid("setHitZone:"),function(_1b,_1c,r){
with(_1b){
hitZone=r;
}
}),new objj_method(sel_getUid("hitZone"),function(_1d,_1e){
with(_1d){
return hitZone;
}
}),new objj_method(sel_getUid("fullBounds"),function(_1f,_20){
with(_1f){
return objj_msgSend(_1f,"bounds");
}
}),new objj_method(sel_getUid("translateBy:"),function(_21,_22,p){
with(_21){
var _23=CGRectOffset(objj_msgSend(_21,"bounds"),p.x,p.y);
objj_msgSend(_21,"setBounds:",_23);
}
}),new objj_method(sel_getUid("mouseDraggedToPoint:constrained:centered:originalBounds:guideCoordinator:"),function(_24,_25,p,_26,_27,_28,_29){
with(_24){
}
}),new objj_method(sel_getUid("drawRect:atScale:"),function(_2a,_2b,_2c,_2d){
with(_2a){
}
}),new objj_method(sel_getUid("customChangeCommand"),function(_2e,_2f){
with(_2e){
return nil;
}
}),new objj_method(sel_getUid("setProjectController:"),function(_30,_31,_32){
with(_30){
if(_32==projectController){
return;
}
objj_msgSend(projectController,"release");
projectController=_32;
objj_msgSend(projectController,"retain");
}
}),new objj_method(sel_getUid("owner"),function(_33,_34){
with(_33){
return owner;
}
}),new objj_method(sel_getUid("actuallySelectedCell"),function(_35,_36){
with(_35){
return objj_msgSend(_35,"owner");
}
}),new objj_method(sel_getUid("startDragAtPoint:"),function(_37,_38,p){
with(_37){
startPoint=p;
}
}),new objj_method(sel_getUid("calculateTranslationForPoint:"),function(_39,_3a,p){
with(_39){
return CGPointMake(p.x-startPoint.x,p.y-startPoint.y);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("handleSize"),function(_3b,_3c){
with(_3b){
return 4;
}
}),new objj_method(sel_getUid("hitZoneSize"),function(_3d,_3e){
with(_3d){
return 8;
}
})]);
p;10;GDAction.jt;5598;@STATIC;1.0;i;15;GDModelObject.jt;5559;
objj_executeFile("GDModelObject.j",YES);
var _1=objj_allocateClassPair(GDModelObject,"GDAction"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("eventHandler"),new objj_ivar("screenChangeManager")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("eventHandler"),function(_3,_4){
with(_3){
return eventHandler;
}
}),new objj_method(sel_getUid("setEventHandler:"),function(_5,_6,_7){
with(_5){
eventHandler=_7;
}
}),new objj_method(sel_getUid("screenChangeManager"),function(_8,_9){
with(_8){
return screenChangeManager;
}
}),new objj_method(sel_getUid("setScreenChangeManager:"),function(_a,_b,_c){
with(_a){
screenChangeManager=_c;
}
}),new objj_method(sel_getUid("execute"),function(_d,_e){
with(_d){
}
}),new objj_method(sel_getUid("vetoAutomaticStateChange"),function(_f,_10){
with(_f){
return NO;
}
})]);
var _1=objj_allocateClassPair(GDAction,"GDGotoScreenAction"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("screen"),new objj_ivar("jsonDict"),new objj_ivar("project")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initFromJSONObject:inProject:"),function(_11,_12,_13,_14){
with(_11){
_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("GDGotoScreenAction").super_class},"initFromJSONObject:inProject:",_13,_14);
if(_11==nil){
return nil;
}
jsonDict=_13;
project=_14;
return _11;
}
}),new objj_method(sel_getUid("execute"),function(_15,_16){
with(_15){
if(screen===nil){
if(jsonDict.screenIndex>=0&&jsonDict.screenIndex<objj_msgSend(objj_msgSend(project,"orderedScreens"),"count")){
screen=objj_msgSend(objj_msgSend(project,"orderedScreens"),"objectAtIndex:",jsonDict.screenIndex);
}
}
if(screen!=nil){
objj_msgSend(screenChangeManager,"setScreen:",screen);
}
}
})]);
var _1=objj_allocateClassPair(GDAction,"GDTargetCellAction"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("targetCell"),new objj_ivar("jsonDict"),new objj_ivar("project")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initFromJSONObject:inProject:"),function(_17,_18,_19,_1a){
with(_17){
_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("GDTargetCellAction").super_class},"initFromJSONObject:inProject:",_19,_1a);
if(_17==nil){
return nil;
}
jsonDict=_19;
project=_1a;
return _17;
}
}),new objj_method(sel_getUid("targetCell"),function(_1b,_1c){
with(_1b){
if(targetCell==nil){
var _1d=jsonDict.indexPathString.split(",");
var _1e=objj_msgSend(CPIndexPath,"indexPathWithIndexes:",_1d);
var _1f=nil;
if(jsonDict.screenIndex>=0&&jsonDict.screenIndex<objj_msgSend(objj_msgSend(project,"orderedScreens"),"count")){
_1f=objj_msgSend(objj_msgSend(project,"orderedScreens"),"objectAtIndex:",jsonDict.screenIndex);
}
targetCell=objj_msgSend(_1f,"figureWithIndexPath:",_1e);
}
return targetCell;
}
})]);
var _1=objj_allocateClassPair(GDTargetCellAction,"GDChangeStateAction"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("state")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initFromJSONObject:inProject:"),function(_20,_21,_22,_23){
with(_20){
_20=objj_msgSendSuper({receiver:_20,super_class:objj_getClass("GDChangeStateAction").super_class},"initFromJSONObject:inProject:",_22,_23);
if(_20==nil){
return nil;
}
state=objj_msgSend(_23,"stateWithIdentifier:",_22.state);
return _20;
}
}),new objj_method(sel_getUid("execute"),function(_24,_25){
with(_24){
if(objj_msgSend(_24,"targetCell")==nil){
return;
}
if(state==nil){
return;
}
objj_msgSend(screenChangeManager,"updateRenderObjectForWidgetInstance:loadValuesForState:",objj_msgSend(_24,"targetCell"),state);
}
})]);
var _1=objj_allocateClassPair(GDTargetCellAction,"GDToggleStateAction"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("firstState"),new objj_ivar("secondState")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initFromJSONObject:inProject:"),function(_26,_27,_28,_29){
with(_26){
_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("GDToggleStateAction").super_class},"initFromJSONObject:inProject:",_28,_29);
if(_26==nil){
return nil;
}
firstState=objj_msgSend(_29,"stateWithIdentifier:",_28.firstState);
secondState=objj_msgSend(_29,"stateWithIdentifier:",_28.secondState);
return _26;
}
}),new objj_method(sel_getUid("execute"),function(_2a,_2b){
with(_2a){
if(objj_msgSend(_2a,"targetCell")==nil){
return;
}
var _2c=objj_msgSend(objj_msgSend(screenChangeManager,"renderObjectForFigure:",objj_msgSend(_2a,"targetCell")),"currentState");
if(_2c==nil){
return;
}
var _2d=nil;
if(objj_msgSend(_2c,"isEqual:",firstState)){
_2d=secondState;
}else{
_2d=firstState;
}
if(_2d!=nil){
objj_msgSend(screenChangeManager,"updateRenderObjectForWidgetInstance:loadValuesForState:",objj_msgSend(_2a,"targetCell"),_2d);
}
}
}),new objj_method(sel_getUid("vetoAutomaticStateChange"),function(_2e,_2f){
with(_2e){
return YES;
}
})]);
var _1=objj_allocateClassPair(GDTargetCellAction,"GDHideAction"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("execute"),function(_30,_31){
with(_30){
var _32=objj_msgSend(screenChangeManager,"renderObjectForFigure:",objj_msgSend(_30,"targetCell"));
objj_msgSend(_32,"setVisibility:",GDVisibilityCollapsed);
}
})]);
var _1=objj_allocateClassPair(GDTargetCellAction,"GDShowAction"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("execute"),function(_33,_34){
with(_33){
var _35=objj_msgSend(screenChangeManager,"renderObjectForFigure:",objj_msgSend(_33,"targetCell"));
objj_msgSend(_35,"setVisibility:",GDVisibilityVisible);
}
})]);
p;19;GDAffineTransform.jt;2117;@STATIC;1.0;I;21;Foundation/CPObject.ji;20;CGContextAdditions.jt;2047;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CGContextAdditions.j",YES);
var _1=objj_allocateClassPair(CPObject,"GDAffineTransform"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("transform")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDAffineTransform").super_class},"init");
if(_3==nil){
return nil;
}
transform=CGAffineTransformMakeIdentity();
return _3;
}
}),new objj_method(sel_getUid("copy"),function(_5,_6){
with(_5){
var _7=objj_msgSend(objj_msgSend(objj_msgSend(_5,"class"),"alloc"),"init");
objj_msgSend(_7,"setTransform:",CGAffineTransformMakeCopy(transform));
return _7;
}
}),new objj_method(sel_getUid("setTransform:"),function(_8,_9,_a){
with(_8){
transform=_a;
}
}),new objj_method(sel_getUid("cgTransform"),function(_b,_c){
with(_b){
return transform;
}
}),new objj_method(sel_getUid("invert"),function(_d,_e){
with(_d){
transform=CGAffineTransformInvert(transform);
}
}),new objj_method(sel_getUid("appendTransform:"),function(_f,_10,_11){
with(_f){
transform=CGAffineTransformConcat(objj_msgSend(_11,"cgTransform"),transform);
}
}),new objj_method(sel_getUid("prependTransform:"),function(_12,_13,_14){
with(_12){
transform=CGAffineTransformConcat(transform,objj_msgSend(_14,"cgTransform"));
}
}),new objj_method(sel_getUid("translateXBy:yBy:"),function(_15,_16,x,y){
with(_15){
transform=CGAffineTransformTranslate(transform,x,y);
}
}),new objj_method(sel_getUid("transformPoint:"),function(_17,_18,p){
with(_17){
return CGPointApplyAffineTransform(p,transform);
}
}),new objj_method(sel_getUid("concatToContext:"),function(_19,_1a,_1b){
with(_19){
CGContextConcatCTM(_1b,transform);
}
}),new objj_method(sel_getUid("concat"),function(_1c,_1d){
with(_1c){
objj_msgSend(_1c,"concatToContext:",GDGetCurrentContext());
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("transform"),function(_1e,_1f){
with(_1e){
return objj_msgSend(objj_msgSend(_1e,"alloc"),"init");
}
})]);
p;25;GDAlignmentLayoutPolicy.jt;2488;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;GDLayoutPolicy.ji;19;GDLayoutConstants.ji;20;GDCellRenderObject.ji;16;GDRenderObject.jt;2330;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDLayoutPolicy.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDRenderObject.j",YES);
var _1=objj_allocateClassPair(GDLayoutPolicy,"GDAlignmentLayoutPolicy"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("calculateContentSizeOfAdaptor:"),function(_3,_4,_5){
with(_3){
var _6=0;
var _7=nil;
var _8=objj_msgSend(objj_msgSend(_5,"nonActiveComponents"),"objectEnumerator");
while(_7=objj_msgSend(_8,"nextObject")){
if(objj_msgSend(_7,"resizingMode")!=GDFlexResizing){
_6=fmaxf(_6,objj_msgSend(_7,"fullSize"));
}else{
_6=fmaxf(_6,objj_msgSend(_7,"minimumSize")+objj_msgSend(_7,"margin"));
}
}
return _6;
}
}),new objj_method(sel_getUid("resizeComponentsOfAdaptor:"),function(_9,_a,_b){
with(_9){
objj_msgSendSuper({receiver:_9,super_class:objj_getClass("GDAlignmentLayoutPolicy").super_class},"resizeComponentsOfAdaptor:",_b);
var _c=nil;
var _d=objj_msgSend(objj_msgSend(_b,"nonActiveComponents"),"objectEnumerator");
while(_c=objj_msgSend(_d,"nextObject")){
if(objj_msgSend(_c,"resizingMode")==GDFlexResizing){
objj_msgSend(_c,"setSize:",(objj_msgSend(_b,"innerSize")-objj_msgSend(_c,"margin"))*(objj_msgSend(_c,"flexPercentage")/100));
}
}
}
}),new objj_method(sel_getUid("alignComponentsOfAdaptor:"),function(_e,_f,_10){
with(_e){
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("GDAlignmentLayoutPolicy").super_class},"alignComponentsOfAdaptor:",_10);
var _11=nil;
var _12=objj_msgSend(objj_msgSend(_10,"nonActiveComponents"),"objectEnumerator");
while(_11=objj_msgSend(_12,"nextObject")){
switch(objj_msgSend(_10,"alignment")){
case GDCenterAlignment:
objj_msgSend(_11,"setFullOrigin:",objj_msgSend(_10,"firstPadding")+(objj_msgSend(_10,"innerSize")-objj_msgSend(_11,"fullSize"))/2);
break;
case GDLeftAlignment:
objj_msgSend(_11,"setFullOrigin:",objj_msgSend(_10,"firstPadding"));
break;
case GDRightAlignment:
objj_msgSend(_11,"setFullOrigin:",objj_msgSend(_10,"firstPadding")+objj_msgSend(_10,"innerSize")-objj_msgSend(_11,"fullSize"));
break;
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("layoutPolicyCode"),function(_13,_14){
with(_13){
return GDAlignmentLayoutPolicyCode;
}
})]);
p;19;GDBoxLayoutPolicy.jt;3916;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;GDLayoutPolicy.ji;20;GDCellRenderObject.ji;19;GDLayoutConstants.jt;3779;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDLayoutPolicy.j",YES);
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
var _1=objj_allocateClassPair(GDLayoutPolicy,"GDBoxLayoutPolicy"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("startingOriginForAdaptor:"),function(_3,_4,_5){
with(_3){
var _6=0;
var _7=nil;
var _8=objj_msgSend(objj_msgSend(_5,"nonActiveComponents"),"objectEnumerator");
while(_7=objj_msgSend(_8,"nextObject")){
_6+=objj_msgSend(_7,"fullSize");
}
switch(objj_msgSend(_5,"alignment")){
case GDCenterAlignment:
return objj_msgSend(_5,"firstPadding")+((objj_msgSend(_5,"innerSize")-_6)/2);
case GDLeftAlignment:
return objj_msgSend(_5,"firstPadding");
case GDRightAlignment:
return objj_msgSend(_5,"firstPadding")+(objj_msgSend(_5,"innerSize")-_6);
default:
return 0;
}
}
}),new objj_method(sel_getUid("calculateContentSizeOfPrimaryAdaptor:"),function(_9,_a,_b){
with(_9){
var _c=0;
var _d=nil;
var _e=objj_msgSend(objj_msgSend(_b,"nonActiveComponents"),"objectEnumerator");
while(_d=objj_msgSend(_e,"nextObject")){
if(objj_msgSend(_d,"resizingMode")!=GDFlexResizing){
_c+=objj_msgSend(_d,"fullSize");
}else{
_c+=objj_msgSend(_d,"minimumSize")+objj_msgSend(_d,"margin");
}
}
return _c;
}
}),new objj_method(sel_getUid("resizeComponentsOfPrimaryAdaptor:"),function(_f,_10,_11){
with(_f){
var _12=objj_msgSend(_11,"innerSize");
var _13=objj_msgSend(CPMutableArray,"array");
var _14=nil;
var _15=objj_msgSend(objj_msgSend(_11,"nonActiveComponents"),"objectEnumerator");
while(_14=objj_msgSend(_15,"nextObject")){
if(objj_msgSend(_14,"resizingMode")!=GDFlexResizing){
_12-=objj_msgSend(_14,"fullSize");
}else{
objj_msgSend(_13,"addObject:",_14);
}
}
objj_msgSend(_f,"distributeFlexSize:onFlexAdaptors:",_12,_13);
}
}),new objj_method(sel_getUid("alignComponentsOfPrimaryAdaptor:"),function(_16,_17,_18){
with(_16){
var _19=objj_msgSend(_16,"startingOriginForAdaptor:",_18);
var _1a=nil;
var _1b=objj_msgSend(objj_msgSend(_18,"nonActiveComponents"),"objectEnumerator");
while(_1a=objj_msgSend(_1b,"nextObject")){
objj_msgSend(_1a,"setFullOrigin:",_19);
_19+=objj_msgSend(_1a,"fullSize");
}
}
}),new objj_method(sel_getUid("calculateContentSizeOfSecondaryAdaptor:"),function(_1c,_1d,_1e){
with(_1c){
var _1f=0;
var _20=nil;
var _21=objj_msgSend(objj_msgSend(_1e,"nonActiveComponents"),"objectEnumerator");
while(_20=objj_msgSend(_21,"nextObject")){
if(objj_msgSend(_20,"resizingMode")!=GDFlexResizing){
_1f=fmaxf(_1f,objj_msgSend(_20,"fullSize"));
}else{
_1f=fmaxf(_1f,objj_msgSend(_20,"minimumSize")+objj_msgSend(_20,"margin"));
}
}
return _1f;
}
}),new objj_method(sel_getUid("resizeComponentsOfSecondaryAdaptor:"),function(_22,_23,_24){
with(_22){
var _25=nil;
var _26=objj_msgSend(objj_msgSend(_24,"nonActiveComponents"),"objectEnumerator");
while(_25=objj_msgSend(_26,"nextObject")){
if(objj_msgSend(_25,"resizingMode")==GDFlexResizing){
objj_msgSend(_25,"setFullSize:",objj_msgSend(_24,"innerSize"));
}
}
}
}),new objj_method(sel_getUid("alignComponentsOfSecondaryAdaptor:"),function(_27,_28,_29){
with(_27){
var _2a=nil;
var _2b=objj_msgSend(objj_msgSend(_29,"nonActiveComponents"),"objectEnumerator");
while(_2a=objj_msgSend(_2b,"nextObject")){
switch(objj_msgSend(_29,"alignment")){
case GDCenterAlignment:
objj_msgSend(_2a,"setFullOrigin:",objj_msgSend(_29,"firstPadding")+(objj_msgSend(_29,"innerSize")-objj_msgSend(_2a,"fullSize"))/2);
break;
case GDLeftAlignment:
objj_msgSend(_2a,"setFullOrigin:",objj_msgSend(_29,"firstPadding"));
break;
case GDRightAlignment:
objj_msgSend(_2a,"setFullOrigin:",objj_msgSend(_29,"firstPadding")+objj_msgSend(_29,"innerSize")-objj_msgSend(_2a,"fullSize"));
break;
}
}
}
})]);
p;10;GDCanvas.jt;4153;@STATIC;1.0;I;15;AppKit/CPView.ji;10;GDScreen.ji;20;GDCellRenderObject.ji;23;GDScreenChangeManager.ji;8;GDTool.ji;11;GDRunTool.ji;30;GDPresentationHandleDragTool.jt;3983;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("GDScreen.j",YES);
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDScreenChangeManager.j",YES);
objj_executeFile("GDTool.j",YES);
objj_executeFile("GDRunTool.j",YES);
objj_executeFile("GDPresentationHandleDragTool.j",YES);
var _1=objj_allocateClassPair(CPView,"GDCanvas"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("screenChangeManager"),new objj_ivar("currentTool"),new objj_ivar("handleDragTool"),new objj_ivar("runTool")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("screenChangeManager"),function(_3,_4){
with(_3){
return screenChangeManager;
}
}),new objj_method(sel_getUid("setScreenChangeManager:"),function(_5,_6,_7){
with(_5){
screenChangeManager=_7;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("GDCanvas").super_class},"initWithFrame:",_a);
if(_8==nil){
return nil;
}
screenChangeManager=objj_msgSend(objj_msgSend(GDScreenChangeManager,"alloc"),"initWithView:",_8);
runTool=objj_msgSend(objj_msgSend(GDRunTool,"alloc"),"initWithView:",_8);
handleDragTool=objj_msgSend(objj_msgSend(GDPresentationHandleDragTool,"alloc"),"initWithView:",_8);
currentTool=runTool;
return _8;
}
}),new objj_method(sel_getUid("setScreen:"),function(_b,_c,_d){
with(_b){
objj_msgSend(screenChangeManager,"setScreen:",_d);
}
}),new objj_method(sel_getUid("screen"),function(_e,_f){
with(_e){
return objj_msgSend(screenChangeManager,"screen");
}
}),new objj_method(sel_getUid("setCurrentTool:"),function(_10,_11,_12){
with(_10){
currentTool=_12;
}
}),new objj_method(sel_getUid("reloadScreen"),function(_13,_14){
with(_13){
objj_msgSend(screenChangeManager,"reloadScreen");
}
}),new objj_method(sel_getUid("noteUpdateRect:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"setNeedsDisplayInRect:",_17);
}
}),new objj_method(sel_getUid("drawRect:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(screenChangeManager,"drawRect:",_1a);
}
}),new objj_method(sel_getUid("handleAtPoint:"),function(_1b,_1c,p){
with(_1b){
return objj_msgSend(screenChangeManager,"handleAtPoint:",p);
}
}),new objj_method(sel_getUid("renderObjectAtPoint:"),function(_1d,_1e,p){
with(_1d){
return objj_msgSend(screenChangeManager,"renderObjectAtPoint:",p);
}
}),new objj_method(sel_getUid("allRenderObjectsAtPoint:"),function(_1f,_20,p){
with(_1f){
return objj_msgSend(screenChangeManager,"allRenderObjectsAtPoint:",p);
}
}),new objj_method(sel_getUid("startDragWithHandle:atPoint:"),function(_21,_22,_23,_24){
with(_21){
objj_msgSend(_21,"setCurrentTool:",handleDragTool);
objj_msgSend(handleDragTool,"startWithHandle:atPoint:lastTool:",_23,_24,runTool);
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_25,_26){
with(_25){
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_27,_28,_29){
with(_27){
var _2a=objj_msgSend(GDEvent,"eventWithCocoaEvent:inView:",_29,_27);
objj_msgSend(currentTool,"mouseDown:",_2a);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(GDEvent,"eventWithCocoaEvent:inView:",_2d,_2b);
objj_msgSend(currentTool,"mouseUp:",_2e);
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_2f,_30,_31){
with(_2f){
var _32=objj_msgSend(GDEvent,"eventWithCocoaEvent:inView:",_31,_2f);
objj_msgSend(currentTool,"mouseMoved:",_32);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(GDEvent,"eventWithCocoaEvent:inView:",_35,_33);
objj_msgSend(currentTool,"mouseDragged:",_36);
}
}),new objj_method(sel_getUid("keyUp:"),function(_37,_38,_39){
with(_37){
var _3a=objj_msgSend(GDEvent,"eventWithCocoaEvent:inView:",_39,_37);
objj_msgSend(currentTool,"keyUp:",_3a);
}
}),new objj_method(sel_getUid("keyDown:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=objj_msgSend(GDEvent,"eventWithCocoaEvent:inView:",_3d,_3b);
objj_msgSend(currentTool,"keyDown:",_3e);
}
})]);
p;20;GDCellRenderObject.jt;120083;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;GDRenderObject.ji;18;NSArrayAdditions.ji;19;GDLayoutConstants.ji;25;GDAlignmentLayoutPolicy.ji;29;GDHorizontalBoxLayoutPolicy.ji;27;GDVerticalBoxLayoutPolicy.ji;21;GDFixedLayoutPolicy.ji;29;GDHorizontalBoxLayoutPolicy.ji;23;GDRenderObjectPainter.ji;20;GDTextRenderObject.ji;22;GDWidgetInstanceCell.ji;20;CGContextAdditions.ji;17;GDLayoutAdaptor.ji;22;GDLayoutRenderObject.jt;119636;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDRenderObject.j",YES);
objj_executeFile("NSArrayAdditions.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("GDAlignmentLayoutPolicy.j",YES);
objj_executeFile("GDHorizontalBoxLayoutPolicy.j",YES);
objj_executeFile("GDVerticalBoxLayoutPolicy.j",YES);
objj_executeFile("GDFixedLayoutPolicy.j",YES);
objj_executeFile("GDHorizontalBoxLayoutPolicy.j",YES);
objj_executeFile("GDRenderObjectPainter.j",YES);
objj_executeFile("GDTextRenderObject.j",YES);
objj_executeFile("GDWidgetInstanceCell.j",YES);
objj_executeFile("CGContextAdditions.j",YES);
objj_executeFile("GDLayoutAdaptor.j",YES);
objj_executeFile("GDLayoutRenderObject.j",YES);
GDBorderOverlap=4;
GDBorderTypeDottedFill=1;
GDBorderTypeDottedSpace=2;
GDBorderTypeDashedFill=5;
GDBorderTypeDashedSpace=3;
GDMaximumCellSizeForShadow=9000000;
GDDropShadowLayerOverlap=50;
outputPhaseForBorder=function(_1,_2,_3,_4){
var _5=0;
if(_1==GDBorderTypeDashed){
_5=outputPhaseForLength(_3,new Array(_2*GDBorderTypeDashedFill,_2*GDBorderTypeDashedSpace),_4);
}
if(_1==GDBorderTypeDotted){
_5=outputPhaseForLength(_3,new Array(_2*GDBorderTypeDottedFill,_2*GDBorderTypeDottedSpace),_4);
}
return _5;
};
PIXEL_FUDGE_FACTOR=0.5;
propertiesWithTheSameName=["isSelectable","rotationAngle","marginTop","marginBottom","marginLeft","marginRight","paddingTop","paddingLeft","paddingRight","paddingBottom","borderTopWidth","borderBottomWidth","borderLeftWidth","borderRightWidth","borderTopColor","borderRightColor","borderBottomColor","borderLeftColor","cornerRadiusTopLeft","cornerRadiusTopRight","cornerRadiusBottomRight","cornerRadiusBottomLeft","verticalAlignment","horizontalAlignment","horizontalResizing","verticalResizing","minimumWidth","maximumWidth","minimumHeight","maximumHeight","flexWidthPercentage","flexHeightPercentage","isContentClipped","isDropTarget","opacity","dropShadow","dropShadowAngle","dropShadowSize","dropShadowOffset","dropShadowBlur","dropShadowOpacity","dropShadowColor","innerShadow","innerShadowAngle","innerShadowOffset","innerShadowBlur","innerShadowOpacity","innerShadowColor","activeLayout","activeHorizontalAlignment","activeVerticalAlignment","isDrawingReverted","borderGradient","borderGradientFill","borderGradientAngle","borderGradientIsRadial","borderTopType","borderBottomType","borderLeftType","borderRightType","isDrawingAboveAll","drawingIndex"];
textProperties=["textAttributedString","textColor","textAntialias","textFont","textHorizontalAlignment","textVerticalAlignment","textWordWrap","textShadow","textShadowOffset","textShadowOpacity","textShadowAngle","textShadowBlur","textShadowColor","textLineHeight","textLineHeightMultiply"];
var _6=objj_allocateClassPair(GDLayoutRenderObject,"GDCellRenderObject"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("orderedComponents"),new objj_ivar("marginTop"),new objj_ivar("marginBottom"),new objj_ivar("marginLeft"),new objj_ivar("marginRight"),new objj_ivar("paddingTop"),new objj_ivar("paddingBottom"),new objj_ivar("paddingLeft"),new objj_ivar("paddingRight"),new objj_ivar("borderTopWidth"),new objj_ivar("borderLeftWidth"),new objj_ivar("borderBottomWidth"),new objj_ivar("borderRightWidth"),new objj_ivar("cornerRadiusTopLeft"),new objj_ivar("cornerRadiusTopRight"),new objj_ivar("cornerRadiusBottomLeft"),new objj_ivar("cornerRadiusBottomRight"),new objj_ivar("minimumWidth"),new objj_ivar("maximumWidth"),new objj_ivar("minimumHeight"),new objj_ivar("maximumHeight"),new objj_ivar("rotationAngle"),new objj_ivar("flexHeightPercentage"),new objj_ivar("flexWidthPercentage"),new objj_ivar("horizontalResizing"),new objj_ivar("verticalResizing"),new objj_ivar("opacity"),new objj_ivar("horizontalAlignment"),new objj_ivar("verticalAlignment"),new objj_ivar("background"),new objj_ivar("borderBottomColor"),new objj_ivar("borderLeftColor"),new objj_ivar("borderRightColor"),new objj_ivar("borderTopColor"),new objj_ivar("dropShadow"),new objj_ivar("dropShadowAngle"),new objj_ivar("dropShadowSize"),new objj_ivar("dropShadowOffset"),new objj_ivar("dropShadowBlur"),new objj_ivar("dropShadowOpacity"),new objj_ivar("dropShadowColor"),new objj_ivar("innerShadow"),new objj_ivar("innerShadowAngle"),new objj_ivar("innerShadowOffset"),new objj_ivar("innerShadowBlur"),new objj_ivar("innerShadowOpacity"),new objj_ivar("innerShadowColor"),new objj_ivar("borderGradient"),new objj_ivar("borderGradientFill"),new objj_ivar("borderGradientAngle"),new objj_ivar("borderGradientIsRadial"),new objj_ivar("borderTopType"),new objj_ivar("borderBottomType"),new objj_ivar("borderLeftType"),new objj_ivar("borderRightType"),new objj_ivar("isDrawingReverted"),new objj_ivar("isDrawingAboveAll"),new objj_ivar("drawingIndex"),new objj_ivar("activeLayout"),new objj_ivar("activeHorizontalAlignment"),new objj_ivar("activeVerticalAlignment"),new objj_ivar("isContentClipped"),new objj_ivar("isDropTarget"),new objj_ivar("layoutPolicy"),new objj_ivar("textRenderObject"),new objj_ivar("needsHorizontalLayout"),new objj_ivar("needsVerticalLayout"),new objj_ivar("needsPassOnHorizontalLayout"),new objj_ivar("needsPassOnVerticalLayout"),new objj_ivar("cornerRadiusTopLeftAdjusted"),new objj_ivar("cornerRadiusTopRightAdjusted"),new objj_ivar("cornerRadiusBottomLeftAdjusted"),new objj_ivar("cornerRadiusBottomRightAdjusted"),new objj_ivar("borderLeftWidthAdjusted"),new objj_ivar("borderRightWidthAdjusted"),new objj_ivar("borderTopWidthAdjusted"),new objj_ivar("borderBottomWidthAdjusted"),new objj_ivar("currentState"),new objj_ivar("orderedDisplayComponentsCache"),new objj_ivar("orderedDrawingComponentsCache"),new objj_ivar("needsDisplayComponentsUpdate"),new objj_ivar("needsDrawingComponentsUpdate")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("init"),function(_8,_9){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("GDCellRenderObject").super_class},"init");
if(_8==nil){
return nil;
}
marginTop=0;
marginLeft=0;
marginBottom=0;
marginRight=0;
paddingLeft=0;
paddingRight=0;
paddingBottom=0;
paddingTop=0;
borderTopWidth=0;
borderRightWidth=0;
borderBottomWidth=0;
borderLeftWidth=0;
borderTopWidthAdjusted=0;
borderRightWidthAdjusted=0;
borderBottomWidthAdjusted=0;
borderLeftWidthAdjusted=0;
cornerRadiusTopLeft=0;
cornerRadiusTopRight=0;
cornerRadiusBottomRight=0;
cornerRadiusBottomLeft=0;
cornerRadiusTopLeftAdjusted=0;
cornerRadiusTopRightAdjusted=0;
cornerRadiusBottomRightAdjusted=0;
cornerRadiusBottomLeftAdjusted=0;
verticalAlignment=GDTopAlignment;
horizontalAlignment=GDLeftAlignment;
minimumWidth=0;
maximumWidth=INFINITY;
minimumHeight=0;
maximumHeight=INFINITY;
flexWidthPercentage=100;
flexHeightPercentage=100;
horizontalResizing=GDFixResizing;
verticalResizing=GDFixResizing;
isContentClipped=YES;
isDropTarget=YES;
objj_msgSend(_8,"setLayoutPolicyCode:",GDAlignmentLayoutPolicyCode);
opacity=1;
activeLayout=NO;
activeHorizontalAlignment=GDLeftAlignment;
activeVerticalAlignment=GDTopAlignment;
isDrawingReverted=NO;
isDrawingAboveAll=NO;
drawingIndex=0;
orderedComponents=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
orderedDisplayComponentsCache=nil;
orderedDrawingComponentsCache=nil;
needsDisplayComponentsUpdate=YES;
needsDrawingComponentsUpdate=YES;
return _8;
}
}),new objj_method(sel_getUid("initWithFigure:screenChangeManager:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("GDCellRenderObject").super_class},"initWithFigure:screenChangeManager:",_c,_d);
if(_a==nil){
return nil;
}
needsHorizontalLayout=YES;
needsVerticalLayout=YES;
needsPassOnHorizontalLayout=NO;
needsPassOnVerticalLayout=NO;
return _a;
}
}),new objj_method(sel_getUid("usePropertiesInState:"),function(_e,_f,_10){
with(_e){
var _11=objj_msgSend(_e,"figure");
var _12=objj_msgSend(_10,"identifier");
var _13=objj_msgSend(propertiesWithTheSameName,"objectEnumerator");
var _14=nil;
while((_14=objj_msgSend(_13,"nextObject"))!=nil){
var _15=objj_msgSend(_11,"valueForKey:inStateWithIdentifier:",_14,_12);
_e[_14]=_15;
}
var _16=objj_msgSend(_11,"valueForKey:inStateWithIdentifier:","isDisplay",_12);
var _17=objj_msgSend(_11,"valueForKey:inStateWithIdentifier:","isVisible",_12);
var _18=GDVisibilityVisible;
if(!_16){
_18=GDVisibilityCollapsed;
}else{
if(!_17){
_18=GDVisibilityHidden;
}
}
objj_msgSend(_e,"setVisibility:",_18);
var _19=objj_msgSend(GDRenderObjectPainter,"painterForCell:inState:renderObject:",_11,_10,_e);
objj_msgSend(_e,"setBackground:",_19);
var _1a=objj_msgSend(objj_msgSend(_11,"valueForKey:inStateWithIdentifier:","layoutPolicyCode",_12),"intValue");
objj_msgSend(_e,"setLayoutPolicyCode:",_1a);
if(container==nil||objj_msgSend(objj_msgSend(container,"layoutPolicy"),"isFixedLayout")){
objj_msgSend(_e,"setX:",objj_msgSend(_11,"valueForKey:inStateWithIdentifier:","x",_12));
objj_msgSend(_e,"setY:",objj_msgSend(_11,"valueForKey:inStateWithIdentifier:","y",_12));
}
if(horizontalResizing==GDFixResizing){
objj_msgSend(_e,"setWidth:",objj_msgSend(_11,"valueForKey:inStateWithIdentifier:","width",_12));
}
if(verticalResizing==GDFixResizing){
objj_msgSend(_e,"setHeight:",objj_msgSend(_11,"valueForKey:inStateWithIdentifier:","height",_12));
}
var _1b=objj_msgSend(_11,"valueForKey:inStateWithIdentifier:","textAttributedString",_12);
if(_1b!=nil){
objj_msgSend(_e,"assureTextRenderObjectExists");
var _1c=objj_msgSend(textProperties,"objectEnumerator");
var _14=nil;
while((_14=objj_msgSend(_1c,"nextObject"))!=nil){
var _15=objj_msgSend(_11,"valueForKey:inStateWithIdentifier:",_14,_12);
_15=_15===null?0:_15;
objj_msgSend(_e,"setValue:forKey:",_15,_14);
}
}
if(currentState!=nil){
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",_e);
}
currentState=_10;
}
}),new objj_method(sel_getUid("currentState"),function(_1d,_1e){
with(_1d){
return currentState;
}
}),new objj_method(sel_getUid("updateValuesToState:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_1f,"usePropertiesInState:",_21);
objj_msgSend(_1f,"setNeedsHorizontalLayout");
objj_msgSend(_1f,"setNeedsVerticalLayout");
var _22=objj_msgSend(objj_msgSend(_1f,"figure"),"rootInstanceCell");
var _23=nil;
var _24=objj_msgSend(orderedComponents,"objectEnumerator");
while(_23=objj_msgSend(_24,"nextObject")){
if(_22==objj_msgSend(objj_msgSend(_23,"figure"),"rootInstanceCell")){
objj_msgSend(_23,"updateValuesToState:",_21);
}
}
}
}),new objj_method(sel_getUid("updateTextRenderObject"),function(_25,_26){
with(_25){
}
}),new objj_method(sel_getUid("textRenderObject"),function(_27,_28){
with(_27){
return textRenderObject;
}
}),new objj_method(sel_getUid("updateFromFigure"),function(_29,_2a){
with(_29){
objj_msgSendSuper({receiver:_29,super_class:objj_getClass("GDCellRenderObject").super_class},"updateFromFigure");
var _2b=screenChangeManager;
screenChangeManager=nil;
var _2c=objj_msgSend(_29,"figure");
objj_msgSend(_29,"usePropertiesInState:",objj_msgSend(_2c,"activeState"));
screenChangeManager=_2b;
}
}),new objj_method(sel_getUid("updateFromFigureRecursively"),function(_2d,_2e){
with(_2d){
objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("GDCellRenderObject").super_class},"updateFromFigureRecursively");
objj_msgSend(orderedComponents,"makeObjectsPerformSelector:",sel_getUid("updateFromFigureRecursively"));
}
}),new objj_method(sel_getUid("orderedComponents"),function(_2f,_30){
with(_2f){
return orderedComponents;
}
}),new objj_method(sel_getUid("checkOrderedDisplayComponentsCache"),function(_31,_32){
with(_31){
var _33=objj_msgSend(CPMutableArray,"array");
var _34=objj_msgSend(objj_msgSend(_31,"orderedComponents"),"objectEnumerator");
var _35=nil;
while((_35=objj_msgSend(_34,"nextObject"))!=nil){
if(objj_msgSend(_35,"visibility")!=GDVisibilityCollapsed){
objj_msgSend(_33,"addObject:",_35);
}
}
if(!objj_msgSend(_33,"isEqualToArray:",orderedDisplayComponentsCache)){
objj_msgSend(_31,"willChangeValueForKey:","orderedDisplayComponents");
orderedDisplayComponentsCache=_33;
objj_msgSend(_31,"didChangeValueForKey:","orderedDisplayComponents");
}
needsDisplayComponentsUpdate=NO;
}
}),new objj_method(sel_getUid("setNeedsDisplayComponentsUpdate:"),function(_36,_37,_38){
with(_36){
needsDisplayComponentsUpdate=_38;
}
}),new objj_method(sel_getUid("orderedDisplayComponents"),function(_39,_3a){
with(_39){
if(orderedDisplayComponentsCache==nil||needsDisplayComponentsUpdate){
objj_msgSend(_39,"checkOrderedDisplayComponentsCache");
}
return orderedDisplayComponentsCache;
}
}),new objj_method(sel_getUid("checkOrderedDrawingComponentsCache"),function(_3b,_3c){
with(_3b){
var _3d=objj_msgSend(CPMutableArray,"array");
var _3e=objj_msgSend(_3b,"isDrawingReverted")?objj_msgSend(objj_msgSend(_3b,"orderedComponents"),"reverseObjectEnumerator"):objj_msgSend(objj_msgSend(_3b,"orderedComponents"),"objectEnumerator");
var _3f=nil;
while((_3f=objj_msgSend(_3e,"nextObject"))!=nil){
if(objj_msgSend(_3f,"visibility")!=GDVisibilityCollapsed){
objj_msgSend(_3d,"addObject:",_3f);
}
}
var _40=objj_msgSend(CPSortDescriptor,"sortDescriptorWithKey:ascending:","drawingIndex",YES);
var _41=objj_msgSend(_3d,"sortedArrayUsingDescriptors:",objj_msgSend(CPArray,"arrayWithObject:",_40));
if(!objj_msgSend(_41,"isEqualToArray:",orderedDrawingComponentsCache)){
objj_msgSend(_3b,"willChangeValueForKey:","orderedDrawingComponents");
orderedDrawingComponentsCache=_41;
objj_msgSend(_3b,"didChangeValueForKey:","orderedDrawingComponents");
}
needsDrawingComponentsUpdate=NO;
}
}),new objj_method(sel_getUid("setNeedsDrawingComponentsUpdate:"),function(_42,_43,_44){
with(_42){
needsDrawingComponentsUpdate=_44;
}
}),new objj_method(sel_getUid("orderedDrawingComponents"),function(_45,_46){
with(_45){
if(orderedDrawingComponentsCache==nil||needsDrawingComponentsUpdate){
objj_msgSend(_45,"checkOrderedDrawingComponentsCache");
}
return orderedDrawingComponentsCache;
}
}),new objj_method(sel_getUid("addComponent:"),function(_47,_48,_49){
with(_47){
objj_msgSend(_47,"insertComponent:atIndex:",_49,objj_msgSend(orderedComponents,"count"));
}
}),new objj_method(sel_getUid("insertComponent:atIndex:"),function(_4a,_4b,_4c,_4d){
with(_4a){
var _4e=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_4d);
objj_msgSend(orderedComponents,"insertObject:atIndex:",_4c,_4d);
objj_msgSend(_4c,"setContainer:",_4a);
objj_msgSend(_4a,"setNeedsDisplayComponentsUpdate:",YES);
objj_msgSend(_4a,"setNeedsDrawingComponentsUpdate:",YES);
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalCellLayout:",_4a);
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalCellLayout:",_4a);
}
}),new objj_method(sel_getUid("removeComponentAtIndex:"),function(_4f,_50,_51){
with(_4f){
var _52=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_51);
objj_msgSend(orderedComponents,"removeObjectAtIndex:",_51);
objj_msgSend(_4f,"setNeedsDisplayComponentsUpdate:",YES);
objj_msgSend(_4f,"setNeedsDrawingComponentsUpdate:",YES);
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalCellLayout:",_4f);
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalCellLayout:",_4f);
}
}),new objj_method(sel_getUid("renderObjectForFigure:"),function(_53,_54,f){
with(_53){
if(objj_msgSend(f,"isEqual:",objj_msgSend(_53,"figure"))){
return _53;
}
for(var i=0;i<orderedComponents.length;i++){
var o=objj_msgSend(orderedComponents[i],"renderObjectForFigure:",f);
if(o!=nil){
return o;
}
}
return nil;
}
}),new objj_method(sel_getUid("renderObjectAtPoint:"),function(_55,_56,p){
with(_55){
if(objj_msgSend(_55,"visibility")==GDVisibilityCollapsed){
return nil;
}
if(objj_msgSend(_55,"isContentClipped")&&!NSPointInRect(p,objj_msgSend(_55,"bounds"))){
return nil;
}
var _57=objj_msgSend(_55,"affineTransform");
objj_msgSend(_57,"invert");
var _58=objj_msgSend(_57,"transformPoint:",p);
var _59=objj_msgSend(_55,"searchEnumerator");
var _5a=nil;
while((_5a=objj_msgSend(_59,"nextObject"))!=nil){
var f=nil;
if((f=objj_msgSend(_5a,"renderObjectAtPoint:",_58))!=nil){
return f;
}
}
return objj_msgSendSuper({receiver:_55,super_class:objj_getClass("GDCellRenderObject").super_class},"renderObjectAtPoint:",p);
}
}),new objj_method(sel_getUid("allRenderObjectsAtPoint:"),function(_5b,_5c,p){
with(_5b){
if(objj_msgSend(_5b,"visibility")==GDVisibilityCollapsed){
return objj_msgSend(CPArray,"array");
}
var _5d=objj_msgSend(CPMutableArray,"arrayWithArray:",objj_msgSendSuper({receiver:_5b,super_class:objj_getClass("GDCellRenderObject").super_class},"allRenderObjectsAtPoint:",p));
if(objj_msgSend(_5b,"isContentClipped")&&!NSPointInRect(p,objj_msgSend(_5b,"bounds"))){
return _5d;
}
var _5e=objj_msgSend(_5b,"affineTransform");
objj_msgSend(_5e,"invert");
var _5f=objj_msgSend(_5e,"transformPoint:",p);
var _60=objj_msgSend(_5b,"searchEnumerator");
var _61=nil;
while((_61=objj_msgSend(_60,"nextObject"))!=nil){
var _62=objj_msgSend(_61,"allRenderObjectsAtPoint:",_5f);
if(objj_msgSend(_62,"count")>0){
objj_msgSend(_5d,"addObjectsFromArray:",_62);
return _5d;
}
}
return _5d;
}
}),new objj_method(sel_getUid("setVisibility:"),function(_63,_64,_65){
with(_63){
if(visibility==_65){
return;
}
var _66=NO;
if(visibility==GDVisibilityCollapsed){
_66=YES;
}
visibility=_65;
if(visibility==GDVisibilityCollapsed){
_66=YES;
}
objj_msgSend(objj_msgSend(_63,"container"),"setNeedsDisplayComponentsUpdate:",YES);
objj_msgSend(objj_msgSend(_63,"container"),"setNeedsDrawingComponentsUpdate:",YES);
if(_66&&objj_msgSend(_63,"container")!=nil){
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalContainerLayout:",_63);
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalContainerLayout:",_63);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",objj_msgSend(_63,"container"));
}else{
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",_63);
}
}
}),new objj_method(sel_getUid("isDrawingReverted"),function(_67,_68){
with(_67){
return isDrawingReverted;
}
}),new objj_method(sel_getUid("setIsDrawingReverted:"),function(_69,_6a,_6b){
with(_69){
if(_6b==isDrawingReverted){
return;
}
objj_msgSend(_69,"willChangeValueForKey:","isDrawingReverted");
isDrawingReverted=_6b;
objj_msgSend(_69,"didChangeValueForKey:","isDrawingReverted");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",_69);
objj_msgSend(_69,"setNeedsDrawingComponentsUpdate:",YES);
}
}),new objj_method(sel_getUid("setIsDrawingAboveAll:"),function(_6c,_6d,_6e){
with(_6c){
if(_6e==isDrawingAboveAll){
return;
}
objj_msgSend(_6c,"willChangeValueForKey:","isDrawingAboveAll");
isDrawingAboveAll=_6e;
objj_msgSend(_6c,"didChangeValueForKey:","isDrawingAboveAll");
}
}),new objj_method(sel_getUid("isDrawingAboveAll"),function(_6f,_70){
with(_6f){
return isDrawingAboveAll;
}
}),new objj_method(sel_getUid("drawingIndex"),function(_71,_72){
with(_71){
return drawingIndex;
}
}),new objj_method(sel_getUid("setDrawingIndex:"),function(_73,_74,_75){
with(_73){
if(_75==drawingIndex){
return;
}
objj_msgSend(_73,"willChangeValueForKey:","drawingIndex");
drawingIndex=_75;
objj_msgSend(_73,"didChangeValueForKey:","drawingIndex");
objj_msgSend(objj_msgSend(_73,"container"),"setNeedsDrawingComponentsUpdate:",YES);
}
}),new objj_method(sel_getUid("isDeepDrawingAboveAll"),function(_76,_77){
with(_76){
var _78=(objj_msgSend(_76,"container")!=nil)?objj_msgSend(objj_msgSend(_76,"container"),"isDeepDrawingAboveAll"):NO;
return _78||objj_msgSend(_76,"isDrawingAboveAll");
}
}),new objj_method(sel_getUid("drawingEnumerator"),function(_79,_7a){
with(_79){
return objj_msgSend(objj_msgSend(_79,"orderedDrawingComponents"),"objectEnumerator");
}
}),new objj_method(sel_getUid("searchEnumerator"),function(_7b,_7c){
with(_7b){
return objj_msgSend(objj_msgSend(_7b,"orderedDrawingComponents"),"reverseObjectEnumerator");
}
}),new objj_method(sel_getUid("siblingsSearchEnumerator"),function(_7d,_7e){
with(_7d){
var all=objj_msgSend(CPMutableArray,"arrayWithArray:",objj_msgSend(objj_msgSend(_7d,"container"),"orderedDrawingComponents"));
objj_msgSend(all,"removeObject:",_7d);
return objj_msgSend(all,"reverseObjectEnumerator");
}
}),new objj_method(sel_getUid("deepDrawingAboveAllComponents"),function(_7f,_80){
with(_7f){
if(objj_msgSend(_7f,"isDrawingAboveAll")){
return objj_msgSend(CPArray,"arrayWithObject:",_7f);
}
var _81=objj_msgSend(CPMutableArray,"array");
var _82=objj_msgSend(_7f,"drawingEnumerator");
var _83=nil;
while((_83=objj_msgSend(_82,"nextObject"))!=nil){
objj_msgSend(_81,"addObjectsFromArray:",objj_msgSend(_83,"deepDrawingAboveAllComponents"));
}
return _81;
}
}),new objj_method(sel_getUid("deepOrderedDrawingAboveAllComponents"),function(_84,_85){
with(_84){
var _86=objj_msgSend(_84,"deepDrawingAboveAllComponents");
var _87=objj_msgSend(CPSortDescriptor,"sortDescriptorWithKey:ascending:","drawingIndex",YES);
return objj_msgSend(_86,"sortedArrayUsingDescriptors:",objj_msgSend(CPArray,"arrayWithObject:",_87));
}
}),new objj_method(sel_getUid("layoutPolicy"),function(_88,_89){
with(_88){
return layoutPolicy;
}
}),new objj_method(sel_getUid("setLayoutPolicy:"),function(_8a,_8b,_8c){
with(_8a){
if(objj_msgSend(layoutPolicy,"layoutPolicyCode")==objj_msgSend(_8c,"layoutPolicyCode")){
return;
}
objj_msgSend(layoutPolicy,"release");
layoutPolicy=objj_msgSend(_8c,"retain");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalCellLayout:",_8a);
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalCellLayout:",_8a);
}
}),new objj_method(sel_getUid("layoutPolicyCode"),function(_8d,_8e){
with(_8d){
return objj_msgSend(layoutPolicy,"layoutPolicyCode");
}
}),new objj_method(sel_getUid("setLayoutPolicyCode:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"setLayoutPolicy:",objj_msgSend(GDLayoutPolicy,"layoutPolicyWithCode:",_91));
}
}),new objj_method(sel_getUid("affineTransform"),function(_92,_93){
with(_92){
var _94=objj_msgSend(_92,"affineOriginTransform");
objj_msgSend(_94,"appendTransform:",objj_msgSend(_92,"affineBorderTransform"));
return _94;
}
}),new objj_method(sel_getUid("affineBorderTransform"),function(_95,_96){
with(_95){
var _97=objj_msgSend(GDAffineTransform,"transform");
objj_msgSend(_97,"translateXBy:yBy:",objj_msgSend(_95,"borderLeftWidth"),objj_msgSend(_95,"borderTopWidth"));
return _97;
}
}),new objj_method(sel_getUid("updateCornerPoints"),function(_98,_99){
with(_98){
}
}),new objj_method(sel_getUid("setBounds:"),function(_9a,_9b,_9c){
with(_9a){
_9c.origin.x=floorf(_9c.origin.x);
_9c.origin.y=floorf(_9c.origin.y);
_9c.size.width=floorf(_9c.size.width);
if(objj_msgSend(_9a,"minimumWidth")!=0&&_9c.size.width<objj_msgSend(_9a,"minimumWidth")){
_9c.size.width=objj_msgSend(_9a,"minimumWidth");
}
if(objj_msgSend(_9a,"maximumWidth")!=0&&_9c.size.width>objj_msgSend(_9a,"maximumWidth")){
_9c.size.width=objj_msgSend(_9a,"maximumWidth");
}
if(objj_msgSend(_9a,"minimumHeight")!=0&&_9c.size.height<objj_msgSend(_9a,"minimumHeight")){
_9c.size.height=objj_msgSend(_9a,"minimumHeight");
}
if(objj_msgSend(_9a,"maximumHeight")!=0&&_9c.size.height>objj_msgSend(_9a,"maximumHeight")){
_9c.size.height=objj_msgSend(_9a,"maximumHeight");
}
_9c.size.height=floorf(_9c.size.height);
if(_9c.size.height<0){
_9c.size.height=0;
}
if(_9c.size.width<0){
_9c.size.width=0;
}
objj_msgSendSuper({receiver:_9a,super_class:objj_getClass("GDCellRenderObject").super_class},"setBounds:",_9c);
objj_msgSend(_9a,"updateCornerPoints");
objj_msgSend(textRenderObject,"adjustTextContainerSize");
}
}),new objj_method(sel_getUid("fullBounds"),function(_9d,_9e){
with(_9d){
var _9f=objj_msgSendSuper({receiver:_9d,super_class:objj_getClass("GDCellRenderObject").super_class},"fullBounds");
return CGRectMake(_9f.origin.x-objj_msgSend(_9d,"marginLeft"),_9f.origin.y-objj_msgSend(_9d,"marginTop"),_9f.size.width+objj_msgSend(_9d,"marginLeft")+objj_msgSend(_9d,"marginRight"),_9f.size.height+objj_msgSend(_9d,"marginTop")+objj_msgSend(_9d,"marginBottom"));
}
}),new objj_method(sel_getUid("setFullBounds:"),function(_a0,_a1,_a2){
with(_a0){
var _a3=_a2.size.width-objj_msgSend(_a0,"marginLeft")-objj_msgSend(_a0,"marginRight");
if(_a3<0){
_a3=0;
}
var _a4=_a2.size.height-objj_msgSend(_a0,"marginTop")-objj_msgSend(_a0,"marginBottom");
if(_a4<0){
_a4=0;
}
var _a5=_a2.origin.x+objj_msgSend(_a0,"marginLeft");
var _a6=_a2.origin.y+objj_msgSend(_a0,"marginTop");
objj_msgSend(_a0,"setBounds:",NSMakeRect(_a5,_a6,_a3,_a4));
}
}),new objj_method(sel_getUid("setFullX:"),function(_a7,_a8,_a9){
with(_a7){
objj_msgSend(_a7,"setX:",_a9+objj_msgSend(_a7,"marginLeft"));
}
}),new objj_method(sel_getUid("setFullY:"),function(_aa,_ab,_ac){
with(_aa){
objj_msgSend(_aa,"setY:",_ac+objj_msgSend(_aa,"marginTop"));
}
}),new objj_method(sel_getUid("setFullWidth:"),function(_ad,_ae,_af){
with(_ad){
var _b0=_af-objj_msgSend(_ad,"marginLeft")-objj_msgSend(_ad,"marginRight");
if(_b0<0){
_b0=0;
}
objj_msgSend(_ad,"setWidth:",_b0);
}
}),new objj_method(sel_getUid("setFullHeight:"),function(_b1,_b2,_b3){
with(_b1){
var _b4=_b3-objj_msgSend(_b1,"marginTop")-objj_msgSend(_b1,"marginBottom");
if(_b4<0){
_b4=0;
}
objj_msgSend(_b1,"setHeight:",_b4);
}
}),new objj_method(sel_getUid("innerBounds"),function(_b5,_b6){
with(_b5){
var _b7=bounds;
return CGRectMake(_b7.origin.x+objj_msgSend(_b5,"borderLeftWidth")+objj_msgSend(_b5,"paddingLeft"),_b7.origin.y+objj_msgSend(_b5,"borderTopWidth")+objj_msgSend(_b5,"paddingTop"),_b7.size.width-objj_msgSend(_b5,"borderLeftWidth")-objj_msgSend(_b5,"borderRightWidth")-objj_msgSend(_b5,"paddingLeft")-objj_msgSend(_b5,"paddingRight"),_b7.size.height-objj_msgSend(_b5,"borderTopWidth")-objj_msgSend(_b5,"borderBottomWidth")-objj_msgSend(_b5,"paddingTop")-objj_msgSend(_b5,"paddingBottom"));
}
}),new objj_method(sel_getUid("setInnerBounds:"),function(_b8,_b9,r){
with(_b8){
objj_msgSend(_b8,"setBounds:",CGRectMake(r.origin.x-objj_msgSend(_b8,"paddingLeft")-objj_msgSend(_b8,"borderLeftWidth"),r.origin.y-objj_msgSend(_b8,"paddingTop")-objj_msgSend(_b8,"borderTopWidth"),r.size.width+objj_msgSend(_b8,"paddingLeft")+objj_msgSend(_b8,"paddingRight")+objj_msgSend(_b8,"borderLeftWidth")+objj_msgSend(_b8,"borderRightWidth"),r.size.height+objj_msgSend(_b8,"paddingTop")+objj_msgSend(_b8,"paddingBottom")+objj_msgSend(_b8,"borderTopWidth")+objj_msgSend(_b8,"borderBottomWidth")));
}
}),new objj_method(sel_getUid("setRotationAngle:"),function(_ba,_bb,_bc){
with(_ba){
if(rotationAngle==_bc){
return;
}
objj_msgSend(_ba,"willChangeValueForKey:","rotationAngle");
rotationAngle=_bc;
objj_msgSend(_ba,"didChangeValueForKey:","rotationAngle");
objj_msgSend(_ba,"updateCornerPoints");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",_ba);
}
}),new objj_method(sel_getUid("rotationAngle"),function(_bd,_be){
with(_bd){
return rotationAngle;
}
}),new objj_method(sel_getUid("hasRoundedCorners"),function(_bf,_c0){
with(_bf){
return objj_msgSend(_bf,"cornerRadiusBottomLeft")!=0||objj_msgSend(_bf,"cornerRadiusBottomRight")!=0||objj_msgSend(_bf,"cornerRadiusTopLeft")!=0||objj_msgSend(_bf,"cornerRadiusTopRight")!=0;
}
}),new objj_method(sel_getUid("hasBorders"),function(_c1,_c2){
with(_c1){
return objj_msgSend(_c1,"borderTopWidth")>0||objj_msgSend(_c1,"borderLeftWidth")>0||objj_msgSend(_c1,"borderRightWidth")>0||objj_msgSend(_c1,"borderBottomWidth")>0;
}
}),new objj_method(sel_getUid("marginTop"),function(_c3,_c4){
with(_c3){
return marginTop;
}
}),new objj_method(sel_getUid("setMarginTop:"),function(_c5,_c6,_c7){
with(_c5){
if(_c7==marginTop){
return;
}
objj_msgSend(_c5,"willChangeValueForKey:","marginTop");
marginTop=_c7;
objj_msgSend(_c5,"didChangeValueForKey:","marginTop");
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalContainerLayout:",_c5);
}
}),new objj_method(sel_getUid("marginBottom"),function(_c8,_c9){
with(_c8){
return marginBottom;
}
}),new objj_method(sel_getUid("setMarginBottom:"),function(_ca,_cb,_cc){
with(_ca){
if(_cc==marginBottom){
return;
}
objj_msgSend(_ca,"willChangeValueForKey:","marginBottom");
marginBottom=_cc;
objj_msgSend(_ca,"didChangeValueForKey:","marginBottom");
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalContainerLayout:",_ca);
}
}),new objj_method(sel_getUid("marginLeft"),function(_cd,_ce){
with(_cd){
return marginLeft;
}
}),new objj_method(sel_getUid("setMarginLeft:"),function(_cf,_d0,_d1){
with(_cf){
if(marginLeft==_d1){
return;
}
objj_msgSend(_cf,"willChangeValueForKey:","marginLeft");
marginLeft=_d1;
objj_msgSend(_cf,"didChangeValueForKey:","marginLeft");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalContainerLayout:",_cf);
}
}),new objj_method(sel_getUid("marginRight"),function(_d2,_d3){
with(_d2){
return marginRight;
}
}),new objj_method(sel_getUid("setMarginRight:"),function(_d4,_d5,_d6){
with(_d4){
if(marginRight==_d6){
return;
}
objj_msgSend(_d4,"willChangeValueForKey:","marginRight");
marginRight=_d6;
objj_msgSend(_d4,"didChangeValueForKey:","marginRight");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalContainerLayout:",_d4);
}
}),new objj_method(sel_getUid("setMargin:"),function(_d7,_d8,_d9){
with(_d7){
objj_msgSend(_d7,"setMarginBottom:",_d9);
objj_msgSend(_d7,"setMarginLeft:",_d9);
objj_msgSend(_d7,"setMarginRight:",_d9);
objj_msgSend(_d7,"setMarginTop:",_d9);
}
}),new objj_method(sel_getUid("paddingTop"),function(_da,_db){
with(_da){
return paddingTop;
}
}),new objj_method(sel_getUid("setPaddingTop:"),function(_dc,_dd,_de){
with(_dc){
if(paddingTop==_de){
return;
}
objj_msgSend(_dc,"willChangeValueForKey:","paddingTop");
paddingTop=_de;
objj_msgSend(_dc,"didChangeValueForKey:","paddingTop");
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalCellLayout:",_dc);
}
}),new objj_method(sel_getUid("paddingBottom"),function(_df,_e0){
with(_df){
return paddingBottom;
}
}),new objj_method(sel_getUid("setPaddingBottom:"),function(_e1,_e2,_e3){
with(_e1){
if(paddingBottom==_e3){
return;
}
objj_msgSend(_e1,"willChangeValueForKey:","paddingBottom");
paddingBottom=_e3;
objj_msgSend(_e1,"didChangeValueForKey:","paddingBottom");
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalCellLayout:",_e1);
}
}),new objj_method(sel_getUid("paddingLeft"),function(_e4,_e5){
with(_e4){
return paddingLeft;
}
}),new objj_method(sel_getUid("setPaddingLeft:"),function(_e6,_e7,_e8){
with(_e6){
if(paddingLeft==_e8){
return;
}
objj_msgSend(_e6,"willChangeValueForKey:","paddingLeft");
paddingLeft=_e8;
objj_msgSend(_e6,"didChangeValueForKey:","paddingLeft");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalCellLayout:",_e6);
}
}),new objj_method(sel_getUid("paddingRight"),function(_e9,_ea){
with(_e9){
return paddingRight;
}
}),new objj_method(sel_getUid("setPaddingRight:"),function(_eb,_ec,_ed){
with(_eb){
if(paddingRight==_ed){
return;
}
objj_msgSend(_eb,"willChangeValueForKey:","paddingRight");
paddingRight=_ed;
objj_msgSend(_eb,"didChangeValueForKey:","paddingRight");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalCellLayout:",_eb);
}
}),new objj_method(sel_getUid("setPadding:"),function(_ee,_ef,_f0){
with(_ee){
objj_msgSend(_ee,"setPaddingTop:",_f0);
objj_msgSend(_ee,"setPaddingLeft:",_f0);
objj_msgSend(_ee,"setPaddingBottom:",_f0);
objj_msgSend(_ee,"setPaddingRight:",_f0);
}
}),new objj_method(sel_getUid("horizontalAlignment"),function(_f1,_f2){
with(_f1){
return horizontalAlignment;
}
}),new objj_method(sel_getUid("setHorizontalAlignment:"),function(_f3,_f4,_f5){
with(_f3){
if(horizontalAlignment==_f5){
return;
}
if(_f5==null){
_f5=0;
}
objj_msgSend(_f3,"willChangeValueForKey:","horizontalAlignment");
horizontalAlignment=_f5;
objj_msgSend(_f3,"didChangeValueForKey:","horizontalAlignment");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalCellLayout:",_f3);
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_f6,_f7){
with(_f6){
return verticalAlignment;
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_f8,_f9,_fa){
with(_f8){
if(verticalAlignment==_fa){
return;
}
if(_fa==null){
_fa=0;
}
objj_msgSend(_f8,"willChangeValueForKey:","verticalAlignment");
verticalAlignment=_fa;
objj_msgSend(_f8,"didChangeValueForKey:","verticalAlignment");
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalCellLayout:",_f8);
}
}),new objj_method(sel_getUid("minimumWidth"),function(_fb,_fc){
with(_fb){
return minimumWidth;
}
}),new objj_method(sel_getUid("setMinimumWidth:"),function(_fd,_fe,_ff){
with(_fd){
if(minimumWidth==_ff){
return;
}
objj_msgSend(_fd,"willChangeValueForKey:","minimumWidth");
if(_ff<maximumWidth){
minimumWidth=_ff;
}else{
minimumWidth=maximumWidth;
}
objj_msgSend(_fd,"didChangeValueForKey:","minimumWidth");
if(objj_msgSend(_fd,"width")<minimumWidth){
objj_msgSend(_fd,"setWidth:",minimumWidth);
}
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalLayout:",_fd);
}
}),new objj_method(sel_getUid("maximumWidth"),function(self,_100){
with(self){
return maximumWidth;
}
}),new objj_method(sel_getUid("setMaximumWidth:"),function(self,_101,_102){
with(self){
if(maximumWidth==_102){
return;
}
objj_msgSend(self,"willChangeValueForKey:","maximumWidth");
if(_102>minimumWidth){
maximumWidth=_102;
}else{
maximumWidth=minimumWidth;
}
objj_msgSend(self,"didChangeValueForKey:","maximumWidth");
if(objj_msgSend(self,"width")>maximumWidth){
objj_msgSend(self,"setWidth:",maximumWidth);
}
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalLayout:",self);
}
}),new objj_method(sel_getUid("minimumHeight"),function(self,_103){
with(self){
return minimumHeight;
}
}),new objj_method(sel_getUid("setMinimumHeight:"),function(self,_104,_105){
with(self){
if(minimumHeight==_105){
return;
}
objj_msgSend(self,"willChangeValueForKey:","minimumHeight");
if(_105<maximumHeight){
minimumHeight=_105;
}else{
minimumHeight=maximumHeight;
}
objj_msgSend(self,"didChangeValueForKey:","minimumHeight");
if(objj_msgSend(self,"height")<minimumHeight){
objj_msgSend(self,"setHeight:",minimumHeight);
}
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",self);
}
}),new objj_method(sel_getUid("maximumHeight"),function(self,_106){
with(self){
return maximumHeight;
}
}),new objj_method(sel_getUid("setMaximumHeight:"),function(self,_107,_108){
with(self){
if(maximumHeight==_108){
return;
}
objj_msgSend(self,"willChangeValueForKey:","maximumHeight");
if(_108>minimumHeight){
maximumHeight=_108;
}else{
maximumHeight=minimumHeight;
}
objj_msgSend(self,"didChangeValueForKey:","maximumHeight");
if(objj_msgSend(self,"height")>maximumHeight){
objj_msgSend(self,"setHeight:",maximumHeight);
}
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",self);
}
}),new objj_method(sel_getUid("flexHeightPercentage"),function(self,_109){
with(self){
return flexHeightPercentage;
}
}),new objj_method(sel_getUid("setFlexHeightPercentage:"),function(self,_10a,_10b){
with(self){
if(flexHeightPercentage==_10b){
return;
}
objj_msgSend(self,"willChangeValueForKey:","flexHeightPercentage");
flexHeightPercentage=_10b;
objj_msgSend(self,"didChangeValueForKey:","flexHeightPercentage");
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",self);
}
}),new objj_method(sel_getUid("flexWidthPercentage"),function(self,_10c){
with(self){
return flexWidthPercentage;
}
}),new objj_method(sel_getUid("setFlexWidthPercentage:"),function(self,_10d,_10e){
with(self){
if(flexWidthPercentage==_10e){
return;
}
objj_msgSend(self,"willChangeValueForKey:","flexWidthPercentage");
flexWidthPercentage=_10e;
objj_msgSend(self,"didChangeValueForKey:","flexWidthPercentage");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalLayout:",self);
}
}),new objj_method(sel_getUid("verticalResizing"),function(self,_10f){
with(self){
return verticalResizing;
}
}),new objj_method(sel_getUid("setVerticalResizing:"),function(self,_110,_111){
with(self){
if(_111==verticalResizing){
return;
}
if(_111==null){
_111=0;
}
objj_msgSend(self,"willChangeValueForKey:","verticalResizing");
verticalResizing=_111;
objj_msgSend(self,"didChangeValueForKey:","verticalResizing");
objj_msgSend(textRenderObject,"adjustTextContainerSize");
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",self);
}
}),new objj_method(sel_getUid("horizontalResizing"),function(self,_112){
with(self){
return horizontalResizing;
}
}),new objj_method(sel_getUid("setHorizontalResizing:"),function(self,_113,_114){
with(self){
if(horizontalResizing==_114){
return;
}
if(_114==null){
_114=0;
}
objj_msgSend(self,"willChangeValueForKey:","horizontalResizing");
horizontalResizing=_114;
objj_msgSend(self,"didChangeValueForKey:","horizontalResizing");
if(_114==GDIntrinsicResizing){
objj_msgSend(self,"setTextWordWrap:",NO);
}
objj_msgSend(textRenderObject,"adjustTextContainerSize");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalLayout:",self);
}
}),new objj_method(sel_getUid("borderTopWidth"),function(self,_115){
with(self){
return borderTopWidth;
}
}),new objj_method(sel_getUid("setBorderTopWidth:"),function(self,_116,_117){
with(self){
if(borderTopWidth==_117){
return;
}
if(!objj_msgSend(self,"isContentClipped")){
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
objj_msgSend(self,"willChangeValueForKey:","borderTopWidth");
borderTopWidth=_117;
objj_msgSend(self,"didChangeValueForKey:","borderTopWidth");
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalCellLayout:",self);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("borderLeftWidth"),function(self,_118){
with(self){
return borderLeftWidth;
}
}),new objj_method(sel_getUid("setBorderLeftWidth:"),function(self,_119,_11a){
with(self){
if(borderLeftWidth==_11a){
return;
}
if(!objj_msgSend(self,"isContentClipped")){
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
objj_msgSend(self,"willChangeValueForKey:","borderLeftWidth");
borderLeftWidth=_11a;
objj_msgSend(self,"didChangeValueForKey:","borderLeftWidth");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalCellLayout:",self);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("borderBottomWidth"),function(self,_11b){
with(self){
return borderBottomWidth;
}
}),new objj_method(sel_getUid("setBorderBottomWidth:"),function(self,_11c,_11d){
with(self){
if(borderBottomWidth==_11d){
return;
}
if(!objj_msgSend(self,"isContentClipped")){
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
objj_msgSend(self,"willChangeValueForKey:","borderBottomWidth");
borderBottomWidth=_11d;
objj_msgSend(self,"didChangeValueForKey:","borderBottomWidth");
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalCellLayout:",self);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("borderRightWidth"),function(self,_11e){
with(self){
return borderRightWidth;
}
}),new objj_method(sel_getUid("setBorderRightWidth:"),function(self,_11f,_120){
with(self){
if(borderRightWidth==_120){
return;
}
if(!objj_msgSend(self,"isContentClipped")){
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
objj_msgSend(self,"willChangeValueForKey:","borderRightWidth");
borderRightWidth=_120;
objj_msgSend(self,"didChangeValueForKey:","borderRightWidth");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalCellLayout:",self);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setBorderWidth:"),function(self,_121,_122){
with(self){
objj_msgSend(self,"setBorderBottomWidth:",_122);
objj_msgSend(self,"setBorderTopWidth:",_122);
objj_msgSend(self,"setBorderLeftWidth:",_122);
objj_msgSend(self,"setBorderRightWidth:",_122);
}
}),new objj_method(sel_getUid("borderTopWidthAdjusted"),function(self,_123){
with(self){
return borderTopWidthAdjusted;
}
}),new objj_method(sel_getUid("setBorderTopWidthAdjusted:"),function(self,_124,_125){
with(self){
borderTopWidthAdjusted=_125;
}
}),new objj_method(sel_getUid("borderBottomWidthAdjusted"),function(self,_126){
with(self){
return borderBottomWidthAdjusted;
}
}),new objj_method(sel_getUid("setBorderBottomWidthAdjusted:"),function(self,_127,_128){
with(self){
borderBottomWidthAdjusted=_128;
}
}),new objj_method(sel_getUid("borderLeftWidthAdjusted"),function(self,_129){
with(self){
return borderLeftWidthAdjusted;
}
}),new objj_method(sel_getUid("setBorderLeftWidthAdjusted:"),function(self,_12a,_12b){
with(self){
borderLeftWidthAdjusted=_12b;
}
}),new objj_method(sel_getUid("borderRightWidthAdjusted"),function(self,_12c){
with(self){
return borderRightWidthAdjusted;
}
}),new objj_method(sel_getUid("setBorderRightWidthAdjusted:"),function(self,_12d,_12e){
with(self){
borderRightWidthAdjusted=_12e;
}
}),new objj_method(sel_getUid("borderBottomColor"),function(self,_12f){
with(self){
return borderBottomColor;
}
}),new objj_method(sel_getUid("setBorderBottomColor:"),function(self,_130,_131){
with(self){
if(borderBottomColor==_131){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderBottomColor");
objj_msgSend(borderBottomColor,"release");
borderBottomColor=objj_msgSend(_131,"retain");
objj_msgSend(self,"didChangeValueForKey:","borderBottomColor");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("borderLeftColor"),function(self,_132){
with(self){
return borderLeftColor;
}
}),new objj_method(sel_getUid("setBorderLeftColor:"),function(self,_133,_134){
with(self){
if(borderLeftColor==_134){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderLeftColor");
objj_msgSend(borderLeftColor,"release");
borderLeftColor=objj_msgSend(_134,"retain");
objj_msgSend(self,"didChangeValueForKey:","borderLeftColor");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("borderRightColor"),function(self,_135){
with(self){
return borderRightColor;
}
}),new objj_method(sel_getUid("setBorderRightColor:"),function(self,_136,_137){
with(self){
if(borderRightColor==_137){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderRightColor");
objj_msgSend(borderRightColor,"release");
borderRightColor=objj_msgSend(_137,"retain");
objj_msgSend(self,"didChangeValueForKey:","borderRightColor");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("borderTopColor"),function(self,_138){
with(self){
return borderTopColor;
}
}),new objj_method(sel_getUid("setBorderTopColor:"),function(self,_139,_13a){
with(self){
if(borderTopColor==_13a){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderTopColor");
objj_msgSend(borderTopColor,"release");
borderTopColor=objj_msgSend(_13a,"retain");
objj_msgSend(self,"didChangeValueForKey:","borderTopColor");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("borderTopType"),function(self,_13b){
with(self){
return borderTopType;
}
}),new objj_method(sel_getUid("borderBottomType"),function(self,_13c){
with(self){
return borderBottomType;
}
}),new objj_method(sel_getUid("borderLeftType"),function(self,_13d){
with(self){
return borderLeftType;
}
}),new objj_method(sel_getUid("borderRightType"),function(self,_13e){
with(self){
return borderRightType;
}
}),new objj_method(sel_getUid("setBorderTopType:"),function(self,_13f,_140){
with(self){
if(borderTopType==_140){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderTopType");
borderTopType=_140;
objj_msgSend(self,"didChangeValueForKey:","borderTopType");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setBorderBottomType:"),function(self,_141,_142){
with(self){
if(borderBottomType==_142){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderBottomType");
borderBottomType=_142;
objj_msgSend(self,"didChangeValueForKey:","borderBottomType");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setBorderLeftType:"),function(self,_143,_144){
with(self){
if(borderLeftType==_144){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderLeftType");
borderLeftType=_144;
objj_msgSend(self,"didChangeValueForKey:","borderLeftType");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setBorderRightType:"),function(self,_145,_146){
with(self){
if(borderRightType==_146){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderRightType");
borderRightType=_146;
objj_msgSend(self,"didChangeValueForKey:","borderRightType");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("borderGradient"),function(self,_147){
with(self){
return borderGradient;
}
}),new objj_method(sel_getUid("borderGradientFill"),function(self,_148){
with(self){
return borderGradientFill;
}
}),new objj_method(sel_getUid("borderGradientIsRadial"),function(self,_149){
with(self){
return borderGradientIsRadial;
}
}),new objj_method(sel_getUid("borderGradientAngle"),function(self,_14a){
with(self){
return borderGradientAngle;
}
}),new objj_method(sel_getUid("setBorderGradient:"),function(self,_14b,_14c){
with(self){
if(borderGradient==_14c){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderGradient");
borderGradient=_14c;
objj_msgSend(self,"didChangeValueForKey:","borderGradient");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setBorderGradientFill:"),function(self,_14d,_14e){
with(self){
if(borderGradientFill==_14e){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderGradientFill");
objj_msgSend(borderGradientFill,"release");
borderGradientFill=objj_msgSend(_14e,"retain");
objj_msgSend(self,"didChangeValueForKey:","borderGradientFill");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setBorderGradientIsRadial:"),function(self,_14f,_150){
with(self){
if(borderGradientIsRadial==_150){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderGradientIsRadial");
borderGradientIsRadial=_150;
objj_msgSend(self,"didChangeValueForKey:","borderGradientIsRadial");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setBorderGradientAngle:"),function(self,_151,_152){
with(self){
if(borderGradientAngle==_152){
return;
}
objj_msgSend(self,"willChangeValueForKey:","borderGradientAngle");
borderGradientAngle=_152;
objj_msgSend(self,"didChangeValueForKey:","borderGradientAngle");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("cornerRadiusTopLeft"),function(self,_153){
with(self){
return cornerRadiusTopLeft;
}
}),new objj_method(sel_getUid("setCornerRadiusTopLeft:"),function(self,_154,_155){
with(self){
if(cornerRadiusTopLeft==_155){
return;
}
objj_msgSend(self,"willChangeValueForKey:","cornerRadiusTopLeft");
cornerRadiusTopLeft=_155;
objj_msgSend(self,"didChangeValueForKey:","cornerRadiusTopLeft");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("cornerRadiusTopRight"),function(self,_156){
with(self){
return cornerRadiusTopRight;
}
}),new objj_method(sel_getUid("setCornerRadiusTopRight:"),function(self,_157,_158){
with(self){
if(cornerRadiusTopRight==_158){
return;
}
objj_msgSend(self,"willChangeValueForKey:","cornerRadiusTopRight");
cornerRadiusTopRight=_158;
objj_msgSend(self,"didChangeValueForKey:","cornerRadiusTopRight");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("cornerRadiusBottomLeft"),function(self,_159){
with(self){
return cornerRadiusBottomLeft;
}
}),new objj_method(sel_getUid("setCornerRadiusBottomLeft:"),function(self,_15a,_15b){
with(self){
if(cornerRadiusBottomLeft==_15b){
return;
}
objj_msgSend(self,"willChangeValueForKey:","cornerRadiusBottomLeft");
cornerRadiusBottomLeft=_15b;
objj_msgSend(self,"didChangeValueForKey:","cornerRadiusBottomLeft");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("cornerRadiusBottomRight"),function(self,_15c){
with(self){
return cornerRadiusBottomRight;
}
}),new objj_method(sel_getUid("setCornerRadiusBottomRight:"),function(self,_15d,_15e){
with(self){
if(cornerRadiusBottomRight==_15e){
return;
}
objj_msgSend(self,"willChangeValueForKey:","cornerRadiusBottomRight");
cornerRadiusBottomRight=_15e;
objj_msgSend(self,"didChangeValueForKey:","cornerRadiusBottomRight");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("cornerRadiusTopLeftAdjusted"),function(self,_15f){
with(self){
return cornerRadiusTopLeftAdjusted;
}
}),new objj_method(sel_getUid("cornerRadiusTopRightAdjusted"),function(self,_160){
with(self){
return cornerRadiusTopRightAdjusted;
}
}),new objj_method(sel_getUid("cornerRadiusBottomLeftAdjusted"),function(self,_161){
with(self){
return cornerRadiusBottomLeftAdjusted;
}
}),new objj_method(sel_getUid("cornerRadiusBottomRightAdjusted"),function(self,_162){
with(self){
return cornerRadiusBottomRightAdjusted;
}
}),new objj_method(sel_getUid("background"),function(self,_163){
with(self){
return background;
}
}),new objj_method(sel_getUid("setBackground:"),function(self,_164,_165){
with(self){
if(background==_165){
return;
}
objj_msgSend(self,"willChangeValueForKey:","background");
objj_msgSend(background,"release");
background=objj_msgSend(_165,"retain");
objj_msgSend(self,"didChangeValueForKey:","background");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("backgroundColor"),function(self,_166){
with(self){
if(background!=nil&&objj_msgSend(background,"isColorPainter")){
return objj_msgSend(background,"color");
}
return nil;
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(self,_167,_168){
with(self){
if(background!=nil&&objj_msgSend(background,"isColorPainter")){
objj_msgSend(background,"setColor:",_168);
}
}
}),new objj_method(sel_getUid("backgroundGradient"),function(self,_169){
with(self){
if(objj_msgSend(background,"isGradientPainter")){
return objj_msgSend(background,"gradient");
}
return nil;
}
}),new objj_method(sel_getUid("setBackgroundGradient:"),function(self,_16a,_16b){
with(self){
if(objj_msgSend(background,"isGradientPainter")){
objj_msgSend(background,"setGradient:",_16b);
}
}
}),new objj_method(sel_getUid("backgroundGradientAngle"),function(self,_16c){
with(self){
if(objj_msgSend(background,"isGradientPainter")){
return objj_msgSend(background,"angle");
}
return 0;
}
}),new objj_method(sel_getUid("setBackgroundGradientAngle:"),function(self,_16d,_16e){
with(self){
if(objj_msgSend(background,"isGradientPainter")){
objj_msgSend(background,"setAngle:",_16e);
}
}
}),new objj_method(sel_getUid("backgroundGradientIsRadial"),function(self,_16f){
with(self){
if(objj_msgSend(background,"isGradientPainter")){
return objj_msgSend(background,"isRadial");
}
return NO;
}
}),new objj_method(sel_getUid("setBackgroundGradientIsRadial:"),function(self,_170,_171){
with(self){
if(objj_msgSend(background,"isGradientPainter")){
objj_msgSend(background,"setIsRadial:",_171);
}
}
}),new objj_method(sel_getUid("backgroundImageResource"),function(self,_172){
with(self){
if(objj_msgSend(background,"isImagePainter")){
return objj_msgSend(background,"imageResource");
}
return nil;
}
}),new objj_method(sel_getUid("setBackgroundImageResource:"),function(self,_173,_174){
with(self){
if(objj_msgSend(background,"isImagePainter")){
objj_msgSend(background,"setImageData:",objj_msgSend(_174,"data"));
}
}
}),new objj_method(sel_getUid("backgroundImageHorizontalAlignment"),function(self,_175){
with(self){
if(objj_msgSend(background,"isImagePainter")){
return objj_msgSend(background,"horizontalAlignment");
}
return GDLeftAlignment;
}
}),new objj_method(sel_getUid("setBackgroundImageHorizontalAlignment:"),function(self,_176,_177){
with(self){
if(objj_msgSend(background,"isImagePainter")){
return objj_msgSend(background,"setHorizontalAlignment:",_177);
}
}
}),new objj_method(sel_getUid("backgroundImageVerticalAlignment"),function(self,_178){
with(self){
if(objj_msgSend(background,"isImagePainter")){
return objj_msgSend(background,"verticalAlignment");
}
return GDTopAlignment;
}
}),new objj_method(sel_getUid("setBackgroundImageVerticalAlignment:"),function(self,_179,_17a){
with(self){
if(objj_msgSend(background,"isImagePainter")){
return objj_msgSend(background,"setVerticalAlignment:",_17a);
}
}
}),new objj_method(sel_getUid("backgroundImageHorizontalOperation"),function(self,_17b){
with(self){
if(objj_msgSend(background,"isImagePainter")){
return objj_msgSend(background,"horizontalOperation");
}
return GDOriginalSizeImageOperation;
}
}),new objj_method(sel_getUid("setBackgroundImageHorizontalOperation:"),function(self,_17c,_17d){
with(self){
if(objj_msgSend(background,"isImagePainter")){
objj_msgSend(background,"setHorizontalOperation:",_17d);
}
}
}),new objj_method(sel_getUid("backgroundImageVerticalOperation"),function(self,_17e){
with(self){
if(objj_msgSend(background,"isImagePainter")){
return objj_msgSend(background,"verticalOperation");
}
return GDOriginalSizeImageOperation;
}
}),new objj_method(sel_getUid("setBackgroundImageVerticalOperation:"),function(self,_17f,_180){
with(self){
if(objj_msgSend(background,"isImagePainter")){
objj_msgSend(background,"setVerticalOperation:",_180);
}
}
}),new objj_method(sel_getUid("setBackgroundImageProportionalScale:"),function(self,_181,_182){
with(self){
if(objj_msgSend(background,"isImagePainter")){
objj_msgSend(background,"setProportionalScale:",_182);
}
}
}),new objj_method(sel_getUid("backgroundImageProportionalScale"),function(self,_183){
with(self){
if(objj_msgSend(background,"isImagePainter")){
return objj_msgSend(background,"proportionalScale");
}
return NO;
}
}),new objj_method(sel_getUid("setDropShadow:"),function(self,_184,_185){
with(self){
if(dropShadow===_185){
return;
}
dropShadow=_185;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setDropShadowAngle:"),function(self,_186,_187){
with(self){
if(dropShadowAngle===_187){
return;
}
dropShadowAngle=_187;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setDropShadowSize:"),function(self,_188,_189){
with(self){
if(dropShadowSize===_189){
return;
}
dropShadowSize=_189;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setDropShadowOffset:"),function(self,_18a,_18b){
with(self){
if(dropShadowOffset===_18b){
return;
}
dropShadowOffset=_18b;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setDropShadowBlur:"),function(self,_18c,_18d){
with(self){
if(dropShadowBlur===_18d){
return;
}
dropShadowBlur=_18d;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setDropShadowOpacity:"),function(self,_18e,_18f){
with(self){
if(dropShadowOpacity===_18f){
return;
}
dropShadowOpacity=_18f;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setDropShadowColor:"),function(self,_190,_191){
with(self){
if(objj_msgSend(dropShadowColor,"isEqual:",_191)){
return;
}
dropShadowColor=_191;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setInnerShadow:"),function(self,_192,_193){
with(self){
if(innerShadow===_193){
return;
}
innerShadow=_193;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setInnerShadowAngle:"),function(self,_194,_195){
with(self){
if(innerShadowAngle===_195){
return;
}
innerShadowAngle=_195;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setInnerShadowOffset:"),function(self,_196,_197){
with(self){
if(innerShadowOffset===_197){
return;
}
innerShadowOffset=_197;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setInnerShadowBlur:"),function(self,_198,_199){
with(self){
if(innerShadowBlur===_199){
return;
}
innerShadowBlur=_199;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setInnerShadowOpacity:"),function(self,_19a,_19b){
with(self){
if(innerShadowOpacity===_19b){
return;
}
innerShadowOpacity=_19b;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setInnerShadowColor:"),function(self,_19c,_19d){
with(self){
if(objj_msgSend(innerShadowColor,"isEqual:",_19d)){
return;
}
innerShadowColor=_19d;
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("hasTextContent"),function(self,_19e){
with(self){
return textRenderObject!=nil&&objj_msgSend(textRenderObject,"attributedString")!="";
}
}),new objj_method(sel_getUid("textLocation"),function(self,_19f){
with(self){
return objj_msgSend(textRenderObject,"textLocation");
}
}),new objj_method(sel_getUid("textContainer"),function(self,_1a0){
with(self){
return objj_msgSend(textRenderObject,"textContainer");
}
}),new objj_method(sel_getUid("hideText"),function(self,_1a1){
with(self){
objj_msgSend(textRenderObject,"hideText");
}
}),new objj_method(sel_getUid("showText"),function(self,_1a2){
with(self){
objj_msgSend(textRenderObject,"showText");
}
}),new objj_method(sel_getUid("textAntialias"),function(self,_1a3){
with(self){
return objj_msgSend(textRenderObject,"antialias");
}
}),new objj_method(sel_getUid("setTextAntialias:"),function(self,_1a4,_1a5){
with(self){
objj_msgSend(self,"willChangeValueForKey:","textAntialias");
objj_msgSend(textRenderObject,"setAntialias:",_1a5);
objj_msgSend(self,"didChangeValueForKey:","textAntialias");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("textHorizontalAlignment"),function(self,_1a6){
with(self){
return objj_msgSend(textRenderObject,"horizontalAlignment");
}
}),new objj_method(sel_getUid("setTextHorizontalAlignment:"),function(self,_1a7,_1a8){
with(self){
objj_msgSend(self,"willChangeValueForKey:","textHorizontalAlignment");
objj_msgSend(textRenderObject,"setHorizontalAlignment:",_1a8);
objj_msgSend(self,"didChangeValueForKey:","textHorizontalAlignment");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("textVerticalAlignment"),function(self,_1a9){
with(self){
return objj_msgSend(textRenderObject,"verticalAlignment");
}
}),new objj_method(sel_getUid("setTextVerticalAlignment:"),function(self,_1aa,_1ab){
with(self){
objj_msgSend(self,"willChangeValueForKey:","textVerticalAlignment");
objj_msgSend(textRenderObject,"setVerticalAlignment:",_1ab);
objj_msgSend(self,"didChangeValueForKey:","textVerticalAlignment");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("textColor"),function(self,_1ac){
with(self){
return objj_msgSend(textRenderObject,"textColor");
}
}),new objj_method(sel_getUid("setTextColor:"),function(self,_1ad,_1ae){
with(self){
if(objj_msgSend(_1ae,"isEqual:",objj_msgSend(textRenderObject,"textColor"))){
return;
}
objj_msgSend(self,"willChangeValueForKey:","textColor");
objj_msgSend(textRenderObject,"setTextColor:",_1ae);
objj_msgSend(self,"didChangeValueForKey:","textColor");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("textFont"),function(self,_1af){
with(self){
return objj_msgSend(textRenderObject,"font");
}
}),new objj_method(sel_getUid("setTextFont:"),function(self,_1b0,font){
with(self){
if(objj_msgSend(font,"isEqual:",objj_msgSend(textRenderObject,"font"))){
return;
}
objj_msgSend(self,"willChangeValueForKey:","textFont");
objj_msgSend(textRenderObject,"setFont:",font);
objj_msgSend(self,"didChangeValueForKey:","textFont");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalLayout:",self);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("textAttributedString"),function(self,_1b1){
with(self){
return objj_msgSend(textRenderObject,"attributedString");
}
}),new objj_method(sel_getUid("setTextRenderObject:"),function(self,_1b2,_1b3){
with(self){
if(textRenderObject==_1b3){
return;
}
objj_msgSend(self,"willChangeValueForKey:","textRenderObject");
objj_msgSend(textRenderObject,"release");
textRenderObject=objj_msgSend(_1b3,"retain");
objj_msgSend(self,"didChangeValueForKey:","textRenderObject");
}
}),new objj_method(sel_getUid("assureTextRenderObjectExists"),function(self,_1b4){
with(self){
if(textRenderObject==nil){
var t=objj_msgSend(objj_msgSend(GDTextRenderObject,"alloc"),"initWithCellRenderObject:",self);
objj_msgSend(self,"setTextRenderObject:",t);
objj_msgSend(t,"release");
objj_msgSend(self,"updateTextRenderObject");
}
}
}),new objj_method(sel_getUid("setTextAttributedString:"),function(self,_1b5,_1b6){
with(self){
if(_1b6==nil){
return;
}
if(objj_msgSend(_1b6,"isEqual:",objj_msgSend(textRenderObject,"attributedString"))){
return;
}
objj_msgSend(self,"assureTextRenderObjectExists");
objj_msgSend(self,"willChangeValueForKey:","textAttributedString");
objj_msgSend(textRenderObject,"setAttributedString:",_1b6);
objj_msgSend(self,"didChangeValueForKey:","textAttributedString");
if(objj_msgSend(self,"horizontalResizing")==GDIntrinsicResizing){
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalLayout:",self);
}
if(objj_msgSend(self,"verticalResizing")==GDIntrinsicResizing){
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",self);
}
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("textStringValue"),function(self,_1b7){
with(self){
return objj_msgSend(textRenderObject,"stringValue");
}
}),new objj_method(sel_getUid("setTextStringValue:"),function(self,_1b8,_1b9){
with(self){
objj_msgSend(self,"assureTextRenderObjectExists");
objj_msgSend(self,"willChangeValueForKey:","textStringValue");
if(_1b9==nil){
objj_msgSend(self,"setTextRenderObject:",nil);
}else{
objj_msgSend(textRenderObject,"setStringValue:",_1b9);
}
objj_msgSend(self,"didChangeValueForKey:","textStringValue");
if(objj_msgSend(self,"horizontalResizing")==GDIntrinsicResizing){
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalLayout:",self);
}
if(objj_msgSend(self,"verticalResizing")==GDIntrinsicResizing){
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",self);
}
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("textWordWrap"),function(self,_1ba){
with(self){
return objj_msgSend(textRenderObject,"wordWrap");
}
}),new objj_method(sel_getUid("setTextWordWrap:"),function(self,_1bb,_1bc){
with(self){
if(_1bc==objj_msgSend(textRenderObject,"wordWrap")){
return;
}
objj_msgSend(self,"willChangeValueForKey:","textWordWrap");
objj_msgSend(textRenderObject,"setWordWrap:",_1bc);
objj_msgSend(self,"didChangeValueForKey:","textWordWrap");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
if(objj_msgSend(self,"horizontalResizing")==GDIntrinsicResizing){
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalLayout:",self);
}
if(objj_msgSend(self,"verticalResizing")==GDIntrinsicResizing){
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",self);
}
}
}),new objj_method(sel_getUid("textLineHeight"),function(self,_1bd){
with(self){
return objj_msgSend(textRenderObject,"lineHeight");
}
}),new objj_method(sel_getUid("setTextLineHeight:"),function(self,_1be,_1bf){
with(self){
if(!objj_msgSend(self,"isContentClipped")){
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
objj_msgSend(self,"willChangeValueForKey:","textLineHeight");
objj_msgSend(textRenderObject,"setLineHeight:",_1bf);
objj_msgSend(self,"didChangeValueForKey:","textLineHeight");
if(objj_msgSend(self,"verticalResizing")==GDIntrinsicResizing){
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",self);
}
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("textLineHeightMultiply"),function(self,_1c0){
with(self){
return objj_msgSend(textRenderObject,"lineHeightMultiply");
}
}),new objj_method(sel_getUid("setTextLineHeightMultiply:"),function(self,_1c1,_1c2){
with(self){
if(!objj_msgSend(self,"isContentClipped")){
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
objj_msgSend(self,"willChangeValueForKey:","textLineHeightMultiply");
objj_msgSend(textRenderObject,"setLineHeightMultiply:",_1c2);
objj_msgSend(self,"didChangeValueForKey:","textLineHeightMultiply");
if(objj_msgSend(self,"verticalResizing")==GDIntrinsicResizing){
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",self);
}
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("baseline"),function(self,_1c3){
with(self){
return objj_msgSend(textRenderObject,"baseline");
}
}),new objj_method(sel_getUid("textSize"),function(self,_1c4){
with(self){
if(textRenderObject!=nil&&objj_msgSend(objj_msgSend(textRenderObject,"attributedString"),"length")>0){
return objj_msgSend(textRenderObject,"boundingSize");
}
return CGSizeMake(0,0);
}
}),new objj_method(sel_getUid("textWidth"),function(self,_1c5){
with(self){
return objj_msgSend(self,"textSize").width;
}
}),new objj_method(sel_getUid("textHeight"),function(self,_1c6){
with(self){
return objj_msgSend(self,"textSize").height;
}
}),new objj_method(sel_getUid("setTextShadow:"),function(self,_1c7,_1c8){
with(self){
objj_msgSend(textRenderObject,"setTextShadow:",_1c8);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(self,_1c9,_1ca){
with(self){
objj_msgSend(textRenderObject,"setTextShadowOffset:",_1ca);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setTextShadowOpacity:"),function(self,_1cb,_1cc){
with(self){
objj_msgSend(textRenderObject,"setTextShadowOpacity:",_1cc);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setTextShadowAngle:"),function(self,_1cd,_1ce){
with(self){
objj_msgSend(textRenderObject,"setTextShadowAngle:",_1ce);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setTextShadowBlur:"),function(self,_1cf,_1d0){
with(self){
objj_msgSend(textRenderObject,"setTextShadowBlur:",_1d0);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(self,_1d1,_1d2){
with(self){
objj_msgSend(textRenderObject,"setTextShadowColor:",_1d2);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("textShadow"),function(self,_1d3){
with(self){
return objj_msgSend(textRenderObject,"textShadow");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(self,_1d4){
with(self){
return objj_msgSend(textRenderObject,"textShadowOffset");
}
}),new objj_method(sel_getUid("textShadowOpacity"),function(self,_1d5){
with(self){
return objj_msgSend(textRenderObject,"textShadowOpacity");
}
}),new objj_method(sel_getUid("textShadowBlur"),function(self,_1d6){
with(self){
return objj_msgSend(textRenderObject,"textShadowBlur");
}
}),new objj_method(sel_getUid("textShadowAngle"),function(self,_1d7){
with(self){
return objj_msgSend(textRenderObject,"textShadowAngle");
}
}),new objj_method(sel_getUid("textShadowColor"),function(self,_1d8){
with(self){
return objj_msgSend(textRenderObject,"textShadowColor");
}
}),new objj_method(sel_getUid("opacity"),function(self,_1d9){
with(self){
return opacity;
}
}),new objj_method(sel_getUid("setOpacity:"),function(self,_1da,_1db){
with(self){
if(opacity==_1db){
return;
}
objj_msgSend(self,"willChangeValueForKey:","opacity");
opacity=_1db;
objj_msgSend(self,"didChangeValueForKey:","opacity");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("isContentClipped"),function(self,_1dc){
with(self){
return isContentClipped;
}
}),new objj_method(sel_getUid("setIsContentClipped:"),function(self,_1dd,_1de){
with(self){
if(isContentClipped==_1de){
return;
}
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
objj_msgSend(self,"willChangeValueForKey:","isContentClipped");
isContentClipped=_1de;
objj_msgSend(self,"didChangeValueForKey:","isContentClipped");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("isDropTarget"),function(self,_1df){
with(self){
return isDropTarget;
}
}),new objj_method(sel_getUid("setIsDropTarget:"),function(self,_1e0,_1e1){
with(self){
if(_1e1==isDropTarget){
return;
}
objj_msgSend(self,"willChangeValueForKey:","isDropTarget");
isDropTarget=_1e1;
objj_msgSend(self,"didChangeValueForKey:","isDropTarget");
}
}),new objj_method(sel_getUid("defaultVerticalSquareBorderStart"),function(self,_1e2){
with(self){
return borderTopWidthAdjusted;
}
}),new objj_method(sel_getUid("defaultVerticalSquareBorderEnd"),function(self,_1e3){
with(self){
return objj_msgSend(self,"height")-borderBottomWidthAdjusted;
}
}),new objj_method(sel_getUid("borderOverlap"),function(self,_1e4){
with(self){
return GDBorderOverlap;
}
}),new objj_method(sel_getUid("adjustRoundedCornersToAvailableSize"),function(self,_1e5){
with(self){
var _1e6=objj_msgSend(self,"width");
var _1e7=objj_msgSend(self,"height");
cornerRadiusTopLeftAdjusted=objj_msgSend(self,"cornerRadiusTopLeft");
cornerRadiusTopRightAdjusted=objj_msgSend(self,"cornerRadiusTopRight");
cornerRadiusBottomLeftAdjusted=objj_msgSend(self,"cornerRadiusBottomLeft");
cornerRadiusBottomRightAdjusted=objj_msgSend(self,"cornerRadiusBottomRight");
var _1e8=cornerRadiusBottomLeftAdjusted;
var _1e9=cornerRadiusBottomRightAdjusted;
var _1ea=cornerRadiusTopLeftAdjusted;
var _1eb=cornerRadiusTopRightAdjusted;
var _1ec=(_1ea+_1eb)-_1e6;
var _1ed=(_1e8+_1e9)-_1e6;
while(_1ec>0){
if(((cornerRadiusTopLeftAdjusted!=0)&&(cornerRadiusTopLeftAdjusted>cornerRadiusTopRightAdjusted))||(cornerRadiusTopRightAdjusted==0)){
cornerRadiusTopLeftAdjusted--;
_1ec--;
if(_1ec==0){
break;
}
}
if(((cornerRadiusTopRightAdjusted!=0)&&(cornerRadiusTopRightAdjusted>=cornerRadiusTopLeftAdjusted))||(cornerRadiusTopLeftAdjusted==0)){
cornerRadiusTopRightAdjusted--;
_1ec--;
continue;
}
}
while(_1ed>0){
if(((cornerRadiusBottomLeftAdjusted!=0)&&(cornerRadiusBottomLeftAdjusted>cornerRadiusBottomRightAdjusted))||(cornerRadiusBottomRightAdjusted==0)){
cornerRadiusBottomLeftAdjusted--;
_1ed--;
if(_1ed==0){
break;
}
}
if(((cornerRadiusBottomRightAdjusted!=0)&&(cornerRadiusBottomRightAdjusted>=cornerRadiusBottomLeftAdjusted))||(cornerRadiusBottomLeftAdjusted==0)){
cornerRadiusBottomRightAdjusted--;
_1ed--;
continue;
}
}
var _1ee=cornerRadiusBottomLeftAdjusted;
var _1ef=cornerRadiusBottomRightAdjusted;
var _1f0=cornerRadiusTopLeftAdjusted;
var _1f1=cornerRadiusTopRightAdjusted;
var _1f2=(_1f0+_1ee)-_1e7;
var _1f3=(_1f1+_1ef)-_1e7;
while(_1f2>0){
if(((cornerRadiusTopLeftAdjusted!=0)&&(cornerRadiusTopLeftAdjusted>cornerRadiusBottomLeftAdjusted))||(cornerRadiusBottomLeftAdjusted==0)){
cornerRadiusTopLeftAdjusted--;
_1f2--;
if(_1f2==0){
break;
}
}
if(((cornerRadiusBottomLeftAdjusted!=0)&&(cornerRadiusBottomLeftAdjusted>=cornerRadiusTopLeftAdjusted))||(cornerRadiusTopLeftAdjusted==0)){
cornerRadiusBottomLeftAdjusted--;
_1f2--;
continue;
}
}
while(_1f3>0){
if(((cornerRadiusTopRightAdjusted!=0)&&(cornerRadiusTopRightAdjusted>cornerRadiusBottomRightAdjusted))||(cornerRadiusBottomRightAdjusted==0)){
cornerRadiusTopRightAdjusted--;
_1f3--;
if(_1f3==0){
break;
}
}
if(((cornerRadiusBottomRightAdjusted!=0)&&(cornerRadiusBottomRightAdjusted>=cornerRadiusTopRightAdjusted))||(cornerRadiusTopRightAdjusted==0)){
cornerRadiusBottomRightAdjusted--;
_1f3--;
continue;
}
}
}
}),new objj_method(sel_getUid("adjustBordersToAvailableSize"),function(self,_1f4){
with(self){
var _1f5=objj_msgSend(self,"width");
var _1f6=objj_msgSend(self,"height");
borderLeftWidthAdjusted=objj_msgSend(self,"borderLeftWidth");
borderRightWidthAdjusted=objj_msgSend(self,"borderRightWidth");
borderTopWidthAdjusted=objj_msgSend(self,"borderTopWidth");
borderBottomWidthAdjusted=objj_msgSend(self,"borderBottomWidth");
var _1f7=(borderLeftWidthAdjusted+borderRightWidthAdjusted)-_1f5;
while(_1f7>0){
if(((borderLeftWidthAdjusted!=0)&&(borderLeftWidthAdjusted>borderRightWidthAdjusted))||(borderRightWidthAdjusted==0)){
borderLeftWidthAdjusted--;
_1f7--;
if(_1f7==0){
break;
}
}
if(((borderRightWidthAdjusted!=0)&&(borderRightWidthAdjusted>=borderLeftWidthAdjusted))||(borderLeftWidthAdjusted==0)){
borderRightWidthAdjusted--;
_1f7--;
continue;
}
}
var _1f8=(borderTopWidthAdjusted+borderBottomWidthAdjusted)-_1f6;
while(_1f8>0){
if(((borderTopWidthAdjusted!=0)&&(borderTopWidthAdjusted>borderBottomWidthAdjusted))||(borderBottomWidthAdjusted==0)){
borderTopWidthAdjusted--;
_1f8--;
if(_1f8==0){
break;
}
}
if(((borderBottomWidthAdjusted!=0)&&(borderBottomWidthAdjusted>=borderTopWidthAdjusted))||(borderTopWidthAdjusted==0)){
borderBottomWidthAdjusted--;
_1f8--;
continue;
}
}
var _1f9=0;
if(cornerRadiusTopLeftAdjusted>0){
_1f9+=borderLeftWidthAdjusted;
}
if(cornerRadiusBottomLeftAdjusted>0){
_1f9+=borderLeftWidthAdjusted;
}
var _1fa=0;
if(cornerRadiusTopRightAdjusted>0){
_1fa+=borderRightWidthAdjusted;
}
if(cornerRadiusBottomRightAdjusted>0){
_1fa+=borderRightWidthAdjusted;
}
if(_1f9>_1f6){
borderLeftWidthAdjusted=_1f6-borderLeftWidthAdjusted;
if(borderLeftWidthAdjusted<fminf(borderTopWidthAdjusted,borderBottomWidthAdjusted)){
borderLeftWidthAdjusted=fminf(borderTopWidthAdjusted,borderBottomWidthAdjusted);
}
}
if(_1fa>_1f6){
borderRightWidthAdjusted=_1f6-borderRightWidthAdjusted;
if(borderRightWidthAdjusted<fminf(borderTopWidthAdjusted,borderBottomWidthAdjusted)){
borderRightWidthAdjusted=fminf(borderTopWidthAdjusted,borderBottomWidthAdjusted);
}
}
var _1fb=0;
if(cornerRadiusTopLeftAdjusted>0){
_1fb+=borderTopWidthAdjusted;
}
if(cornerRadiusTopRightAdjusted>0){
_1fb+=borderTopWidthAdjusted;
}
var _1fc=0;
if(cornerRadiusBottomLeftAdjusted>0){
_1fc+=borderBottomWidthAdjusted;
}
if(cornerRadiusBottomRightAdjusted>0){
_1fc+=borderBottomWidthAdjusted;
}
if(_1fb>_1f5){
borderTopWidthAdjusted=_1f5-borderTopWidthAdjusted;
if(borderTopWidthAdjusted<fminf(borderLeftWidthAdjusted,borderRightWidthAdjusted)){
borderTopWidthAdjusted=fminf(borderLeftWidthAdjusted,borderRightWidthAdjusted);
}
}
if(_1fc>_1f5){
borderBottomWidthAdjusted=_1f5-borderBottomWidthAdjusted;
if(borderBottomWidthAdjusted<fminf(borderLeftWidthAdjusted,borderRightWidthAdjusted)){
borderBottomWidthAdjusted=fminf(borderLeftWidthAdjusted,borderRightWidthAdjusted);
}
}
}
}),new objj_method(sel_getUid("adjustBordersAndCornersToAvailableSize"),function(self,_1fd){
with(self){
objj_msgSend(self,"adjustRoundedCornersToAvailableSize");
objj_msgSend(self,"adjustBordersToAvailableSize");
}
}),new objj_method(sel_getUid("drawBorderPath:inContext:borderType:borderWidth:phase:"),function(self,_1fe,path,_1ff,_200,_201,_202){
with(self){
if(CGPathIsEmpty(path)){
return;
}
CGContextSetLineWidth(_1ff,_201+objj_msgSend(self,"borderOverlap"));
switch(_200){
case GDBorderTypeDashed:
var _203=new Array(_201*GDBorderTypeDashedFill,_201*GDBorderTypeDashedSpace);
CGContextStrokeDashedPath(_1ff,path,_203,_202);
break;
case GDBorderTypeDotted:
var _203=new Array(_201*GDBorderTypeDottedFill,_201*GDBorderTypeDottedSpace);
CGContextStrokeDashedPath(_1ff,path,_203,_202);
break;
case GDBorderTypeSolid:
CGContextBeginPath(_1ff);
CGContextAddPath(_1ff,path);
CGContextStrokePath(_1ff);
}
}
}),new objj_method(sel_getUid("drawTopBorderWithPhase:"),function(self,_204,_205){
with(self){
var _206=GDGetCurrentContext();
var path=CGPathCreateMutable();
var _207=objj_msgSend(self,"addTopBorderToStrokePath:inputPhase:",path,_205);
CGContextSaveGState(_206);
CGContextSetStrokeColorWithAlpha(_206,borderTopColor,objj_msgSend(borderTopColor,"alphaComponent"));
objj_msgSend(self,"drawBorderPath:inContext:borderType:borderWidth:phase:",path,_206,objj_msgSend(self,"borderTopType"),objj_msgSend(self,"borderTopWidthAdjusted"),_205);
CGContextRestoreGState(_206);
CGPathRelease(path);
return _207;
}
}),new objj_method(sel_getUid("drawRightBorderWithPhase:"),function(self,_208,_209){
with(self){
var _20a=GDGetCurrentContext();
var path=CGPathCreateMutable();
var _20b=objj_msgSend(self,"addRightBorderToStrokePath:inputPhase:",path,_209);
CGContextSaveGState(_20a);
CGContextSetStrokeColorWithAlpha(_20a,borderRightColor,objj_msgSend(borderRightColor,"alphaComponent"));
objj_msgSend(self,"drawBorderPath:inContext:borderType:borderWidth:phase:",path,_20a,objj_msgSend(self,"borderRightType"),objj_msgSend(self,"borderRightWidthAdjusted"),_209);
CGContextRestoreGState(_20a);
CGPathRelease(path);
return _20b;
}
}),new objj_method(sel_getUid("drawBottomBorderWithPhase:"),function(self,_20c,_20d){
with(self){
var _20e=GDGetCurrentContext();
var path=CGPathCreateMutable();
var _20f=objj_msgSend(self,"addBottomBorderToStrokePath:inputPhase:",path,_20d);
CGContextSaveGState(_20e);
CGContextSetStrokeColorWithAlpha(_20e,borderBottomColor,objj_msgSend(borderBottomColor,"alphaComponent"));
objj_msgSend(self,"drawBorderPath:inContext:borderType:borderWidth:phase:",path,_20e,objj_msgSend(self,"borderBottomType"),objj_msgSend(self,"borderBottomWidthAdjusted"),_20d);
CGContextRestoreGState(_20e);
CGPathRelease(path);
return _20f;
}
}),new objj_method(sel_getUid("drawLeftBorderWithPhase:"),function(self,_210,_211){
with(self){
var _212=GDGetCurrentContext();
var path=CGPathCreateMutable();
var _213=objj_msgSend(self,"addLeftBorderToStrokePath:inputPhase:",path,_211);
CGContextSaveGState(_212);
CGContextSetStrokeColorWithAlpha(_212,borderLeftColor,objj_msgSend(borderLeftColor,"alphaComponent"));
objj_msgSend(self,"drawBorderPath:inContext:borderType:borderWidth:phase:",path,_212,objj_msgSend(self,"borderLeftType"),objj_msgSend(self,"borderLeftWidthAdjusted"),_211);
CGContextRestoreGState(_212);
CGPathRelease(path);
return _213;
}
}),new objj_method(sel_getUid("addTopBorderToStrokePath:inputPhase:"),function(self,_214,_215,_216){
with(self){
if(borderTopWidthAdjusted<=0){
return 0;
}
var _217=borderTopWidthAdjusted;
var _218=0;
var _219=0;
var _21a=_217-((_217+objj_msgSend(self,"borderOverlap"))/2);
if(cornerRadiusTopLeftAdjusted>0){
if(cornerRadiusTopLeftAdjusted>_217){
CGPathAddArc(_215,NULL,cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted-_21a,M_PI+M_PI_4,M_PI+M_PI_2,0);
_218+=(M_PI_4*(cornerRadiusTopLeftAdjusted-_21a));
_219=cornerRadiusTopLeftAdjusted;
}else{
CGPathMoveToPoint(_215,NULL,_217,_21a);
_219=_217;
}
}else{
CGPathMoveToPoint(_215,NULL,0,_21a);
_219=0;
}
var _21b=0;
if(cornerRadiusTopRightAdjusted<=0){
_21b=objj_msgSend(self,"width");
}else{
if(cornerRadiusTopRightAdjusted<_217){
_21b=objj_msgSend(self,"width")-_217;
}else{
_21b=objj_msgSend(self,"width")-cornerRadiusTopRightAdjusted;
}
}
CGPathAddLineToPoint(_215,NULL,_21b,_21a);
_218+=(_21b-_219);
var _21c=0;
if(cornerRadiusTopRightAdjusted>0){
if(cornerRadiusTopRightAdjusted>_217){
CGPathAddArc(_215,NULL,objj_msgSend(self,"width")-cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted-_21a,M_PI+M_PI_2,M_PI+M_PI_2+M_PI_4,0);
_218+=M_PI_4*(cornerRadiusTopRightAdjusted-_21a);
_21c=outputPhaseForBorder(objj_msgSend(self,"borderTopType"),_217,_218,_216);
}
}else{
_21c=outputPhaseForBorder(objj_msgSend(self,"borderTopType"),_217,_218,_216);
}
return _21c;
}
}),new objj_method(sel_getUid("addRightBorderToStrokePath:inputPhase:"),function(self,_21d,_21e,_21f){
with(self){
if(borderRightWidthAdjusted<=0){
return 0;
}
var _220=borderRightWidthAdjusted;
var _221=0;
var _222=0;
var _223=_220-((_220+objj_msgSend(self,"borderOverlap"))/2);
if(cornerRadiusTopRightAdjusted>0){
if(cornerRadiusTopRightAdjusted>_220){
CGPathAddArc(_21e,NULL,objj_msgSend(self,"width")-cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted-_223,M_PI+M_PI_2+M_PI_4,0,0);
_221+=(M_PI_4*(cornerRadiusTopRightAdjusted-_223));
_222=cornerRadiusTopRightAdjusted;
}else{
CGPathMoveToPoint(_21e,NULL,objj_msgSend(self,"width")-_223,_220);
_222=_220;
}
}else{
CGPathMoveToPoint(_21e,NULL,objj_msgSend(self,"width")-_223,objj_msgSend(self,"defaultVerticalSquareBorderStart"));
_222=objj_msgSend(self,"defaultVerticalSquareBorderStart");
}
var _224=0;
if(cornerRadiusBottomRightAdjusted<=0){
_224=objj_msgSend(self,"defaultVerticalSquareBorderEnd");
}else{
if(cornerRadiusBottomRightAdjusted<_220){
_224=objj_msgSend(self,"height")-_220;
}else{
_224=objj_msgSend(self,"height")-cornerRadiusBottomRightAdjusted;
}
}
CGPathAddLineToPoint(_21e,NULL,objj_msgSend(self,"width")-_223,_224);
_221+=(_224-_222);
var _225=0;
if(cornerRadiusBottomRightAdjusted>0){
if(cornerRadiusBottomRightAdjusted>_220){
CGPathAddArc(_21e,NULL,objj_msgSend(self,"width")-cornerRadiusBottomRightAdjusted,objj_msgSend(self,"height")-cornerRadiusBottomRightAdjusted,cornerRadiusBottomRightAdjusted-_223,0,M_PI_4,0);
_221+=M_PI_4*(cornerRadiusBottomRightAdjusted-_223);
_225=outputPhaseForBorder(objj_msgSend(self,"borderRightType"),_220,_221,_21f);
}
}else{
_225=outputPhaseForBorder(objj_msgSend(self,"borderRightType"),_220,_221,_21f);
}
return _225;
}
}),new objj_method(sel_getUid("addBottomBorderToStrokePath:inputPhase:"),function(self,_226,_227,_228){
with(self){
if(borderBottomWidthAdjusted<=0){
return 0;
}
var _229=borderBottomWidthAdjusted;
var _22a=0;
var _22b=0;
var _22c=_229-((_229+objj_msgSend(self,"borderOverlap"))/2);
if(cornerRadiusBottomRightAdjusted>0){
if(cornerRadiusBottomRightAdjusted>_229){
CGPathAddArc(_227,NULL,objj_msgSend(self,"width")-cornerRadiusBottomRightAdjusted,objj_msgSend(self,"height")-cornerRadiusBottomRightAdjusted,cornerRadiusBottomRightAdjusted-_22c,M_PI_4,M_PI_2,0);
_22a+=(M_PI_4*(cornerRadiusBottomRightAdjusted-_22c));
_22b=objj_msgSend(self,"width")-cornerRadiusBottomRightAdjusted;
}else{
CGPathMoveToPoint(_227,NULL,objj_msgSend(self,"width")-_229,objj_msgSend(self,"height")-_22c);
_22b=objj_msgSend(self,"width")-_229;
}
}else{
CGPathMoveToPoint(_227,NULL,objj_msgSend(self,"width"),objj_msgSend(self,"height")-_22c);
_22b=objj_msgSend(self,"width");
}
var _22d=0;
if(cornerRadiusBottomLeftAdjusted<=0){
_22d=0;
}else{
if(cornerRadiusBottomLeftAdjusted<_229){
_22d=_229;
}else{
_22d=cornerRadiusBottomLeftAdjusted;
}
}
CGPathAddLineToPoint(_227,NULL,_22d,objj_msgSend(self,"height")-_22c);
_22a+=(_22b-_22d);
var _22e=0;
if(cornerRadiusBottomLeftAdjusted>0){
if(cornerRadiusBottomLeftAdjusted>_229){
CGPathAddArc(_227,NULL,cornerRadiusBottomLeftAdjusted,objj_msgSend(self,"height")-cornerRadiusBottomLeftAdjusted,cornerRadiusBottomLeftAdjusted-_22c,M_PI_2,M_PI_2+M_PI_4,0);
_22a+=M_PI_4*(cornerRadiusBottomLeftAdjusted-_22c);
_22e=outputPhaseForBorder(objj_msgSend(self,"borderBottomType"),_229,_22a,_228);
}
}else{
_22e=outputPhaseForBorder(objj_msgSend(self,"borderBottomType"),_229,_22a,_228);
}
return _22e;
}
}),new objj_method(sel_getUid("addLeftBorderToStrokePath:inputPhase:"),function(self,_22f,_230,_231){
with(self){
if(borderLeftWidthAdjusted<=0){
return 0;
}
var _232=borderLeftWidthAdjusted;
var _233=0;
var _234=0;
var _235=_232-((_232+objj_msgSend(self,"borderOverlap"))/2);
if(cornerRadiusBottomLeftAdjusted>0){
if(cornerRadiusBottomLeftAdjusted>_232){
CGPathAddArc(_230,NULL,cornerRadiusBottomLeftAdjusted,objj_msgSend(self,"height")-cornerRadiusBottomLeftAdjusted,cornerRadiusBottomLeftAdjusted-_235,M_PI_2+M_PI_4,M_PI,0);
_233+=(M_PI_4*(cornerRadiusBottomLeftAdjusted-_235));
_234=objj_msgSend(self,"height")-cornerRadiusBottomLeftAdjusted;
}else{
CGPathMoveToPoint(_230,NULL,_235,objj_msgSend(self,"height")-_232);
_234=objj_msgSend(self,"height")-_232;
}
}else{
CGPathMoveToPoint(_230,NULL,_235,objj_msgSend(self,"defaultVerticalSquareBorderEnd"));
_234=objj_msgSend(self,"height");
}
var _236=0;
if(cornerRadiusTopLeftAdjusted<=0){
_236=objj_msgSend(self,"defaultVerticalSquareBorderStart");
}else{
if(cornerRadiusTopLeftAdjusted<_232){
_236=_232;
}else{
_236=cornerRadiusTopLeftAdjusted;
}
}
CGPathAddLineToPoint(_230,NULL,_235,_236);
_233+=(_234-_236);
var _237=0;
if(cornerRadiusTopLeftAdjusted>0){
if(cornerRadiusTopLeftAdjusted>_232){
CGPathAddArc(_230,NULL,cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted-_235,M_PI,M_PI+M_PI_4,0);
_233+=M_PI_4*(cornerRadiusTopLeftAdjusted-_235);
_237=outputPhaseForBorder(objj_msgSend(self,"borderLeftType"),_232,_233,_231);
}
}else{
_237=outputPhaseForBorder(objj_msgSend(self,"borderLeftType"),_232,_233,_231);
}
return _237;
}
}),new objj_method(sel_getUid("drawStrokeBorder"),function(self,_238){
with(self){
var _239=GDGetCurrentContext();
var _23a=CGPathCreateMutable();
var _23b=0;
var _23c=0;
if(borderTopType!=GDBorderTypeSolid){
_23b=objj_msgSend(self,"addTopBorderToStrokePath:inputPhase:",_23a,0);
if(!objj_msgSend(borderTopColor,"isEqual:",borderRightColor)||cornerRadiusTopRightAdjusted<=0||borderTopType!=borderRightType||borderTopWidthAdjusted!=borderRightWidthAdjusted||borderTopWidthAdjusted>=cornerRadiusTopRight||borderRightWidthAdjusted>=cornerRadiusTopRight){
CGContextSaveGState(_239);
CGContextSetStrokeColorWithAlpha(_239,objj_msgSend(borderTopColor,"colorWithAlphaComponent:",1),objj_msgSend(borderTopColor,"alphaComponent"));
objj_msgSend(self,"drawBorderPath:inContext:borderType:borderWidth:phase:",_23a,_239,borderTopType,borderTopWidthAdjusted,_23c);
CGContextRestoreGState(_239);
CGPathRelease(_23a);
_23a=CGPathCreateMutable();
_23c=_23b;
}
}else{
_23c=0;
}
if(borderRightType!=GDBorderTypeSolid){
_23b=objj_msgSend(self,"addRightBorderToStrokePath:inputPhase:",_23a,_23c);
if(!objj_msgSend(borderRightColor,"isEqual:",borderBottomColor)||cornerRadiusBottomRightAdjusted<=0||borderRightType!=borderBottomType||borderRightWidthAdjusted!=borderBottomWidthAdjusted||borderRightWidthAdjusted>=cornerRadiusBottomRight||borderBottomWidthAdjusted>=cornerRadiusBottomRight){
CGContextSaveGState(_239);
CGContextSetStrokeColorWithAlpha(_239,objj_msgSend(borderRightColor,"colorWithAlphaComponent:",1),objj_msgSend(borderRightColor,"alphaComponent"));
objj_msgSend(self,"drawBorderPath:inContext:borderType:borderWidth:phase:",_23a,_239,borderRightType,borderRightWidthAdjusted,_23c);
CGContextRestoreGState(_239);
CGPathRelease(_23a);
_23a=CGPathCreateMutable();
_23c=_23b;
}
}else{
_23c=0;
}
if(borderBottomType!=GDBorderTypeSolid){
_23b=objj_msgSend(self,"addBottomBorderToStrokePath:inputPhase:",_23a,_23c);
if(!objj_msgSend(borderBottomColor,"isEqual:",borderLeftColor)||cornerRadiusBottomLeftAdjusted<=0||borderBottomType!=borderLeftType||borderBottomWidthAdjusted!=borderLeftWidthAdjusted||borderBottomWidthAdjusted>=cornerRadiusBottomLeft||borderLeftWidthAdjusted>=cornerRadiusBottomLeft){
CGContextSaveGState(_239);
CGContextSetStrokeColorWithAlpha(_239,objj_msgSend(borderBottomColor,"colorWithAlphaComponent:",1),objj_msgSend(borderBottomColor,"alphaComponent"));
objj_msgSend(self,"drawBorderPath:inContext:borderType:borderWidth:phase:",_23a,_239,borderBottomType,borderBottomWidthAdjusted,_23c);
CGContextRestoreGState(_239);
CGPathRelease(_23a);
_23a=CGPathCreateMutable();
_23c=_23b;
}
}else{
_23c=0;
}
if(borderLeftType!=GDBorderTypeSolid){
objj_msgSend(self,"addLeftBorderToStrokePath:inputPhase:",_23a,_23c);
CGContextSaveGState(_239);
CGContextSetStrokeColorWithAlpha(_239,objj_msgSend(borderLeftColor,"colorWithAlphaComponent:",1),objj_msgSend(borderLeftColor,"alphaComponent"));
objj_msgSend(self,"drawBorderPath:inContext:borderType:borderWidth:phase:",_23a,_239,borderLeftType,borderLeftWidthAdjusted,_23c);
CGContextRestoreGState(_239);
}
CGPathRelease(_23a);
}
}),new objj_method(sel_getUid("addTopBorderToFillPaths:"),function(self,_23d,_23e){
with(self){
if(borderTopWidthAdjusted<=0){
return;
}
var _23f=objj_msgSend(_23e,"objectForKey:",objj_msgSend(borderTopColor,"cssString"));
var _240=borderTopWidthAdjusted;
if(borderTopType==GDBorderTypeSolid){
var _241=0,_242=objj_msgSend(self,"width");
if(cornerRadiusTopLeftAdjusted>0){
_241=(cornerRadiusTopLeftAdjusted>_240)?cornerRadiusTopLeftAdjusted:_240;
}
if(cornerRadiusTopRightAdjusted>0){
_242=(cornerRadiusTopRightAdjusted<_240)?objj_msgSend(self,"width")-_240:objj_msgSend(self,"width")-cornerRadiusTopRightAdjusted;
}
var rr=CGRectMake(_241,-objj_msgSend(self,"borderOverlap"),_242-_241,borderTopWidthAdjusted+objj_msgSend(self,"borderOverlap"));
CGPathAddRect(_23f,NULL,rr);
CGPathCloseSubpath(_23f);
}
if(cornerRadiusTopLeftAdjusted>0){
if(_240>=cornerRadiusTopLeftAdjusted){
CGPathMoveToPoint(_23f,NULL,0,0);
CGPathAddLineToPoint(_23f,NULL,_240,_240);
CGPathAddLineToPoint(_23f,NULL,_240,0);
CGPathCloseSubpath(_23f);
}else{
if(borderTopType==GDBorderTypeSolid&&_240<cornerRadiusTopLeftAdjusted){
CGPathMoveToPoint(_23f,NULL,0,0);
CGPathAddArc(_23f,NULL,cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted-_240,M_PI+M_PI_4,M_PI+M_PI_2,0);
CGPathAddLineToPoint(_23f,NULL,cornerRadiusTopLeftAdjusted,0);
CGPathCloseSubpath(_23f);
}
}
}
if(cornerRadiusTopRightAdjusted>0){
if(_240>=cornerRadiusTopRightAdjusted){
CGPathMoveToPoint(_23f,NULL,objj_msgSend(self,"width"),0);
CGPathAddLineToPoint(_23f,NULL,objj_msgSend(self,"width")-_240,0);
CGPathAddLineToPoint(_23f,NULL,objj_msgSend(self,"width")-_240,_240);
CGPathCloseSubpath(_23f);
}else{
if(borderTopType==GDBorderTypeSolid&&_240<cornerRadiusTopRightAdjusted){
CGPathMoveToPoint(_23f,NULL,objj_msgSend(self,"width")-cornerRadiusTopRightAdjusted,0);
CGPathAddArc(_23f,NULL,objj_msgSend(self,"width")-cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted-_240,M_PI+M_PI_2,M_PI+M_PI_2+M_PI_4,0);
CGPathAddLineToPoint(_23f,NULL,objj_msgSend(self,"width"),0);
CGPathCloseSubpath(_23f);
}
}
}
}
}),new objj_method(sel_getUid("addRightBorderToFillPaths:"),function(self,_243,_244){
with(self){
if(borderRightWidthAdjusted<=0){
return;
}
var _245=objj_msgSend(_244,"objectForKey:",objj_msgSend(borderRightColor,"cssString"));
var _246=borderRightWidthAdjusted;
if(borderRightType==GDBorderTypeSolid){
var _247=objj_msgSend(self,"defaultVerticalSquareBorderStart"),_248=objj_msgSend(self,"defaultVerticalSquareBorderEnd");
if(cornerRadiusTopRightAdjusted>0){
_247=(cornerRadiusTopRightAdjusted>_246)?cornerRadiusTopRightAdjusted:_246;
}
if(cornerRadiusBottomRightAdjusted>0){
_248=(cornerRadiusBottomRightAdjusted<_246)?objj_msgSend(self,"height")-_246:objj_msgSend(self,"height")-cornerRadiusBottomRightAdjusted;
}
CGPathAddRect(_245,NULL,CGRectMake(objj_msgSend(self,"width")-_246,_247,_246+objj_msgSend(self,"borderOverlap"),_248-_247));
CGPathCloseSubpath(_245);
}
if(cornerRadiusTopRightAdjusted>0){
if(_246>=cornerRadiusTopRightAdjusted){
CGPathMoveToPoint(_245,NULL,objj_msgSend(self,"width"),0);
CGPathAddLineToPoint(_245,NULL,objj_msgSend(self,"width")-_246,_246);
CGPathAddLineToPoint(_245,NULL,objj_msgSend(self,"width"),_246);
CGPathCloseSubpath(_245);
}else{
if(borderRightType==GDBorderTypeSolid&&_246<cornerRadiusTopRightAdjusted){
CGPathMoveToPoint(_245,NULL,objj_msgSend(self,"width"),0);
CGPathAddArc(_245,NULL,objj_msgSend(self,"width")-cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted-_246,M_PI+M_PI_2+M_PI_4,0,0);
CGPathAddLineToPoint(_245,NULL,objj_msgSend(self,"width"),cornerRadiusTopRightAdjusted);
CGPathCloseSubpath(_245);
}
}
}
if(cornerRadiusBottomRightAdjusted>0){
if(_246>=cornerRadiusBottomRightAdjusted){
CGPathMoveToPoint(_245,NULL,objj_msgSend(self,"width"),objj_msgSend(self,"height"));
CGPathAddLineToPoint(_245,NULL,objj_msgSend(self,"width"),objj_msgSend(self,"height")-_246);
CGPathAddLineToPoint(_245,NULL,objj_msgSend(self,"width")-_246,objj_msgSend(self,"height")-_246);
CGPathCloseSubpath(_245);
}else{
if(borderRightType==GDBorderTypeSolid&&_246<cornerRadiusBottomRightAdjusted){
CGPathMoveToPoint(_245,NULL,objj_msgSend(self,"width"),objj_msgSend(self,"height")-cornerRadiusBottomRightAdjusted);
CGPathAddArc(_245,NULL,objj_msgSend(self,"width")-cornerRadiusBottomRightAdjusted,objj_msgSend(self,"height")-cornerRadiusBottomRightAdjusted,cornerRadiusBottomRightAdjusted-_246,0,M_PI_4,0);
CGPathAddLineToPoint(_245,NULL,objj_msgSend(self,"width"),objj_msgSend(self,"height"));
CGPathCloseSubpath(_245);
}
}
}
}
}),new objj_method(sel_getUid("addBottomBorderToFillPaths:"),function(self,_249,_24a){
with(self){
if(borderBottomWidthAdjusted<=0){
return;
}
var _24b=objj_msgSend(_24a,"objectForKey:",objj_msgSend(borderBottomColor,"cssString"));
var _24c=borderBottomWidthAdjusted;
if(borderBottomType==GDBorderTypeSolid){
var _24d=0,_24e=objj_msgSend(self,"width");
if(cornerRadiusBottomLeftAdjusted>0){
_24d=(cornerRadiusBottomLeftAdjusted>_24c)?cornerRadiusBottomLeftAdjusted:_24c;
}
if(cornerRadiusBottomRightAdjusted>0){
_24e=(cornerRadiusBottomRightAdjusted<_24c)?objj_msgSend(self,"width")-_24c:objj_msgSend(self,"width")-cornerRadiusBottomRightAdjusted;
}
CGPathAddRect(_24b,NULL,CGRectMake(_24d,objj_msgSend(self,"height")-_24c,_24e-_24d,_24c+objj_msgSend(self,"borderOverlap")));
CGPathCloseSubpath(_24b);
}
if(cornerRadiusBottomRightAdjusted>0){
if(_24c>=cornerRadiusBottomRightAdjusted){
CGPathMoveToPoint(_24b,NULL,objj_msgSend(self,"width"),objj_msgSend(self,"height"));
CGPathAddLineToPoint(_24b,NULL,objj_msgSend(self,"width")-_24c,objj_msgSend(self,"height")-_24c);
CGPathAddLineToPoint(_24b,NULL,objj_msgSend(self,"width")-_24c,objj_msgSend(self,"height"));
CGPathCloseSubpath(_24b);
}else{
if(borderBottomType==GDBorderTypeSolid&&_24c<cornerRadiusBottomRightAdjusted){
CGPathMoveToPoint(_24b,NULL,objj_msgSend(self,"width"),objj_msgSend(self,"height"));
CGPathAddArc(_24b,NULL,objj_msgSend(self,"width")-cornerRadiusBottomRightAdjusted,objj_msgSend(self,"height")-cornerRadiusBottomRightAdjusted,cornerRadiusBottomRightAdjusted-_24c,M_PI_4,M_PI_2,0);
CGPathAddLineToPoint(_24b,NULL,objj_msgSend(self,"width")-cornerRadiusBottomRightAdjusted,objj_msgSend(self,"height"));
CGPathCloseSubpath(_24b);
}
}
}
if(cornerRadiusBottomLeftAdjusted>0){
if(_24c>=cornerRadiusBottomLeftAdjusted){
CGPathMoveToPoint(_24b,NULL,0,objj_msgSend(self,"height"));
CGPathAddLineToPoint(_24b,NULL,_24c,objj_msgSend(self,"height")-_24c);
CGPathAddLineToPoint(_24b,NULL,_24c,objj_msgSend(self,"height"));
CGPathCloseSubpath(_24b);
}else{
if(borderBottomType==GDBorderTypeSolid&&_24c<cornerRadiusBottomLeftAdjusted){
CGPathMoveToPoint(_24b,NULL,cornerRadiusBottomLeftAdjusted,objj_msgSend(self,"height"));
CGPathAddArc(_24b,NULL,cornerRadiusBottomLeftAdjusted,objj_msgSend(self,"height")-cornerRadiusBottomLeftAdjusted,cornerRadiusBottomLeftAdjusted-_24c,M_PI_2,M_PI_2+M_PI_4,0);
CGPathAddLineToPoint(_24b,NULL,0,objj_msgSend(self,"height"));
CGPathCloseSubpath(_24b);
}
}
}
}
}),new objj_method(sel_getUid("addLeftBorderToFillPaths:"),function(self,_24f,_250){
with(self){
if(borderLeftWidthAdjusted<=0){
return;
}
var _251=objj_msgSend(_250,"objectForKey:",objj_msgSend(borderLeftColor,"cssString"));
var _252=borderLeftWidthAdjusted;
if(borderLeftType==GDBorderTypeSolid){
var _253=objj_msgSend(self,"defaultVerticalSquareBorderStart"),_254=objj_msgSend(self,"defaultVerticalSquareBorderEnd");
if(cornerRadiusTopLeftAdjusted>0){
_253=(cornerRadiusTopLeftAdjusted>_252)?cornerRadiusTopLeftAdjusted:_252;
}
if(cornerRadiusBottomLeftAdjusted>0){
_254=(cornerRadiusBottomLeftAdjusted<_252)?objj_msgSend(self,"height")-_252:objj_msgSend(self,"height")-cornerRadiusBottomLeftAdjusted;
}
CGPathAddRect(_251,NULL,CGRectMake(-objj_msgSend(self,"borderOverlap"),_253,_252+objj_msgSend(self,"borderOverlap"),_254-_253));
CGPathCloseSubpath(_251);
}
if(cornerRadiusBottomLeftAdjusted>0){
if(_252>=cornerRadiusBottomLeftAdjusted){
CGPathMoveToPoint(_251,NULL,0,objj_msgSend(self,"height"));
CGPathAddLineToPoint(_251,NULL,0,objj_msgSend(self,"height")-_252);
CGPathAddLineToPoint(_251,NULL,_252,objj_msgSend(self,"height")-_252);
CGPathCloseSubpath(_251);
}else{
if(borderLeftType==GDBorderTypeSolid&&_252<cornerRadiusBottomLeftAdjusted){
CGPathMoveToPoint(_251,NULL,0,objj_msgSend(self,"height"));
CGPathAddArc(_251,NULL,cornerRadiusBottomLeftAdjusted,objj_msgSend(self,"height")-cornerRadiusBottomLeftAdjusted,cornerRadiusBottomLeftAdjusted-_252,M_PI_2+M_PI_4,M_PI,0);
CGPathAddLineToPoint(_251,NULL,0,objj_msgSend(self,"height")-cornerRadiusBottomLeftAdjusted);
CGPathCloseSubpath(_251);
}
}
}
if(cornerRadiusTopLeftAdjusted>0){
if(_252>=cornerRadiusTopLeftAdjusted){
CGPathMoveToPoint(_251,NULL,0,0);
CGPathAddLineToPoint(_251,NULL,0,_252);
CGPathAddLineToPoint(_251,NULL,_252,_252);
CGPathCloseSubpath(_251);
}else{
if(borderLeftType==GDBorderTypeSolid&&_252<cornerRadiusTopLeftAdjusted){
CGPathMoveToPoint(_251,NULL,0,cornerRadiusTopLeftAdjusted);
CGPathAddArc(_251,NULL,cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted-_252,M_PI,M_PI+M_PI_4,0);
CGPathAddLineToPoint(_251,NULL,0,0);
CGPathCloseSubpath(_251);
}
}
}
}
}),new objj_method(sel_getUid("borderFillPathColors"),function(self,_255){
with(self){
return objj_msgSend(CPArray,"arrayWithObjects:",borderTopColor,borderRightColor,borderBottomColor,borderLeftColor,nil);
}
}),new objj_method(sel_getUid("prepareBorderFillPaths"),function(self,_256){
with(self){
var _257=objj_msgSend(CPMutableDictionary,"dictionary");
var _258=objj_msgSend(self,"borderFillPathColors");
for(var i=0;i<objj_msgSend(_258,"count");i++){
var _259=objj_msgSend(_258,"objectAtIndex:",i);
var path=CGPathCreateMutable();
objj_msgSend(_257,"setObject:forKey:",path,objj_msgSend(_259,"cssString"));
CGPathRelease(path);
}
return _257;
}
}),new objj_method(sel_getUid("drawBorderFillPaths:inContext:"),function(self,_25a,_25b,_25c){
with(self){
var _25d=objj_msgSend(_25b,"allKeys");
for(var i=0;i<objj_msgSend(_25d,"count");i++){
var _25e=objj_msgSend(_25d,"objectAtIndex:",i);
var path=objj_msgSend(_25b,"objectForKey:",_25e);
if(!CGPathIsEmpty(path)){
CGContextSaveGState(_25c);
var _25f=objj_msgSend(CPColor,"colorWithCSSString:",_25e);
CGContextSetFillColorWithAlpha(_25c,objj_msgSend(_25f,"colorWithAlphaComponent:",1),objj_msgSend(_25f,"alphaComponent"));
CGContextBeginPath(_25c);
CGContextAddPath(_25c,path);
CGContextFillPath(_25c);
CGContextRestoreGState(_25c);
}
}
}
}),new objj_method(sel_getUid("drawFillBorder"),function(self,_260){
with(self){
var _261=objj_msgSend(self,"prepareBorderFillPaths");
objj_msgSend(self,"addTopBorderToFillPaths:",_261);
objj_msgSend(self,"addRightBorderToFillPaths:",_261);
objj_msgSend(self,"addBottomBorderToFillPaths:",_261);
objj_msgSend(self,"addLeftBorderToFillPaths:",_261);
objj_msgSend(self,"drawBorderFillPaths:inContext:",_261,GDGetCurrentContext());
}
}),new objj_method(sel_getUid("drawRegularBorder"),function(self,_262){
with(self){
objj_msgSend(self,"drawFillBorder");
objj_msgSend(self,"drawStrokeBorder");
}
}),new objj_method(sel_getUid("drawGradientBorder"),function(self,_263){
with(self){
var _264=GDGetCurrentContext();
var _265=objj_msgSend(self,"bounds");
_265.origin=CGPointMake(0,0);
CGContextBeginPath(_264);
CGContextAddCounterClockwiseRect(_264,_265);
objj_msgSend(self,"addInnerCellPathToContext:",_264);
CGContextClosePath(_264);
CGContextClip(_264);
if(objj_msgSend(self,"borderGradientIsRadial")){
objj_msgSend(objj_msgSend(self,"borderGradientFill"),"radialFillRect:",_265);
}else{
objj_msgSend(objj_msgSend(self,"borderGradientFill"),"fillRect:angle:",_265,objj_msgSend(self,"borderGradientAngle")+90);
}
}
}),new objj_method(sel_getUid("drawBorder"),function(self,_266){
with(self){
if(!objj_msgSend(self,"hasBorders")){
return;
}
var _267=GDGetCurrentContext();
CGContextSaveGState(_267);
if(objj_msgSend(self,"borderGradient")){
objj_msgSend(self,"drawGradientBorder");
}else{
var _268=objj_msgSend(self,"bounds");
_268.origin=NSZeroPoint();
CGContextBeginPath(_267);
CGContextAddCounterClockwiseRect(_267,_268);
objj_msgSend(self,"addInnerCellPathToContext:",_267);
CGContextClosePath(_267);
CGContextClip(_267);
objj_msgSend(self,"drawRegularBorder");
}
CGContextRestoreGState(_267);
}
}),new objj_method(sel_getUid("createPathInContext:size:"),function(self,_269,_26a,size){
with(self){
CGContextBeginPath(_26a);
CGContextMoveToPoint(_26a,0,cornerRadiusTopLeftAdjusted);
CGContextAddArc(_26a,cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted,M_PI,M_PI+M_PI_2,true);
CGContextAddArc(_26a,size.width-cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted,M_PI+M_PI_2,0,true);
CGContextAddArc(_26a,size.width-cornerRadiusBottomRightAdjusted,size.height-cornerRadiusBottomRightAdjusted,cornerRadiusBottomRightAdjusted,0,M_PI_2,true);
CGContextAddArc(_26a,cornerRadiusBottomLeftAdjusted,size.height-cornerRadiusBottomLeftAdjusted,cornerRadiusBottomLeftAdjusted,M_PI_2,M_PI,true);
CGContextClosePath(_26a);
}
}),new objj_method(sel_getUid("drawDropShadow"),function(self,_26b){
with(self){
if(!dropShadow||(objj_msgSend(self,"width")*objj_msgSend(self,"height")>GDMaximumCellSizeForShadow)){
return;
}
var _26c=document.createElement("canvas");
_26c.width=objj_msgSend(self,"bounds").size.width+2*GDDropShadowLayerOverlap;
_26c.height=objj_msgSend(self,"bounds").size.height+2*GDDropShadowLayerOverlap;
var _26d=_26c.getContext("2d");
CGContextTranslateCTM(_26d,GDDropShadowLayerOverlap,GDDropShadowLayerOverlap);
_26d.fillStyle=objj_msgSend(dropShadowColor,"cssString");
CGContextSaveGState(_26d);
CGContextSetAntetypeDropShadow(_26d,dropShadowOffset,dropShadowAngle,dropShadowOpacity,dropShadowBlur*2,dropShadowColor);
var _26e=objj_msgSend(self,"bounds").size;
objj_msgSend(self,"createPathInContext:size:",_26d,_26e);
CGContextFillPath(_26d);
CGContextRestoreGState(_26d);
_26d.fillStyle=objj_msgSend(dropShadowColor,"cssString");
_26d.globalCompositeOperation="destination-out";
objj_msgSend(self,"createPathInContext:size:",_26d,_26e);
CGContextFillPath(_26d);
var _26f=GDGetCurrentContext();
CGContextSaveGState(_26f);
_26f.drawImage(_26c,-GDDropShadowLayerOverlap,-GDDropShadowLayerOverlap);
CGContextRestoreGState(_26f);
}
}),new objj_method(sel_getUid("drawInnerShadow"),function(self,_270){
with(self){
if(!innerShadow||(objj_msgSend(self,"width")*objj_msgSend(self,"height")>GDMaximumCellSizeForShadow)){
return;
}
var _271=GDGetCurrentContext();
CGContextSaveGState(_271);
CGContextSetAntetypeInnerShadow(_271,innerShadowOffset,innerShadowAngle,innerShadowOpacity,innerShadowBlur,innerShadowColor);
CGContextSetFillColor(_271,innerShadowColor);
var _272=fmaxf(fmaxf(fabsf(innerShadowOffset*2),innerShadowBlur*2),50);
var rect=CGRectMake(-_272,-_272,objj_msgSend(self,"width")+2*_272,objj_msgSend(self,"height")+2*_272);
CGContextBeginPath(_271);
CGContextAddCounterClockwiseRect(_271,rect);
objj_msgSend(self,"addOuterCellPathToContext:",_271);
CGContextClosePath(_271);
CGContextFillPath(_271);
CGContextRestoreGState(_271);
}
}),new objj_method(sel_getUid("drawBackground"),function(self,_273){
with(self){
var _274=GDGetCurrentContext();
CGContextSaveGState(_274);
var _275=objj_msgSend(self,"bounds");
_275.origin=NSZeroPoint();
objj_msgSend(objj_msgSend(self,"background"),"paintRect:",_275);
CGContextRestoreGState(_274);
}
}),new objj_method(sel_getUid("drawContentInRect:atScale:"),function(self,_276,rect,_277){
with(self){
var _278=GDGetCurrentContext();
CGContextSaveGState(_278);
objj_msgSend(objj_msgSend(self,"affineBorderTransform"),"concat");
var _279=CGRectMakeCopy(rect);
var _27a=objj_msgSend(self,"affineTransform");
objj_msgSend(_27a,"invert");
_279.origin=objj_msgSend(_27a,"transformPoint:",_279.origin);
var _27b=nil;
var _27c=objj_msgSend(self,"drawingEnumerator");
while((_27b=objj_msgSend(_27c,"nextObject"))!=nil){
objj_msgSend(_27b,"drawRect:atScale:",_279,_277);
}
CGContextRestoreGState(_278);
}
}),new objj_method(sel_getUid("drawText"),function(self,_27d){
with(self){
if(objj_msgSend(self,"hasTextContent")){
var _27e=GDGetCurrentContext();
CGContextSaveGState(_27e);
var _27f=objj_msgSend(self,"affineOriginTransform");
objj_msgSend(_27f,"invert");
objj_msgSend(_27f,"concat");
objj_msgSend(objj_msgSend(self,"textRenderObject"),"draw");
CGContextRestoreGState(_27e);
}
}
}),new objj_method(sel_getUid("shouldDrawInRect:"),function(self,_280,rect){
with(self){
return !((objj_msgSend(self,"visibility")!=GDVisibilityVisible)||(objj_msgSend(self,"isContentClipped")&&!NSIntersectsRect(rect,objj_msgSend(self,"drawBounds")))||(screenChangeManager!=nil&&!objj_msgSend(screenChangeManager,"renderObjectShouldDraw:",self)));
}
}),new objj_method(sel_getUid("drawRect:atScale:"),function(self,_281,rect,_282){
with(self){
if(!objj_msgSend(self,"shouldDrawInRect:",rect)){
return;
}
objj_msgSend(self,"adjustBordersAndCornersToAvailableSize");
var _283=GDGetCurrentContext();
CGContextSaveGState(_283);
var _284=objj_msgSend(self,"affineOriginTransform");
objj_msgSend(_284,"concat");
objj_msgSend(_284,"invert");
var _285=CGRectMakeCopy(rect);
_285.origin=objj_msgSend(_284,"transformPoint:",_285.origin);
CGContextSetAlpha(_283,objj_msgSend(self,"opacity"));
var _286=_283;
if(objj_msgSend(self,"opacity")<1){
var _287=0;
if(!objj_msgSend(self,"isContentClipped")){
_287=500;
}else{
if(dropShadow){
_287=GDDropShadowLayerOverlap;
}
}
_286=CGContextBeginTransparencyLayer(_283,CGRectMake(-_287,-_287,objj_msgSend(self,"width")+2*_287,objj_msgSend(self,"height")+2*_287),_285);
}
objj_msgSend(self,"drawDropShadow");
CGContextSaveGState(_286);
CGContextBeginPath(_286);
objj_msgSend(self,"addOuterCellPathToContext:",_286);
CGContextClosePath(_286);
CGContextClip(_286);
CGContextBeginTransparencyLayer(_286,CGRectMake(0,0,objj_msgSend(self,"width"),objj_msgSend(self,"height")),_285);
objj_msgSend(self,"drawBackground");
if(objj_msgSend(self,"isContentClipped")){
objj_msgSend(self,"drawContentInRect:atScale:",rect,_282);
objj_msgSend(self,"drawText");
}
objj_msgSend(self,"drawInnerShadow");
objj_msgSend(self,"drawBorder");
CGContextEndTransparencyLayer(_286);
CGContextRestoreGState(_286);
if(!objj_msgSend(self,"isContentClipped")){
objj_msgSend(self,"drawContentInRect:atScale:",rect,_282);
objj_msgSend(self,"drawText");
}
if(objj_msgSend(self,"opacity")<1){
CGContextEndTransparencyLayer(_283);
}
CGContextRestoreGState(_283);
}
}),new objj_method(sel_getUid("handles"),function(self,_288){
with(self){
return objj_msgSend(CPArray,"array");
}
}),new objj_method(sel_getUid("drawBounds"),function(self,_289){
with(self){
var _28a=objj_msgSend(self,"bounds");
if(!objj_msgSend(self,"isContentClipped")){
var _28b=objj_msgSend(self,"affineTransform");
var _28c=objj_msgSend(objj_msgSend(self,"orderedDisplayComponents"),"objectEnumerator");
var cell=nil;
while((cell=objj_msgSend(_28c,"nextObject"))!=nil){
var _28d=objj_msgSend(cell,"drawBounds");
_28d.origin=objj_msgSend(_28b,"transformPoint:",_28d.origin);
_28a=NSUnionRect(_28a,_28d);
}
}else{
var _28e=nil;
var _28c=objj_msgSend(objj_msgSend(self,"orderedDisplayComponents"),"objectEnumerator");
while((_28e=objj_msgSend(_28c,"nextObject"))!=nil){
var _28f=objj_msgSend(self,"absoluteAffineTransform");
objj_msgSend(_28f,"invert");
var _290=objj_msgSend(objj_msgSend(_28e,"deepDrawingAboveAllComponents"),"objectEnumerator");
var cell=nil;
while((cell=objj_msgSend(_290,"nextObject"))!=nil){
var _28d=objj_msgSend(cell,"globalDrawBounds");
_28d.origin=objj_msgSend(_28f,"transformPoint:",_28d.origin);
_28a=NSUnionRect(_28a,_28d);
}
}
}
if(dropShadow){
_28a=NSUnionRect(_28a,NSInsetRect(objj_msgSend(self,"bounds"),-GDDropShadowLayerOverlap,-GDDropShadowLayerOverlap));
}
return _28a;
}
}),new objj_method(sel_getUid("globalDrawBounds"),function(self,_291){
with(self){
var _292=objj_msgSend(self,"drawBounds");
_292.origin=objj_msgSend(objj_msgSend(self,"absoluteAffineTransform"),"transformPoint:",_292.origin);
return _292;
}
}),new objj_method(sel_getUid("redraw"),function(self,_293){
with(self){
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",self);
}
}),new objj_method(sel_getUid("activeLayout"),function(self,_294){
with(self){
return activeLayout;
}
}),new objj_method(sel_getUid("setActiveLayout:"),function(self,_295,_296){
with(self){
if(activeLayout==_296){
return;
}
objj_msgSend(self,"willChangeValueForKey:","activeLayout");
activeLayout=_296;
objj_msgSend(self,"didChangeValueForKey:","activeLayout");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalContainerLayout:",self);
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalContainerLayout:",self);
}
}),new objj_method(sel_getUid("activeHorizontalAlignment"),function(self,_297){
with(self){
return activeHorizontalAlignment;
}
}),new objj_method(sel_getUid("setActiveHorizontalAlignment:"),function(self,_298,_299){
with(self){
if(activeHorizontalAlignment==_299){
return;
}
objj_msgSend(self,"willChangeValueForKey:","activeHorizontalAlignment");
activeHorizontalAlignment=_299;
objj_msgSend(self,"didChangeValueForKey:","activeHorizontalAlignment");
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalContainerLayout:",self);
}
}),new objj_method(sel_getUid("activeVerticalAlignment"),function(self,_29a){
with(self){
return activeVerticalAlignment;
}
}),new objj_method(sel_getUid("setActiveVerticalAlignment:"),function(self,_29b,_29c){
with(self){
if(activeVerticalAlignment==_29c){
return;
}
objj_msgSend(self,"willChangeValueForKey:","activeVerticalAlignment");
activeVerticalAlignment=_29c;
objj_msgSend(self,"didChangeValueForKey:","activeVerticalAlignment");
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalContainerLayout:",self);
}
}),new objj_method(sel_getUid("shiftNonActiveComponentsToX:ignoreFlex:"),function(self,_29d,theX,_29e){
with(self){
var _29f=objj_msgSend(self,"orderedDisplayComponents");
if(objj_msgSend(_29f,"count")==0){
return 0;
}
var _2a0=1000000;
for(var i=0;i<objj_msgSend(_29f,"count");i++){
var _2a1=objj_msgSend(_29f,"objectAtIndex:",i);
if(objj_msgSend(_2a1,"activeLayout")){
continue;
}
if(_29e&&objj_msgSend(_2a1,"horizontalResizing")==GDFlexResizing){
continue;
}
_2a0=fminf(_2a0,objj_msgSend(_2a1,"fullBounds").origin.x);
}
var _2a2=theX-_2a0;
for(var i=0;i<objj_msgSend(_29f,"count");i++){
var _2a1=objj_msgSend(_29f,"objectAtIndex:",i);
if(objj_msgSend(_2a1,"activeLayout")){
continue;
}
if(_29e&&objj_msgSend(_2a1,"horizontalResizing")==GDFlexResizing){
objj_msgSend(_2a1,"setFullX:",theX);
}else{
objj_msgSend(_2a1,"setFullX:",objj_msgSend(_2a1,"fullBounds").origin.x+_2a2);
}
}
return _2a2;
}
}),new objj_method(sel_getUid("shiftNonActiveComponentsToY:ignoreFlex:"),function(self,_2a3,theY,_2a4){
with(self){
var _2a5=objj_msgSend(self,"orderedDisplayComponents");
if(objj_msgSend(_2a5,"count")==0){
return 0;
}
var _2a6=10000000;
for(var i=0;i<objj_msgSend(_2a5,"count");i++){
var _2a7=objj_msgSend(_2a5,"objectAtIndex:",i);
if(objj_msgSend(_2a7,"activeLayout")){
continue;
}
if(_2a4&&objj_msgSend(_2a7,"verticalResizing")==GDFlexResizing){
continue;
}
_2a6=fminf(_2a6,objj_msgSend(_2a7,"fullBounds").origin.y);
}
var _2a8=theY-_2a6;
for(var i=0;i<objj_msgSend(_2a5,"count");i++){
var _2a7=objj_msgSend(_2a5,"objectAtIndex:",i);
if(objj_msgSend(_2a7,"activeLayout")){
continue;
}
if(_2a4&&objj_msgSend(_2a7,"verticalResizing")==GDFlexResizing){
objj_msgSend(_2a7,"setFullY:",theY);
}else{
objj_msgSend(_2a7,"setFullY:",objj_msgSend(_2a7,"fullBounds").origin.y+_2a8);
}
}
return _2a8;
}
}),new objj_method(sel_getUid("needsHorizontalLayout"),function(self,_2a9){
with(self){
return needsHorizontalLayout;
}
}),new objj_method(sel_getUid("needsVerticalLayout"),function(self,_2aa){
with(self){
return needsVerticalLayout;
}
}),new objj_method(sel_getUid("needsPassOnVerticalLayout"),function(self,_2ab){
with(self){
return needsPassOnVerticalLayout;
}
}),new objj_method(sel_getUid("needsPassOnHorizontalLayout"),function(self,_2ac){
with(self){
return needsPassOnHorizontalLayout;
}
}),new objj_method(sel_getUid("setNeedsHorizontalCellLayout"),function(self,_2ad){
with(self){
needsHorizontalLayout=YES;
if(objj_msgSend(self,"horizontalResizing")==GDIntrinsicResizing){
objj_msgSend(objj_msgSend(self,"container"),"setNeedsHorizontalCellLayout");
}else{
objj_msgSend(objj_msgSend(self,"container"),"setNeedsPassOnHorizontalLayout");
}
}
}),new objj_method(sel_getUid("setNeedsHorizontalContainerLayout"),function(self,_2ae){
with(self){
objj_msgSend(objj_msgSend(self,"container"),"setNeedsHorizontalCellLayout");
}
}),new objj_method(sel_getUid("setNeedsHorizontalLayout"),function(self,_2af){
with(self){
needsHorizontalLayout=YES;
objj_msgSend(objj_msgSend(self,"container"),"setNeedsHorizontalCellLayout");
}
}),new objj_method(sel_getUid("setNeedsPassOnHorizontalLayout"),function(self,_2b0){
with(self){
needsPassOnHorizontalLayout=YES;
objj_msgSend(objj_msgSend(self,"container"),"setNeedsPassOnHorizontalLayout");
}
}),new objj_method(sel_getUid("setNeedsVerticalCellLayout"),function(self,_2b1){
with(self){
needsVerticalLayout=YES;
if(objj_msgSend(self,"verticalResizing")==GDIntrinsicResizing){
objj_msgSend(objj_msgSend(self,"container"),"setNeedsVerticalCellLayout");
}else{
objj_msgSend(objj_msgSend(self,"container"),"setNeedsPassOnVerticalLayout");
}
}
}),new objj_method(sel_getUid("setNeedsVerticalContainerLayout"),function(self,_2b2){
with(self){
objj_msgSend(objj_msgSend(self,"container"),"setNeedsVerticalCellLayout");
}
}),new objj_method(sel_getUid("setNeedsVerticalLayout"),function(self,_2b3){
with(self){
needsVerticalLayout=YES;
objj_msgSend(objj_msgSend(self,"container"),"setNeedsVerticalCellLayout");
}
}),new objj_method(sel_getUid("setNeedsPassOnVerticalLayout"),function(self,_2b4){
with(self){
needsPassOnVerticalLayout=YES;
objj_msgSend(objj_msgSend(self,"container"),"setNeedsPassOnVerticalLayout");
}
}),new objj_method(sel_getUid("setNeedsHorizontalLayoutCellOnly:"),function(self,_2b5,_2b6){
with(self){
needsHorizontalLayout=_2b6;
}
}),new objj_method(sel_getUid("setNeedsVerticalLayoutCellOnly:"),function(self,_2b7,_2b8){
with(self){
needsVerticalLayout=_2b8;
}
}),new objj_method(sel_getUid("horizontalLayoutIfNeeded"),function(self,_2b9){
with(self){
objj_msgSend(self,"layoutIfNeededUsingAdaptor:",objj_msgSend(self,"createHorizontalLayoutAdaptor"));
}
}),new objj_method(sel_getUid("verticalLayoutIfNeeded"),function(self,_2ba){
with(self){
objj_msgSend(self,"layoutIfNeededUsingAdaptor:",objj_msgSend(self,"createVerticalLayoutAdaptor"));
}
}),new objj_method(sel_getUid("layoutIfNeededUsingAdaptor:"),function(self,_2bb,_2bc){
with(self){
if(objj_msgSend(_2bc,"isVertical")){
if(objj_msgSend(self,"needsVerticalLayout")){
objj_msgSend(objj_msgSend(self,"layoutPolicy"),"layoutAdaptor:",_2bc);
}else{
if(objj_msgSend(self,"needsPassOnVerticalLayout")){
objj_msgSend(_2bc,"layoutComponents");
}
}
needsVerticalLayout=NO;
needsPassOnVerticalLayout=NO;
return;
}
if(objj_msgSend(_2bc,"isHorizontal")){
if(objj_msgSend(self,"needsHorizontalLayout")){
objj_msgSend(objj_msgSend(self,"layoutPolicy"),"layoutAdaptor:",_2bc);
}else{
if(objj_msgSend(self,"needsPassOnHorizontalLayout")){
objj_msgSend(_2bc,"layoutComponents");
}
}
needsHorizontalLayout=NO;
needsPassOnHorizontalLayout=NO;
return;
}
}
}),new objj_method(sel_getUid("createHorizontalLayoutAdaptor"),function(self,_2bd){
with(self){
return objj_msgSend(GDHorizontalLayoutAdaptor,"adaptorForRenderObject:",self);
}
}),new objj_method(sel_getUid("createVerticalLayoutAdaptor"),function(self,_2be){
with(self){
return objj_msgSend(GDVerticalLayoutAdaptor,"adaptorForRenderObject:",self);
}
}),new objj_method(sel_getUid("addOuterCellPathToContext:"),function(self,_2bf,_2c0){
with(self){
var _2c1=objj_msgSend(self,"bounds");
_2c1.origin=CGPointMake(0,0);
CGContextMoveToPoint(_2c0,NSMinX(_2c1)+cornerRadiusTopLeftAdjusted,NSMinY(_2c1));
if(cornerRadiusTopRightAdjusted>0){
CGContextAddArc(_2c0,NSMaxX(_2c1)-cornerRadiusTopRightAdjusted,NSMinY(_2c1)+cornerRadiusTopRightAdjusted,cornerRadiusTopRightAdjusted,M_PI+M_PI_2,0,1);
}else{
CGContextAddLineToPoint(_2c0,NSMaxX(_2c1),NSMinY(_2c1));
}
if(cornerRadiusBottomRightAdjusted>0){
CGContextAddArc(_2c0,NSMaxX(_2c1)-cornerRadiusBottomRightAdjusted,NSMaxY(_2c1)-cornerRadiusBottomRightAdjusted,cornerRadiusBottomRightAdjusted,0,M_PI_2,1);
}else{
CGContextAddLineToPoint(_2c0,NSMaxX(_2c1),NSMaxY(_2c1));
}
if(cornerRadiusBottomLeftAdjusted>0){
CGContextAddArc(_2c0,NSMinX(_2c1)+cornerRadiusBottomLeftAdjusted,NSMaxY(_2c1)-cornerRadiusBottomLeftAdjusted,cornerRadiusBottomLeftAdjusted,M_PI_2,M_PI,1);
}else{
CGContextAddLineToPoint(_2c0,NSMinX(_2c1),NSMaxY(_2c1));
}
if(cornerRadiusTopLeftAdjusted>0){
CGContextAddArc(_2c0,NSMinX(_2c1)+cornerRadiusTopLeftAdjusted,NSMinY(_2c1)+cornerRadiusTopLeftAdjusted,cornerRadiusTopLeftAdjusted,M_PI,M_PI+M_PI_2,1);
}else{
CGContextAddLineToPoint(_2c0,NSMinX(_2c1),NSMinY(_2c1));
CGContextAddLineToPoint(_2c0,NSMinX(_2c1)+cornerRadiusTopLeftAdjusted,NSMinY(_2c1));
}
}
}),new objj_method(sel_getUid("addInnerCellPathToContext:"),function(self,_2c2,_2c3){
with(self){
var top=objj_msgSend(self,"borderTopWidthAdjusted");
var _2c4=objj_msgSend(self,"borderRightWidthAdjusted");
var _2c5=objj_msgSend(self,"borderBottomWidthAdjusted");
var left=objj_msgSend(self,"borderLeftWidthAdjusted");
var _2c6=objj_msgSend(self,"cornerRadiusTopLeftAdjusted");
var _2c7=objj_msgSend(self,"cornerRadiusBottomLeftAdjusted");
var _2c8=objj_msgSend(self,"cornerRadiusTopRightAdjusted");
var _2c9=objj_msgSend(self,"cornerRadiusBottomRightAdjusted");
var _2ca;
if(_2c6<=0){
CGContextMoveToPoint(_2c3,left,top);
_2ca=CGPointMake(left,top);
}else{
if(left>_2c6){
CGContextMoveToPoint(_2c3,left,left);
_2ca=CGPointMake(left,left);
}else{
CGContextAddArc(_2c3,_2c6,_2c6,_2c6-left,M_PI,M_PI+M_PI_4,1);
_2ca=CGPointMake(left,_2c6);
}
if(top>_2c6){
CGContextAddLineToPoint(_2c3,top,top);
}else{
CGContextAddArc(_2c3,_2c6,_2c6,_2c6-top,M_PI+M_PI_4,M_PI+M_PI_2,1);
}
}
if(_2c8<=0){
CGContextAddLineToPoint(_2c3,objj_msgSend(self,"width")-_2c4,top);
}else{
if(top>_2c8){
CGContextAddLineToPoint(_2c3,objj_msgSend(self,"width")-top,top);
}else{
CGContextAddArc(_2c3,objj_msgSend(self,"width")-_2c8,_2c8,_2c8-top,M_PI+M_PI_2,M_PI+M_PI_2+M_PI_4,1);
}
if(_2c4>_2c8){
CGContextAddLineToPoint(_2c3,objj_msgSend(self,"width")-_2c4,_2c4);
}else{
CGContextAddArc(_2c3,objj_msgSend(self,"width")-_2c8,_2c8,_2c8-_2c4,M_PI+M_PI_2+M_PI_4,0,1);
}
}
if(_2c9<=0){
CGContextAddLineToPoint(_2c3,objj_msgSend(self,"width")-_2c4,objj_msgSend(self,"height")-_2c5);
}else{
if(_2c4>_2c9){
CGContextAddLineToPoint(_2c3,objj_msgSend(self,"width")-_2c4,objj_msgSend(self,"height")-_2c4);
}else{
CGContextAddArc(_2c3,objj_msgSend(self,"width")-_2c9,objj_msgSend(self,"height")-_2c9,_2c9-_2c4,0,M_PI_4,1);
}
if(_2c5>_2c9){
CGContextAddLineToPoint(_2c3,objj_msgSend(self,"width")-_2c5,objj_msgSend(self,"height")-_2c5);
}else{
CGContextAddArc(_2c3,objj_msgSend(self,"width")-_2c9,objj_msgSend(self,"height")-_2c9,_2c9-_2c5,M_PI_4,M_PI_2,1);
}
}
if(_2c7<=0){
CGContextAddLineToPoint(_2c3,left,objj_msgSend(self,"height")-_2c5);
}else{
if(_2c5>_2c7){
CGContextAddLineToPoint(_2c3,_2c5,objj_msgSend(self,"height")-_2c5);
}else{
CGContextAddArc(_2c3,_2c7,objj_msgSend(self,"height")-_2c7,_2c7-_2c5,M_PI_2,M_PI_2+M_PI_4,1);
}
if(left>_2c7){
CGContextAddLineToPoint(_2c3,left,objj_msgSend(self,"height")-left);
}else{
CGContextAddArc(_2c3,_2c7,objj_msgSend(self,"height")-_2c7,_2c7-left,M_PI_2+M_PI_4,M_PI,1);
}
}
CGContextAddLineToPoint(_2c3,_2ca.x,_2ca.y);
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("keyPathsForValuesAffectingTextAttributedString"),function(self,_2cb){
with(self){
return objj_msgSend(CPSet,"setWithObject:","textStringValue");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingTextStringValue"),function(self,_2cc){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","textAttributedString","textRenderObject.stringValue",nil);
}
})]);
p;26;GDCircleCellRenderObject.jt;7441;@STATIC;1.0;i;20;GDCellRenderObject.jt;7397;
objj_executeFile("GDCellRenderObject.j",YES);
var _1=objj_allocateClassPair(GDCellRenderObject,"GDCircleCellRenderObject"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDCircleCellRenderObject").super_class},"init");
if(_3==nil){
return nil;
}
rotationAngle=180;
return _3;
}
}),new objj_method(sel_getUid("circleBorderWidth"),function(_5,_6){
with(_5){
return objj_msgSend(_5,"borderTopWidth");
}
}),new objj_method(sel_getUid("setCircleBorderWidth:"),function(_7,_8,_9){
with(_7){
objj_msgSend(_7,"setBorderTopWidth:",_9);
}
}),new objj_method(sel_getUid("circleBorderColor"),function(_a,_b){
with(_a){
return objj_msgSend(_a,"borderTopColor");
}
}),new objj_method(sel_getUid("setCircleBorderColor:"),function(_c,_d,_e){
with(_c){
objj_msgSend(_c,"setBorderTopColor:",_e);
}
}),new objj_method(sel_getUid("circleBorderWidthAdjusted"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"borderTopWidthAdjusted");
}
}),new objj_method(sel_getUid("setCircleBorderWidthAdjusted:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"setBorderTopWidthAdjusted:",_13);
}
}),new objj_method(sel_getUid("setCircleBorderType:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"setBorderTopType:",_16);
}
}),new objj_method(sel_getUid("circleBorderType"),function(_17,_18){
with(_17){
return objj_msgSend(_17,"borderTopType");
}
}),new objj_method(sel_getUid("cellType"),function(_19,_1a){
with(_19){
return GDCircleCellType;
}
}),new objj_method(sel_getUid("hasBorders"),function(_1b,_1c){
with(_1b){
return objj_msgSend(_1b,"circleBorderWidth")>0;
}
}),new objj_method(sel_getUid("adjustBordersToAvailableSize"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_1d,"width");
var _20=objj_msgSend(_1d,"height");
objj_msgSend(_1d,"setCircleBorderWidthAdjusted:",objj_msgSend(_1d,"circleBorderWidth"));
if(objj_msgSend(_1d,"circleBorderWidthAdjusted")*2>_1f){
objj_msgSend(_1d,"setCircleBorderWidthAdjusted:",floorf(_1f/2));
}
if(objj_msgSend(_1d,"circleBorderWidthAdjusted")*2>_20){
objj_msgSend(_1d,"setCircleBorderWidthAdjusted:",floorf(_20/2));
}
}
}),new objj_method(sel_getUid("drawRegularBorder"),function(_21,_22){
with(_21){
var _23=GDGetCurrentContext();
var _24=objj_msgSend(_21,"bounds");
_24.origin=NSZeroPoint();
CGContextSetStrokeColorWithAlpha(_23,objj_msgSend(_21,"circleBorderColor"),objj_msgSend(objj_msgSend(_21,"circleBorderColor"),"alphaComponent"));
var _25=objj_msgSend(_21,"circleBorderWidthAdjusted");
CGContextSetLineWidth(_23,_25+objj_msgSend(_21,"borderOverlap"));
_24.origin.x+=(_25/2);
_24.origin.y+=(_25/2);
_24.size.width-=_25;
_24.size.height-=_25;
var _26=CGPathCreateMutable();
objj_msgSend(_21,"addEllipseInRect:inPath:",_24,_26);
objj_msgSend(_21,"drawBorderPath:inContext:borderType:borderWidth:phase:",_26,_23,objj_msgSend(_21,"circleBorderType"),_25,0);
CGPathRelease(_26);
}
}),new objj_method(sel_getUid("createPathInContext:size:"),function(_27,_28,_29,_2a){
with(_27){
CGContextAddEllipseInRect(_29,CGRectMake(0,0,bounds.size.width,bounds.size.height));
}
}),new objj_method(sel_getUid("drawDropShadowToLayerContext:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(_2b,"bounds");
var _2f=2*dropShadowSize;
var _30=CGRectMake(dropShadowBlur*2,dropShadowBlur*2,_2e.size.width+_2f,_2e.size.height+_2f);
var _31=cgRectFromNSRect(_30);
CGContextFillEllipseInRect(_2d,_31);
}
}),new objj_method(sel_getUid("affineBorderTransform"),function(_32,_33){
with(_32){
var _34=objj_msgSend(GDAffineTransform,"transform");
objj_msgSend(_34,"translateXBy:yBy:",objj_msgSend(_32,"circleBorderWidth"),objj_msgSend(_32,"circleBorderWidth"));
return _34;
}
}),new objj_method(sel_getUid("innerBounds"),function(_35,_36){
with(_35){
var _37=objj_msgSend(_35,"bounds");
return CGRectMake(_37.origin.x+objj_msgSend(_35,"circleBorderWidth")+objj_msgSend(_35,"paddingLeft"),_37.origin.y+objj_msgSend(_35,"circleBorderWidth")+objj_msgSend(_35,"paddingTop"),_37.size.width-objj_msgSend(_35,"circleBorderWidth")-objj_msgSend(_35,"circleBorderWidth")-objj_msgSend(_35,"paddingLeft")-objj_msgSend(_35,"paddingRight"),_37.size.height-objj_msgSend(_35,"circleBorderWidth")-objj_msgSend(_35,"circleBorderWidth")-objj_msgSend(_35,"paddingTop")-objj_msgSend(_35,"paddingBottom"));
}
}),new objj_method(sel_getUid("setInnerBounds:"),function(_38,_39,r){
with(_38){
objj_msgSend(_38,"setBounds:",CGRectMake(r.origin.x-objj_msgSend(_38,"paddingLeft")-objj_msgSend(_38,"circleBorderWidth"),r.origin.y-objj_msgSend(_38,"paddingTop")-objj_msgSend(_38,"circleBorderWidth"),r.size.width+objj_msgSend(_38,"paddingLeft")+objj_msgSend(_38,"paddingRight")+objj_msgSend(_38,"circleBorderWidth")+objj_msgSend(_38,"circleBorderWidth"),r.size.height+objj_msgSend(_38,"paddingTop")+objj_msgSend(_38,"paddingBottom")+objj_msgSend(_38,"circleBorderWidth")+objj_msgSend(_38,"circleBorderWidth")));
}
}),new objj_method(sel_getUid("globalInnerBounds"),function(_3a,_3b){
with(_3a){
var _3c=objj_msgSend(_3a,"globalBounds");
return CGRectMake(_3c.origin.x+objj_msgSend(_3a,"circleBorderWidth")+objj_msgSend(_3a,"paddingLeft"),_3c.origin.y+objj_msgSend(_3a,"circleBorderWidth")+objj_msgSend(_3a,"paddingTop"),_3c.size.width-objj_msgSend(_3a,"circleBorderWidth")-objj_msgSend(_3a,"circleBorderWidth")-objj_msgSend(_3a,"paddingLeft")-objj_msgSend(_3a,"paddingRight"),_3c.size.height-objj_msgSend(_3a,"circleBorderWidth")-objj_msgSend(_3a,"circleBorderWidth")-objj_msgSend(_3a,"paddingTop")-objj_msgSend(_3a,"paddingBottom"));
}
}),new objj_method(sel_getUid("addEllipseInRect:inContext:"),function(_3d,_3e,_3f,_40){
with(_3d){
var _41=CGPathCreateMutable();
objj_msgSend(_3d,"addEllipseInRect:inPath:",_3f,_41);
CGContextAddPath(_40,_41);
CGPathRelease(_41);
}
}),new objj_method(sel_getUid("addEllipseInRect:inPath:"),function(_42,_43,_44,_45){
with(_42){
var _46=4*((SQRT2-1)/3);
if(NSWidth(_44)==NSHeight(_44)){
CGPathAddArc(_45,NULL,NSMidX(_44),NSMidY(_44),NSWidth(_44)/2,0,2*M_PI,YES);
}else{
var _47=CGSizeMake(NSWidth(_44)/2,NSHeight(_44)/2),_48=CGPointMake(NSMinX(_44)+_47.width,NSMinY(_44)+_47.height);
CGPathMoveToPoint(_45,NULL,_48.x,_48.y-_47.height);
CGPathAddCurveToPoint(_45,NULL,_48.x+(_46*_47.width),_48.y-_47.height,_48.x+_47.width,_48.y-(_46*_47.height),_48.x+_47.width,_48.y);
CGPathAddCurveToPoint(_45,NULL,_48.x+_47.width,_48.y+(_46*_47.height),_48.x+(_46*_47.width),_48.y+_47.height,_48.x,_48.y+_47.height);
CGPathAddCurveToPoint(_45,NULL,_48.x-(_46*_47.width),_48.y+_47.height,_48.x-_47.width,_48.y+(_46*_47.height),_48.x-_47.width,_48.y);
CGPathAddCurveToPoint(_45,NULL,_48.x-_47.width,_48.y-(_46*_47.height),_48.x-(_46*_47.width),_48.y-_47.height,_48.x,_48.y-_47.height);
}
}
}),new objj_method(sel_getUid("addOuterCellPathToContext:"),function(_49,_4a,_4b){
with(_49){
var _4c=objj_msgSend(_49,"bounds");
_4c.origin=CGPointMake(0,0);
objj_msgSend(_49,"addEllipseInRect:inContext:",_4c,_4b);
}
}),new objj_method(sel_getUid("addInnerCellPathToContext:"),function(_4d,_4e,_4f){
with(_4d){
var _50=objj_msgSend(_4d,"bounds");
_50.origin=CGPointMake(objj_msgSend(_4d,"circleBorderWidthAdjusted"),objj_msgSend(_4d,"circleBorderWidthAdjusted"));
_50.size.width-=(2*objj_msgSend(_4d,"circleBorderWidthAdjusted"));
_50.size.height-=(2*objj_msgSend(_4d,"circleBorderWidthAdjusted"));
objj_msgSend(_4d,"addEllipseInRect:inContext:",_50,_4f);
}
})]);
p;22;GDCocoaCompatibility.jt;3301;@STATIC;1.0;t;3282;
INFINITY=Number.POSITIVE_INFINITY;
M_PI=Math.PI;
M_PI_2=(Math.PI/2);
M_PI_4=(Math.PI/4);
floorf=function(_1){
return Math.floor(_1);
};
fmaxf=function(a,b){
return Math.max(a,b);
};
fmax=function(a,b){
return Math.max(a,b);
};
fminf=function(a,b){
return Math.min(a,b);
};
fabsf=function(a){
return Math.abs(a);
};
powf=function(a,b){
return Math.pow(a,b);
};
pow=function(a,b){
return Math.pow(a,b);
};
sqrtf=function(a){
return Math.sqrt(a);
};
acosf=function(x){
return Math.acos(x);
};
sinf=function(x){
return Math.sin(x);
};
tanf=function(x){
return Math.tan(x);
};
cosf=function(x){
return Math.cos(x);
};
sin=function(x){
return Math.sin(x);
};
cos=function(x){
return Math.cos(x);
};
tan=function(x){
return Math.tan(x);
};
roundf=function(x){
return Math.round(x);
};
NSEqualRects=function(r1,r2){
if(r1==nil||r2==nil){
return NO;
}
return CGRectEqualToRect(r1,r2);
};
NSEqualPoints=function(a,b){
return CGPointEqualToPoint(a,b);
};
NSEqualSizes=function(a,b){
return CGSizeEqualToSize(a,b);
};
NSPointInRect=function(p,r){
return CGRectContainsPoint(r,p);
};
NSUnionRect=function(r1,r2){
return CGRectUnion(r1,r2);
};
NSMidY=function(r){
return CGRectGetMidY(r);
};
NSMidX=function(r){
return CGRectGetMidX(r);
};
NSMinY=function(r){
return CGRectGetMinY(r);
};
NSMaxY=function(r){
return CGRectGetMaxY(r);
};
NSMinX=function(r){
return CGRectGetMinX(r);
};
NSMaxX=function(r){
return CGRectGetMaxX(r);
};
NSWidth=function(r){
return r.size.width;
};
NSHeight=function(r){
return r.size.height;
};
NSZeroPoint=function(){
return CGPointMake(0,0);
};
NSZeroRect=function(){
return CGRectMake(0,0,0,0);
};
NSMakeRect=function(a,b,c,d){
return CGRectMake(a,b,c,d);
};
NSMakePoint=function(a,b){
return CGPointMake(a,b);
};
NSMakeSize=function(a,b){
return CGSizeMake(a,b);
};
NSIntersectsRect=function(a,b){
return CGRectIntersectsRect(a,b);
};
NSInsetRect=function(r,a,b){
return CGRectInset(r,a,b);
};
NSOffsetRect=function(r,a,b){
return CGRectOffset(r,a,b);
};
NSPrintRect=function(r){
console.log(r.origin.x+" "+r.origin.y+" "+r.size.width+" "+r.size.height);
};
STAssertTrue=function(a,m){
objj_msgSend(OJAssert,"assertTrue:message:",a,m);
};
STAssertFalse=function(a,m){
objj_msgSend(OJAssert,"assertFalse:message:",a,m);
};
STAssertEquals=function(a,b,m){
objj_msgSend(OJAssert,"assert:equals:message:",a,b,m);
};
STAssertEqualRects=function(a,b,m){
objj_msgSend(OJAssert,"assert:equals:message:",a.origin.x,b.origin.x,"wrong x value of rect");
objj_msgSend(OJAssert,"assert:equals:message:",a.origin.y,b.origin.y,"wrong y value of rect");
objj_msgSend(OJAssert,"assert:equals:message:",a.size.width,b.size.width,"wrong width value of rect");
objj_msgSend(OJAssert,"assert:equals:message:",a.size.height,b.size.height,"wrong height value of rect");
};
STAssertEqualPoints=function(a,b,m){
objj_msgSend(OJAssert,"assert:equals:message:",a.x,b.x,"wrong x value of point");
objj_msgSend(OJAssert,"assert:equals:message:",a.y,b.y,"wrong y value of point");
};
STAssertEqualSizes=function(a,b,m){
objj_msgSend(OJAssert,"assert:equals:message:",a.width,b.width,"wrong width value of size");
objj_msgSend(OJAssert,"assert:equals:message:",a.height,b.height,"wrong height value of size");
};
STAssertNil=function(a,m){
objj_msgSend(OJAssert,"assertNull:message:",a,m);
};
p;19;GDCompositeFigure.jt;2799;@STATIC;1.0;i;15;GDModelObject.jI;23;Foundation/Foundation.ji;22;CPIndexPathAdditions.jt;2705;
objj_executeFile("GDModelObject.j",YES);
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("CPIndexPathAdditions.j",YES);
var _1=objj_allocateClassPair(GDModelObject,"GDCompositeFigure"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("orderedComponents"),new objj_ivar("container"),new objj_ivar("name")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("initFromJSONObject:inProject:"),function(_8,_9,_a,_b){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("GDCompositeFigure").super_class},"initFromJSONObject:inProject:",_a,_b);
if(_8==nil){
return nil;
}
name=_a.name;
orderedComponents=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
var _c=nil;
var _d=objj_msgSend(_a.orderedComponents,"objectEnumerator");
while((_c=objj_msgSend(_d,"nextObject"))!=nil){
var _e=objj_msgSend(GDModelObject,"fromJSONObject:inProject:",_c,_b);
objj_msgSend(orderedComponents,"addObject:",_e);
objj_msgSend(_e,"setContainer:",_8);
}
return _8;
}
}),new objj_method(sel_getUid("container"),function(_f,_10){
with(_f){
return container;
}
}),new objj_method(sel_getUid("setContainer:"),function(_11,_12,_13){
with(_11){
container=_13;
}
}),new objj_method(sel_getUid("orderedComponents"),function(_14,_15){
with(_14){
return orderedComponents;
}
}),new objj_method(sel_getUid("acceptVisitor:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_18,"visitCompositeFigure:",_16);
objj_msgSend(orderedComponents,"makeObjectsPerformSelector:withObject:",sel_getUid("acceptVisitor:"),_18);
}
}),new objj_method(sel_getUid("isTable"),function(_19,_1a){
with(_19){
return NO;
}
}),new objj_method(sel_getUid("isTableCell"),function(_1b,_1c){
with(_1b){
return NO;
}
}),new objj_method(sel_getUid("isTableRow"),function(_1d,_1e){
with(_1d){
return objj_msgSend(objj_msgSend(_1d,"container"),"isTable");
}
}),new objj_method(sel_getUid("isHandle"),function(_1f,_20){
with(_1f){
return NO;
}
}),new objj_method(sel_getUid("rootInstanceCell"),function(_21,_22){
with(_21){
return objj_msgSend(container,"rootInstanceCell");
}
}),new objj_method(sel_getUid("figureWithIndexPath:"),function(_23,_24,_25){
with(_23){
if(objj_msgSend(_25,"length")==0){
return _23;
}
var _26=objj_msgSend(_25,"indexAtPosition:",0);
if(_26>objj_msgSend(orderedComponents,"count")){
return nil;
}
var _27=objj_msgSend(orderedComponents,"objectAtIndex:",_26);
var _28=objj_msgSend(_25,"indexPathByRemovingFirstIndex");
if(objj_msgSend(_28,"length")>0){
return objj_msgSend(_27,"figureWithIndexPath:",_28);
}
return _27;
}
})]);
p;9;GDEvent.jt;5138;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;5071;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
var _1=objj_allocateClassPair(CPObject,"GDEvent"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("modifierFlags"),new objj_ivar("locationInWindow"),new objj_ivar("keyCode"),new objj_ivar("type"),new objj_ivar("locationInView"),new objj_ivar("clickCount"),new objj_ivar("cocoaEvent")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCocoaEvent:inView:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSend(_3,"init");
modifierFlags=objj_msgSend(_5,"modifierFlags");
locationInWindow=objj_msgSend(_5,"locationInWindow");
locationInView=objj_msgSend(_6,"convertPoint:fromView:",locationInWindow,nil);
if(objj_msgSend(_5,"type")==CPKeyDown||objj_msgSend(_5,"type")==CPKeyUp){
keyCode=objj_msgSend(_5,"keyCode");
}else{
clickCount=objj_msgSend(_5,"clickCount");
}
type=objj_msgSend(_5,"type");
cocoaEvent=objj_msgSend(_5,"retain");
return _3;
}
}),new objj_method(sel_getUid("initWithType:locationInView:keyCode:modifierFlags:"),function(_7,_8,_9,p,_a,_b){
with(_7){
_7=objj_msgSend(_7,"initWithType:locationInView:keyCode:modifierFlags:clickCount:",_9,p,_a,_b,1);
return _7;
}
}),new objj_method(sel_getUid("initWithType:locationInView:keyCode:modifierFlags:clickCount:"),function(_c,_d,_e,p,_f,_10,_11){
with(_c){
_c=objj_msgSend(_c,"init");
modifierFlags=_10;
locationInView=p;
keyCode=_f;
type=_e;
clickCount=_11;
return _c;
}
}),new objj_method(sel_getUid("shiftKeyPressed"),function(_12,_13){
with(_12){
return (modifierFlags&CPShiftKeyMask)>0;
}
}),new objj_method(sel_getUid("optionKeyPressed"),function(_14,_15){
with(_14){
return (modifierFlags&CPAlternateKeyMask)>0;
}
}),new objj_method(sel_getUid("controlKeyPressed"),function(_16,_17){
with(_16){
return (modifierFlags&CPControlKeyMask)>0;
}
}),new objj_method(sel_getUid("commandKeyPressed"),function(_18,_19){
with(_18){
return (modifierFlags&CPCommandKeyMask)>0;
}
}),new objj_method(sel_getUid("locationInWindow"),function(_1a,_1b){
with(_1a){
return locationInWindow;
}
}),new objj_method(sel_getUid("locationInView"),function(_1c,_1d){
with(_1c){
return locationInView;
}
}),new objj_method(sel_getUid("keyCode"),function(_1e,_1f){
with(_1e){
return keyCode;
}
}),new objj_method(sel_getUid("setClickCount:"),function(_20,_21,_22){
with(_20){
clickCount=_22;
}
}),new objj_method(sel_getUid("clickCount"),function(_23,_24){
with(_23){
return clickCount;
}
}),new objj_method(sel_getUid("cocoaEvent"),function(_25,_26){
with(_25){
return cocoaEvent;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("eventWithCocoaEvent:inView:"),function(_27,_28,_29,_2a){
with(_27){
return objj_msgSend(objj_msgSend(objj_msgSend(_27,"alloc"),"initWithCocoaEvent:inView:",_29,_2a),"autorelease");
}
}),new objj_method(sel_getUid("eventWithMouseDownAtPoint:"),function(_2b,_2c,p){
with(_2b){
return objj_msgSend(_2b,"eventWithMouseDownAtPoint:modifierFlags:",p,0);
}
}),new objj_method(sel_getUid("eventWithMouseDownAtPoint:modifierFlags:"),function(_2d,_2e,p,_2f){
with(_2d){
return objj_msgSend(_2d,"eventWithType:locationInView:keyCode:modifierFlags:",CPLeftMouseDown,p,0,_2f);
}
}),new objj_method(sel_getUid("eventWithMouseDraggedAtPoint:"),function(_30,_31,p){
with(_30){
return objj_msgSend(_30,"eventWithType:locationInView:keyCode:modifierFlags:",CPLeftMouseDragged,p,0,0);
}
}),new objj_method(sel_getUid("eventWithMouseUpAtPoint:"),function(_32,_33,p){
with(_32){
return objj_msgSend(_32,"eventWithMouseUpAtPoint:modifierFlags:",p,0);
}
}),new objj_method(sel_getUid("eventWithMouseUpAtPoint:modifierFlags:"),function(_34,_35,p,_36){
with(_34){
return objj_msgSend(_34,"eventWithType:locationInView:keyCode:modifierFlags:",CPLeftMouseUp,p,0,_36);
}
}),new objj_method(sel_getUid("eventWithKeyUp:"),function(_37,_38,_39){
with(_37){
return objj_msgSend(_37,"eventWithKeyUp:modifierFlags:",_39,0);
}
}),new objj_method(sel_getUid("eventWithKeyUp:modifierFlags:"),function(_3a,_3b,_3c,_3d){
with(_3a){
return objj_msgSend(_3a,"eventWithType:locationInView:keyCode:modifierFlags:",CPKeyUp,CGPointMake(0,0),_3c,_3d);
}
}),new objj_method(sel_getUid("eventWithKeyDown:"),function(_3e,_3f,_40){
with(_3e){
return objj_msgSend(_3e,"eventWithKeyDown:modifierFlags:",_40,0);
}
}),new objj_method(sel_getUid("eventWithKeyDown:modifierFlags:"),function(_41,_42,_43,_44){
with(_41){
return objj_msgSend(_41,"eventWithType:locationInView:keyCode:modifierFlags:",CPKeyDown,CGPointMake(0,0),_43,_44);
}
}),new objj_method(sel_getUid("eventWithType:locationInView:keyCode:modifierFlags:"),function(_45,_46,_47,p,_48,_49){
with(_45){
return objj_msgSend(objj_msgSend(objj_msgSend(_45,"alloc"),"initWithType:locationInView:keyCode:modifierFlags:clickCount:",_47,p,_48,_49,1),"autorelease");
}
}),new objj_method(sel_getUid("eventWithType:locationInView:keyCode:modifierFlags:clickCount:"),function(_4a,_4b,_4c,p,_4d,_4e,_4f){
with(_4a){
return objj_msgSend(objj_msgSend(objj_msgSend(_4a,"alloc"),"initWithType:locationInView:keyCode:modifierFlags:clickCount:",_4c,p,_4d,_4e,_4f),"autorelease");
}
})]);
p;16;GDEventHandler.jt;1967;@STATIC;1.0;i;15;GDModelObject.ji;10;GDAction.jt;1913;
objj_executeFile("GDModelObject.j",YES);
objj_executeFile("GDAction.j",YES);
GDMouseEnterEventType="GDMouseEnterEventType";
GDMouseLeaveEventType="GDMouseLeaveEventType";
GDMouseDownEventType="GDMouseDownEventType";
GDMouseUpEventType="GDMouseUpEventType";
GDMouseClickEventType="GDMouseClickEventType";
var _1=objj_allocateClassPair(GDModelObject,"GDEventHandler"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("eventType"),new objj_ivar("cell"),new objj_ivar("orderedActions")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("eventType"),function(_3,_4){
with(_3){
return eventType;
}
}),new objj_method(sel_getUid("setEventType:"),function(_5,_6,_7){
with(_5){
eventType=_7;
}
}),new objj_method(sel_getUid("cell"),function(_8,_9){
with(_8){
return cell;
}
}),new objj_method(sel_getUid("setCell:"),function(_a,_b,_c){
with(_a){
cell=_c;
}
}),new objj_method(sel_getUid("orderedActions"),function(_d,_e){
with(_d){
return orderedActions;
}
}),new objj_method(sel_getUid("setOrderedActions:"),function(_f,_10,_11){
with(_f){
orderedActions=_11;
}
}),new objj_method(sel_getUid("init"),function(_12,_13){
with(_12){
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("GDEventHandler").super_class},"init");
if(_12==nil){
return nil;
}
orderedActions=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
return _12;
}
}),new objj_method(sel_getUid("initFromJSONObject:inProject:"),function(_14,_15,_16,_17){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("GDEventHandler").super_class},"initFromJSONObject:inProject:",_16,_17);
if(_14==nil){
return nil;
}
eventType=_16.eventType;
var _18=nil;
var _19=objj_msgSend(_16.orderedActions,"objectEnumerator");
while((_18=objj_msgSend(_19,"nextObject"))!=nil){
var _1a=objj_msgSend(GDModelObject,"fromJSONObject:inProject:",_18,_17);
objj_msgSend(orderedActions,"addObject:",_1a);
}
return _14;
}
})]);
p;16;GDEventManager.jt;7250;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;10;GDAction.ji;22;GDWidgetInstanceCell.ji;26;GDWidgetInstanceRootCell.ji;16;GDEventHandler.jt;7089;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDAction.j",YES);
objj_executeFile("GDWidgetInstanceCell.j",YES);
objj_executeFile("GDWidgetInstanceRootCell.j",YES);
objj_executeFile("GDEventHandler.j",YES);
var _1=objj_allocateClassPair(CPObject,"GDEventManager"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("hoveredCells"),new objj_ivar("view"),new objj_ivar("downCells")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithView:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDEventManager").super_class},"init");
if(_3==nil){
return nil;
}
view=_5;
hoveredCells=objj_msgSend(objj_msgSend(CPArray,"array"),"retain");
downCells=objj_msgSend(objj_msgSend(CPArray,"array"),"retain");
return _3;
}
}),new objj_method(sel_getUid("changeStatesForEventsOfType:forCell:"),function(_6,_7,_8,_9){
with(_6){
if(objj_msgSend(objj_msgSend(objj_msgSend(_9,"widget"),"states"),"count")==1){
return;
}
var _a=-1;
if(objj_msgSend(_8,"isEqual:",GDMouseEnterEventType)){
_a=GDMouseOverStateType;
}else{
if(objj_msgSend(_8,"isEqual:",GDMouseLeaveEventType)){
_a=GDNormalStateType;
}else{
if(objj_msgSend(_8,"isEqual:",GDMouseDownEventType)){
_a=GDPressedStateType;
}else{
if(objj_msgSend(_8,"isEqual:",GDMouseUpEventType)){
if(objj_msgSend(objj_msgSend(_9,"widget"),"stateWithType:",GDMouseOverStateType)!=nil){
_a=GDMouseOverStateType;
}else{
_a=GDNormalStateType;
}
}
}
}
}
if(_a!=-1){
var _b=objj_msgSend(objj_msgSend(view,"screenChangeManager"),"renderObjectForFigure:",_9);
var _c=objj_msgSend(objj_msgSend(_b,"currentState"),"type");
state=objj_msgSend(objj_msgSend(_9,"widget"),"stateWithType:",_a);
if(state!=nil&&_c!=GDCustomStateType&&_c!=GDDisabledStateType&&_c!=_a){
objj_msgSend(objj_msgSend(view,"screenChangeManager"),"updateRenderObjectForWidgetInstance:loadValuesForState:",_9,state);
}
}
}
}),new objj_method(sel_getUid("fireEventsOfType:forCell:"),function(_d,_e,_f,_10){
with(_d){
var _11=objj_msgSend(_10,"actions");
if(!_11.some(function(_12){
return objj_msgSend(_12,"vetoAutomaticStateChange")==YES;
})){
objj_msgSend(_d,"changeStatesForEventsOfType:forCell:",_f,_10);
}
var _13=objj_msgSend(_10,"actionsForEventType:",_f);
var _14=nil;
var _15=objj_msgSend(_13,"objectEnumerator");
while((_14=objj_msgSend(_15,"nextObject"))!=nil){
objj_msgSend(_14,"setScreenChangeManager:",objj_msgSend(view,"screenChangeManager"));
objj_msgSend(_14,"execute");
}
}
}),new objj_method(sel_getUid("fireEventsOfType:"),function(_16,_17,_18){
with(_16){
var _19=nil;
var it=objj_msgSend(hoveredCells,"objectEnumerator");
while(_19=objj_msgSend(it,"nextObject")){
objj_msgSend(_16,"fireEventsOfType:forCell:",_18,_19);
}
}
}),new objj_method(sel_getUid("resetEventSystemState"),function(_1a,_1b){
with(_1a){
objj_msgSend(_1a,"fireEventsOfType:",GDMouseLeaveEventType);
objj_msgSend(downCells,"removeAllObjects");
objj_msgSend(hoveredCells,"removeAllObjects");
}
}),new objj_method(sel_getUid("extractRootCells:"),function(_1c,_1d,_1e){
with(_1c){
if(_1e==nil){
return nil;
}
var _1f=objj_msgSend(CPSet,"set");
var _20=nil;
var it=objj_msgSend(_1e,"objectEnumerator");
while(_20=objj_msgSend(it,"nextObject")){
var _21=objj_msgSend(_20,"rootInstanceCell");
objj_msgSend(_1f,"addObject:",_21);
}
return objj_msgSend(_1f,"allObjects");
}
}),new objj_method(sel_getUid("setHoveredCells:"),function(_22,_23,_24){
with(_22){
if(_24==hoveredCells){
return;
}
objj_msgSend(hoveredCells,"release");
hoveredCells=_24;
objj_msgSend(hoveredCells,"retain");
}
}),new objj_method(sel_getUid("updateWithDownEventAndCells:clickCount:"),function(_25,_26,_27,_28){
with(_25){
objj_msgSend(downCells,"removeAllObjects");
objj_msgSend(hoveredCells,"removeAllObjects");
if(_27!=nil){
var _29=objj_msgSend(_25,"extractRootCells:",_27);
objj_msgSend(downCells,"addObjectsFromArray:",_29);
objj_msgSend(hoveredCells,"addObjectsFromArray:",_29);
objj_msgSend(_25,"fireEventsOfType:",GDMouseDownEventType);
}
}
}),new objj_method(sel_getUid("updateWithMovedEventAndCells:"),function(_2a,_2b,_2c){
with(_2a){
if(_2c==nil){
objj_msgSend(_2a,"fireEventsOfType:",GDMouseLeaveEventType);
objj_msgSend(hoveredCells,"removeAllObjects");
return;
}
var _2d=nil;
var _2e=objj_msgSend(_2c,"objectEnumerator");
while(_2d=objj_msgSend(_2e,"nextObject")){
var _2f=objj_msgSend(_2d,"rootInstanceCell");
if(!objj_msgSend(hoveredCells,"containsObject:",_2f)){
objj_msgSend(_2a,"fireEventsOfType:forCell:",GDMouseEnterEventType,_2f);
objj_msgSend(hoveredCells,"addObject:",_2f);
}
}
var _30=objj_msgSend(CPArray,"array");
var _31=nil;
var _32=objj_msgSend(hoveredCells,"objectEnumerator");
while(_31=objj_msgSend(_32,"nextObject")){
var _33=NO;
var _34=nil;
var _2e=objj_msgSend(_2c,"objectEnumerator");
while(_34=objj_msgSend(_2e,"nextObject")){
var _35=objj_msgSend(_34,"rootInstanceCell");
if(_35==_31){
_33=YES;
break;
}
}
if(!_33){
objj_msgSend(_2a,"fireEventsOfType:forCell:",GDMouseLeaveEventType,_31);
if(!objj_msgSend(_30,"containsObject:",_31)){
objj_msgSend(_30,"addObject:",_31);
}
}
}
objj_msgSend(hoveredCells,"removeObjectsInArray:",_30);
}
}),new objj_method(sel_getUid("updateWithUpEventAndCells:clickCount:"),function(_36,_37,_38,_39){
with(_36){
var _3a=objj_msgSend(_36,"extractRootCells:",_38);
var _3b=nil;
var _3c=objj_msgSend(_3a,"objectEnumerator");
while(_3b=objj_msgSend(_3c,"nextObject")){
if(objj_msgSend(downCells,"count")>0){
if(objj_msgSend(downCells,"containsObject:",_3b)){
objj_msgSend(_36,"fireEventsOfType:forCell:",GDMouseUpEventType,_3b);
objj_msgSend(_36,"fireEventsOfType:forCell:",GDMouseClickEventType,_3b);
}
}else{
objj_msgSend(_36,"fireEventsOfType:forCell:",GDMouseUpEventType,_3b);
objj_msgSend(_36,"fireEventsOfType:forCell:",GDMouseClickEventType,_3b);
}
}
objj_msgSend(downCells,"removeAllObjects");
}
}),new objj_method(sel_getUid("updateWithDraggedEventAndCells:"),function(_3d,_3e,_3f){
with(_3d){
if(objj_msgSend(downCells,"count")==0){
return;
}
if(_3f==nil){
objj_msgSend(_3d,"fireEventsOfType:",GDMouseLeaveEventType);
objj_msgSend(hoveredCells,"removeAllObjects");
return;
}
var _40=objj_msgSend(_3d,"extractRootCells:",_3f);
var _41=nil;
var _42=objj_msgSend(_40,"objectEnumerator");
while(_41=objj_msgSend(_42,"nextObject")){
if(objj_msgSend(downCells,"containsObject:",_41)){
if(!objj_msgSend(hoveredCells,"containsObject:",_41)){
objj_msgSend(_3d,"fireEventsOfType:forCell:",GDMouseDownEventType,_41);
objj_msgSend(hoveredCells,"addObject:",_41);
}
}
}
var _43=objj_msgSend(CPArray,"array");
var _44=nil;
var _45=objj_msgSend(hoveredCells,"objectEnumerator");
while(_44=objj_msgSend(_45,"nextObject")){
var _46=NO;
var _41=nil;
var _47=objj_msgSend(_40,"objectEnumerator");
while(_41=objj_msgSend(_47,"nextObject")){
if(objj_msgSend(downCells,"containsObject:",_41)){
if(_41==_44){
_46=YES;
break;
}
}
}
if(!_46){
objj_msgSend(_3d,"fireEventsOfType:forCell:",GDMouseLeaveEventType,_44);
if(!objj_msgSend(_43,"containsObject:",_44)){
objj_msgSend(_43,"addObject:",_44);
}
}
}
objj_msgSend(hoveredCells,"removeObjectsInArray:",_43);
}
})]);
p;21;GDFixedLayoutPolicy.jt;2864;@STATIC;1.0;I;15;AppKit/AppKit.ji;16;GDLayoutPolicy.ji;19;GDLayoutConstants.ji;20;GDCellRenderObject.jt;2755;
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDLayoutPolicy.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("GDCellRenderObject.j",YES);
var _1=objj_allocateClassPair(GDLayoutPolicy,"GDFixedLayoutPolicy"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isFixedLayout"),function(_3,_4){
with(_3){
return YES;
}
}),new objj_method(sel_getUid("calculateFullUnionSizeOfAdaptors:"),function(_5,_6,_7){
with(_5){
if(objj_msgSend(_7,"count")==0){
return 0;
}
var _8=objj_msgSend(_7,"objectEnumerator");
var _9=objj_msgSend(_8,"nextObject");
var _a=objj_msgSend(_9,"fullOrigin");
var _b=_a+objj_msgSend(_9,"fullSize");
var _c=nil;
while(_c=objj_msgSend(_8,"nextObject")){
_a=fminf(_a,objj_msgSend(_c,"fullOrigin"));
_b=fmaxf(_b,objj_msgSend(_c,"fullOrigin")+objj_msgSend(_c,"fullSize"));
}
return _b-_a;
}
}),new objj_method(sel_getUid("calculateContentSizeOfAdaptor:"),function(_d,_e,_f){
with(_d){
var _10=objj_msgSend(CPMutableArray,"array");
var _11=0;
var _12=nil;
var _13=objj_msgSend(objj_msgSend(_f,"nonActiveComponents"),"objectEnumerator");
while(_12=objj_msgSend(_13,"nextObject")){
if(objj_msgSend(_12,"resizingMode")!=GDFlexResizing){
objj_msgSend(_10,"addObject:",_12);
}else{
_11=fmaxf(_11,objj_msgSend(_12,"minimumSize")+objj_msgSend(_12,"margin"));
}
}
return fmaxf(_11,objj_msgSend(_d,"calculateFullUnionSizeOfAdaptors:",_10));
}
}),new objj_method(sel_getUid("resizeComponentsOfAdaptor:"),function(_14,_15,_16){
with(_14){
objj_msgSendSuper({receiver:_14,super_class:objj_getClass("GDFixedLayoutPolicy").super_class},"resizeComponentsOfAdaptor:",_16);
var _17=nil;
var _18=objj_msgSend(objj_msgSend(_16,"nonActiveComponents"),"objectEnumerator");
while(_17=objj_msgSend(_18,"nextObject")){
if(objj_msgSend(_17,"resizingMode")==GDFlexResizing){
objj_msgSend(_17,"setSize:",(objj_msgSend(_16,"innerSize")-objj_msgSend(_17,"margin"))*(objj_msgSend(_17,"flexPercentage")/100));
}
}
}
}),new objj_method(sel_getUid("alignComponentsOfAdaptor:"),function(_19,_1a,_1b){
with(_19){
objj_msgSendSuper({receiver:_19,super_class:objj_getClass("GDFixedLayoutPolicy").super_class},"alignComponentsOfAdaptor:",_1b);
if(objj_msgSend(_1b,"resizingMode")==GDIntrinsicResizing){
objj_msgSend(_1b,"shiftComponentsToOrigin:ignoreFlex:",objj_msgSend(_1b,"firstPadding"),YES);
var _1c=nil;
var _1d=objj_msgSend(objj_msgSend(_1b,"nonActiveComponents"),"objectEnumerator");
while(_1c=objj_msgSend(_1d,"nextObject")){
if(objj_msgSend(_1c,"resizingMode")==GDFlexResizing){
objj_msgSend(_1c,"setFullOrigin:",objj_msgSend(_1b,"firstPadding"));
}
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("layoutPolicyCode"),function(_1e,_1f){
with(_1e){
return GDFixedLayoutPolicyCode;
}
})]);
p;8;GDFont.jt;959;@STATIC;1.0;I;15;AppKit/AppKit.jt;921;
objj_executeFile("AppKit/AppKit.j",NO);
_GDCreateCSSString=function(_1,_2,_3,_4){
return (_3?"italic ":"")+(_4?"bold ":"")+_2+"px "+_1;
};
var _5={};
var _6=objj_allocateClassPair(CPFont,"GDFont"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_isItalic")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("initWithName:size:italic:bold:"),function(_8,_9,_a,_b,_c,_d){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("GDFont").super_class},"_initWithName:size:bold:",_a,_b,_d);
if(_8==nil){
return nil;
}
_isItalic=_c;
_cssString=_GDCreateCSSString(_a,_b,_c,_d);
_5[_cssString]=_8;
return _8;
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("fontWithName:size:italic:bool:"),function(_e,_f,_10,_11,_12,_13){
with(_e){
return _5[_GDCreateCSSString(_10,_11,_12,_13)]||objj_msgSend(objj_msgSend(_e,"alloc"),"initWithName:size:italic:bold:",_10,_11,_12,_13);
}
})]);
p;29;GDHorizontalBoxLayoutPolicy.jt;1568;@STATIC;1.0;i;19;GDBoxLayoutPolicy.ji;20;GDCellRenderObject.ji;19;GDLayoutConstants.jt;1476;
objj_executeFile("GDBoxLayoutPolicy.j",YES);
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
var _1=objj_allocateClassPair(GDBoxLayoutPolicy,"GDHorizontalBoxLayoutPolicy"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("resizeComponentsOfAdaptor:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDHorizontalBoxLayoutPolicy").super_class},"resizeComponentsOfAdaptor:",_5);
if(objj_msgSend(_5,"isHorizontal")){
objj_msgSend(_3,"resizeComponentsOfPrimaryAdaptor:",_5);
}else{
objj_msgSend(_3,"resizeComponentsOfSecondaryAdaptor:",_5);
}
}
}),new objj_method(sel_getUid("alignComponentsOfAdaptor:"),function(_6,_7,_8){
with(_6){
objj_msgSendSuper({receiver:_6,super_class:objj_getClass("GDHorizontalBoxLayoutPolicy").super_class},"alignComponentsOfAdaptor:",_8);
if(objj_msgSend(_8,"isHorizontal")){
objj_msgSend(_6,"alignComponentsOfPrimaryAdaptor:",_8);
}else{
objj_msgSend(_6,"alignComponentsOfSecondaryAdaptor:",_8);
}
}
}),new objj_method(sel_getUid("calculateContentSizeOfAdaptor:"),function(_9,_a,_b){
with(_9){
if(objj_msgSend(_b,"isHorizontal")){
return objj_msgSend(_9,"calculateContentSizeOfPrimaryAdaptor:",_b);
}else{
return objj_msgSend(_9,"calculateContentSizeOfSecondaryAdaptor:",_b);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("layoutPolicyCode"),function(_c,_d){
with(_c){
return GDHorizontalBoxLayoutPolicyCode;
}
})]);
p;27;GDHorizontalLayoutAdaptor.jt;5596;@STATIC;1.0;i;21;GDTableRenderObject.ji;20;GDCellRenderObject.ji;25;GDTableCellRenderObject.ji;18;GDTableConstants.ji;17;GDLayoutAdaptor.jt;5451;
objj_executeFile("GDTableRenderObject.j",YES);
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDTableCellRenderObject.j",YES);
objj_executeFile("GDTableConstants.j",YES);
objj_executeFile("GDLayoutAdaptor.j",YES);
var _1=objj_allocateClassPair(GDLayoutAdaptor,"GDHorizontalLayoutAdaptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isHorizontal"),function(_3,_4){
with(_3){
return YES;
}
}),new objj_method(sel_getUid("_adaptorForRenderObject:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_7,"createHorizontalLayoutAdaptor");
}
}),new objj_method(sel_getUid("size"),function(_8,_9){
with(_8){
return objj_msgSend(renderObject,"width");
}
}),new objj_method(sel_getUid("setSize:"),function(_a,_b,_c){
with(_a){
objj_msgSend(renderObject,"setWidth:",_c);
}
}),new objj_method(sel_getUid("fullSize"),function(_d,_e){
with(_d){
return objj_msgSend(renderObject,"fullWidth");
}
}),new objj_method(sel_getUid("setFullSize:"),function(_f,_10,_11){
with(_f){
objj_msgSend(renderObject,"setFullWidth:",_11);
}
}),new objj_method(sel_getUid("innerSize"),function(_12,_13){
with(_12){
return objj_msgSend(renderObject,"innerBounds").size.width;
}
}),new objj_method(sel_getUid("setInnerSize:"),function(_14,_15,_16){
with(_14){
objj_msgSend(renderObject,"setInnerWidth:",_16);
}
}),new objj_method(sel_getUid("setMaximumSize:"),function(_17,_18,max){
with(_17){
objj_msgSend(renderObject,"setMaximumWidth:",max);
}
}),new objj_method(sel_getUid("maximumSize"),function(_19,_1a){
with(_19){
return objj_msgSend(renderObject,"maximumWidth");
}
}),new objj_method(sel_getUid("setMinimumSize:"),function(_1b,_1c,min){
with(_1b){
objj_msgSend(renderObject,"setMinimumWidth:",min);
}
}),new objj_method(sel_getUid("minimumSize"),function(_1d,_1e){
with(_1d){
return objj_msgSend(renderObject,"minimumWidth");
}
}),new objj_method(sel_getUid("textSize"),function(_1f,_20){
with(_1f){
return objj_msgSend(renderObject,"textWidth");
}
}),new objj_method(sel_getUid("origin"),function(_21,_22){
with(_21){
return objj_msgSend(renderObject,"x");
}
}),new objj_method(sel_getUid("setOrigin:"),function(_23,_24,_25){
with(_23){
objj_msgSend(renderObject,"setX:",_25);
}
}),new objj_method(sel_getUid("fullOrigin"),function(_26,_27){
with(_26){
return objj_msgSend(renderObject,"fullX");
}
}),new objj_method(sel_getUid("setFullOrigin:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(renderObject,"setFullX:",_2a);
}
}),new objj_method(sel_getUid("resizingMode"),function(_2b,_2c){
with(_2b){
return objj_msgSend(renderObject,"horizontalResizing");
}
}),new objj_method(sel_getUid("flexPercentage"),function(_2d,_2e){
with(_2d){
return objj_msgSend(renderObject,"flexWidthPercentage");
}
}),new objj_method(sel_getUid("activeAlignment"),function(_2f,_30){
with(_2f){
return objj_msgSend(renderObject,"activeHorizontalAlignment");
}
}),new objj_method(sel_getUid("alignment"),function(_31,_32){
with(_31){
return objj_msgSend(renderObject,"horizontalAlignment");
}
}),new objj_method(sel_getUid("borderSize"),function(_33,_34){
with(_33){
return objj_msgSend(renderObject,"borderLeftWidth")+objj_msgSend(renderObject,"borderRightWidth");
}
}),new objj_method(sel_getUid("margin"),function(_35,_36){
with(_35){
return objj_msgSend(renderObject,"marginLeft")+objj_msgSend(renderObject,"marginRight");
}
}),new objj_method(sel_getUid("firstPadding"),function(_37,_38){
with(_37){
return objj_msgSend(renderObject,"paddingLeft");
}
}),new objj_method(sel_getUid("secondPadding"),function(_39,_3a){
with(_39){
return objj_msgSend(renderObject,"paddingRight");
}
}),new objj_method(sel_getUid("shiftComponentsToOrigin:ignoreFlex:"),function(_3b,_3c,_3d,_3e){
with(_3b){
objj_msgSend(renderObject,"shiftNonActiveComponentsToX:ignoreFlex:",_3d,_3e);
}
})]);
var _1=objj_allocateClassPair(GDHorizontalLayoutAdaptor,"GDHorizontalTableLayoutAdaptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_components"),function(_3f,_40){
with(_3f){
return objj_msgSend(renderObject,"orderedColumns");
}
}),new objj_method(sel_getUid("textSize"),function(_41,_42){
with(_41){
return 0;
}
}),new objj_method(sel_getUid("alignment"),function(_43,_44){
with(_43){
return 0;
}
}),new objj_method(sel_getUid("firstPadding"),function(_45,_46){
with(_45){
return 0;
}
}),new objj_method(sel_getUid("secondPadding"),function(_47,_48){
with(_47){
return 0;
}
}),new objj_method(sel_getUid("shiftComponentsToOrigin:ignoreFlex:"),function(_49,_4a,_4b,_4c){
with(_49){
}
})]);
var _1=objj_allocateClassPair(GDHorizontalLayoutAdaptor,"GDHorizontalTableCellLayoutAdaptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("borderSize"),function(_4d,_4e){
with(_4d){
if(!((objj_msgSend(renderObject,"approximatePosition")&GDTableCellPositionOuterRight)>0)){
return objj_msgSend(renderObject,"borderLeftWidth");
}else{
return objj_msgSendSuper({receiver:_4d,super_class:objj_getClass("GDHorizontalTableCellLayoutAdaptor").super_class},"borderSize");
}
}
})]);
var _1=objj_allocateClassPair(GDTableStructureElementLayoutAdaptor,"GDTableColumnLayoutAdaptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isHorizontal"),function(_4f,_50){
with(_4f){
return YES;
}
}),new objj_method(sel_getUid("_adaptorForRenderObject:"),function(_51,_52,_53){
with(_51){
return objj_msgSend(_53,"createHorizontalLayoutAdaptor");
}
})]);
p;17;GDImageResource.jt;1635;@STATIC;1.0;i;12;GDResource.jI;16;AppKit/CPImage.jt;1578;
objj_executeFile("GDResource.j",YES);
objj_executeFile("AppKit/CPImage.j",NO);
var _1=objj_allocateClassPair(GDResource,"GDImageResource"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("image"),new objj_ivar("width"),new objj_ivar("height")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("width"),function(_3,_4){
with(_3){
return width;
}
}),new objj_method(sel_getUid("setWidth:"),function(_5,_6,_7){
with(_5){
width=_7;
}
}),new objj_method(sel_getUid("height"),function(_8,_9){
with(_8){
return height;
}
}),new objj_method(sel_getUid("setHeight:"),function(_a,_b,_c){
with(_a){
height=_c;
}
}),new objj_method(sel_getUid("initFromJSONObject:inProject:"),function(_d,_e,_f,_10){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("GDImageResource").super_class},"initFromJSONObject:inProject:",_f,_10);
if(_d==nil){
return nil;
}
width=_f.width;
height=_f.height;
return _d;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_11,_12,_13){
with(_11){
_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("GDImageResource").super_class},"initWithCoder:",_13);
if(_11==nil){
return nil;
}
width=objj_msgSend(_13,"decodeFloatForKey:","width");
height=objj_msgSend(_13,"decodeFloatForKey:","height");
return _11;
}
}),new objj_method(sel_getUid("load"),function(_14,_15){
with(_14){
image=objj_msgSend(GDProject,"imageWithFileName:size:",fileName,CGSizeMake(width,height));
}
}),new objj_method(sel_getUid("image"),function(_16,_17){
with(_16){
if(image==nil){
objj_msgSend(_16,"load");
}
return image;
}
})]);
p;17;GDLayoutAdaptor.jt;9357;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;20;GDCellRenderObject.ji;16;GDLayoutPolicy.ji;16;GDRenderObject.ji;37;GDTableStructureElementRenderObject.jt;9181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDLayoutPolicy.j",YES);
objj_executeFile("GDRenderObject.j",YES);
objj_executeFile("GDTableStructureElementRenderObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"GDLayoutAdaptor"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("renderObject"),new objj_ivar("cachedComponents")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithRenderObject:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDLayoutAdaptor").super_class},"init");
if(_3==nil){
return nil;
}
renderObject=_5;
cachedComponents=nil;
return _3;
}
}),new objj_method(sel_getUid("isHorizontal"),function(_6,_7){
with(_6){
return NO;
}
}),new objj_method(sel_getUid("isVertical"),function(_8,_9){
with(_8){
return NO;
}
}),new objj_method(sel_getUid("size"),function(_a,_b){
with(_a){
return 0;
}
}),new objj_method(sel_getUid("setSize:"),function(_c,_d,_e){
with(_c){
}
}),new objj_method(sel_getUid("fullSize"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"size");
}
}),new objj_method(sel_getUid("setFullSize:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"setSize:",_13);
}
}),new objj_method(sel_getUid("innerSize"),function(_14,_15){
with(_14){
return objj_msgSend(_14,"size");
}
}),new objj_method(sel_getUid("setInnerSize:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_16,"setSize:",_18);
}
}),new objj_method(sel_getUid("maximumSize"),function(_19,_1a){
with(_19){
return 0;
}
}),new objj_method(sel_getUid("setMaximumSize:"),function(_1b,_1c,max){
with(_1b){
}
}),new objj_method(sel_getUid("minimumSize"),function(_1d,_1e){
with(_1d){
return 0;
}
}),new objj_method(sel_getUid("setMinimumSize:"),function(_1f,_20,min){
with(_1f){
}
}),new objj_method(sel_getUid("maximumFullSize"),function(_21,_22){
with(_21){
return objj_msgSend(_21,"maximumSize")+objj_msgSend(_21,"margin");
}
}),new objj_method(sel_getUid("setMaximumFullSize:"),function(_23,_24,max){
with(_23){
objj_msgSend(_23,"setMaximumSize:",(max-objj_msgSend(_23,"margin")));
}
}),new objj_method(sel_getUid("minimumFullSize"),function(_25,_26){
with(_25){
return objj_msgSend(_25,"minimumSize")+objj_msgSend(_25,"margin");
}
}),new objj_method(sel_getUid("setMinimumFullSize:"),function(_27,_28,min){
with(_27){
objj_msgSend(_27,"setMinimumSize:",(min-objj_msgSend(_27,"margin")));
}
}),new objj_method(sel_getUid("textSize"),function(_29,_2a){
with(_29){
return 0;
}
}),new objj_method(sel_getUid("origin"),function(_2b,_2c){
with(_2b){
return 0;
}
}),new objj_method(sel_getUid("setOrigin:"),function(_2d,_2e,_2f){
with(_2d){
}
}),new objj_method(sel_getUid("fullOrigin"),function(_30,_31){
with(_30){
return objj_msgSend(_30,"origin");
}
}),new objj_method(sel_getUid("setFullOrigin:"),function(_32,_33,_34){
with(_32){
objj_msgSend(_32,"setOrigin:",_34);
}
}),new objj_method(sel_getUid("resizingMode"),function(_35,_36){
with(_35){
return 0;
}
}),new objj_method(sel_getUid("flexPercentage"),function(_37,_38){
with(_37){
return 0;
}
}),new objj_method(sel_getUid("alignment"),function(_39,_3a){
with(_39){
return 0;
}
}),new objj_method(sel_getUid("activeAlignment"),function(_3b,_3c){
with(_3b){
return 0;
}
}),new objj_method(sel_getUid("borderSize"),function(_3d,_3e){
with(_3d){
return 0;
}
}),new objj_method(sel_getUid("margin"),function(_3f,_40){
with(_3f){
return 0;
}
}),new objj_method(sel_getUid("padding"),function(_41,_42){
with(_41){
return objj_msgSend(_41,"firstPadding")+objj_msgSend(_41,"secondPadding");
}
}),new objj_method(sel_getUid("firstPadding"),function(_43,_44){
with(_43){
return 0;
}
}),new objj_method(sel_getUid("secondPadding"),function(_45,_46){
with(_45){
return 0;
}
}),new objj_method(sel_getUid("activeLayout"),function(_47,_48){
with(_47){
return objj_msgSend(renderObject,"activeLayout");
}
}),new objj_method(sel_getUid("isTableCell"),function(_49,_4a){
with(_49){
return objj_msgSend(renderObject,"isTableCell");
}
}),new objj_method(sel_getUid("isTable"),function(_4b,_4c){
with(_4b){
return objj_msgSend(renderObject,"isTable");
}
}),new objj_method(sel_getUid("layoutIfNeeded"),function(_4d,_4e){
with(_4d){
objj_msgSend(renderObject,"layoutIfNeededUsingAdaptor:",_4d);
}
}),new objj_method(sel_getUid("layoutComponentsWithResizingMode:"),function(_4f,_50,_51){
with(_4f){
for(var i=0;i<objj_msgSend(objj_msgSend(_4f,"components"),"count");i++){
var _52=objj_msgSend(objj_msgSend(_4f,"components"),"objectAtIndex:",i);
if(objj_msgSend(_52,"resizingMode")==_51){
objj_msgSend(_52,"layoutIfNeeded");
}
}
}
}),new objj_method(sel_getUid("layoutComponents"),function(_53,_54){
with(_53){
for(var i=0;i<objj_msgSend(objj_msgSend(_53,"components"),"count");i++){
objj_msgSend(objj_msgSend(objj_msgSend(_53,"components"),"objectAtIndex:",i),"layoutIfNeeded");
}
}
}),new objj_method(sel_getUid("shiftComponentsToOrigin:ignoreFlex:"),function(_55,_56,_57,_58){
with(_55){
}
}),new objj_method(sel_getUid("calculateContentSizeViaLayoutPolicy"),function(_59,_5a){
with(_59){
return objj_msgSend(objj_msgSend(renderObject,"layoutPolicy"),"calculateCompleteContentSizeOfAdaptor:",_59);
}
}),new objj_method(sel_getUid("nonActiveComponents"),function(_5b,_5c){
with(_5b){
var _5d=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<objj_msgSend(objj_msgSend(_5b,"components"),"count");i++){
var _5e=objj_msgSend(objj_msgSend(_5b,"components"),"objectAtIndex:",i);
if(!objj_msgSend(_5e,"activeLayout")){
objj_msgSend(_5d,"addObject:",_5e);
}
}
return _5d;
}
}),new objj_method(sel_getUid("activeComponents"),function(_5f,_60){
with(_5f){
var _61=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<objj_msgSend(objj_msgSend(_5f,"components"),"count");i++){
var _62=objj_msgSend(objj_msgSend(_5f,"components"),"objectAtIndex:",i);
if(objj_msgSend(_62,"activeLayout")){
objj_msgSend(_61,"addObject:",_62);
}
}
return _61;
}
}),new objj_method(sel_getUid("_adaptorForRenderObject:"),function(_63,_64,_65){
with(_63){
return nil;
}
}),new objj_method(sel_getUid("_components"),function(_66,_67){
with(_66){
return objj_msgSend(renderObject,"orderedDisplayComponents");
}
}),new objj_method(sel_getUid("components"),function(_68,_69){
with(_68){
if(cachedComponents!=nil){
return cachedComponents;
}
var _6a=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<objj_msgSend(objj_msgSend(_68,"_components"),"count");i++){
objj_msgSend(_6a,"addObject:",objj_msgSend(_68,"_adaptorForRenderObject:",objj_msgSend(objj_msgSend(_68,"_components"),"objectAtIndex:",i)));
}
cachedComponents=objj_msgSend(_6a,"retain");
return cachedComponents;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("adaptorForRenderObject:"),function(_6b,_6c,_6d){
with(_6b){
return objj_msgSend(objj_msgSend(objj_msgSend(_6b,"alloc"),"initWithRenderObject:",_6d),"autorelease");
}
})]);
var _1=objj_allocateClassPair(GDLayoutAdaptor,"GDTableStructureElementLayoutAdaptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("shiftComponentsToOrigin:ignoreFlex:"),function(_6e,_6f,_70,_71){
with(_6e){
}
}),new objj_method(sel_getUid("castedRenderObject"),function(_72,_73){
with(_72){
return renderObject;
}
}),new objj_method(sel_getUid("size"),function(_74,_75){
with(_74){
return objj_msgSend(objj_msgSend(_74,"castedRenderObject"),"size");
}
}),new objj_method(sel_getUid("setSize:"),function(_76,_77,_78){
with(_76){
objj_msgSend(objj_msgSend(_76,"castedRenderObject"),"setSize:",_78);
}
}),new objj_method(sel_getUid("setMaximumSize:"),function(_79,_7a,max){
with(_79){
objj_msgSend(objj_msgSend(_79,"castedRenderObject"),"setMaximumSize:",max);
}
}),new objj_method(sel_getUid("maximumSize"),function(_7b,_7c){
with(_7b){
return objj_msgSend(objj_msgSend(_7b,"castedRenderObject"),"maximumSize");
}
}),new objj_method(sel_getUid("setMinimumSize:"),function(_7d,_7e,min){
with(_7d){
objj_msgSend(objj_msgSend(_7d,"castedRenderObject"),"setMinimumSize:",min);
}
}),new objj_method(sel_getUid("minimumSize"),function(_7f,_80){
with(_7f){
return objj_msgSend(objj_msgSend(_7f,"castedRenderObject"),"minimumSize");
}
}),new objj_method(sel_getUid("origin"),function(_81,_82){
with(_81){
return objj_msgSend(objj_msgSend(_81,"castedRenderObject"),"origin");
}
}),new objj_method(sel_getUid("setOrigin:"),function(_83,_84,_85){
with(_83){
objj_msgSend(objj_msgSend(_83,"castedRenderObject"),"setOrigin:",_85);
}
}),new objj_method(sel_getUid("resizingMode"),function(_86,_87){
with(_86){
return objj_msgSend(renderObject,"resizingMode");
}
}),new objj_method(sel_getUid("flexPercentage"),function(_88,_89){
with(_88){
return objj_msgSend(renderObject,"flexPercentage");
}
}),new objj_method(sel_getUid("activeLayout"),function(_8a,_8b){
with(_8a){
return NO;
}
}),new objj_method(sel_getUid("_components"),function(_8c,_8d){
with(_8c){
return objj_msgSend(renderObject,"orderedComponents");
}
}),new objj_method(sel_getUid("layoutIfNeeded"),function(_8e,_8f){
with(_8e){
for(var i=0;i<objj_msgSend(objj_msgSend(_8e,"components"),"count");i++){
objj_msgSend(objj_msgSend(objj_msgSend(_8e,"components"),"objectAtIndex:",i),"layoutIfNeeded");
}
}
})]);
p;19;GDLayoutConstants.jt;563;@STATIC;1.0;i;22;GDCocoaCompatibility.jt;518;
GDLeftAlignment=0;
GDCenterAlignment=1;
GDRightAlignment=2;
GDJustifiedAlignment=3;
GDTopAlignment=0;
GDBottomAlignment=2;
GDFixResizing=0;
GDFlexResizing=1;
GDIntrinsicResizing=2;
GDFixedLayoutPolicyCode=0;
GDAlignmentLayoutPolicyCode=1;
GDHorizontalBoxLayoutPolicyCode=2;
GDVerticalBoxLayoutPolicyCode=3;
GDTableLayoutPolicyCode=4;
GDVisibilityHidden=0;
GDVisibilityVisible=1;
GDVisibilityCollapsed=2;
GDBorderTypeSolid=0;
GDBorderTypeDotted=1;
GDBorderTypeDashed=2;
objj_executeFile("GDCocoaCompatibility.j",YES);
p;16;GDLayoutPolicy.jt;7278;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;19;GDLayoutConstants.jt;7187;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDLayoutConstants.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"GDLayoutPolicy"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("copyWithZone:"),function(_4,_5,_6){
with(_4){
return objj_msgSend(objj_msgSend(objj_msgSend(_4,"class"),"alloc"),"init");
}
}),new objj_method(sel_getUid("isEqualToLayoutPolicy:"),function(_7,_8,_9){
with(_7){
return _9!=nil&&objj_msgSend(_9,"isMemberOfClass:",objj_msgSend(_7,"class"));
}
}),new objj_method(sel_getUid("layoutPolicyCode"),function(_a,_b){
with(_a){
return objj_msgSend(objj_msgSend(_a,"class"),"layoutPolicyCode");
}
}),new objj_method(sel_getUid("isFixedLayout"),function(_c,_d){
with(_c){
return NO;
}
}),new objj_method(sel_getUid("layoutAdaptor:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_10,"layoutComponentsWithResizingMode:",GDIntrinsicResizing);
objj_msgSend(_10,"layoutComponentsWithResizingMode:",GDFixResizing);
objj_msgSend(_e,"resizeAdaptor:",_10);
objj_msgSend(_e,"resizeComponentsOfAdaptor:",_10);
objj_msgSend(_10,"layoutComponentsWithResizingMode:",GDFlexResizing);
objj_msgSend(_e,"alignComponentsOfAdaptor:",_10);
}
}),new objj_method(sel_getUid("calculateActiveContentSizeOfAdaptor:"),function(_11,_12,_13){
with(_11){
var _14=0;
var _15=objj_msgSend(_13,"activeComponents");
for(var i=0;i<objj_msgSend(_15,"count");i++){
if(objj_msgSend(objj_msgSend(_15,"objectAtIndex:",i),"resizingMode")!=GDFlexResizing){
_14=fmaxf(_14,objj_msgSend(objj_msgSend(_15,"objectAtIndex:",i),"fullSize"));
}else{
_14=fmaxf(_14,objj_msgSend(objj_msgSend(_15,"objectAtIndex:",i),"minimumFullSize"));
}
}
return _14;
}
}),new objj_method(sel_getUid("calculateCompleteContentSizeOfAdaptor:"),function(_16,_17,_18){
with(_16){
var _19=objj_msgSend(_16,"calculateContentSizeOfAdaptor:",_18);
var _1a=objj_msgSend(_16,"calculateActiveContentSizeOfAdaptor:",_18);
var _1b=floorf(objj_msgSend(_18,"textSize"));
return fmaxf(fmaxf(_19,_1a),_1b);
}
}),new objj_method(sel_getUid("resizeAdaptor:"),function(_1c,_1d,_1e){
with(_1c){
if(objj_msgSend(_1e,"resizingMode")!=GDIntrinsicResizing||objj_msgSend(_1e,"isTableCell")){
return;
}
objj_msgSend(_1e,"setInnerSize:",objj_msgSend(_1c,"calculateCompleteContentSizeOfAdaptor:",_1e));
}
}),new objj_method(sel_getUid("resizeComponentsOfAdaptor:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(_21,"innerSize");
var _23=nil;
var _24=objj_msgSend(objj_msgSend(_21,"activeComponents"),"objectEnumerator");
while(_23=objj_msgSend(_24,"nextObject")){
if(objj_msgSend(_23,"resizingMode")==GDFlexResizing){
objj_msgSend(_23,"setSize:",floorf((_22-objj_msgSend(_23,"margin"))*objj_msgSend(_23,"flexPercentage")/100));
}
}
}
}),new objj_method(sel_getUid("alignComponentsOfAdaptor:"),function(_25,_26,_27){
with(_25){
var _28=objj_msgSend(_27,"innerSize");
var _29=objj_msgSend(_27,"firstPadding");
var _2a=nil;
var _2b=objj_msgSend(objj_msgSend(_27,"activeComponents"),"objectEnumerator");
while(_2a=objj_msgSend(_2b,"nextObject")){
switch(objj_msgSend(_2a,"activeAlignment")){
case GDCenterAlignment:
objj_msgSend(_2a,"setFullOrigin:",_29+floorf((_28-objj_msgSend(_2a,"fullSize"))/2));
break;
case GDLeftAlignment:
objj_msgSend(_2a,"setFullOrigin:",_29);
break;
case GDRightAlignment:
objj_msgSend(_2a,"setFullOrigin:",_29+_28-objj_msgSend(_2a,"fullSize"));
break;
}
}
}
}),new objj_method(sel_getUid("calculateContentSizeOfAdaptor:"),function(_2c,_2d,_2e){
with(_2c){
return 0;
}
}),new objj_method(sel_getUid("distributePositivePixel:negativePixel:onFlexAdaptors:"),function(_2f,_30,_31,_32,_33){
with(_2f){
var _34=YES;
while(_31>0&&_34){
_34=NO;
var _35=objj_msgSend(_33,"objectEnumerator");
var _36=nil;
while(_36=objj_msgSend(_35,"nextObject")){
if(objj_msgSend(_36,"maximumSize")>=(objj_msgSend(_36,"size")+1)){
objj_msgSend(_36,"setSize:",(objj_msgSend(_36,"size")+1));
_34=YES;
_31-=1;
}
if(_31==0){
break;
}
}
}
_32-=_31;
while(_32>0){
var _35=objj_msgSend(_33,"objectEnumerator");
var _36=nil;
while(_36=objj_msgSend(_35,"nextObject")){
if(objj_msgSend(_36,"minimumSize")<=(objj_msgSend(_36,"size")-1)){
objj_msgSend(_36,"setSize:",(objj_msgSend(_36,"size")-1));
_32-=1;
}
if(_32==0){
break;
}
}
}
}
}),new objj_method(sel_getUid("distributeFlexSize:onFlexAdaptors:"),function(_37,_38,_39,_3a){
with(_37){
if(objj_msgSend(_3a,"count")==0){
return;
}
var _3b=0;
var _3c=0;
var _3d=0;
for(var i=0;i<objj_msgSend(_3a,"count");i++){
var _3e=objj_msgSend(_3a,"objectAtIndex:",i);
_3b+=(objj_msgSend(_3e,"maximumFullSize"));
_3c+=(objj_msgSend(_3e,"minimumFullSize"));
_3d+=objj_msgSend(_3e,"flexPercentage");
}
if(_3c>_39){
for(var i=0;i<objj_msgSend(_3a,"count");i++){
var _3e=objj_msgSend(_3a,"objectAtIndex:",i);
objj_msgSend(_3e,"setSize:",objj_msgSend(_3e,"minimumSize"));
}
return;
}
if(_3b<_39){
for(var i=0;i<objj_msgSend(_3a,"count");i++){
var _3e=objj_msgSend(_3a,"objectAtIndex:",i);
objj_msgSend(_3e,"setSize:",objj_msgSend(_3e,"maximumSize"));
}
return;
}
var _3f=0;
var _40=0;
var _41=0;
var _3e=nil;
var _42=objj_msgSend(_3a,"objectEnumerator");
while(_3e=objj_msgSend(_42,"nextObject")){
var _43=floorf((objj_msgSend(_3e,"flexPercentage")/_3d)*_39);
if(objj_msgSend(_3e,"minimumFullSize")>_43){
objj_msgSend(_3e,"setFullSize:",objj_msgSend(_3e,"minimumFullSize"));
_3f+=objj_msgSend(_3e,"minimumFullSize");
_41+=(objj_msgSend(_3e,"minimumFullSize")-_43);
}else{
if(objj_msgSend(_3e,"maximumFullSize")<_43){
objj_msgSend(_3e,"setFullSize:",objj_msgSend(_3e,"maximumFullSize"));
_3f+=objj_msgSend(_3e,"maximumFullSize");
_40+=(_43-objj_msgSend(_3e,"maximumFullSize"));
}else{
objj_msgSend(_3e,"setFullSize:",_43);
_3f+=_43;
}
}
}
_40+=_39-(_3f+(_40-_41));
objj_msgSend(_37,"distributePositivePixel:negativePixel:onFlexAdaptors:",_40,_41,_3a);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("layoutPolicy"),function(_44,_45){
with(_44){
return objj_msgSend(objj_msgSend(objj_msgSend(_44,"alloc"),"init"),"autorelease");
}
}),new objj_method(sel_getUid("layoutPolicyWithCode:"),function(_46,_47,_48){
with(_46){
if(_1==nil){
_1=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(GDFixedLayoutPolicy,"layoutPolicy"),objj_msgSend(CPNumber,"numberWithInt:",GDFixedLayoutPolicyCode));
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(GDAlignmentLayoutPolicy,"layoutPolicy"),objj_msgSend(CPNumber,"numberWithInt:",GDAlignmentLayoutPolicyCode));
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(GDHorizontalBoxLayoutPolicy,"layoutPolicy"),objj_msgSend(CPNumber,"numberWithInt:",GDHorizontalBoxLayoutPolicyCode));
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(GDVerticalBoxLayoutPolicy,"layoutPolicy"),objj_msgSend(CPNumber,"numberWithInt:",GDVerticalBoxLayoutPolicyCode));
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(GDTableLayoutPolicy,"layoutPolicy"),objj_msgSend(CPNumber,"numberWithInt:",GDTableLayoutPolicyCode));
}
return objj_msgSend(_1,"objectForKey:",objj_msgSend(CPNumber,"numberWithInt:",_48));
}
}),new objj_method(sel_getUid("layoutPolicyCode"),function(_49,_4a){
with(_49){
objj_msgSend(_49,"subclassResponsibility");
return 666;
}
})]);
p;22;GDLayoutRenderObject.jt;7783;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;19;GDLayoutConstants.ji;9;GDState.ji;16;GDRenderObject.jt;7658;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("GDState.j",YES);
objj_executeFile("GDRenderObject.j",YES);
var _1=objj_allocateClassPair(GDRenderObject,"GDLayoutRenderObject"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("renderObjectAtPoint:"),function(_3,_4,p){
with(_3){
if(objj_msgSend(_3,"visibility")==GDVisibilityCollapsed){
return nil;
}
if(CGRectContainsPoint(objj_msgSend(_3,"bounds"),p)){
return _3;
}
return nil;
}
}),new objj_method(sel_getUid("allRenderObjectsAtPoint:"),function(_5,_6,p){
with(_5){
if(objj_msgSend(_5,"visibility")==GDVisibilityCollapsed||!NSPointInRect(p,objj_msgSend(_5,"bounds"))){
return objj_msgSend(CPArray,"array");
}
return objj_msgSend(CPArray,"arrayWithObject:",_5);
}
}),new objj_method(sel_getUid("setBounds:"),function(_7,_8,_9){
with(_7){
var _a=objj_msgSend(_7,"bounds");
if(NSEqualRects(_a,_9)){
return;
}
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",_7);
objj_msgSend(_7,"willChangeValueForKey:","bounds");
bounds=_9;
objj_msgSend(_7,"didChangeValueForKey:","bounds");
if(_a.size.width!=bounds.size.width){
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalLayout:",_7);
}
if(_a.size.height!=bounds.size.height){
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",_7);
}
if(_a.origin.x!=bounds.origin.x){
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalContainerLayout:",_7);
}
if(_a.origin.y!=bounds.origin.y){
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalContainerLayout:",_7);
}
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",_7);
}
}),new objj_method(sel_getUid("innerBounds"),function(_b,_c){
with(_b){
return objj_msgSend(_b,"bounds");
}
}),new objj_method(sel_getUid("setInnerBounds:"),function(_d,_e,r){
with(_d){
objj_msgSend(_d,"setBounds:",r);
}
}),new objj_method(sel_getUid("setInnerSize:"),function(_f,_10,s){
with(_f){
var _11=objj_msgSend(_f,"innerBounds");
_11.size=s;
objj_msgSend(_f,"setInnerBounds:",_11);
}
}),new objj_method(sel_getUid("setInnerWidth:"),function(_12,_13,w){
with(_12){
var s=objj_msgSend(_12,"innerBounds").size;
s.width=w;
objj_msgSend(_12,"setInnerSize:",s);
}
}),new objj_method(sel_getUid("setInnerHeight:"),function(_14,_15,h){
with(_14){
var s=objj_msgSend(_14,"innerBounds").size;
s.height=h;
objj_msgSend(_14,"setInnerSize:",s);
}
}),new objj_method(sel_getUid("globalInnerBounds"),function(_16,_17){
with(_16){
return objj_msgSend(_16,"globalBounds");
}
}),new objj_method(sel_getUid("globalFullBounds"),function(_18,_19){
with(_18){
return objj_msgSend(_18,"globalBounds");
}
}),new objj_method(sel_getUid("setFullSize:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"setSize:",_1c);
}
}),new objj_method(sel_getUid("fullSize"),function(_1d,_1e){
with(_1d){
return objj_msgSend(_1d,"fullBounds").size;
}
}),new objj_method(sel_getUid("setFullOrigin:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_1f,"setOrigin:",_21);
}
}),new objj_method(sel_getUid("fullBounds"),function(_22,_23){
with(_22){
return objj_msgSend(_22,"bounds");
}
}),new objj_method(sel_getUid("fullWidth"),function(_24,_25){
with(_24){
return objj_msgSend(_24,"fullBounds").size.width;
}
}),new objj_method(sel_getUid("setFullWidth:"),function(_26,_27,_28){
with(_26){
objj_msgSend(_26,"setWidth:",_28);
}
}),new objj_method(sel_getUid("fullHeight"),function(_29,_2a){
with(_29){
return objj_msgSend(_29,"fullBounds").size.height;
}
}),new objj_method(sel_getUid("setFullHeight:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_2b,"setHeight:",_2d);
}
}),new objj_method(sel_getUid("setFullX:"),function(_2e,_2f,_30){
with(_2e){
objj_msgSend(_2e,"setX:",_30);
}
}),new objj_method(sel_getUid("setFullY:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_31,"setY:",_33);
}
}),new objj_method(sel_getUid("fullOrigin"),function(_34,_35){
with(_34){
return objj_msgSend(_34,"fullBounds").origin;
}
}),new objj_method(sel_getUid("fullX"),function(_36,_37){
with(_36){
return objj_msgSend(_36,"fullOrigin").x;
}
}),new objj_method(sel_getUid("fullY"),function(_38,_39){
with(_38){
return objj_msgSend(_38,"fullOrigin").y;
}
}),new objj_method(sel_getUid("outerX1"),function(_3a,_3b){
with(_3a){
return objj_msgSend(_3a,"fullBounds").origin.x;
}
}),new objj_method(sel_getUid("outerY1"),function(_3c,_3d){
with(_3c){
return objj_msgSend(_3c,"fullBounds").origin.y;
}
}),new objj_method(sel_getUid("outerX2"),function(_3e,_3f){
with(_3e){
return CGRectGetMaxX(objj_msgSend(_3e,"fullBounds"));
}
}),new objj_method(sel_getUid("outerY2"),function(_40,_41){
with(_40){
return CGRectGetMaxY(objj_msgSend(_40,"fullBounds"));
}
}),new objj_method(sel_getUid("isDeepDrawingAboveAll"),function(_42,_43){
with(_42){
return NO;
}
}),new objj_method(sel_getUid("deepDrawingAboveAllComponents"),function(_44,_45){
with(_44){
return objj_msgSend(CPArray,"array");
}
}),new objj_method(sel_getUid("setVisibility:"),function(_46,_47,_48){
with(_46){
if(visibility==_48){
return;
}
var _49=NO;
if(visibility==GDVisibilityCollapsed){
_49=YES;
}
visibility=_48;
if(visibility==GDVisibilityCollapsed){
_49=YES;
}
if(objj_msgSend(_46,"container")!=nil&&_49){
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalContainerLayout:",_46);
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalContainerLayout:",_46);
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",container);
}else{
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",_46);
}
}
}),new objj_method(sel_getUid("hasTextContent"),function(_4a,_4b){
with(_4a){
return NO;
}
}),new objj_method(sel_getUid("painterChanged:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",_4c);
}
}),new objj_method(sel_getUid("createHorizontalLayoutAdaptor"),function(_4f,_50){
with(_4f){
return nil;
}
}),new objj_method(sel_getUid("createVerticalLayoutAdaptor"),function(_51,_52){
with(_51){
return nil;
}
}),new objj_method(sel_getUid("horizontalLayoutIfNeeded"),function(_53,_54){
with(_53){
}
}),new objj_method(sel_getUid("verticalLayoutIfNeeded"),function(_55,_56){
with(_55){
}
}),new objj_method(sel_getUid("layoutIfNeededUsingAdaptor:"),function(_57,_58,_59){
with(_57){
}
}),new objj_method(sel_getUid("needsVerticalLayout"),function(_5a,_5b){
with(_5a){
return NO;
}
}),new objj_method(sel_getUid("needsPassOnVerticalLayout"),function(_5c,_5d){
with(_5c){
return NO;
}
}),new objj_method(sel_getUid("needsHorizontalLayout"),function(_5e,_5f){
with(_5e){
return NO;
}
}),new objj_method(sel_getUid("needsPassOnHorizontalLayout"),function(_60,_61){
with(_60){
return NO;
}
}),new objj_method(sel_getUid("setNeedsHorizontalCellLayout"),function(_62,_63){
with(_62){
}
}),new objj_method(sel_getUid("setNeedsHorizontalContainerLayout"),function(_64,_65){
with(_64){
}
}),new objj_method(sel_getUid("setNeedsHorizontalLayout"),function(_66,_67){
with(_66){
}
}),new objj_method(sel_getUid("setNeedsPassOnHorizontalLayout"),function(_68,_69){
with(_68){
}
}),new objj_method(sel_getUid("setNeedsVerticalCellLayout"),function(_6a,_6b){
with(_6a){
}
}),new objj_method(sel_getUid("setNeedsVerticalContainerLayout"),function(_6c,_6d){
with(_6c){
}
}),new objj_method(sel_getUid("setNeedsVerticalLayout"),function(_6e,_6f){
with(_6e){
}
}),new objj_method(sel_getUid("setNeedsPassOnVerticalLayout"),function(_70,_71){
with(_70){
}
}),new objj_method(sel_getUid("setNeedsHorizontalLayoutCellOnly:"),function(_72,_73,_74){
with(_72){
}
}),new objj_method(sel_getUid("setNeedsVerticalLayoutCellOnly:"),function(_75,_76,_77){
with(_75){
}
})]);
p;11;GDLibrary.jt;2920;@STATIC;1.0;i;15;GDModelObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jt;2826;
objj_executeFile("GDModelObject.j",YES);
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
var _1=objj_allocateClassPair(GDModelObject,"GDLibrary"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("lookAndFeels"),new objj_ivar("widgets"),new objj_ivar("resources"),new objj_ivar("project")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("project"),function(_3,_4){
with(_3){
return project;
}
}),new objj_method(sel_getUid("setProject:"),function(_5,_6,_7){
with(_5){
project=_7;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("GDLibrary").super_class},"initWithCoder:",_a);
lookAndFeels=objj_msgSend(objj_msgSend(_a,"decodeObjectForKey:","lookAndFeels"),"allObjects");
lookAndFeels=objj_msgSend(lookAndFeels,"sortedArrayUsingFunction:",function(l1,l2){
return objj_msgSend(l1,"name")<objj_msgSend(l2,"name");
});
widgets=objj_msgSend(_a,"decodeObjectForKey:","widgets");
objj_msgSend(widgets,"makeObjectsPerformSelector:withObject:",sel_getUid("setLibrary:"),_8);
var _b=objj_msgSend(_a,"decodeObjectForKey:","resources");
var _c=objj_msgSend(_b,"objectEnumerator");
var _d=nil;
resources=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
while(_d=objj_msgSend(_c,"nextObject")){
objj_msgSend(resources,"setObject:forKey:",_d,objj_msgSend(_d,"identifier"));
}
return _8;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e,_f,_10){
with(_e){
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("GDLibrary").super_class},"encodeWithCoder:",_10);
objj_msgSend(_10,"encodeObject:forKey:",lookAndFeels,"lookAndFeels");
objj_msgSend(_10,"encodeObject:forKey:",widgets,"widgets");
objj_msgSend(_10,"encodeObject:forKey:",resources,"resources");
}
}),new objj_method(sel_getUid("resourceWithIdentifier:"),function(_11,_12,_13){
with(_11){
var _14=objj_msgSend(resources,"objectForKey:",_13);
if(typeof _14==="undefined"){
return nil;
}
return _14;
}
}),new objj_method(sel_getUid("resources"),function(_15,_16){
with(_15){
return resources;
}
}),new objj_method(sel_getUid("lookAndFeels"),function(_17,_18){
with(_17){
return lookAndFeels;
}
}),new objj_method(sel_getUid("stateWithIdentifier:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(widgets,"objectEnumerator");
var _1d=nil;
while(_1d=objj_msgSend(_1c,"nextObject")){
var _1e=objj_msgSend(_1d,"stateWithIdentifier:",_1b);
if(_1e!=nil){
return _1e;
}
}
return nil;
}
}),new objj_method(sel_getUid("definitionWithIdentifier:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(widgets,"objectEnumerator");
var _23=nil;
while(_23=objj_msgSend(_22,"nextObject")){
var _24=objj_msgSend(_23,"definitionWithIdentifier:",_21);
if(_24!=nil){
return _24;
}
}
return nil;
}
})]);
p;15;GDLookAndFeel.jt;5911;@STATIC;1.0;i;15;GDModelObject.ji;24;GDPropertiesDictionary.ji;15;AppController.ji;19;GDLayoutConstants.ji;23;GDRenderObjectPainter.ji;12;CTGradient.ji;22;GDWidgetInstanceCell.jt;5727;
objj_executeFile("GDModelObject.j",YES);
objj_executeFile("GDPropertiesDictionary.j",YES);
objj_executeFile("AppController.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("GDRenderObjectPainter.j",YES);
objj_executeFile("CTGradient.j",YES);
objj_executeFile("GDWidgetInstanceCell.j",YES);
GDNoPainterType=0;
GDColorPainterType=1;
GDImagePainterType=2;
GDGradientPainterType=3;
DefaultPropertyValues={x:0,y:0,width:100,height:100,rotationAngle:0,cellType:GDRectangleCellType,flexHeightPercentage:100,flexWidthPercentage:100,isMovable:true,isSelectable:true,isVisible:true,isDisplay:true,isContentClipped:true,isDropTarget:true,maximumHeight:1000000,minimumHeight:3,maximumWidth:1000000,minimumWidth:3,verticalResizing:GDFixResizing,horizontalResizing:GDFixResizing,cornerRadiusBottomLeft:0,cornerRadiusBottomRight:0,cornerRadiusTopLeft:0,cornerRadiusTopRight:0,horizontalAlignment:GDLeftAlignment,verticalAlignment:GDLeftAlignment,marginBottom:0,marginLeft:0,marginRight:0,marginTop:0,paddingBottom:0,paddingLeft:0,paddingRight:0,paddingTop:0,opacity:1,borderBottomWidth:1,borderLeftWidth:1,borderRightWidth:1,borderTopWidth:1,borderBottomType:GDBorderTypeSolid,borderLeftType:GDBorderTypeSolid,borderRightType:GDBorderTypeSolid,borderTopType:GDBorderTypeSolid,borderBottomColor:objj_msgSend(CPColor,"blackColor"),borderLeftColor:objj_msgSend(CPColor,"blackColor"),borderRightColor:objj_msgSend(CPColor,"blackColor"),borderTopColor:objj_msgSend(CPColor,"blackColor"),layoutPolicyCode:GDAlignmentLayoutPolicyCode,backgroundPainterType:GDNoPainterType,backgroundColor:objj_msgSend(CPColor,"whiteColor"),backgroundGradient:objj_msgSend(CTGradient,"unifiedDarkGradient"),backgroundGradientAngle:0,backgroundGradientIsRadial:false,backgroundImageResource:nil,backgroundImageHorizontalAlignment:GDCenterAlignment,backgroundImageVerticalAlignment:GDCenterAlignment,backgroundImageHorizontalOperation:GDStretchImageOperation,backgroundImageVerticalOperation:GDStretchImageOperation,backgroundImageProportionalScale:false,dropShadow:false,dropShadowAngle:180,dropShadowSize:0,dropShadowOffset:2,dropShadowBlur:2,dropShadowOpacity:0.5,dropShadowColor:objj_msgSend(CPColor,"blackColor"),textRichText:false,textAttributedString:nil,textFont:objj_msgSend(CPFont,"fontWithName:size:","LucidaGrande",13),textColor:objj_msgSend(CPColor,"blackColor"),textHorizontalAlignment:GDCenterAlignment,textVerticalAlignment:GDCenterAlignment,textAntialias:true,textWordWrap:true,textTraits:0,textLineHeight:1,textLineHeightMultiply:true,textShadow:false,textShadowOffset:2,textShadowOpacity:0.5,textShadowAngle:180,textShadowBlur:1,textShadowColor:objj_msgSend(CPColor,"blackColor"),activeLayout:false,activeHorizontalAlignment:GDLeftAlignment,activeVerticalAlignment:GDTopAlignment,isDrawingReverted:false,isDrawingAboveAll:false,drawingIndex:0,innerShadow:false,innerShadowOffset:5,innerShadowOpacity:0.75,innerShadowAngle:315,innerShadowBlur:5,innerShadowColor:objj_msgSend(CPColor,"blackColor"),borderGradient:NO,borderGradientFill:objj_msgSend(CTGradient,"unifiedDarkGradient"),borderGradientIsRadial:NO,borderGradientAngle:0};
var _1=objj_allocateClassPair(GDModelObject,"GDLookAndFeel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("identifier"),new objj_ivar("lookNodes")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("identifier"),function(_8,_9){
with(_8){
return identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_a,_b,_c){
with(_a){
identifier=_c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_d,_e,_f){
with(_d){
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("GDLookAndFeel").super_class},"encodeWithCoder:",_f);
objj_msgSend(_f,"encodeObject:forKey:",name,"name");
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_10,_11,_12){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("GDLookAndFeel").super_class},"initWithCoder:",_12);
name=objj_msgSend(_12,"decodeObjectForKey:","name");
identifier=objj_msgSend(_12,"decodeObjectForKey:","identifier");
return _10;
}
}),new objj_method(sel_getUid("stylePropertyValueNamed:forHierarchyNodeWithIdentifier:inStateWithIdentifier:"),function(_13,_14,_15,_16,_17){
with(_13){
if(lookNodes==nil){
objj_msgSend(_13,"load");
}
var _18=lookNodes[_16];
if(typeof _18!=="undefined"){
var _19=_18[_17];
if(typeof _19!=="undefined"){
var _1a=gdValueOfPropertyInJSONDictionary(_15,_19);
if(_1a!=nil){
return _1a;
}
}
}
return DefaultPropertyValues[_15];
}
}),new objj_method(sel_getUid("stylePropertyValueNamed:forHierarchyNode:inStateWithIdentifier:"),function(_1b,_1c,_1d,_1e,_1f){
with(_1b){
return objj_msgSend(_1b,"stylePropertyValueNamed:forHierarchyNodeWithIdentifier:inStateWithIdentifier:",_1d,objj_msgSend(_1e,"identifier"),_1f);
}
}),new objj_method(sel_getUid("stylePropertyValueNamed:forHierarchyNode:inState:"),function(_20,_21,_22,_23,_24){
with(_20){
return objj_msgSend(_20,"stylePropertyValueNamed:forHierarchyNode:inStateWithIdentifier:",_22,_23,objj_msgSend(_24,"identifier"));
}
}),new objj_method(sel_getUid("load"),function(_25,_26){
with(_25){
if(lookNodes!=nil){
return;
}
var _27="";
for(var i=0;i<identifier.length;i++){
if(identifier[i]!="/"&&identifier[i]!=":"){
_27+=identifier[i];
}
}
var _28="lf-"+_27+".json";
lookNodes=objj_msgSend(objj_msgSend(_25,"class"),"loadJSONFromFile:",_28);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("defaultValueForPropertyWithName:"),function(_29,_2a,_2b){
with(_29){
return DefaultPropertyValues[_2b];
}
})]);
p;15;GDModelObject.jt;2566;@STATIC;1.0;I;23;Foundation/Foundation.ji;8;GDFont.ji;12;CTGradient.jt;2490;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("GDFont.j",YES);
objj_executeFile("CTGradient.j",YES);
gdValueOfPropertyInJSONDictionary=function(_1,_2){
var _3=_2[_1];
if(typeof _3==="undefined"){
return nil;
}
if(_3&&_3.NSCoderXML){
var _4=objj_msgSend(CPData,"dataWithRawString:",_3.NSCoderXML);
var _5=objj_msgSend(objj_msgSend(CPKeyedUnarchiver,"alloc"),"initForReadingWithData:",_4);
objj_msgSend(_5,"finishDecoding");
var _6=objj_msgSend(_5,"decodeObjectForKey:","value");
_3.NSCoderXML=false;
_2[_1]=_6;
return _6;
}
if(_3&&_3.NSColorValue){
var _7=_3.NSColorValue.split(",");
for(var i=0;i<4;i++){
_7[i]=parseFloat(_7[i]);
}
var _6=objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",_7[0],_7[1],_7[2],_7[3]);
_3.NSColorValue=false;
_2[_1]=_6;
return _6;
}
if(_3&&_3.CTGradient){
var _6=objj_msgSend(CTGradient,"gradientFromJSON:",_3.CTGradient);
_2[_1]=_6;
_3.CTGradient=false;
return _6;
}
if(_3&&_3.GDFont){
var _6=objj_msgSend(GDFont,"fontWithName:size:italic:bool:",_3.GDFont.css,_3.GDFont.size,_3.GDFont.isItalic,_3.GDFont.isBold);
_2[_1]=_6;
_3.GDFont=false;
return _6;
}
if(_3&&_3.GDImageResource){
var _8=_3.GDImageResource.identifier;
var _6=objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(CPApplication,"sharedApplication"),"delegate"),"project"),"projectLibrary"),"resourceWithIdentifier:",_8);
_2[_1]=_6;
_3.GDImageResource=false;
return _6;
}
return _3;
};
var _9=objj_allocateClassPair(CPObject,"GDModelObject"),_a=_9.isa;
objj_registerClassPair(_9);
class_addMethods(_9,[new objj_method(sel_getUid("initFromJSONObject:inProject:"),function(_b,_c,_d,_e){
with(_b){
_b=objj_msgSend(_b,"init");
return _b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f,_10,_11){
with(_f){
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_12,_13,_14){
with(_12){
return _12;
}
})]);
class_addMethods(_a,[new objj_method(sel_getUid("loadJSONFromFile:"),function(_15,_16,_17){
with(_15){
var url=objj_msgSend(CPURL,"URLWithString:relativeToURL:",_17,globalResourcesURL());
var _18=objj_msgSend(CPURLRequest,"requestWithURL:",url);
var _19=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_18,nil);
return JSON.parse(objj_msgSend(_19,"rawString"));
}
}),new objj_method(sel_getUid("fromJSONObject:inProject:"),function(_1a,_1b,_1c,_1d){
with(_1a){
var _1e=_1c.className;
var _1f=CPClassFromString(_1e);
return objj_msgSend(objj_msgSend(_1f,"alloc"),"initFromJSONObject:inProject:",_1c,_1d);
}
})]);
p;29;GDNonBlockingOperationQueue.jt;872;@STATIC;1.0;I;23;Foundation/Foundation.jt;826;
objj_executeFile("Foundation/Foundation.j",NO);
var _1=objj_allocateClassPair(CPOperationQueue,"GDNonBlockingOperationQueue"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_runNextOpsInQueue"),function(_3,_4){
with(_3){
if(_timer){
objj_msgSend(_timer,"invalidate");
_timer=nil;
}
if(!_suspended&&objj_msgSend(_3,"operationCount")>0){
var i=0,_5=objj_msgSend(_operations,"count");
var op=objj_msgSend(_operations,"objectAtIndex:",i);
if(objj_msgSend(op,"isReady")&&!objj_msgSend(op,"isCancelled")&&!objj_msgSend(op,"isFinished")&&!objj_msgSend(op,"isExecuting")){
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",0.01,function(){
objj_msgSend(op,"start");
objj_msgSend(_operations,"removeObject:",op);
objj_msgSend(_3,"_runNextOpsInQueue");
},NO);
}
}
}
})]);
p;30;GDPresentationHandleDragTool.jt;1524;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;8;GDTool.ji;18;GDAbstractHandle.ji;9;GDEvent.ji;18;GDAbstractHandle.ji;20;GDCellRenderObject.jt;1361;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDTool.j",YES);
objj_executeFile("GDAbstractHandle.j",YES);
objj_executeFile("GDEvent.j",YES);
objj_executeFile("GDAbstractHandle.j",YES);
objj_executeFile("GDCellRenderObject.j",YES);
var _1=objj_allocateClassPair(GDTool,"GDPresentationHandleDragTool"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("handle"),new objj_ivar("lastTool"),new objj_ivar("originalBounds")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("startWithHandle:atPoint:lastTool:"),function(_3,_4,_5,p,_6){
with(_3){
handle=_5;
lastTool=_6;
var _7=objj_msgSend(_5,"owner");
originalBounds=objj_msgSend(_7,"bounds");
objj_msgSend(handle,"startDragAtPoint:",p);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_8,_9,_a){
with(_8){
var _b=objj_msgSend(_a,"locationInView");
objj_msgSend(handle,"mouseDraggedToPoint:constrained:centered:originalBounds:guideCoordinator:",_b,objj_msgSend(_a,"shiftKeyPressed"),objj_msgSend(_a,"optionKeyPressed"),originalBounds,nil);
objj_msgSend(objj_msgSend(handle,"cursor"),"set");
}
}),new objj_method(sel_getUid("mouseUp:"),function(_c,_d,_e){
with(_c){
handle=nil;
objj_msgSend(view,"setCurrentTool:",lastTool);
lastTool=nil;
objj_msgSend(objj_msgSend(view,"screenChangeManager"),"windowSizeChanged");
}
})]);
p;11;GDProject.jt;2995;@STATIC;1.0;I;23;Foundation/Foundation.ji;15;GDModelObject.ji;11;GDLibrary.jt;2912;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("GDModelObject.j",YES);
objj_executeFile("GDLibrary.j",YES);
var _1=objj_msgSend(CPDictionary,"dictionary");
globalCurrentLookAndFeel=nil;
var _2=objj_allocateClassPair(GDModelObject,"GDProject"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("projectLibrary"),new objj_ivar("currentLookAndFeel"),new objj_ivar("orderedScreens"),new objj_ivar("orderedScreensCount")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("orderedScreensCount"),function(_4,_5){
with(_4){
return orderedScreensCount;
}
}),new objj_method(sel_getUid("setOrderedScreensCount:"),function(_6,_7,_8){
with(_6){
orderedScreensCount=_8;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_9,_a,_b){
with(_9){
objj_msgSend(_b,"encodeObject:forKey:",projectLibrary,"projectLibrary");
objj_msgSend(_b,"encodeObject:forKey:",currentLookAndFeel,"currentLookAndFeel");
objj_msgSend(_b,"encodeObject:forKey:",orderedScreens,"orderedScreens");
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("GDProject").super_class},"initWithCoder:",_e);
if(_c==nil){
return nil;
}
projectLibrary=objj_msgSend(_e,"decodeObjectForKey:","projectLibrary");
objj_msgSend(projectLibrary,"setProject:",_c);
objj_msgSend(_c,"setCurrentLookAndFeel:",objj_msgSend(_e,"decodeObjectForKey:","currentLookAndFeel"));
orderedScreens=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
orderedScreensCount=objj_msgSend(_e,"decodeIntForKey:","orderedScreensCount");
return _c;
}
}),new objj_method(sel_getUid("setCurrentLookAndFeel:"),function(_f,_10,_11){
with(_f){
currentLookAndFeel=_11;
globalCurrentLookAndFeel=_11;
}
}),new objj_method(sel_getUid("currentLookAndFeel"),function(_12,_13){
with(_12){
return currentLookAndFeel;
}
}),new objj_method(sel_getUid("projectLibrary"),function(_14,_15){
with(_14){
return projectLibrary;
}
}),new objj_method(sel_getUid("lookAndFeels"),function(_16,_17){
with(_16){
return objj_msgSend(projectLibrary,"lookAndFeels");
}
}),new objj_method(sel_getUid("orderedScreens"),function(_18,_19){
with(_18){
return orderedScreens;
}
}),new objj_method(sel_getUid("stateWithIdentifier:"),function(_1a,_1b,_1c){
with(_1a){
return objj_msgSend(GDState,"objectWithIdentifier:",_1c);
}
}),new objj_method(sel_getUid("definitionWithIdentifier:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(GDWidgetCellDefinition,"objectWithIdentifier:",_1f);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("imageWithFileName:size:"),function(_20,_21,_22,_23){
with(_20){
var _24=objj_msgSend(_1,"valueForKey:",_22);
if(_24==nil){
var _25=objj_msgSend("Resources/","stringByAppendingString:",_22);
_24=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",_25,_23);
objj_msgSend(_1,"setObject:forKey:",_24,_22);
}
return _24;
}
})]);
p;24;GDPropertiesDictionary.jt;1069;@STATIC;1.0;I;23;Foundation/Foundation.jt;1022;
objj_executeFile("Foundation/Foundation.j",NO);
var _1=objj_allocateClassPair(CPObject,"GDPropertiesDictionary"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("statesPropertiesDictionary")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initFromProperties:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSend(_3,"init");
if(_3==nil){
return nil;
}
statesPropertiesDictionary=new Object;
var _6=nil;
var _7=objj_msgSend(_5,"objectEnumerator");
while(_6=objj_msgSend(_7,"nextObject")){
var _8=objj_msgSend(_6,"state");
if(statesPropertiesDictionary[objj_msgSend(_8,"hash")]){
var _9=statesPropertiesDictionary[objj_msgSend(_8,"hash")];
_9[objj_msgSend(_6,"name")]=_6;
}else{
var _a=new Object;
_a[objj_msgSend(_6,"name")]=_6;
statesPropertiesDictionary[objj_msgSend(_8,"hash")]=_a;
}
}
return _3;
}
}),new objj_method(sel_getUid("propertyWithName:inState:"),function(_b,_c,_d,_e){
with(_b){
var _f=statesPropertiesDictionary[objj_msgSend(_e,"hash")];
if(!_f){
return nil;
}
return _f[_d];
}
})]);
p;16;GDRenderObject.jt;13526;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;19;GDAffineTransform.ji;19;GDCompositeFigure.ji;16;GDLayoutPolicy.ji;19;GDLayoutConstants.jt;13365;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDAffineTransform.j",YES);
objj_executeFile("GDCompositeFigure.j",YES);
objj_executeFile("GDLayoutPolicy.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
var _1=objj_allocateClassPair(CPObject,"GDRenderObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("bounds"),new objj_ivar("selectable"),new objj_ivar("visibility"),new objj_ivar("screenChangeManager"),new objj_ivar("container"),new objj_ivar("figure")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFigure:screenChangeManager:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSend(_3,"init");
if(_3==nil){
return nil;
}
figure=objj_msgSend(_5,"retain");
screenChangeManager=_6;
objj_msgSend(screenChangeManager,"registerRenderObject:forFigure:",_3,figure);
bounds=CGRectMake(0,0,100,100);
if(figure==nil){
selectable=YES;
visibility=GDVisibilityVisible;
}else{
objj_msgSend(_3,"updateFromFigure");
}
return _3;
}
}),new objj_method(sel_getUid("description"),function(_7,_8){
with(_7){
var b=objj_msgSend(_7,"bounds");
return objj_msgSend(CPString,"stringWithFormat:","%@ \"%@\", bounds: {%f, %f, %f, %f}",objj_msgSendSuper({receiver:_7,super_class:objj_getClass("GDRenderObject").super_class},"description"),objj_msgSend(figure,"name"),b.origin.x,b.origin.y,b.size.width,b.size.height,nil);
}
}),new objj_method(sel_getUid("screenChangeManager"),function(_9,_a){
with(_9){
return screenChangeManager;
}
}),new objj_method(sel_getUid("currentState"),function(_b,_c){
with(_b){
return nil;
}
}),new objj_method(sel_getUid("name"),function(_d,_e){
with(_d){
return objj_msgSend(figure,"name");
}
}),new objj_method(sel_getUid("figure"),function(_f,_10){
with(_f){
return figure;
}
}),new objj_method(sel_getUid("updateFromFigure"),function(_11,_12){
with(_11){
}
}),new objj_method(sel_getUid("updateFromFigureRecursively"),function(_13,_14){
with(_13){
objj_msgSend(_13,"updateFromFigure");
}
}),new objj_method(sel_getUid("renderObjectForFigure:"),function(_15,_16,f){
with(_15){
if(objj_msgSend(f,"isEqual:",figure)){
return _15;
}
return nil;
}
}),new objj_method(sel_getUid("setSize:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(_17,"bounds").origin;
objj_msgSend(_17,"setBounds:",CGRectMake(_1a.x,_1a.y,_19.width,_19.height));
}
}),new objj_method(sel_getUid("bounds"),function(_1b,_1c){
with(_1b){
return CGRectMakeCopy(bounds);
}
}),new objj_method(sel_getUid("setBounds:"),function(_1d,_1e,_1f){
with(_1d){
if(NSEqualRects(_1f,bounds)){
return;
}
bounds=_1f;
}
}),new objj_method(sel_getUid("width"),function(_20,_21){
with(_20){
return CGRectGetWidth(bounds);
}
}),new objj_method(sel_getUid("setWidth:"),function(_22,_23,w){
with(_22){
if(w==bounds.size.width){
return;
}
var _24=objj_msgSend(_22,"bounds");
_24.size.width=w;
objj_msgSend(_22,"setBounds:",_24);
}
}),new objj_method(sel_getUid("height"),function(_25,_26){
with(_25){
return CGRectGetHeight(bounds);
}
}),new objj_method(sel_getUid("setHeight:"),function(_27,_28,h){
with(_27){
if(h==objj_msgSend(_27,"height")){
return;
}
var _29=objj_msgSend(_27,"bounds");
_29.size.height=h;
objj_msgSend(_27,"setBounds:",_29);
}
}),new objj_method(sel_getUid("x"),function(_2a,_2b){
with(_2a){
return bounds.origin.x;
}
}),new objj_method(sel_getUid("setX:"),function(_2c,_2d,x){
with(_2c){
if(x==objj_msgSend(_2c,"x")){
return;
}
var _2e=objj_msgSend(_2c,"bounds");
_2e.origin.x=x;
objj_msgSend(_2c,"setBounds:",_2e);
}
}),new objj_method(sel_getUid("y"),function(_2f,_30){
with(_2f){
return bounds.origin.y;
}
}),new objj_method(sel_getUid("setY:"),function(_31,_32,y){
with(_31){
if(y==objj_msgSend(_31,"y")){
return;
}
var _33=objj_msgSend(_31,"bounds");
_33.origin.y=y;
objj_msgSend(_31,"setBounds:",_33);
}
}),new objj_method(sel_getUid("origin"),function(_34,_35){
with(_34){
return objj_msgSend(_34,"bounds").origin;
}
}),new objj_method(sel_getUid("setOrigin:"),function(_36,_37,_38){
with(_36){
if(NSEqualPoints(_38,bounds.origin)){
return;
}
var _39=objj_msgSend(_36,"bounds");
_39.origin=_38;
objj_msgSend(_36,"setBounds:",_39);
}
}),new objj_method(sel_getUid("size"),function(_3a,_3b){
with(_3a){
return objj_msgSend(_3a,"bounds").size;
}
}),new objj_method(sel_getUid("setSize:"),function(_3c,_3d,_3e){
with(_3c){
if(NSEqualSizes(_3e,bounds.size)){
return;
}
var _3f=objj_msgSend(_3c,"bounds");
_3f.size=_3e;
objj_msgSend(_3c,"setBounds:",_3f);
}
}),new objj_method(sel_getUid("minimumWidth"),function(_40,_41){
with(_40){
return 0;
}
}),new objj_method(sel_getUid("maximumWidth"),function(_42,_43){
with(_42){
return 0;
}
}),new objj_method(sel_getUid("minimumHeight"),function(_44,_45){
with(_44){
return 0;
}
}),new objj_method(sel_getUid("maximumHeight"),function(_46,_47){
with(_46){
return 0;
}
}),new objj_method(sel_getUid("topLeft"),function(_48,_49){
with(_48){
return objj_msgSend(_48,"bounds").origin;
}
}),new objj_method(sel_getUid("setTopLeft:"),function(_4a,_4b,p){
with(_4a){
var _4c=CGRectMake(p.x,p.y,0,0);
var _4d=objj_msgSend(_4a,"bounds");
if(p.x>_4d.origin.x){
_4c.size.width=_4d.size.width-(p.x-_4d.origin.x);
_4c.size.height=_4d.size.height-(p.y-_4d.origin.y);
}else{
_4c.size.width=_4d.size.width+(_4d.origin.x-p.x);
_4c.size.height=_4d.size.height+(_4d.origin.y-p.y);
}
objj_msgSend(_4a,"setBounds:",_4c);
}
}),new objj_method(sel_getUid("topRight"),function(_4e,_4f){
with(_4e){
return CGPointMake(objj_msgSend(_4e,"bounds").origin.x+objj_msgSend(_4e,"bounds").size.width,objj_msgSend(_4e,"bounds").origin.y);
}
}),new objj_method(sel_getUid("setTopRight:"),function(_50,_51,p){
with(_50){
var _52;
var _53=objj_msgSend(_50,"bounds");
_52.origin.x=_53.origin.x;
_52.origin.y=p.y;
_52.size.width=fabs(_53.origin.x-p.x);
_52.size.height=fabs(_53.origin.y+_53.size.height-p.y);
objj_msgSend(_50,"setBounds:",_52);
}
}),new objj_method(sel_getUid("bottomRight"),function(_54,_55){
with(_54){
return CGPointMake(objj_msgSend(_54,"bounds").origin.x+objj_msgSend(_54,"bounds").size.width,objj_msgSend(_54,"bounds").origin.y+objj_msgSend(_54,"bounds").size.height);
}
}),new objj_method(sel_getUid("setBottomRight:"),function(_56,_57,p){
with(_56){
var _58=objj_msgSend(_56,"bounds");
_58.size.width=fabs(p.x-_58.origin.x);
_58.size.height=fabs(p.y-_58.origin.y);
objj_msgSend(_56,"setBounds:",_58);
}
}),new objj_method(sel_getUid("bottomLeft"),function(_59,_5a){
with(_59){
return CGPointMake(objj_msgSend(_59,"bounds").origin.x,objj_msgSend(_59,"bounds").origin.y+objj_msgSend(_59,"bounds").size.height);
}
}),new objj_method(sel_getUid("setBottomLeft:"),function(_5b,_5c,p){
with(_5b){
var _5d;
var _5e=objj_msgSend(_5b,"bounds");
_5d.origin.x=p.x;
_5d.origin.y=_5e.origin.y;
_5d.size.height=fabs(p.y-_5e.origin.y);
_5d.size.width=fabs(_5e.origin.x+_5e.size.width-p.x);
objj_msgSend(_5b,"setBounds:",_5d);
}
}),new objj_method(sel_getUid("topCenter"),function(_5f,_60){
with(_5f){
var _61=objj_msgSend(_5f,"bounds");
return CGPointMake(_61.origin.x+_61.size.width/2,_61.origin.y);
}
}),new objj_method(sel_getUid("setTopCenter:"),function(_62,_63,p){
with(_62){
objj_msgSend(_62,"setTopLeft:",CGPointMake(objj_msgSend(_62,"topLeft").x,p.y));
}
}),new objj_method(sel_getUid("bottomCenter"),function(_64,_65){
with(_64){
var _66=objj_msgSend(_64,"bounds");
return CGPointMake(_66.origin.x+_66.size.width/2,_66.origin.y+_66.size.height);
}
}),new objj_method(sel_getUid("setBottomCenter:"),function(_67,_68,p){
with(_67){
objj_msgSend(_67,"setBottomLeft:",CGPointMake(objj_msgSend(_67,"bottomLeft").x,p.y));
}
}),new objj_method(sel_getUid("leftCenter"),function(_69,_6a){
with(_69){
var _6b=objj_msgSend(_69,"bounds");
return CGPointMake(_6b.origin.x,_6b.origin.y+_6b.size.height/2);
}
}),new objj_method(sel_getUid("setLeftCenter:"),function(_6c,_6d,p){
with(_6c){
objj_msgSend(_6c,"setTopLeft:",CGPointMake(p.x,objj_msgSend(_6c,"topLeft").y));
}
}),new objj_method(sel_getUid("rightCenter"),function(_6e,_6f){
with(_6e){
var _70=objj_msgSend(_6e,"bounds");
return CGPointMake(_70.origin.x+_70.size.width,_70.origin.y+_70.size.height/2);
}
}),new objj_method(sel_getUid("setRightCenter:"),function(_71,_72,p){
with(_71){
objj_msgSend(_71,"setTopRight:",CGPointMake(p.x,objj_msgSend(_71,"topRight").y));
}
}),new objj_method(sel_getUid("translateBy:"),function(_73,_74,p){
with(_73){
var _75=CGRectOffset(objj_msgSend(_73,"bounds"),p.x,p.y);
objj_msgSend(_73,"setBounds:",_75);
}
}),new objj_method(sel_getUid("globalBounds"),function(_76,_77){
with(_76){
var _78=objj_msgSend(_76,"fullBounds");
_78.origin=objj_msgSend(objj_msgSend(_76,"absoluteAffineTransform"),"transformPoint:",_78.origin);
return _78;
}
}),new objj_method(sel_getUid("globalDrawBounds"),function(_79,_7a){
with(_79){
return objj_msgSend(_79,"globalBounds");
}
}),new objj_method(sel_getUid("drawBounds"),function(_7b,_7c){
with(_7b){
return objj_msgSend(_7b,"bounds");
}
}),new objj_method(sel_getUid("container"),function(_7d,_7e){
with(_7d){
return container;
}
}),new objj_method(sel_getUid("setContainer:"),function(_7f,_80,_81){
with(_7f){
container=_81;
}
}),new objj_method(sel_getUid("siblings"),function(_82,_83){
with(_82){
var _84=objj_msgSend(objj_msgSend(objj_msgSend(_82,"container"),"orderedComponents"),"mutableCopy");
objj_msgSend(_84,"removeObject:",_82);
return objj_msgSend(_84,"autorelease");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_85,_86,_87){
with(_85){
var f=_85;
while((f=objj_msgSend(f,"container"))!=nil){
if(objj_msgSend(f,"isEqual:",_87)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("index"),function(_88,_89){
with(_88){
return objj_msgSend(objj_msgSend(objj_msgSend(_88,"container"),"orderedComponents"),"indexOfObject:",_88);
}
}),new objj_method(sel_getUid("isDraggable"),function(_8a,_8b){
with(_8a){
return YES;
}
}),new objj_method(sel_getUid("isHandle"),function(_8c,_8d){
with(_8c){
return NO;
}
}),new objj_method(sel_getUid("visibility"),function(_8e,_8f){
with(_8e){
return visibility;
}
}),new objj_method(sel_getUid("setVisibility:"),function(_90,_91,_92){
with(_90){
if(visibility==_92){
return;
}
visibility=_92;
}
}),new objj_method(sel_getUid("isTable"),function(_93,_94){
with(_93){
return NO;
}
}),new objj_method(sel_getUid("isTableCell"),function(_95,_96){
with(_95){
return NO;
}
}),new objj_method(sel_getUid("isSelectable"),function(_97,_98){
with(_97){
return selectable;
}
}),new objj_method(sel_getUid("setIsSelectable:"),function(_99,_9a,_9b){
with(_99){
if(selectable==_9b){
return;
}
selectable=_9b;
}
}),new objj_method(sel_getUid("isMovable"),function(_9c,_9d){
with(_9c){
return objj_msgSend(figure,"isMovable");
}
}),new objj_method(sel_getUid("verticalResizing"),function(_9e,_9f){
with(_9e){
return GDFixResizing;
}
}),new objj_method(sel_getUid("horizontalResizing"),function(_a0,_a1){
with(_a0){
return GDFixResizing;
}
}),new objj_method(sel_getUid("isTableElement"),function(_a2,_a3){
with(_a2){
return NO;
}
}),new objj_method(sel_getUid("drawRect:atScale:"),function(_a4,_a5,_a6,_a7){
with(_a4){
}
}),new objj_method(sel_getUid("absoluteAffineTransform"),function(_a8,_a9){
with(_a8){
var _aa=objj_msgSend(GDAffineTransform,"transform");
var p=objj_msgSend(_a8,"container");
while(p!=nil){
objj_msgSend(_aa,"appendTransform:",objj_msgSend(p,"affineTransform"));
p=objj_msgSend(p,"container");
}
return _aa;
}
}),new objj_method(sel_getUid("affineTransform"),function(_ab,_ac){
with(_ab){
return objj_msgSend(_ab,"affineOriginTransform");
}
}),new objj_method(sel_getUid("affineOriginTransform"),function(_ad,_ae){
with(_ad){
var _af=objj_msgSend(GDAffineTransform,"transform");
var _b0=objj_msgSend(_ad,"bounds").origin;
objj_msgSend(_af,"translateXBy:yBy:",_b0.x,_b0.y);
return _af;
}
}),new objj_method(sel_getUid("affineBorderTransform"),function(_b1,_b2){
with(_b1){
return objj_msgSend(GDAffineTransform,"transform");
}
}),new objj_method(sel_getUid("convertGlobalPoint:"),function(_b3,_b4,p){
with(_b3){
var _b5=objj_msgSend(_b3,"absoluteAffineTransform");
objj_msgSend(_b5,"prependTransform:",objj_msgSend(_b3,"affineTransform"));
objj_msgSend(_b5,"invert");
return objj_msgSend(_b5,"transformPoint:",p);
}
}),new objj_method(sel_getUid("handles"),function(_b6,_b7){
with(_b6){
return objj_msgSend(CPArray,"array");
}
}),new objj_method(sel_getUid("opacity"),function(_b8,_b9){
with(_b8){
return 1;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingValueForKey:"),function(_ba,_bb,key){
with(_ba){
if(objj_msgSend(objj_msgSend(CPSet,"setWithObjects:","x","y","width","height",nil),"containsObject:",key)){
return objj_msgSend(CPSet,"setWithObject:","bounds");
}
return objj_msgSendSuper({receiver:_ba,super_class:objj_getMetaClass("GDRenderObject").super_class},"keyPathsForValuesAffectingValueForKey:",key);
}
}),new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"),function(_bc,_bd,key){
with(_bc){
return NO;
}
}),new objj_method(sel_getUid("renderObjectForFigure:screenChangeManager:"),function(_be,_bf,_c0,_c1){
with(_be){
return objj_msgSend(objj_msgSend(objj_msgSend(_be,"alloc"),"initWithFigure:screenChangeManager:",_c0,_c1),"autorelease");
}
}),new objj_method(sel_getUid("renderObjectWithBounds:figure:screenChangeManager:"),function(_c2,_c3,r,_c4,_c5){
with(_c2){
var _c6=objj_msgSend(_c2,"renderObjectForFigure:screenChangeManager:",_c4,_c5);
objj_msgSend(_c6,"setBounds:",r);
return _c6;
}
})]);
p;23;GDRenderObjectPainter.jt;8329;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;12;CTGradient.ji;20;CGContextAdditions.jt;8220;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("CTGradient.j",YES);
objj_executeFile("CGContextAdditions.j",YES);
GDColorPainterType=1;
GDImagePainterType=2;
GDGradientPainterType=3;
GDStretchImageOperation=0;
GDOriginalSizeImageOperation=1;
GDTileImageOperation=2;
var _1=objj_allocateClassPair(CPObject,"GDRenderObjectPainter"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("renderObject")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setRenderObject:"),function(_3,_4,_5){
with(_3){
renderObject=_5;
}
}),new objj_method(sel_getUid("useValuesFromCell:inState:"),function(_6,_7,_8,_9){
with(_6){
}
}),new objj_method(sel_getUid("paintRect:"),function(_a,_b,_c){
with(_a){
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("painter"),function(_d,_e){
with(_d){
return objj_msgSend(objj_msgSend(_d,"alloc"),"init");
}
}),new objj_method(sel_getUid("painterForCell:inState:renderObject:"),function(_f,_10,_11,_12,_13){
with(_f){
var _14=nil;
switch(objj_msgSend(objj_msgSend(_11,"valueForKey:inState:","backgroundPainterType",_12),"intValue")){
case GDColorPainterType:
_14=objj_msgSend(GDRenderObjectColorPainter,"painter");
break;
case GDGradientPainterType:
_14=objj_msgSend(GDRenderObjectGradientPainter,"painter");
break;
case GDImagePainterType:
_14=objj_msgSend(GDRenderObjectImagePainter,"painter");
break;
}
objj_msgSend(_14,"setRenderObject:",_13);
objj_msgSend(_14,"useValuesFromCell:inState:",_11,_12);
return _14;
}
})]);
var _1=objj_allocateClassPair(GDRenderObjectPainter,"GDRenderObjectColorPainter"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("color")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("useValuesFromCell:inState:"),function(_15,_16,_17,_18){
with(_15){
color=objj_msgSend(_17,"valueForKey:inState:","backgroundColor",_18);
}
}),new objj_method(sel_getUid("paintRect:"),function(_19,_1a,_1b){
with(_19){
var _1c=GDGetCurrentContext();
CGContextSetFillColorWithAlpha(_1c,color,objj_msgSend(color,"alphaComponent"));
CGContextFillRect(_1c,_1b);
}
})]);
var _1=objj_allocateClassPair(GDRenderObjectPainter,"GDRenderObjectGradientPainter"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("gradient"),new objj_ivar("isRadial"),new objj_ivar("angle")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("useValuesFromCell:inState:"),function(_1d,_1e,_1f,_20){
with(_1d){
gradient=objj_msgSend(_1f,"valueForKey:inState:","backgroundGradient",_20);
isRadial=objj_msgSend(_1f,"valueForKey:inState:","backgroundGradientIsRadial",_20);
angle=objj_msgSend(_1f,"valueForKey:inState:","backgroundGradientAngle",_20);
}
}),new objj_method(sel_getUid("paintRect:"),function(_21,_22,_23){
with(_21){
if(isRadial){
objj_msgSend(gradient,"radialFillRect:",_23);
}else{
objj_msgSend(gradient,"fillRect:angle:",_23,angle+90);
}
}
})]);
var _1=objj_allocateClassPair(GDRenderObjectPainter,"GDRenderObjectImagePainter"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("imageResource"),new objj_ivar("horizontalAlignment"),new objj_ivar("verticalAlignment"),new objj_ivar("horizontalOperation"),new objj_ivar("verticalOperation"),new objj_ivar("proportionalScale")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("useValuesFromCell:inState:"),function(_24,_25,_26,_27){
with(_24){
imageResource=objj_msgSend(_26,"valueForKey:inState:","backgroundImageResource",_27);
verticalAlignment=objj_msgSend(objj_msgSend(_26,"valueForKey:inState:","backgroundImageVerticalAlignment",_27),"intValue");
horizontalAlignment=objj_msgSend(objj_msgSend(_26,"valueForKey:inState:","backgroundImageHorizontalAlignment",_27),"intValue");
verticalOperation=objj_msgSend(objj_msgSend(_26,"valueForKey:inState:","backgroundImageVerticalOperation",_27),"intValue");
horizontalOperation=objj_msgSend(objj_msgSend(_26,"valueForKey:inState:","backgroundImageHorizontalOperation",_27),"intValue");
proportionalScale=objj_msgSend(objj_msgSend(_26,"valueForKey:inState:","backgroundImageProportionalScale",_27),"boolValue");
}
}),new objj_method(sel_getUid("alignRect:inRect:"),function(_28,_29,_2a,_2b){
with(_28){
var x=0;
var y=0;
var _2c=_2b.size;
switch(horizontalAlignment){
case GDLeftAlignment:
x=0;
break;
case GDCenterAlignment:
x=(_2c.width-_2a.size.width)/2;
break;
case GDRightAlignment:
x=_2c.width-_2a.size.width;
break;
}
switch(verticalAlignment){
case GDTopAlignment:
y=0;
break;
case GDCenterAlignment:
y=(_2c.height-_2a.size.height)/2;
break;
case GDBottomAlignment:
y=_2c.height-_2a.size.height;
break;
}
return CGRectMake(x+_2b.origin.x,y+_2b.origin.y,_2a.size.width,_2a.size.height);
}
}),new objj_method(sel_getUid("paintRect:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(imageResource,"image");
if(objj_msgSend(_30,"loadStatus")!=CPImageLoadStatusCompleted){
return;
}
if(_30==nil||_2f.size.width==0||_2f.size.height==0){
return;
}
var _31=GDGetCurrentContext();
var _32=CGRectMake(CGRectGetMinX(_2f),CGRectGetMinY(_2f),CGRectGetWidth(_2f),CGRectGetHeight(_2f));
var _33=CGSizeMake(objj_msgSend(imageResource,"width"),objj_msgSend(imageResource,"height"));
CGContextSaveGState(_31);
if(proportionalScale){
var _34=_33.height/_33.width;
var _35=_33.width/_33.height;
_33=CGSizeMake(_2f.size.width,_2f.size.width*_34);
if(_33.height>_2f.size.height){
_33=CGSizeMake(_2f.size.height*_35,_2f.size.height);
}
var _36=objj_msgSend(_2d,"alignRect:inRect:",CGRectMake(0,0,_33.width,_33.height),_32);
CGContextClipToRect(_31,_32);
CGContextDrawImage(_31,_36,_30);
}else{
if(verticalOperation==GDStretchImageOperation&&horizontalOperation==GDStretchImageOperation){
CGContextDrawImage(_31,_2f,_30);
}else{
if(verticalOperation==GDOriginalSizeImageOperation&&horizontalOperation==GDOriginalSizeImageOperation){
var _36=objj_msgSend(_2d,"alignRect:inRect:",CGRectMake(0,0,_33.width,_33.height),_32);
CGContextClipToRect(_31,_32);
CGContextDrawImage(_31,_36,_30);
}else{
if(verticalOperation==GDStretchImageOperation&&horizontalOperation==GDOriginalSizeImageOperation){
var _36=objj_msgSend(_2d,"alignRect:inRect:",CGRectMake(0,0,_33.width,_32.size.height),_32);
CGContextClipToRect(_31,_32);
CGContextDrawImage(_31,_36,_30);
}else{
if(verticalOperation==GDOriginalSizeImageOperation&&horizontalOperation==GDStretchImageOperation){
var _36=objj_msgSend(_2d,"alignRect:inRect:",CGRectMake(0,0,_32.size.width,_33.height),_32);
CGContextClipToRect(_31,_32);
CGContextDrawImage(_31,_36,_30);
}else{
if(verticalOperation==GDTileImageOperation&&horizontalOperation==GDTileImageOperation){
var _37=_31.createPattern(_30._image,"repeat");
_31.fillStyle=_37;
CGContextTranslateCTM(_31,_2f.origin.x,_2f.origin.y);
_31.fillRect(0,0,_2f.size.width,_2f.size.height);
}else{
if(horizontalOperation==GDTileImageOperation&&verticalOperation==GDStretchImageOperation){
var _37=_31.createPattern(_30._image,"repeat-x");
_31.fillStyle=_37;
var _36=_2f;
CGContextTranslateCTM(_31,_2f.origin.x,_2f.origin.y);
CGContextScaleCTM(_31,1,_2f.size.height/_33.height);
_31.fillRect(0,0,_2f.size.width,_2f.size.height);
}else{
if(verticalOperation==GDTileImageOperation&&horizontalOperation==GDOriginalSizeImageOperation){
var _38=CGRectMake(0,0,_33.width,_2f.size.height);
_38=objj_msgSend(_2d,"alignRect:inRect:",_38,_32);
var _37=_31.createPattern(_30._image,"repeat-y");
_31.fillStyle=_37;
CGContextTranslateCTM(_31,_38.origin.x,_38.origin.y);
_31.fillRect(0,0,_38.size.width,_38.size.height);
}else{
if(verticalOperation==GDOriginalSizeImageOperation&&horizontalOperation==GDTileImageOperation){
var _38=CGRectMake(0,0,_2f.size.width,_33.height);
_38=objj_msgSend(_2d,"alignRect:inRect:",_38,_32);
var _37=_31.createPattern(_30._image,"repeat-x");
_31.fillStyle=_37;
CGContextTranslateCTM(_31,_38.origin.x,_38.origin.y);
_31.fillRect(0,0,_38.size.width,_38.size.height);
}else{
if(horizontalOperation==GDStretchImageOperation&&verticalOperation==GDTileImageOperation){
var _37=_31.createPattern(_30._image,"repeat-y");
_31.fillStyle=_37;
var _36=_2f;
CGContextTranslateCTM(_31,_2f.origin.x,_2f.origin.y);
CGContextScaleCTM(_31,_2f.size.width/_33.width,1);
_31.fillRect(0,0,_2f.size.width,_2f.size.height);
}
}
}
}
}
}
}
}
}
}
CGContextRestoreGState(_31);
}
})]);
p;12;GDResource.jt;1126;@STATIC;1.0;i;15;GDModelObject.jt;1087;
objj_executeFile("GDModelObject.j",YES);
var _1=objj_allocateClassPair(GDModelObject,"GDResource"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("fileName"),new objj_ivar("identifier")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_5,_6,_7){
with(_5){
identifier=_7;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_8,_9,_a){
with(_8){
objj_msgSend(_a,"encodeObject:forKey:",fileName,"fileName");
objj_msgSend(_a,"encodeObject:forKey:",name,"name");
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("GDResource").super_class},"initWithCoder:",_d);
name=objj_msgSend(_d,"decodeObjectForKey:","name");
fileName=objj_msgSend(_d,"decodeObjectForKey:","fileName");
identifier=objj_msgSend(_d,"decodeObjectForKey:","identifier");
return _b;
}
}),new objj_method(sel_getUid("load"),function(_e,_f){
with(_e){
}
})]);
p;11;GDRunTool.jt;4122;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;8;GDTool.ji;9;GDEvent.ji;11;GDProject.ji;16;GDEventManager.jt;3993;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDTool.j",YES);
objj_executeFile("GDEvent.j",YES);
objj_executeFile("GDProject.j",YES);
objj_executeFile("GDEventManager.j",YES);
var _1=objj_allocateClassPair(GDTool,"GDRunTool"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("eventManager")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithView:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDRunTool").super_class},"initWithView:",_5);
if(_3==nil){
return nil;
}
eventManager=objj_msgSend(objj_msgSend(GDEventManager,"alloc"),"initWithView:",view);
return _3;
}
}),new objj_method(sel_getUid("projectController"),function(_6,_7){
with(_6){
return objj_msgSend(view,"projectController");
}
}),new objj_method(sel_getUid("screenChangeManager"),function(_8,_9){
with(_8){
return objj_msgSend(view,"screenChangeManager");
}
}),new objj_method(sel_getUid("eventManager"),function(_a,_b){
with(_a){
return eventManager;
}
}),new objj_method(sel_getUid("figuresForRenderObjects:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<objj_msgSend(_e,"count");i++){
objj_msgSend(_f,"addObject:",objj_msgSend(objj_msgSend(_e,"objectAtIndex:",i),"figure"));
}
return _f;
}
}),new objj_method(sel_getUid("mouseUp:"),function(_10,_11,_12){
with(_10){
var _13=objj_msgSend(_12,"locationInView");
if(objj_msgSend(view,"handleAtPoint:",_13)!=nil){
return;
}
var _14=objj_msgSend(view,"allRenderObjectsAtPoint:",_13);
objj_msgSend(objj_msgSend(_10,"eventManager"),"updateWithUpEventAndCells:clickCount:",objj_msgSend(_10,"figuresForRenderObjects:",_14),objj_msgSend(_12,"clickCount"));
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_15,_16,_17){
with(_15){
var _18=objj_msgSend(_17,"locationInView");
var _19=objj_msgSend(view,"handleAtPoint:",_18);
if(_19!=nil){
objj_msgSend(objj_msgSend(_19,"cursor"),"set");
}else{
objj_msgSend(objj_msgSend(_15,"cursor"),"set");
}
var _1a=objj_msgSend(view,"allRenderObjectsAtPoint:",_18);
objj_msgSend(objj_msgSend(_15,"eventManager"),"updateWithMovedEventAndCells:",objj_msgSend(_15,"figuresForRenderObjects:",_1a));
}
}),new objj_method(sel_getUid("mouseDown:"),function(_1b,_1c,_1d){
with(_1b){
var _1e=objj_msgSend(_1d,"locationInView");
var _1f=objj_msgSend(view,"handleAtPoint:",_1e);
if(_1f!=nil){
objj_msgSend(view,"startDragWithHandle:atPoint:",_1f,_1e);
return;
}
var _20=objj_msgSend(view,"allRenderObjectsAtPoint:",_1e);
objj_msgSend(objj_msgSend(_1b,"eventManager"),"updateWithDownEventAndCells:clickCount:",objj_msgSend(_1b,"figuresForRenderObjects:",_20),objj_msgSend(_1d,"clickCount"));
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(_23,"locationInView");
var _25=objj_msgSend(view,"allRenderObjectsAtPoint:",_24);
objj_msgSend(objj_msgSend(_21,"eventManager"),"updateWithDraggedEventAndCells:",objj_msgSend(_21,"figuresForRenderObjects:",_25));
}
}),new objj_method(sel_getUid("keyUp:"),function(_26,_27,_28){
with(_26){
if(objj_msgSend(_28,"keyCode")==CPEscapeKeyCode){
objj_msgSend(objj_msgSend(objj_msgSend(CPApplication,"sharedApplication"),"delegate"),"exitFullScreen:",_26);
}
}
}),new objj_method(sel_getUid("keyDown:"),function(_29,_2a,_2b){
with(_29){
if(objj_msgSend(_2b,"keyCode")==CPRightArrowKeyCode){
objj_msgSend(objj_msgSend(objj_msgSend(CPApplication,"sharedApplication"),"delegate"),"nextScreen:",_29);
return;
}
if(objj_msgSend(_2b,"keyCode")==CPLeftArrowKeyCode){
objj_msgSend(objj_msgSend(objj_msgSend(CPApplication,"sharedApplication"),"delegate"),"previousScreen:",_29);
return;
}
}
}),new objj_method(sel_getUid("cursor"),function(_2c,_2d){
with(_2c){
return objj_msgSend(CPCursor,"arrowCursor");
}
}),new objj_method(sel_getUid("gotoScreen:"),function(_2e,_2f,_30){
with(_2e){
objj_msgSend(view,"stopObservingScreen:",nil);
objj_msgSend(view,"startObservingScreen:",_30);
}
})]);
p;10;GDScreen.jt;645;@STATIC;1.0;i;26;GDWidgetInstanceRootCell.jt;596;
objj_executeFile("GDWidgetInstanceRootCell.j",YES);
var _1=objj_allocateClassPair(GDWidgetInstanceRootCell,"GDScreen"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("encodeWithCoder:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDScreen").super_class},"encodeWithCoder:",_5);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("GDScreen").super_class},"initWithCoder:",_8);
if(_6==nil){
return nil;
}
return _6;
}
})]);
p;23;GDScreenChangeManager.jt;12963;@STATIC;1.0;I;21;Foundation/CPObject.ji;16;GDRenderObject.ji;20;GDCellRenderObject.ji;26;GDCircleCellRenderObject.ji;28;GDTriangleCellRenderObject.ji;21;GDTableRenderObject.ji;22;GDScreenRenderObject.ji;10;GDCanvas.ji;10;GDScreen.ji;22;GDCocoaCompatibility.jt;12697;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("GDRenderObject.j",YES);
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDCircleCellRenderObject.j",YES);
objj_executeFile("GDTriangleCellRenderObject.j",YES);
objj_executeFile("GDTableRenderObject.j",YES);
objj_executeFile("GDScreenRenderObject.j",YES);
objj_executeFile("GDCanvas.j",YES);
objj_executeFile("GDScreen.j",YES);
objj_executeFile("GDCocoaCompatibility.j",YES);
GDScreenChangedNotificationName="GDScreenChangedNotificationName";
var _1=objj_allocateClassPair(GDCellRenderObject,"GDUeberRenderObject"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("affineTransform"),function(_3,_4){
with(_3){
return objj_msgSend(GDAffineTransform,"transform");
}
}),new objj_method(sel_getUid("isTableCell"),function(_5,_6){
with(_5){
return NO;
}
}),new objj_method(sel_getUid("isTable"),function(_7,_8){
with(_7){
return NO;
}
})]);
var _1=objj_allocateClassPair(CPObject,"GDScreenChangeManager"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("screenRenderObject"),new objj_ivar("view"),new objj_ivar("screen"),new objj_ivar("screenRenderObjectsCache"),new objj_ivar("figureRenderObjectDictionary"),new objj_ivar("isWorking"),new objj_ivar("layoutingDisabled"),new objj_ivar("partialRedrawDisabled"),new objj_ivar("drawingAboveAllMode"),new objj_ivar("updateRects"),new objj_ivar("handles"),new objj_ivar("ueberRenderObject")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithView:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSend(_9,"init");
if(_9==nil){
return nil;
}
view=_b;
figureRenderObjectDictionary={};
isWorking=0;
layoutingDisabled=0;
partialRedrawDisabled=NO;
drawingAboveAllMode=NO;
updateRects=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
screenRenderObjectsCache=new Object;
handles=objj_msgSend(CPArray,"array");
ueberRenderObject=objj_msgSend(objj_msgSend(GDUeberRenderObject,"alloc"),"initWithFigure:screenChangeManager:",nil,_9);
objj_msgSend(ueberRenderObject,"setHorizontalAlignment:",GDCenterAlignment);
objj_msgSend(ueberRenderObject,"setVerticalAlignment:",GDCenterAlignment);
return _9;
}
}),new objj_method(sel_getUid("registerRenderObject:forFigure:"),function(_c,_d,_e,_f){
with(_c){
if(objj_msgSend(_e,"isHandle")){
return;
}
figureRenderObjectDictionary[_f]=_e;
}
}),new objj_method(sel_getUid("reloadScreen"),function(_10,_11){
with(_10){
screenRenderObjectsCache=new Object;
objj_msgSend(_10,"setScreen:",screen);
}
}),new objj_method(sel_getUid("logRenderObjectRecursively:"),function(_12,_13,_14){
with(_12){
console.log("%s",objj_msgSend(objj_msgSend(_14,"figure"),"name"));
for(var i=0;i<objj_msgSend(objj_msgSend(_14,"orderedComponents"),"count");i++){
objj_msgSend(_12,"logRenderObjectRecursively:",objj_msgSend(objj_msgSend(_14,"orderedComponents"),"objectAtIndex:",i));
}
}
}),new objj_method(sel_getUid("logFigureRecursively:"),function(_15,_16,_17){
with(_15){
console.log("%s",objj_msgSend(_17,"name"));
for(var i=0;i<objj_msgSend(objj_msgSend(_17,"orderedComponents"),"count");i++){
objj_msgSend(_15,"logFigureRecursively:",objj_msgSend(objj_msgSend(_17,"orderedComponents"),"objectAtIndex:",i));
}
}
}),new objj_method(sel_getUid("cacheScreen:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_18,"startWork");
var _1b=objj_msgSend(GDScreenRenderObject,"renderObjectForFigure:screenChangeManager:",_1a,_18);
objj_msgSend(objj_msgSend(_1a,"orderedComponents"),"makeObjectsPerformSelector:withObject:",sel_getUid("acceptVisitor:"),_18);
screenRenderObjectsCache[objj_msgSend(_1a,"hash")]=_1b;
objj_msgSend(_18,"stopWorkAndLayout:redraw:",NO,NO);
}
}),new objj_method(sel_getUid("setScreenRenderObject:"),function(_1c,_1d,_1e){
with(_1c){
if(screenRenderObject==_1e){
return;
}
screenRenderObject=_1e;
objj_msgSend(screenRenderObject,"setIsContentClipped:",YES);
if(objj_msgSend(objj_msgSend(ueberRenderObject,"orderedComponents"),"count")>0){
objj_msgSend(ueberRenderObject,"removeComponentAtIndex:",0);
}
objj_msgSend(ueberRenderObject,"addComponent:",screenRenderObject);
}
}),new objj_method(sel_getUid("setScreen:"),function(_1f,_20,_21){
with(_1f){
screen=_21;
partialRedrawDisabled=YES;
objj_msgSend(_1f,"startWork");
if(!screenRenderObjectsCache[objj_msgSend(_21,"hash")]){
objj_msgSend(_1f,"cacheScreen:",_21);
}
objj_msgSend(_1f,"setScreenRenderObject:",screenRenderObjectsCache[objj_msgSend(screen,"hash")]);
objj_msgSend(_1f,"windowSizeChanged");
objj_msgSend(_1f,"stopWorkAndLayout:redraw:",YES,NO);
partialRedrawDisabled=NO;
objj_msgSend(view,"setNeedsDisplay:",YES);
objj_msgSend(handles,"removeAllObjects");
objj_msgSend(handles,"addObjectsFromArray:",objj_msgSend(screenRenderObject,"handles"));
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:","GDScreenChangedNotificationName",nil);
}
}),new objj_method(sel_getUid("screen"),function(_22,_23){
with(_22){
return screen;
}
}),new objj_method(sel_getUid("windowSizeChanged"),function(_24,_25){
with(_24){
if(view==nil){
return;
}
var _26=objj_msgSend(screenRenderObject,"bounds").size;
var _27=objj_msgSend(objj_msgSend(view,"enclosingScrollView"),"contentSize");
var _28=CGSizeMake(MAX(_26.width,_27.width),MAX(_26.height,_27.height));
if(objj_msgSend(screenRenderObject,"horizontalResizing")==GDFlexResizing){
_28.width=_27.width;
}
if(objj_msgSend(screenRenderObject,"verticalResizing")==GDFlexResizing){
_28.height=_27.height;
}
objj_msgSend(ueberRenderObject,"setBounds:",CGRectMake(0,0,_28.width,_28.height));
objj_msgSend(view,"setFrame:",objj_msgSend(ueberRenderObject,"bounds"));
}
}),new objj_method(sel_getUid("visitCompositeFigure:"),function(_29,_2a,_2b){
with(_29){
}
}),new objj_method(sel_getUid("visitWidgetInstanceCell:"),function(_2c,_2d,_2e){
with(_2c){
var _2f;
if(objj_msgSend(_2e,"isTableCell")||objj_msgSend(_2e,"isTableRow")){
return;
}else{
if(objj_msgSend(_2e,"isTable")){
_2f=objj_msgSend(GDTableRenderObject,"renderObjectForFigure:screenChangeManager:",_2e,_2c);
}else{
if(objj_msgSend(_2e,"cellType")==GDCircleCellType){
_2f=objj_msgSend(GDCircleCellRenderObject,"renderObjectForFigure:screenChangeManager:",_2e,_2c);
}else{
if(objj_msgSend(_2e,"cellType")==GDTriangleCellType){
_2f=objj_msgSend(GDTriangleCellRenderObject,"renderObjectForFigure:screenChangeManager:",_2e,_2c);
}else{
_2f=objj_msgSend(GDCellRenderObject,"renderObjectForFigure:screenChangeManager:",_2e,_2c);
}
}
}
}
var _30=objj_msgSend(_2e,"container");
var _31=objj_msgSend(_2c,"renderObjectForFigure:",_30);
var _32=objj_msgSend(objj_msgSend(_30,"orderedComponents"),"indexOfObject:",_2e);
objj_msgSend(_31,"insertComponent:atIndex:",_2f,_32);
}
}),new objj_method(sel_getUid("renderObjectShouldDraw:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_35,"isDeepDrawingAboveAll");
return (drawingAboveAllMode&&_36)||(!drawingAboveAllMode&&!_36);
}
}),new objj_method(sel_getUid("drawAboveAllInRect:atScale:"),function(_37,_38,_39,_3a){
with(_37){
var _3b=GDGetCurrentContext();
var _3c=nil;
var _3d=objj_msgSend(objj_msgSend(screenRenderObject,"deepOrderedDrawingAboveAllComponents"),"objectEnumerator");
while((_3c=objj_msgSend(_3d,"nextObject"))!=nil){
CGContextSaveGState(_3b);
var _3e=objj_msgSend(_3c,"absoluteAffineTransform");
objj_msgSend(_3e,"concat");
objj_msgSend(_3e,"invert");
var _3f=CGRectMakeCopy(_39);
_3f.origin=objj_msgSend(_3e,"transformPoint:",_3f.origin);
objj_msgSend(_3c,"drawRect:atScale:",_3f,_3a);
CGContextRestoreGState(_3b);
}
}
}),new objj_method(sel_getUid("drawRect:"),function(_40,_41,_42){
with(_40){
var _43=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
setupTransparencyLayerFeature(_43);
updateGlobalCurrentContext();
var _44=CGSizeMake(1,1);
_42.size.width=fminf(10000,_42.size.width);
_42.size.height=fminf(10000,_42.size.height);
CGContextSaveGState(_43);
CGContextAddRect(_43,_42);
CGContextClip(_43);
objj_msgSend(ueberRenderObject,"drawRect:atScale:",_42,_44);
drawingAboveAllMode=YES;
objj_msgSend(_40,"drawAboveAllInRect:atScale:",_42,_44);
drawingAboveAllMode=NO;
var _45=nil;
var _46=objj_msgSend(handles,"objectEnumerator");
while((_45=objj_msgSend(_46,"nextObject"))!=nil){
objj_msgSend(_45,"drawRect:atScale:",_42,_44);
}
CGContextRestoreGState(_43);
}
}),new objj_method(sel_getUid("handleAtPoint:"),function(_47,_48,p){
with(_47){
for(var i=0;i<handles.length;i++){
var _49=handles[i];
if(objj_msgSend(_49,"handleAtPoint:",p)!=nil){
return _49;
}
}
return nil;
}
}),new objj_method(sel_getUid("renderObjectAtPoint:"),function(_4a,_4b,p){
with(_4a){
return objj_msgSend(screenRenderObject,"renderAtPoint:",p);
}
}),new objj_method(sel_getUid("allRenderObjectsAtPoint:"),function(_4c,_4d,p){
with(_4c){
return objj_msgSend(screenRenderObject,"allRenderObjectsAtPoint:",p);
}
}),new objj_method(sel_getUid("renderObjectForFigure:"),function(_4e,_4f,_50){
with(_4e){
return figureRenderObjectDictionary[_50];
}
}),new objj_method(sel_getUid("updateRenderObjectForWidgetInstance:loadValuesForState:"),function(_51,_52,_53,_54){
with(_51){
var _55=objj_msgSend(_53,"rootInstanceCell");
var _56=objj_msgSend(_51,"renderObjectForFigure:",_55);
if(objj_msgSend(_56,"currentState")==_54){
return;
}
objj_msgSend(_51,"startWork");
objj_msgSend(_56,"updateValuesToState:",_54);
objj_msgSend(_51,"stopWork");
}
}),new objj_method(sel_getUid("renderObjectNoteUpdateRect:"),function(_57,_58,_59){
with(_57){
if(partialRedrawDisabled){
return;
}
var r=objj_msgSend(_59,"globalDrawBounds");
if(isWorking){
objj_msgSend(_57,"addUpdateRect:",r);
}else{
objj_msgSend(view,"noteUpdateRect:",r);
}
}
}),new objj_method(sel_getUid("addUpdateRect:"),function(_5a,_5b,r){
with(_5a){
objj_msgSend(updateRects,"addObject:",r);
}
}),new objj_method(sel_getUid("unionOfUpdateRects"),function(_5c,_5d){
with(_5c){
if(objj_msgSend(updateRects,"isEmpty")){
return CGRectMake(0,0,0,0);
}
var _5e=objj_msgSend(updateRects,"firstObject");
var _5f=nil;
var _60=objj_msgSend(updateRects,"objectEnumerator");
while((_5f=objj_msgSend(_60,"nextObject"))!=nil){
_5e=CGRectUnion(_5e,_5f);
}
return _5e;
}
}),new objj_method(sel_getUid("deliverUpdateRects"),function(_61,_62){
with(_61){
var _63=objj_msgSend(_61,"unionOfUpdateRects");
objj_msgSend(updateRects,"removeAllObjects");
if(NSEqualRects(_63,NSZeroRect())){
return;
}
objj_msgSend(view,"noteUpdateRect:",_63);
}
}),new objj_method(sel_getUid("startWork"),function(_64,_65){
with(_64){
isWorking++;
}
}),new objj_method(sel_getUid("stopWorkAndLayout:redraw:"),function(_66,_67,_68,_69){
with(_66){
if(isWorking-1<=0){
if(_68){
objj_msgSend(_66,"layout");
}
if(_69){
objj_msgSend(_66,"deliverUpdateRects");
}
}
isWorking--;
if(isWorking<0){
isWorking=0;
}
}
}),new objj_method(sel_getUid("stopWork"),function(_6a,_6b){
with(_6a){
objj_msgSend(_6a,"stopWorkAndLayout:redraw:",YES,YES);
}
}),new objj_method(sel_getUid("layout"),function(_6c,_6d){
with(_6c){
if(layoutingDisabled==0){
objj_msgSend(_6c,"disableLayouting");
objj_msgSend(ueberRenderObject,"horizontalLayoutIfNeeded");
objj_msgSend(ueberRenderObject,"verticalLayoutIfNeeded");
objj_msgSend(_6c,"enableLayouting");
}
}
}),new objj_method(sel_getUid("disableLayouting"),function(_6e,_6f){
with(_6e){
layoutingDisabled++;
}
}),new objj_method(sel_getUid("enableLayouting"),function(_70,_71){
with(_70){
layoutingDisabled--;
if(layoutingDisabled<0){
layoutingDisabled=0;
}
}
}),new objj_method(sel_getUid("triggerLayout"),function(_72,_73){
with(_72){
if(!isWorking){
objj_msgSend(_72,"startWork");
objj_msgSend(_72,"stopWorkAndLayout:redraw:",YES,NO);
}
}
}),new objj_method(sel_getUid("renderObjectNeedsHorizontalLayout:"),function(_74,_75,_76){
with(_74){
objj_msgSend(_76,"setNeedsHorizontalLayout");
objj_msgSend(_74,"triggerLayout");
}
}),new objj_method(sel_getUid("renderObjectNeedsHorizontalCellLayout:"),function(_77,_78,_79){
with(_77){
objj_msgSend(_79,"setNeedsHorizontalCellLayout");
objj_msgSend(_77,"triggerLayout");
}
}),new objj_method(sel_getUid("renderObjectNeedsHorizontalContainerLayout:"),function(_7a,_7b,_7c){
with(_7a){
objj_msgSend(_7c,"setNeedsHorizontalContainerLayout");
objj_msgSend(_7a,"triggerLayout");
}
}),new objj_method(sel_getUid("renderObjectNeedsVerticalLayout:"),function(_7d,_7e,_7f){
with(_7d){
objj_msgSend(_7f,"setNeedsVerticalLayout");
objj_msgSend(_7d,"triggerLayout");
}
}),new objj_method(sel_getUid("renderObjectNeedsVerticalCellLayout:"),function(_80,_81,_82){
with(_80){
objj_msgSend(_82,"setNeedsVerticalCellLayout");
objj_msgSend(_80,"triggerLayout");
}
}),new objj_method(sel_getUid("renderObjectNeedsVerticalContainerLayout:"),function(_83,_84,_85){
with(_83){
objj_msgSend(_85,"setNeedsVerticalContainerLayout");
objj_msgSend(_83,"triggerLayout");
}
})]);
p;16;GDScreenHandle.jt;5473;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;GDRenderObject.ji;23;GDScreenChangeManager.ji;15;GDTrackHandle.ji;19;GDLayoutConstants.jt;5313;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDRenderObject.j",YES);
objj_executeFile("GDScreenChangeManager.j",YES);
objj_executeFile("GDTrackHandle.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
var _1=objj_allocateClassPair(GDTrackHandle,"GDScreenHandle"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("translateYBy"),new objj_ivar("translateXBy")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithOwner:keyPath:screenChangeManager:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDScreenHandle").super_class},"initWithOwner:keyPath:screenChangeManager:",_5,_6,_7);
if(_3==nil){
return nil;
}
translateYBy=0;
translateXBy=0;
return _3;
}
}),new objj_method(sel_getUid("finishTranslation:newSize:"),function(_8,_9,_a,_b){
with(_8){
objj_msgSend(screenChangeManager,"startWork");
var _c=CGRectMake(0,0,_b.width,_b.height);
objj_msgSend(owner,"setBounds:",_c);
objj_msgSend(screenChangeManager,"stopWork");
objj_msgSend(_8,"setTranslateXBy:",_a.x);
objj_msgSend(_8,"setTranslateYBy:",_a.y);
}
}),new objj_method(sel_getUid("setTranslateXBy:"),function(_d,_e,x){
with(_d){
translateXBy=x;
}
}),new objj_method(sel_getUid("setTranslateYBy:"),function(_f,_10,y){
with(_f){
translateYBy=y;
}
}),new objj_method(sel_getUid("translateXBy"),function(_11,_12){
with(_11){
return translateXBy;
}
}),new objj_method(sel_getUid("translateYBy"),function(_13,_14){
with(_13){
return translateYBy;
}
}),new objj_method(sel_getUid("drawRect:atScale:"),function(_15,_16,_17,_18){
with(_15){
currentScale=_18;
objj_msgSend(_15,"updateBounds");
objj_msgSend(_15,"updateHitZone");
}
}),new objj_method(sel_getUid("updateBounds"),function(_19,_1a){
with(_19){
var p=objj_msgSend(objj_msgSend(objj_msgSend(_19,"owner"),"absoluteAffineTransform"),"transformPoint:",objj_msgSend(objj_msgSend(_19,"owner"),"valueForKeyPath:",keyPath));
var _1b=20;
objj_msgSend(_19,"setBounds:",CGRectMake(p.x-_1b/2,p.y-_1b/2,_1b,_1b));
}
})]);
var _1=objj_allocateClassPair(GDScreenHandle,"GDBottomRightScreenHandle"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithOwner:keyPath:screenChangeManager:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("GDBottomRightScreenHandle").super_class},"initWithOwner:keyPath:screenChangeManager:",_1e,_1f,_20);
if(_1c==nil){
return nil;
}
cursor=objj_msgSend(objj_msgSend(CPCursor,"alloc"),"initWithCSSString:","nwse-resize");
return _1c;
}
}),new objj_method(sel_getUid("mouseDraggedToPoint:constrained:centered:originalBounds:guideCoordinator:"),function(_21,_22,p,_23,_24,_25,_26){
with(_21){
var _27=objj_msgSend(_21,"calculateTranslationForPoint:",p);
var _28=_27.x;
var _29=_27.y;
var _2a;
var _2b;
var _2c;
var _2d;
var _2e;
var _2f;
var _30=objj_msgSend(owner,"maximumWidth");
var _31=objj_msgSend(owner,"maximumHeight");
var _32=objj_msgSend(owner,"minimumWidth");
var _33=objj_msgSend(owner,"minimumHeight");
if(!_23&&!_24){
_2e=_25.size.width+_28;
_2f=_25.size.height+_29;
if(_30<_2e){
_2e=_30;
}
if(_32>_2e){
_2e=_32;
}
if(_31<_2f){
_2f=_31;
}
if(_33>_2f){
_2f=_33;
}
_2a=0;
_2b=0;
_2c=CGPointMake(_2a,_2b);
_2d=CGSizeMake(_2e,_2f);
objj_msgSend(_21,"finishTranslation:newSize:",_2c,_2d);
return;
}
if(_23&&_24){
_2e=_25.size.width+(2*_28);
if(_2e>_30){
_2e=_30;
}
if(_2e<_32){
_2e=_32;
}
_2f=(NSHeight(_25)/NSWidth(_25))*_2e;
if(_2f>_31){
_2f=_31;
_2e=(NSWidth(_25)/NSHeight(_25))*_2f;
}
if(_2f<_33){
_2f=_33;
_2e=(NSWidth(_25)/NSHeight(_25))*_2f;
}
if(_29>floorf((_2f-_25.size.height)/2)){
_2f=_25.size.width+(2*_29);
if(_2f>_31){
_2f=_31;
}
if(_2f<_33){
_2f=_33;
}
_2e=(NSWidth(_25)/NSHeight(_25))*_2f;
if(_2e>_30){
_2e=_30;
_2f=(NSHeight(_25)/NSWidth(_25))*_2e;
}
if(_2e<_32){
_2e=_32;
_2f=(NSHeight(_25)/NSWidth(_25))*_2e;
}
}
_2a=floorf((_25.size.width-_2e)/2);
_2b=floorf((_25.size.height-_2f)/2);
_2c=CGPointMake(_2a,_2b);
_2d=CGSizeMake(_2e,_2f);
objj_msgSend(_21,"finishTranslation:newSize:",_2c,_2d);
return;
}
if(_23){
_2e=_25.size.width+_28;
if(_2e>_30){
_2e=_30;
}
if(_2e<_32){
_2e=_32;
}
_2f=(NSHeight(_25)/NSWidth(_25))*_2e;
if(_2f>_31){
_2f=_31;
_2e=(NSWidth(_25)/NSHeight(_25))*_2f;
}
if(_2f<_33){
_2f=_33;
_2e=(NSWidth(_25)/NSHeight(_25))*_2f;
}
if(_29>_2f-_25.size.height){
_2f=_25.size.height+_29;
if(_2f>_31){
_2f=_31;
}
if(_2f<_33){
_2f=_33;
}
_2e=(NSWidth(_25)/NSHeight(_25))*_2f;
if(_2e>_30){
_2e=_30;
_2f=(NSHeight(_25)/NSWidth(_25))*_2e;
}
if(_2e<_32){
_2e=_32;
_2f=(NSHeight(_25)/NSWidth(_25))*_2e;
}
}
_2a=0;
_2b=0;
_2c=CGPointMake(_2a,_2b);
_2d=CGSizeMake(_2e,_2f);
objj_msgSend(_21,"finishTranslation:newSize:",_2c,_2d);
return;
}
if(_24){
_2e=_25.size.width+(2*_28);
_2f=_25.size.height+(2*_29);
if(_30<_2e){
_2e=_30;
}
if(_31<_2f){
_2f=_31;
}
if(_32>_2e){
_2e=_32;
}
if(_33>_2f){
_2f=_33;
}
_2a=floorf((_25.size.width-_2e)/2);
_2b=floorf((_25.size.height-_2f)/2);
_2c=CGPointMake(_2a,_2b);
_2d=CGSizeMake(_2e,_2f);
objj_msgSend(_21,"finishTranslation:newSize:",_2c,_2d);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("trackHandleOn:screenChangeManager:"),function(_34,_35,_36,_37){
with(_34){
return objj_msgSend(_34,"trackHandleOn:keyPath:screenChangeManager:",_36,"bottomRight",_37);
}
})]);
p;22;GDScreenRenderObject.jt;1976;@STATIC;1.0;i;20;GDCellRenderObject.ji;16;GDScreenHandle.jt;1911;
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDScreenHandle.j",YES);
var _1=objj_allocateClassPair(GDCellRenderObject,"GDScreenRenderObject"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("handles"),function(_3,_4){
with(_3){
var _5=objj_msgSend(GDBottomRightScreenHandle,"trackHandleOn:screenChangeManager:",_3,screenChangeManager);
return objj_msgSend(CPArray,"arrayWithObject:",_5);
}
}),new objj_method(sel_getUid("drawingAboveAllRenderObjectAtPoint:withBlock:"),function(_6,_7,p,_8){
with(_6){
var _9=nil;
var _a=nil;
var _b=objj_msgSend(_6,"deepOrderedDrawingAboveAllComponents");
var _c=objj_msgSend(_b,"reverseObjectEnumerator");
while((_a=objj_msgSend(_c,"nextObject"))!=nil){
var _d=objj_msgSend(_a,"absoluteAffineTransform");
objj_msgSend(_d,"invert");
var _e=objj_msgSend(_d,"transformPoint:",p);
_9=_8(_a,_e);
if(_9!=nil){
break;
}
}
return _9;
}
}),new objj_method(sel_getUid("renderObjectAtPoint:"),function(_f,_10,p){
with(_f){
var _11=function(_12,p){
return objj_msgSend(_12,"renderObjectAtPoint:",p);
};
var f=objj_msgSend(_f,"drawingAboveAllRenderObjectAtPoint:withBlock:",p,_11);
return f!=nil?f:objj_msgSendSuper({receiver:_f,super_class:objj_getClass("GDScreenRenderObject").super_class},"renderObjectAtPoint:",p);
}
}),new objj_method(sel_getUid("allRenderObjectsAtPoint:"),function(_13,_14,p){
with(_13){
var _15=function(_16,p){
return objj_msgSend(_16,"allRenderObjectsAtPoint:",p);
};
var _17=objj_msgSend(_13,"drawingAboveAllRenderObjectAtPoint:withBlock:",p,_15);
var _18=objj_msgSendSuper({receiver:_13,super_class:objj_getClass("GDScreenRenderObject").super_class},"allRenderObjectsAtPoint:",p);
var all=objj_msgSend(CPMutableArray,"array");
if(_17!=nil){
objj_msgSend(all,"addObjectsFromArray:",_17);
}
if(_18!=nil){
objj_msgSend(all,"addObjectsFromArray:",_18);
}
return objj_msgSend(all,"count")>0?all:nil;
}
})]);
p;9;GDState.jt;1526;@STATIC;1.0;i;15;GDModelObject.jt;1487;
objj_executeFile("GDModelObject.j",YES);
GDNormalStateType=0;
GDMouseOverStateType=1;
GDDisabledStateType=2;
GDPressedStateType=3;
GDCustomStateType=100;
GDStateDictionary={};
var _1=objj_allocateClassPair(GDModelObject,"GDState"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("identifier"),new objj_ivar("type")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("identifier"),function(_8,_9){
with(_8){
return identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_a,_b,_c){
with(_a){
identifier=_c;
}
}),new objj_method(sel_getUid("type"),function(_d,_e){
with(_d){
return type;
}
}),new objj_method(sel_getUid("setType:"),function(_f,_10,_11){
with(_f){
type=_11;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_12,_13,_14){
with(_12){
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("GDState").super_class},"initWithCoder:",_14);
if(_12==nil){
return nil;
}
name=objj_msgSend(_14,"decodeObjectForKey:","name");
type=objj_msgSend(_14,"decodeIntForKey:","type");
identifier=objj_msgSend(_14,"decodeObjectForKey:","identifier");
GDStateDictionary[identifier]=_12;
return _12;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("objectWithIdentifier:"),function(_15,_16,_17){
with(_15){
return GDStateDictionary[_17];
}
})]);
p;19;GDTableCellHandle.jt;184;@STATIC;1.0;i;15;GDTrackHandle.jt;146;
objj_executeFile("GDTrackHandle.j",YES);
var _1=objj_allocateClassPair(GDTrackHandle,"GDTableCellHandle"),_2=_1.isa;
objj_registerClassPair(_1);
p;25;GDTableCellRenderObject.jt;17413;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;20;GDCellRenderObject.ji;24;GDTableRowRenderObject.ji;27;GDTableColumnRenderObject.ji;21;GDTableRenderObject.ji;15;GDTrackHandle.ji;19;GDLayoutConstants.ji;19;GDTableCellHandle.ji;16;GDLayoutPolicy.ji;25;GDVerticalLayoutAdaptor.ji;27;GDHorizontalLayoutAdaptor.jt;17082;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDTableRowRenderObject.j",YES);
objj_executeFile("GDTableColumnRenderObject.j",YES);
objj_executeFile("GDTableRenderObject.j",YES);
objj_executeFile("GDTrackHandle.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("GDTableCellHandle.j",YES);
objj_executeFile("GDLayoutPolicy.j",YES);
objj_executeFile("GDVerticalLayoutAdaptor.j",YES);
objj_executeFile("GDHorizontalLayoutAdaptor.j",YES);
var _1=objj_allocateClassPair(GDCellRenderObject,"GDTableCellRenderObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("column"),new objj_ivar("row")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("setRow:"),function(_3,_4,_5){
with(_3){
row=_5;
}
}),new objj_method(sel_getUid("setColumn:"),function(_6,_7,_8){
with(_6){
column=_8;
}
}),new objj_method(sel_getUid("column"),function(_9,_a){
with(_9){
return column;
}
}),new objj_method(sel_getUid("row"),function(_b,_c){
with(_b){
return row;
}
}),new objj_method(sel_getUid("table"),function(_d,_e){
with(_d){
return objj_msgSend(row,"container");
}
}),new objj_method(sel_getUid("position"),function(_f,_10){
with(_f){
return objj_msgSend(objj_msgSend(_f,"table"),"positionOfCell:",_f);
}
}),new objj_method(sel_getUid("approximatePosition"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(_11,"table"),"approximatePositionOfCell:",_11);
}
}),new objj_method(sel_getUid("container"),function(_13,_14){
with(_13){
return row;
}
}),new objj_method(sel_getUid("bounds"),function(_15,_16){
with(_15){
return CGRectMake(objj_msgSend(column,"x"),objj_msgSend(row,"y"),objj_msgSend(column,"width"),objj_msgSend(row,"height"));
}
}),new objj_method(sel_getUid("setBounds:"),function(_17,_18,r){
with(_17){
objj_msgSend(row,"setY:",r.origin.y);
objj_msgSend(row,"setHeight:",r.size.height);
objj_msgSend(column,"setWidth:",r.size.width);
objj_msgSend(column,"setX:",r.origin.x);
}
}),new objj_method(sel_getUid("innerBounds"),function(_19,_1a){
with(_19){
var _1b=objj_msgSend(_19,"bounds");
var rx=_1b.origin.x+objj_msgSend(_19,"borderLeftWidth")+objj_msgSend(_19,"paddingLeft");
var ry=_1b.origin.y+objj_msgSend(_19,"borderTopWidth")+objj_msgSend(_19,"paddingTop");
var _1c=_1b.size.width-objj_msgSend(_19,"borderLeftWidth")-objj_msgSend(_19,"paddingLeft")-objj_msgSend(_19,"paddingRight");
var _1d=_1b.size.height-objj_msgSend(_19,"borderTopWidth")-objj_msgSend(_19,"paddingTop")-objj_msgSend(_19,"paddingBottom");
if((objj_msgSend(_19,"approximatePosition")&GDTableCellPositionOuterRight)>0){
_1c-=objj_msgSend(_19,"borderRightWidth");
}
if((objj_msgSend(_19,"approximatePosition")&GDTableCellPositionOuterBottom)>0){
_1d-=objj_msgSend(_19,"borderBottomWidth");
}
return CGRectMake(rx,ry,_1c,_1d);
}
}),new objj_method(sel_getUid("globalInnerBounds"),function(_1e,_1f){
with(_1e){
var _20=objj_msgSend(_1e,"globalBounds");
var rx=_20.origin.x+objj_msgSend(_1e,"borderLeftWidth")+objj_msgSend(_1e,"paddingLeft");
var ry=_20.origin.y+objj_msgSend(_1e,"borderTopWidth")+objj_msgSend(_1e,"paddingTop");
var _21=_20.size.width-objj_msgSend(_1e,"borderLeftWidth")-objj_msgSend(_1e,"paddingLeft")-objj_msgSend(_1e,"paddingRight");
var _22=_20.size.height-objj_msgSend(_1e,"borderTopWidth")-objj_msgSend(_1e,"paddingTop")-objj_msgSend(_1e,"paddingBottom");
if((objj_msgSend(_1e,"approximatePosition")&GDTableCellPositionOuterRight)>0){
_21-=objj_msgSend(_1e,"borderRightWidth");
}
if((objj_msgSend(_1e,"approximatePosition")&GDTableCellPositionOuterBottom)>0){
_22-=objj_msgSend(_1e,"borderBottomWidth");
}
return CGRectMake(rx,ry,_21,_22);
}
}),new objj_method(sel_getUid("width"),function(_23,_24){
with(_23){
return objj_msgSend(column,"width");
}
}),new objj_method(sel_getUid("height"),function(_25,_26){
with(_25){
return objj_msgSend(row,"height");
}
}),new objj_method(sel_getUid("x"),function(_27,_28){
with(_27){
return objj_msgSend(column,"x");
}
}),new objj_method(sel_getUid("y"),function(_29,_2a){
with(_29){
return objj_msgSend(row,"y");
}
}),new objj_method(sel_getUid("setWidth:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(objj_msgSend(_2b,"column"),"setWidth:",_2d);
}
}),new objj_method(sel_getUid("setHeight:"),function(_2e,_2f,_30){
with(_2e){
objj_msgSend(objj_msgSend(_2e,"row"),"setHeight:",_30);
}
}),new objj_method(sel_getUid("setX:"),function(_31,_32,_33){
with(_31){
objj_msgSend(objj_msgSend(_31,"column"),"setX:",_33);
}
}),new objj_method(sel_getUid("setY:"),function(_34,_35,_36){
with(_34){
objj_msgSend(objj_msgSend(_34,"row"),"setY:",_36);
}
}),new objj_method(sel_getUid("isDraggable"),function(_37,_38){
with(_37){
return NO;
}
}),new objj_method(sel_getUid("setVerticalResizing:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(objj_msgSend(_39,"table"),"setResizingModeOfRow:toValue:",objj_msgSend(_39,"row"),_3b);
}
}),new objj_method(sel_getUid("verticalResizing"),function(_3c,_3d){
with(_3c){
return objj_msgSend(objj_msgSend(_3c,"row"),"resizingMode");
}
}),new objj_method(sel_getUid("setHorizontalResizing:"),function(_3e,_3f,_40){
with(_3e){
objj_msgSend(objj_msgSend(_3e,"table"),"setResizingModeOfColumn:toValue:",objj_msgSend(_3e,"column"),_40);
}
}),new objj_method(sel_getUid("horizontalResizing"),function(_41,_42){
with(_41){
return objj_msgSend(objj_msgSend(_41,"column"),"resizingMode");
}
}),new objj_method(sel_getUid("flexWidthPercentage"),function(_43,_44){
with(_43){
return objj_msgSend(objj_msgSend(_43,"column"),"flexWidthPercentage");
}
}),new objj_method(sel_getUid("setFlexWidthPercentage:"),function(_45,_46,_47){
with(_45){
objj_msgSend(objj_msgSend(_45,"table"),"setFlexWidthPercentageOfColumn:toValue:",objj_msgSend(_45,"column"),_47);
}
}),new objj_method(sel_getUid("flexHeightPercentage"),function(_48,_49){
with(_48){
return objj_msgSend(objj_msgSend(_48,"row"),"flexHeightPercentage");
}
}),new objj_method(sel_getUid("setFlexHeightPercentage:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSend(objj_msgSend(_4a,"table"),"setFlexHeightPercentageOfRow:toValue:",objj_msgSend(_4a,"row"),_4c);
}
}),new objj_method(sel_getUid("minimumWidth"),function(_4d,_4e){
with(_4d){
return objj_msgSend(objj_msgSend(_4d,"column"),"minimumWidth");
}
}),new objj_method(sel_getUid("setMinimumWidth:"),function(_4f,_50,w){
with(_4f){
objj_msgSend(objj_msgSend(_4f,"column"),"setMinimumWidth:",w);
}
}),new objj_method(sel_getUid("maximumWidth"),function(_51,_52){
with(_51){
return objj_msgSend(objj_msgSend(_51,"column"),"maximumWidth");
}
}),new objj_method(sel_getUid("setMaximumWidth:"),function(_53,_54,w){
with(_53){
objj_msgSend(objj_msgSend(_53,"column"),"setMaximumWidth:",w);
}
}),new objj_method(sel_getUid("minimumHeight"),function(_55,_56){
with(_55){
return objj_msgSend(objj_msgSend(_55,"row"),"minimumHeight");
}
}),new objj_method(sel_getUid("setMinimumHeight:"),function(_57,_58,w){
with(_57){
objj_msgSend(objj_msgSend(_57,"row"),"setMinimumHeight:",w);
}
}),new objj_method(sel_getUid("maximumHeight"),function(_59,_5a){
with(_59){
return objj_msgSend(objj_msgSend(_59,"row"),"maximumHeight");
}
}),new objj_method(sel_getUid("setMaximumHeight:"),function(_5b,_5c,w){
with(_5b){
objj_msgSend(objj_msgSend(_5b,"row"),"setMaximumHeight:",w);
}
}),new objj_method(sel_getUid("originalBorderLeftWidth"),function(_5d,_5e){
with(_5d){
return borderLeftWidth;
}
}),new objj_method(sel_getUid("originalBorderRightWidth"),function(_5f,_60){
with(_5f){
return borderRightWidth;
}
}),new objj_method(sel_getUid("originalBorderTopWidth"),function(_61,_62){
with(_61){
return borderTopWidth;
}
}),new objj_method(sel_getUid("originalBorderBottomWidth"),function(_63,_64){
with(_63){
return borderBottomWidth;
}
}),new objj_method(sel_getUid("borderBottomWidth"),function(_65,_66){
with(_65){
var _67=objj_msgSend(_65,"tableCellRenderObjectBelow");
if(_67!=nil){
return objj_msgSend(_67,"borderTopWidth");
}else{
return objj_msgSendSuper({receiver:_65,super_class:objj_getClass("GDTableCellRenderObject").super_class},"borderBottomWidth");
}
}
}),new objj_method(sel_getUid("setBorderBottomWidth:"),function(_68,_69,_6a){
with(_68){
var _6b=objj_msgSend(_68,"tableCellRenderObjectBelow");
if(_6b!=nil){
objj_msgSend(_6b,"setBorderTopWidth:",_6a);
}else{
objj_msgSendSuper({receiver:_68,super_class:objj_getClass("GDTableCellRenderObject").super_class},"setBorderBottomWidth:",_6a);
}
}
}),new objj_method(sel_getUid("borderRightWidth"),function(_6c,_6d){
with(_6c){
var _6e=objj_msgSend(_6c,"tableCellRenderObjectToTheRight");
if(_6e!=nil){
return objj_msgSend(_6e,"borderLeftWidth");
}else{
return objj_msgSendSuper({receiver:_6c,super_class:objj_getClass("GDTableCellRenderObject").super_class},"borderRightWidth");
}
}
}),new objj_method(sel_getUid("setBorderRightWidth:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(_6f,"tableCellRenderObjectToTheRight");
if(_72!=nil){
objj_msgSend(_72,"setBorderLeftWidth:",_71);
}else{
objj_msgSendSuper({receiver:_6f,super_class:objj_getClass("GDTableCellRenderObject").super_class},"setBorderRightWidth:",_71);
}
}
}),new objj_method(sel_getUid("borderBottomColor"),function(_73,_74){
with(_73){
var _75=objj_msgSend(_73,"tableCellRenderObjectBelow");
if(_75!=nil){
return objj_msgSend(_75,"borderTopColor");
}else{
return objj_msgSendSuper({receiver:_73,super_class:objj_getClass("GDTableCellRenderObject").super_class},"borderBottomColor");
}
}
}),new objj_method(sel_getUid("setBorderBottomColor:"),function(_76,_77,_78){
with(_76){
var _79=objj_msgSend(_76,"tableCellRenderObjectBelow");
if(_79!=nil){
objj_msgSend(_79,"setBorderTopColor:",_78);
}else{
objj_msgSendSuper({receiver:_76,super_class:objj_getClass("GDTableCellRenderObject").super_class},"setBorderBottomColor:",_78);
}
}
}),new objj_method(sel_getUid("borderRightColor"),function(_7a,_7b){
with(_7a){
var _7c=objj_msgSend(_7a,"tableCellRenderObjectToTheRight");
if(_7c!=nil){
return objj_msgSend(_7c,"borderLeftColor");
}else{
return objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("GDTableCellRenderObject").super_class},"borderRightColor");
}
}
}),new objj_method(sel_getUid("setBorderRightColor:"),function(_7d,_7e,_7f){
with(_7d){
var _80=objj_msgSend(_7d,"tableCellRenderObjectToTheRight");
if(_80!=nil){
objj_msgSend(_80,"setBorderLeftColor:",_7f);
}else{
objj_msgSendSuper({receiver:_7d,super_class:objj_getClass("GDTableCellRenderObject").super_class},"setBorderRightColor:",_7f);
}
}
}),new objj_method(sel_getUid("tableCellRenderObjectAbove"),function(_81,_82){
with(_81){
var pos=objj_msgSend(_81,"position");
if(pos=nil||pos.y==0){
return nil;
}
return objj_msgSend(objj_msgSend(_81,"table"),"cellAtPosition:",CGPointMake(pos.x,pos.y-1));
}
}),new objj_method(sel_getUid("tableCellRenderObjectBelow"),function(_83,_84){
with(_83){
var pos=objj_msgSend(_83,"position");
if(pos==nil||pos.y==objj_msgSend(objj_msgSend(objj_msgSend(_83,"column"),"orderedComponents"),"count")-1){
return nil;
}
return objj_msgSend(objj_msgSend(_83,"table"),"cellAtPosition:",CGPointMake(pos.x,pos.y+1));
}
}),new objj_method(sel_getUid("tableCellRenderObjectToTheRight"),function(_85,_86){
with(_85){
var pos=objj_msgSend(_85,"position");
if(pos==nil||pos.x==objj_msgSend(objj_msgSend(objj_msgSend(_85,"row"),"orderedComponents"),"count")-1){
return nil;
}
return objj_msgSend(objj_msgSend(_85,"table"),"cellAtPosition:",CGPointMake(pos.x+1,pos.y));
}
}),new objj_method(sel_getUid("tableCellRenderObjectToTheLeft"),function(_87,_88){
with(_87){
var pos=objj_msgSend(_87,"position");
if(pos==nil||pos.x==0){
return nil;
}
return objj_msgSend(objj_msgSend(_87,"table"),"cellAtPosition:",CGPointMake(pos.x-1,pos.y));
}
}),new objj_method(sel_getUid("defaultVerticalSquareBorderStart"),function(_89,_8a){
with(_89){
return objj_msgSend(_89,"borderTopWidth");
}
}),new objj_method(sel_getUid("defaultVerticalSquareBorderEnd"),function(_8b,_8c){
with(_8b){
if((objj_msgSend(_8b,"approximatePosition")&GDTableCellPositionOuterBottom)!=GDTableCellPositionOuterBottom){
return objj_msgSend(_8b,"height");
}else{
return objj_msgSendSuper({receiver:_8b,super_class:objj_getClass("GDTableCellRenderObject").super_class},"defaultVerticalSquareBorderEnd");
}
}
}),new objj_method(sel_getUid("drawRegularBorder"),function(_8d,_8e){
with(_8d){
}
}),new objj_method(sel_getUid("drawGradientBorder"),function(_8f,_90){
with(_8f){
}
}),new objj_method(sel_getUid("drawBorder"),function(_91,_92){
with(_91){
}
}),new objj_method(sel_getUid("borderOverlap"),function(_93,_94){
with(_93){
return 0;
}
}),new objj_method(sel_getUid("handles"),function(_95,_96){
with(_95){
if(!objj_msgSend(_95,"isSelectable")&&objj_msgSend(_95,"visibility")!=GDVisibilityVisible){
return objj_msgSend(CPArray,"array");
}
var _97=objj_msgSend(CPArray,"array");
var _98=objj_msgSend(_95,"tableCellRenderObjectToTheLeft");
if(objj_msgSend(_95,"horizontalResizing")==GDFlexResizing&&_98!=nil&&objj_msgSend(_98,"horizontalResizing")==GDFixResizing){
objj_msgSend(_97,"addObject:",objj_msgSend(GDTableCellRightHandle,"trackHandleOn:screenChangeManager:",_98,screenChangeManager));
}else{
objj_msgSend(_97,"addObject:",objj_msgSend(GDTableCellLeftHandle,"trackHandleOn:screenChangeManager:",_95,screenChangeManager));
}
var _99=objj_msgSend(_95,"tableCellRenderObjectToTheRight");
if(objj_msgSend(_95,"horizontalResizing")==GDFlexResizing&&_99!=nil&&objj_msgSend(_99,"horizontalResizing")==GDFixResizing){
objj_msgSend(_97,"addObject:",objj_msgSend(GDTableCellLeftHandle,"trackHandleOn:screenChangeManager:",_99,screenChangeManager));
}else{
objj_msgSend(_97,"addObject:",objj_msgSend(GDTableCellRightHandle,"trackHandleOn:screenChangeManager:",_95,screenChangeManager));
}
var top=objj_msgSend(_95,"tableCellRenderObjectAbove");
if(objj_msgSend(_95,"verticalResizing")==GDFlexResizing&&top!=nil&&objj_msgSend(top,"verticalResizing")==GDFixResizing){
objj_msgSend(_97,"addObject:",objj_msgSend(GDTableCellBottomHandle,"trackHandleOn:screenChangeManager:",top,screenChangeManager));
}else{
objj_msgSend(_97,"addObject:",objj_msgSend(GDTableCellTopHandle,"trackHandleOn:screenChangeManager:",_95,screenChangeManager));
}
var _9a=objj_msgSend(_95,"tableCellRenderObjectBelow");
if(objj_msgSend(_95,"verticalResizing")==GDFlexResizing&&_9a!=nil&&objj_msgSend(_9a,"verticalResizing")==GDFixResizing){
objj_msgSend(_97,"addObject:",objj_msgSend(GDTableCellTopHandle,"trackHandleOn:screenChangeManager:",_9a,screenChangeManager));
}else{
objj_msgSend(_97,"addObject:",objj_msgSend(GDTableCellBottomHandle,"trackHandleOn:screenChangeManager:",_95,screenChangeManager));
}
return _97;
}
}),new objj_method(sel_getUid("isTableCell"),function(_9b,_9c){
with(_9b){
return YES;
}
}),new objj_method(sel_getUid("cornerRadiusTopLeft"),function(_9d,_9e){
with(_9d){
if((objj_msgSend(_9d,"approximatePosition")&GDTableCellPositionTopLeft)!=GDTableCellPositionTopLeft){
return cornerRadiusTopLeft;
}else{
var _9f=objj_msgSend(_9d,"table");
var _a0=objj_msgSend(_9f,"cornerRadiusTopLeft")-fminf(objj_msgSend(_9f,"borderLeftWidth"),objj_msgSend(_9f,"borderTopWidth"));
return _a0>0?_a0:0;
}
}
}),new objj_method(sel_getUid("cornerRadiusTopRight"),function(_a1,_a2){
with(_a1){
if((objj_msgSend(_a1,"approximatePosition")&GDTableCellPositionTopRight)!=GDTableCellPositionTopRight){
return cornerRadiusTopRight;
}else{
var _a3=objj_msgSend(_a1,"table");
var _a4=objj_msgSend(_a3,"cornerRadiusTopRight")-fminf(objj_msgSend(_a3,"borderRightWidth"),objj_msgSend(_a3,"borderTopWidth"));
return _a4>0?_a4:0;
}
}
}),new objj_method(sel_getUid("cornerRadiusBottomLeft"),function(_a5,_a6){
with(_a5){
if((objj_msgSend(_a5,"approximatePosition")&GDTableCellPositionBottomLeft)!=GDTableCellPositionBottomLeft){
return cornerRadiusBottomLeft;
}else{
var _a7=objj_msgSend(_a5,"table");
var _a8=objj_msgSend(_a7,"cornerRadiusBottomLeft")-fminf(objj_msgSend(_a7,"borderLeftWidth"),objj_msgSend(_a7,"borderBottomWidth"));
return _a8>0?_a8:0;
}
}
}),new objj_method(sel_getUid("cornerRadiusBottomRight"),function(_a9,_aa){
with(_a9){
if((objj_msgSend(_a9,"approximatePosition")&GDTableCellPositionBottomRight)!=GDTableCellPositionBottomRight){
return cornerRadiusBottomRight;
}else{
var _ab=objj_msgSend(_a9,"table");
var _ac=objj_msgSend(_ab,"cornerRadiusBottomRight")-fminf(objj_msgSend(_ab,"borderRightWidth"),objj_msgSend(_ab,"borderBottomWidth"));
return _ac>0?_ac:0;
}
}
}),new objj_method(sel_getUid("setCornerRadiusTopLeft:"),function(_ad,_ae,_af){
with(_ad){
}
}),new objj_method(sel_getUid("setCornerRadiusTopRight:"),function(_b0,_b1,_b2){
with(_b0){
}
}),new objj_method(sel_getUid("setCornerRadiusBottomLeft:"),function(_b3,_b4,_b5){
with(_b3){
}
}),new objj_method(sel_getUid("setCornerRadiusBottomRight:"),function(_b6,_b7,_b8){
with(_b6){
}
}),new objj_method(sel_getUid("createHorizontalLayoutAdaptor"),function(_b9,_ba){
with(_b9){
return objj_msgSend(GDHorizontalTableCellLayoutAdaptor,"adaptorForRenderObject:",_b9);
}
}),new objj_method(sel_getUid("createVerticalLayoutAdaptor"),function(_bb,_bc){
with(_bb){
return objj_msgSend(GDVerticalTableCellLayoutAdaptor,"adaptorForRenderObject:",_bb);
}
})]);
p;27;GDTableColumnRenderObject.jt;5243;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;37;GDTableStructureElementRenderObject.ji;19;GDLayoutConstants.ji;27;GDHorizontalLayoutAdaptor.ji;25;GDVerticalLayoutAdaptor.jt;5048;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDTableStructureElementRenderObject.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("GDHorizontalLayoutAdaptor.j",YES);
objj_executeFile("GDVerticalLayoutAdaptor.j",YES);
var _1=objj_allocateClassPair(GDTableStructureElementRenderObject,"GDTableColumnRenderObject"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("populateTableCells"),function(_3,_4){
with(_3){
var _5=objj_msgSend(_3,"figure");
var _6=nil;
var it=objj_msgSend(objj_msgSend(_5,"orderedComponents"),"objectEnumerator");
while(_6=objj_msgSend(it,"nextObject")){
var _7=objj_msgSend(screenChangeManager,"renderObjectForFigure:",_6);
objj_msgSend(_7,"setColumn:",_3);
objj_msgSend(orderedComponents,"addObject:",_7);
}
}
}),new objj_method(sel_getUid("table"),function(_8,_9){
with(_8){
return container;
}
}),new objj_method(sel_getUid("previousColumn"),function(_a,_b){
with(_a){
var _c=objj_msgSend(_a,"index");
if(_c==0){
return nil;
}
return objj_msgSend(objj_msgSend(objj_msgSend(_a,"table"),"orderedColumns"),"objectAtIndex:",_c-1);
}
}),new objj_method(sel_getUid("nextColumn"),function(_d,_e){
with(_d){
var _f=objj_msgSend(_d,"index");
var _10=objj_msgSend(objj_msgSend(_d,"table"),"orderedColumns");
if(_f==objj_msgSend(_10,"count")-1){
return nil;
}
return objj_msgSend(_10,"objectAtIndex:",_f+1);
}
}),new objj_method(sel_getUid("bounds"),function(_11,_12){
with(_11){
return CGRectMake(objj_msgSend(_11,"x"),0,objj_msgSend(_11,"width"),objj_msgSend(container,"height"));
}
}),new objj_method(sel_getUid("width"),function(_13,_14){
with(_13){
return objj_msgSend(_13,"size");
}
}),new objj_method(sel_getUid("setWidth:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"setSize:",_17);
}
}),new objj_method(sel_getUid("x"),function(_18,_19){
with(_18){
return objj_msgSend(_18,"origin");
}
}),new objj_method(sel_getUid("setX:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"setOrigin:",_1c);
}
}),new objj_method(sel_getUid("minimumWidth"),function(_1d,_1e){
with(_1d){
return objj_msgSend(_1d,"minimumSize");
}
}),new objj_method(sel_getUid("setMinimumWidth:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_1f,"setMinimumSize:",_21);
}
}),new objj_method(sel_getUid("maximumWidth"),function(_22,_23){
with(_22){
return objj_msgSend(_22,"maximumSize");
}
}),new objj_method(sel_getUid("setMaximumWidth:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"setMaximumSize:",_26);
}
}),new objj_method(sel_getUid("minimumHeightResizable"),function(_27,_28){
with(_27){
var _29=0;
for(var i=0;i<objj_msgSend(objj_msgSend(_27,"orderedComponents"),"count");i++){
var _2a=objj_msgSend(objj_msgSend(_27,"orderedComponents"),"objectAtIndex:",i);
if(objj_msgSend(_2a,"verticalResizing")!=GDFlexResizing){
_29+=objj_msgSend(_2a,"height");
}else{
_29+=objj_msgSend(_2a,"minimumHeight");
}
}
_29+=objj_msgSend(objj_msgSend(_27,"table"),"borderTopWidth");
_29+=objj_msgSend(objj_msgSend(_27,"table"),"borderBottomWidth");
return _29;
}
}),new objj_method(sel_getUid("maximumHeightResizable"),function(_2b,_2c){
with(_2b){
var _2d=0;
for(var i=0;i<objj_msgSend(objj_msgSend(_2b,"orderedComponents"),"count");i++){
var _2e=objj_msgSend(objj_msgSend(_2b,"orderedComponents"),"objectAtIndex:",i);
if(objj_msgSend(_2e,"verticalResizing")!=GDFlexResizing){
_2d+=objj_msgSend(_2e,"height");
}else{
_2d+=objj_msgSend(_2e,"maximumHeight");
}
}
_2d+=objj_msgSend(objj_msgSend(_2b,"table"),"borderTopWidth");
_2d+=objj_msgSend(objj_msgSend(_2b,"table"),"borderBottomWidth");
return _2d;
}
}),new objj_method(sel_getUid("horizontalResizing"),function(_2f,_30){
with(_2f){
return resizingMode;
}
}),new objj_method(sel_getUid("setHorizontalResizing:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_31,"setResizingMode:",_33);
}
}),new objj_method(sel_getUid("flexWidthPercentage"),function(_34,_35){
with(_34){
return flexPercentage;
}
}),new objj_method(sel_getUid("createHorizontalLayoutAdaptor"),function(_36,_37){
with(_36){
return objj_msgSend(GDTableColumnLayoutAdaptor,"adaptorForRenderObject:",_36);
}
}),new objj_method(sel_getUid("createVerticalLayoutAdaptor"),function(_38,_39){
with(_38){
return nil;
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(_3a,_3b){
with(_3a){
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalLayout:",_3a);
}
}),new objj_method(sel_getUid("setNeedsCellLayout"),function(_3c,_3d){
with(_3c){
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalCellLayout:",_3c);
}
}),new objj_method(sel_getUid("setNeedsContainerLayout"),function(_3e,_3f){
with(_3e){
objj_msgSend(screenChangeManager,"renderObjectNeedsHorizontalContainerLayout:",_3e);
}
}),new objj_method(sel_getUid("setNeedsComponentsLayout"),function(_40,_41){
with(_40){
for(var i=0;i<objj_msgSend(objj_msgSend(_40,"orderedComponents"),"count");i++){
objj_msgSend(objj_msgSend(objj_msgSend(_40,"orderedComponents"),"objectAtIndex:",i),"setNeedsHorizontalLayoutCellOnly:",YES);
}
}
})]);
p;18;GDTableConstants.jt;302;@STATIC;1.0;t;284;
GDTableCellPositionInner=0,GDTableCellPositionOuterLeft=2,GDTableCellPositionOuterRight=4,GDTableCellPositionOuterTop=8,GDTableCellPositionOuterBottom=16,GDTableCellPositionTopLeft=10,GDTableCellPositionTopRight=12,GDTableCellPositionBottomLeft=18,GDTableCellPositionBottomRight=20;
p;24;GDTableLayouterElement.jt;1601;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;1534;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
var _1=objj_allocateClassPair(CPObject,"GDTableLayouterElement"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("element"),new objj_ivar("flexPercentage")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithElement:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSend(_3,"init");
if(_3==nil){
return nil;
}
element=objj_msgSend(_5,"retain");
flexPercentage=objj_msgSend(element,"flexPercentage");
return _3;
}
}),new objj_method(sel_getUid("maximumSize"),function(_6,_7){
with(_6){
return objj_msgSend(element,"maximumSize");
}
}),new objj_method(sel_getUid("minimumSize"),function(_8,_9){
with(_8){
return objj_msgSend(element,"minimumSize");
}
}),new objj_method(sel_getUid("size"),function(_a,_b){
with(_a){
return objj_msgSend(element,"size");
}
}),new objj_method(sel_getUid("setSize:"),function(_c,_d,_e){
with(_c){
objj_msgSend(element,"setSize:",_e);
}
}),new objj_method(sel_getUid("resizingMode"),function(_f,_10){
with(_f){
return objj_msgSend(element,"resizingMode");
}
}),new objj_method(sel_getUid("flexPercentage"),function(_11,_12){
with(_11){
return flexPercentage;
}
}),new objj_method(sel_getUid("setFlexPercentage:"),function(_13,_14,_15){
with(_13){
flexPercentage=_15;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("tableLayouterElementFor:"),function(_16,_17,_18){
with(_16){
return objj_msgSend(objj_msgSend(objj_msgSend(_16,"alloc"),"initWithElement:",_18),"autorelease");
}
})]);
p;21;GDTableLayoutPolicy.jt;3698;@STATIC;1.0;i;16;GDLayoutPolicy.jI;15;AppKit/AppKit.jt;3638;
objj_executeFile("GDLayoutPolicy.j",YES);
objj_executeFile("AppKit/AppKit.j",NO);
var _1=objj_allocateClassPair(GDLayoutPolicy,"GDTableLayoutPolicy"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("resizeAndLayoutIntrinsicComponentsOfAdaptor:"),function(_3,_4,_5){
with(_3){
var _6=nil;
var _7=objj_msgSend(objj_msgSend(_5,"components"),"objectEnumerator");
while(_6=objj_msgSend(_7,"nextObject")){
if(objj_msgSend(_6,"resizingMode")==GDIntrinsicResizing){
var _8=nil;
var _9=objj_msgSend(objj_msgSend(_6,"components"),"objectEnumerator");
while(_8=objj_msgSend(_9,"nextObject")){
var _a=nil;
var _b=objj_msgSend(objj_msgSend(_8,"components"),"objectEnumerator");
while(_a=objj_msgSend(_b,"nextObject")){
if(objj_msgSend(_a,"resizingMode")==GDIntrinsicResizing){
objj_msgSend(_a,"layoutIfNeeded");
}
}
}
var _c=0;
_8=nil;
_9=objj_msgSend(objj_msgSend(_6,"components"),"objectEnumerator");
while(_8=objj_msgSend(_9,"nextObject")){
_c=fmaxf(_c,objj_msgSend(_8,"calculateContentSizeViaLayoutPolicy")+objj_msgSend(_8,"borderSize")+objj_msgSend(_8,"padding"));
}
objj_msgSend(_6,"setSize:",_c);
objj_msgSend(_6,"layoutIfNeeded");
}
}
}
}),new objj_method(sel_getUid("resizeComponentsOfAdaptor:"),function(_d,_e,_f){
with(_d){
var _10=objj_msgSend(CPMutableArray,"array");
var _11=objj_msgSend(_f,"innerSize");
var _12=nil;
var _13=objj_msgSend(objj_msgSend(_f,"components"),"objectEnumerator");
while(_12=objj_msgSend(_13,"nextObject")){
if(objj_msgSend(_12,"resizingMode")!=GDFlexResizing){
_11-=objj_msgSend(_12,"size");
}else{
objj_msgSend(_10,"addObject:",_12);
}
}
if(objj_msgSend(_10,"isEmpty")){
return;
}
objj_msgSend(_d,"distributeFlexSize:onFlexAdaptors:",_11,_10);
}
}),new objj_method(sel_getUid("alignComponentsOfAdaptor:"),function(_14,_15,_16){
with(_14){
var _17=0;
var _18=nil;
var _19=objj_msgSend(objj_msgSend(_16,"components"),"objectEnumerator");
while(_18=objj_msgSend(_19,"nextObject")){
objj_msgSend(_18,"setOrigin:",_17);
_17+=objj_msgSend(_18,"size");
}
}
}),new objj_method(sel_getUid("adjustMinMaxSizeOfAdaptor:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=0;
var _1e=0;
var _1f=nil;
var _20=objj_msgSend(objj_msgSend(_1c,"components"),"objectEnumerator");
while(_1f=objj_msgSend(_20,"nextObject")){
if(objj_msgSend(_1f,"resizingMode")==GDFlexResizing){
_1d+=objj_msgSend(_1f,"minimumSize");
_1e+=objj_msgSend(_1f,"maximumSize");
}else{
_1d+=objj_msgSend(_1f,"size");
_1e+=objj_msgSend(_1f,"size");
}
}
_1d+=objj_msgSend(_1c,"borderSize");
_1e+=objj_msgSend(_1c,"borderSize");
objj_msgSend(_1c,"setMinimumSize:",_1d);
objj_msgSend(_1c,"setMaximumSize:",_1e);
}
}),new objj_method(sel_getUid("resizeAdaptor:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_21,"adjustMinMaxSizeOfAdaptor:",_23);
var _24=0;
var _25=nil;
var _26=objj_msgSend(objj_msgSend(_23,"components"),"objectEnumerator");
while(_25=objj_msgSend(_26,"nextObject")){
_24+=objj_msgSend(_25,"size");
}
if(_24!=objj_msgSend(_23,"innerSize")){
objj_msgSend(_23,"setInnerSize:",_24);
}
}
}),new objj_method(sel_getUid("layoutAdaptor:"),function(_27,_28,_29){
with(_27){
if(!objj_msgSend(_29,"isTable")){
return;
}
objj_msgSend(_29,"layoutComponentsWithResizingMode:",GDFixResizing);
objj_msgSend(_27,"resizeAndLayoutIntrinsicComponentsOfAdaptor:",_29);
objj_msgSend(_27,"resizeComponentsOfAdaptor:",_29);
objj_msgSend(_27,"resizeAdaptor:",_29);
objj_msgSend(_29,"layoutComponentsWithResizingMode:",GDFlexResizing);
objj_msgSend(_27,"alignComponentsOfAdaptor:",_29);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("layoutPolicyCode"),function(_2a,_2b){
with(_2a){
return GDTableLayoutPolicyCode;
}
})]);
p;21;GDTableRenderObject.jt;17118;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;20;GDCellRenderObject.ji;18;GDTableConstants.ji;18;NSArrayAdditions.ji;21;GDTableRenderObject.ji;24;GDTableRowRenderObject.ji;25;GDTableCellRenderObject.ji;27;GDTableColumnRenderObject.ji;23;GDScreenChangeManager.ji;24;GDTableLayouterElement.ji;19;GDLayoutConstants.ji;21;GDTableLayoutPolicy.ji;23;GDRenderObjectPainter.ji;35;GDWidgetInstanceCellTableCategory.ji;25;GDVerticalLayoutAdaptor.ji;27;GDHorizontalLayoutAdaptor.jt;16625;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDTableConstants.j",YES);
objj_executeFile("NSArrayAdditions.j",YES);
objj_executeFile("GDTableRenderObject.j",YES);
objj_executeFile("GDTableRowRenderObject.j",YES);
objj_executeFile("GDTableCellRenderObject.j",YES);
objj_executeFile("GDTableColumnRenderObject.j",YES);
objj_executeFile("GDScreenChangeManager.j",YES);
objj_executeFile("GDTableLayouterElement.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("GDTableLayoutPolicy.j",YES);
objj_executeFile("GDRenderObjectPainter.j",YES);
objj_executeFile("GDWidgetInstanceCellTableCategory.j",YES);
objj_executeFile("GDVerticalLayoutAdaptor.j",YES);
objj_executeFile("GDHorizontalLayoutAdaptor.j",YES);
var _1=objj_allocateClassPair(GDCellRenderObject,"GDTableRenderObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("orderedRows"),new objj_ivar("orderedColumns"),new objj_ivar("tableNeedsUpdate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("calculatedMaximumSize"),function(_3,_4){
with(_3){
var _5=0;
var _6=0;
var it=objj_msgSend(orderedColumns,"objectEnumerator");
var _7=nil;
while(_7=objj_msgSend(it,"nextObject")){
if(objj_msgSend(_7,"resizingMode")==GDFixResizing||objj_msgSend(_7,"resizingMode")==GDIntrinsicResizing){
_5+=objj_msgSend(_7,"size");
}else{
_5+=objj_msgSend(_7,"maximumSize");
}
}
it=objj_msgSend(orderedRows,"objectEnumerator");
while(_7=objj_msgSend(it,"nextObject")){
if(objj_msgSend(_7,"resizingMode")==GDFixResizing||objj_msgSend(_7,"resizingMode")==GDIntrinsicResizing){
_6+=objj_msgSend(_7,"size");
}else{
_6+=objj_msgSend(_7,"maximumSize");
}
}
return CGSizeMake(_5,_6);
}
}),new objj_method(sel_getUid("calculatedMinimumSize"),function(_8,_9){
with(_8){
var _a=0;
var _b=0;
var it=objj_msgSend(orderedColumns,"objectEnumerator");
var _c=nil;
while(_c=objj_msgSend(it,"nextObject")){
if(objj_msgSend(_c,"resizingMode")==GDFixResizing||objj_msgSend(_c,"resizingMode")==GDIntrinsicResizing){
_a+=objj_msgSend(_c,"size");
}else{
_a+=objj_msgSend(_c,"minimumSize");
}
}
it=objj_msgSend(orderedRows,"objectEnumerator");
while(_c=objj_msgSend(it,"nextObject")){
if(objj_msgSend(_c,"resizingMode")==GDFixResizing||objj_msgSend(_c,"resizingMode")==GDIntrinsicResizing){
_b+=objj_msgSend(_c,"size");
}else{
_b+=objj_msgSend(_c,"minimumSize");
}
}
return CGSizeMake(_a,_b);
}
}),new objj_method(sel_getUid("adjustBounds"),function(_d,_e){
with(_d){
var _f=objj_msgSend(_d,"calculatedMinimumSize");
var _10=objj_msgSend(_d,"calculatedMaximumSize");
_f.width+=objj_msgSend(_d,"borderLeftWidth");
_f.width+=objj_msgSend(_d,"borderRightWidth");
_f.height+=objj_msgSend(_d,"borderTopWidth");
_f.height+=objj_msgSend(_d,"borderBottomWidth");
_10.width+=objj_msgSend(_d,"borderLeftWidth");
_10.width+=objj_msgSend(_d,"borderRightWidth");
_10.height+=objj_msgSend(_d,"borderTopWidth");
_10.height+=objj_msgSend(_d,"borderBottomWidth");
if(objj_msgSend(_d,"width")<_f.width){
objj_msgSend(_d,"setWidth:",_f.width);
}else{
if(objj_msgSend(_d,"width")>_10.width){
objj_msgSend(_d,"setWidth:",_10.width);
}
}
if(objj_msgSend(_d,"height")<_f.height){
objj_msgSend(_d,"setHeight:",_f.height);
}else{
if(objj_msgSend(_d,"height")>_10.height){
objj_msgSend(_d,"setHeight:",_10.height);
}
}
}
}),new objj_method(sel_getUid("rowForFigure:"),function(_11,_12,row){
with(_11){
return objj_msgSend(GDTableRowRenderObject,"renderObjectForFigure:screenChangeManager:table:",row,screenChangeManager,_11);
}
}),new objj_method(sel_getUid("columnForFigure:"),function(_13,_14,_15){
with(_13){
return objj_msgSend(GDTableColumnRenderObject,"renderObjectForFigure:screenChangeManager:table:",_15,screenChangeManager,_13);
}
}),new objj_method(sel_getUid("initializeRenderObjects"),function(_16,_17){
with(_16){
var _18=objj_msgSend(_16,"figure");
var _19=nil;
var it=objj_msgSend(objj_msgSend(_18,"orderedRows"),"objectEnumerator");
while(_19=objj_msgSend(it,"nextObject")){
var _1a=objj_msgSend(_16,"rowForFigure:",_19);
objj_msgSend(orderedRows,"addObject:",_1a);
objj_msgSend(_1a,"setContainer:",_16);
}
var _1b=nil;
it=objj_msgSend(objj_msgSend(_18,"orderedColumns"),"objectEnumerator");
while(_1b=objj_msgSend(it,"nextObject")){
var _1a=objj_msgSend(_16,"columnForFigure:",_1b);
objj_msgSend(_1a,"setContainer:",_16);
objj_msgSend(_1a,"populateTableCells");
objj_msgSend(orderedColumns,"addObject:",_1a);
}
}
}),new objj_method(sel_getUid("initWithFigure:screenChangeManager:"),function(_1c,_1d,_1e,_1f){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("GDTableRenderObject").super_class},"initWithFigure:screenChangeManager:",_1e,_1f);
if(_1c==nil){
return nil;
}
orderedRows=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
orderedColumns=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
objj_msgSend(_1c,"setLayoutPolicyCode:",GDTableLayoutPolicyCode);
if(_1e!=nil){
objj_msgSend(_1c,"initializeRenderObjects");
}else{
return nil;
}
objj_msgSend(_1c,"adjustBounds");
objj_msgSend(_1c,"setNeedsVerticalLayout");
objj_msgSend(_1c,"setNeedsHorizontalLayout");
return _1c;
}
}),new objj_method(sel_getUid("updateValuesToState:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_20,"usePropertiesInState:",_22);
layoutPolicy=objj_msgSend(GDLayoutPolicy,"layoutPolicyWithCode:",GDTableLayoutPolicyCode);
var row=nil;
var it=objj_msgSend(orderedRows,"objectEnumerator");
while(row=objj_msgSend(it,"nextObject")){
objj_msgSend(row,"updateValuesToState:",_22);
objj_msgSend(objj_msgSend(row,"orderedComponents"),"makeObjectsPerformSelector:withObject:",sel_getUid("updateValuesToState:"),_22);
}
objj_msgSend(orderedColumns,"makeObjectsPerformSelector:withObject:",sel_getUid("updateValuesToState:"),_22);
objj_msgSend(_20,"setNeedsHorizontalLayout");
objj_msgSend(_20,"setNeedsVerticalLayout");
}
}),new objj_method(sel_getUid("orderedColumns"),function(_23,_24){
with(_23){
return orderedColumns;
}
}),new objj_method(sel_getUid("orderedRows"),function(_25,_26){
with(_25){
return orderedRows;
}
}),new objj_method(sel_getUid("orderedComponents"),function(_27,_28){
with(_27){
return objj_msgSend(_27,"orderedRows");
}
}),new objj_method(sel_getUid("rowAtIndex:"),function(_29,_2a,_2b){
with(_29){
return objj_msgSend(orderedRows,"objectAtIndex:",_2b);
}
}),new objj_method(sel_getUid("orderedDisplayComponents"),function(_2c,_2d){
with(_2c){
return objj_msgSend(_2c,"orderedComponents");
}
}),new objj_method(sel_getUid("orderedDrawingComponents"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_2e,"orderedComponents");
}
}),new objj_method(sel_getUid("checkOrderedDisplayComponentsCache"),function(_30,_31){
with(_30){
}
}),new objj_method(sel_getUid("checkOrderedDrawingComponentsCache"),function(_32,_33){
with(_32){
}
}),new objj_method(sel_getUid("deepDrawingAboveAllComponents"),function(_34,_35){
with(_34){
if(objj_msgSend(_34,"isDrawingAboveAll")){
return objj_msgSend(CPArray,"arrayWithObject:",_34);
}
var _36=objj_msgSend(CPMutableArray,"array");
var row=nil;
var _37=objj_msgSend(objj_msgSend(_34,"orderedRows"),"objectEnumerator");
while((row=objj_msgSend(_37,"nextObject"))!=nil){
var _38=nil;
var _39=objj_msgSend(objj_msgSend(row,"orderedComponents"),"objectEnumerator");
while((_38=objj_msgSend(_39,"nextObject"))!=nil){
objj_msgSend(_36,"addObjectsFromArray:",objj_msgSend(_38,"deepDrawingAboveAllComponents"));
}
}
return _36;
}
}),new objj_method(sel_getUid("columnAtIndex:"),function(_3a,_3b,_3c){
with(_3a){
return objj_msgSend(orderedColumns,"objectAtIndex:",_3c);
}
}),new objj_method(sel_getUid("cellAtPosition:"),function(_3d,_3e,p){
with(_3d){
var row=objj_msgSend(orderedRows,"objectAtIndex:",p.y);
return objj_msgSend(objj_msgSend(row,"orderedComponents"),"objectAtIndex:",p.x);
}
}),new objj_method(sel_getUid("positionOfCell:"),function(_3f,_40,_41){
with(_3f){
var y=objj_msgSend(orderedRows,"indexOfObject:",objj_msgSend(_41,"row"));
var x=objj_msgSend(objj_msgSend(objj_msgSend(_41,"row"),"orderedComponents"),"indexOfObject:",_41);
var _42=CGPointMake(x,y);
return _42;
}
}),new objj_method(sel_getUid("approximatePositionOfCell:"),function(_43,_44,_45){
with(_43){
var _46=GDTableCellPositionInner;
var x=objj_msgSend(objj_msgSend(objj_msgSend(_45,"row"),"orderedComponents"),"indexOfObject:",_45);
var y=objj_msgSend(orderedRows,"indexOfObject:",objj_msgSend(_45,"row"));
if(x==0){
_46=(_46|GDTableCellPositionOuterLeft);
}
if(y==0){
_46=(_46|GDTableCellPositionOuterTop);
}
if(x==objj_msgSend(_43,"columnCount")-1){
_46=(_46|GDTableCellPositionOuterRight);
}
if(y==objj_msgSend(_43,"rowCount")-1){
_46=(_46|GDTableCellPositionOuterBottom);
}
return _46;
}
}),new objj_method(sel_getUid("renderObjectForFigure:"),function(_47,_48,f){
with(_47){
var _49=objj_msgSend(_47,"figure");
if(objj_msgSend(f,"isEqual:",_49)){
return _47;
}
var _4a=nil;
var _4b=objj_msgSend(orderedColumns,"objectEnumerator");
while(_4a=objj_msgSend(_4b,"nextObject")){
if(objj_msgSend(objj_msgSend(_4a,"figure"),"isEqual:",f)){
return _4a;
}
}
var _4c=nil;
var _4d=objj_msgSend(orderedRows,"objectEnumerator");
while(_4c=objj_msgSend(_4d,"nextObject")){
var _4e=objj_msgSend(_4c,"renderObjectForFigure:",f);
if(_4e!=nil){
return _4e;
}
}
return nil;
}
}),new objj_method(sel_getUid("allRenderObjectsAtPoint:"),function(_4f,_50,p){
with(_4f){
if(objj_msgSend(_4f,"visibility")==GDVisibilityCollapsed){
return objj_msgSend(CPArray,"array");
}
var _51=objj_msgSend(CPMutableArray,"array");
if(NSPointInRect(p,objj_msgSend(_4f,"bounds"))){
objj_msgSend(_51,"addObject:",_4f);
}
if(objj_msgSend(_4f,"isContentClipped")&&!NSPointInRect(p,objj_msgSend(_4f,"bounds"))){
return _51;
}
var _52=objj_msgSend(_4f,"affineTransform");
objj_msgSend(_52,"invert");
var _53=objj_msgSend(_52,"transformPoint:",p);
var _54=objj_msgSend(_4f,"searchEnumerator");
var _55=nil;
while((_55=objj_msgSend(_54,"nextObject"))!=nil){
var _56=objj_msgSend(_55,"allRenderObjectsAtPoint:",_53);
if(objj_msgSend(_56,"count")>0){
objj_msgSend(_51,"addObjectsFromArray:",_56);
return _51;
}
}
return _51;
}
}),new objj_method(sel_getUid("renderObjectAtPoint:"),function(_57,_58,p){
with(_57){
var _59=objj_msgSend(_57,"affineTransform");
objj_msgSend(_59,"invert");
var _5a=objj_msgSend(_59,"transformPoint:",p);
var _5b=nil;
var _5c=objj_msgSend(_57,"searchEnumerator");
while(_5b=objj_msgSend(_5c,"nextObject")){
var f=nil;
if((f=objj_msgSend(_5b,"renderObjectAtPoint:",_5a))!=nil){
return f;
}
}
return objj_msgSendSuper({receiver:_57,super_class:objj_getClass("GDTableRenderObject").super_class},"renderObjectAtPoint:",p);
}
}),new objj_method(sel_getUid("rowCount"),function(_5d,_5e){
with(_5d){
return objj_msgSend(orderedRows,"count");
}
}),new objj_method(sel_getUid("columnCount"),function(_5f,_60){
with(_5f){
return objj_msgSend(orderedColumns,"count");
}
}),new objj_method(sel_getUid("drawBorderForCells"),function(_61,_62){
with(_61){
var _63=GDGetCurrentContext();
CGContextSaveGState(_63);
objj_msgSend(objj_msgSend(_61,"affineBorderTransform"),"concat");
var row=nil;
var _64=objj_msgSend(orderedRows,"objectEnumerator");
while((row=objj_msgSend(_64,"nextObject"))!=nil){
var _65=objj_msgSend(row,"orderedComponents");
var _66=objj_msgSend(_65,"objectAtIndex:",objj_msgSend(_65,"count")-1);
CGContextSaveGState(_63);
objj_msgSend(objj_msgSend(_66,"affineOriginTransform"),"concat");
objj_msgSend(_66,"drawRightBorderWithPhase:",0);
CGContextRestoreGState(_63);
for(var i=0;i<=objj_msgSend(_65,"count")-1;i++){
_66=objj_msgSend(_65,"objectAtIndex:",i);
CGContextSaveGState(_63);
objj_msgSend(objj_msgSend(_66,"affineOriginTransform"),"concat");
objj_msgSend(_66,"drawLeftBorderWithPhase:",0);
objj_msgSend(_66,"drawTopBorderWithPhase:",0);
CGContextRestoreGState(_63);
}
}
var _67=objj_msgSend(objj_msgSend(orderedRows,"objectAtIndex:",objj_msgSend(orderedRows,"count")-1),"orderedComponents");
for(var i=0;i<objj_msgSend(_67,"count");i++){
var _66=objj_msgSend(_67,"objectAtIndex:",i);
CGContextSaveGState(_63);
objj_msgSend(objj_msgSend(_66,"affineOriginTransform"),"concat");
objj_msgSend(_66,"drawBottomBorderWithPhase:",0);
CGContextRestoreGState(_63);
}
CGContextRestoreGState(_63);
}
}),new objj_method(sel_getUid("drawContentInRect:atScale:"),function(_68,_69,_6a,_6b){
with(_68){
objj_msgSendSuper({receiver:_68,super_class:objj_getClass("GDTableRenderObject").super_class},"drawContentInRect:atScale:",_6a,_6b);
objj_msgSend(_68,"drawBorderForCells");
}
}),new objj_method(sel_getUid("isTable"),function(_6c,_6d){
with(_6c){
return YES;
}
}),new objj_method(sel_getUid("removeObjectFromOrderedRowsAtIndex:"),function(_6e,_6f,_70){
with(_6e){
var _71=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_70);
objj_msgSend(_6e,"willChange:valuesAtIndexes:forKey:",NSKeyValueChangeRemoval,_71,"orderedRows");
objj_msgSend(orderedRows,"removeObjectAtIndex:",_70);
objj_msgSend(_6e,"didChange:valuesAtIndexes:forKey:",NSKeyValueChangeRemoval,_71,"orderedRows");
var _72=nil;
var _73=objj_msgSend(orderedColumns,"objectEnumerator");
while(_72=objj_msgSend(_73,"nextObject")){
objj_msgSend(objj_msgSend(_72,"mutableArrayValueForKey:","orderedComponents"),"removeObjectAtIndex:",_70);
}
}
}),new objj_method(sel_getUid("insertObject:inOrderedRowsAtIndex:"),function(_74,_75,row,_76){
with(_74){
objj_msgSend(row,"setContainer:",_74);
var i=0;
for(;i<objj_msgSend(orderedColumns,"count");i++){
var _77=objj_msgSend(objj_msgSend(row,"orderedComponents"),"objectAtIndex:",i);
var _78=objj_msgSend(objj_msgSend(_74,"orderedColumns"),"objectAtIndex:",i);
objj_msgSend(objj_msgSend(_78,"mutableArrayValueForKey:","orderedComponents"),"insertObject:atIndex:",_77,_76);
objj_msgSend(_77,"setColumn:",_78);
objj_msgSend(_77,"setRow:",row);
}
objj_msgSend(_74,"willChange:valuesAtIndexes:forKey:",NSKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_76),"orderedRows");
objj_msgSend(orderedRows,"insertObject:atIndex:",row,_76);
objj_msgSend(_74,"willChange:valuesAtIndexes:forKey:",NSKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_76),"orderedRows");
}
}),new objj_method(sel_getUid("removeObjectFromOrderedColumnsAtIndex:"),function(_79,_7a,_7b){
with(_79){
var _7c=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_7b);
objj_msgSend(_79,"willChange:valuesAtIndexes:forKey:",NSKeyValueChangeRemoval,_7c,"orderedColumns");
objj_msgSend(orderedColumns,"removeObjectAtIndex:",_7b);
objj_msgSend(_79,"didChange:valuesAtIndexes:forKey:",NSKeyValueChangeRemoval,_7c,"orderedColumns");
var _7d=nil;
var _7e=objj_msgSend(orderedRows,"objectEnumerator");
while(_7d=objj_msgSend(_7e,"nextObject")){
objj_msgSend(objj_msgSend(_7d,"mutableArrayValueForKey:","orderedComponents"),"removeObjectAtIndex:",_7b);
}
}
}),new objj_method(sel_getUid("insertObject:inOrderedColumnsAtIndex:"),function(_7f,_80,_81,_82){
with(_7f){
for(var i=0;i<objj_msgSend(orderedRows,"count");i++){
var _83=objj_msgSend(objj_msgSend(_81,"orderedComponents"),"objectAtIndex:",i);
var row=objj_msgSend(objj_msgSend(_7f,"orderedRows"),"objectAtIndex:",i);
objj_msgSend(objj_msgSend(row,"mutableArrayValueForKey:","orderedComponents"),"insertObject:atIndex:",_83,_82);
objj_msgSend(_83,"setColumn:",_81);
objj_msgSend(_83,"setRow:",row);
}
objj_msgSend(_7f,"willChange:valuesAtIndexes:forKey:",NSKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_82),"orderedColumns");
objj_msgSend(orderedColumns,"insertObject:atIndex:",_81,_82);
objj_msgSend(_7f,"willChange:valuesAtIndexes:forKey:",NSKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_82),"orderedColumns");
}
}),new objj_method(sel_getUid("setFlexWidthPercentageOfColumn:toValue:"),function(_84,_85,_86,_87){
with(_84){
if(_87>100){
_87=100;
}
if(_87<0){
_87=0;
}
objj_msgSend(_86,"setFlexPercentage:",_87);
}
}),new objj_method(sel_getUid("setFlexHeightPercentageOfRow:toValue:"),function(_88,_89,row,_8a){
with(_88){
if(_8a>100){
_8a=100;
}
if(_8a<0){
_8a=0;
}
objj_msgSend(row,"setFlexPercentage:",_8a);
}
}),new objj_method(sel_getUid("setResizingModeOfColumn:toValue:"),function(_8b,_8c,_8d,_8e){
with(_8b){
objj_msgSend(_8d,"setResizingMode:",_8e);
}
}),new objj_method(sel_getUid("setResizingModeOfRow:toValue:"),function(_8f,_90,row,_91){
with(_8f){
objj_msgSend(row,"setResizingMode:",_91);
}
}),new objj_method(sel_getUid("createHorizontalLayoutAdaptor"),function(_92,_93){
with(_92){
return objj_msgSend(GDHorizontalTableLayoutAdaptor,"adaptorForRenderObject:",_92);
}
}),new objj_method(sel_getUid("createVerticalLayoutAdaptor"),function(_94,_95){
with(_94){
return objj_msgSend(GDVerticalTableLayoutAdaptor,"adaptorForRenderObject:",_94);
}
})]);
p;24;GDTableRowRenderObject.jt;7089;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;37;GDTableStructureElementRenderObject.ji;19;GDLayoutConstants.ji;25;GDVerticalLayoutAdaptor.ji;27;GDHorizontalLayoutAdaptor.jt;6894;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDTableStructureElementRenderObject.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("GDVerticalLayoutAdaptor.j",YES);
objj_executeFile("GDHorizontalLayoutAdaptor.j",YES);
var _1=objj_allocateClassPair(GDTableStructureElementRenderObject,"GDTableRowRenderObject"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFigure:screenChangeManager:table:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDTableRowRenderObject").super_class},"initWithFigure:screenChangeManager:table:",_5,_6,_7);
if(_3==nil){
return nil;
}
var _8=nil;
var it=objj_msgSend(objj_msgSend(_5,"orderedComponents"),"objectEnumerator");
while(_8=objj_msgSend(it,"nextObject")){
var _9=objj_msgSend(GDTableCellRenderObject,"renderObjectForFigure:screenChangeManager:",_8,screenChangeManager);
objj_msgSend(orderedComponents,"addObject:",_9);
objj_msgSend(_9,"setRow:",_3);
}
return _3;
}
}),new objj_method(sel_getUid("bounds"),function(_a,_b){
with(_a){
return CGRectMake(0,objj_msgSend(_a,"y"),objj_msgSend(container,"width"),objj_msgSend(_a,"height"));
}
}),new objj_method(sel_getUid("visibility"),function(_c,_d){
with(_c){
return GDVisibilityVisible;
}
}),new objj_method(sel_getUid("height"),function(_e,_f){
with(_e){
return objj_msgSend(_e,"size");
}
}),new objj_method(sel_getUid("setHeight:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_10,"setSize:",_12);
}
}),new objj_method(sel_getUid("y"),function(_13,_14){
with(_13){
return objj_msgSend(_13,"origin");
}
}),new objj_method(sel_getUid("setY:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"setOrigin:",_17);
}
}),new objj_method(sel_getUid("verticalResizing"),function(_18,_19){
with(_18){
return resizingMode;
}
}),new objj_method(sel_getUid("setVerticalResizing:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"setResizingMode:",_1c);
}
}),new objj_method(sel_getUid("minimumHeight"),function(_1d,_1e){
with(_1d){
return objj_msgSend(_1d,"minimumSize");
}
}),new objj_method(sel_getUid("setMinimumHeight:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_1f,"setMinimumSize:",_21);
}
}),new objj_method(sel_getUid("maximumHeight"),function(_22,_23){
with(_22){
return objj_msgSend(_22,"maximumSize");
}
}),new objj_method(sel_getUid("setMaximumHeight:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"setMaximumSize:",_26);
}
}),new objj_method(sel_getUid("flexHeightPercentage"),function(_27,_28){
with(_27){
return flexPercentage;
}
}),new objj_method(sel_getUid("minimumWidthResizable"),function(_29,_2a){
with(_29){
var _2b=0;
for(var i=0;i<objj_msgSend(objj_msgSend(_29,"orderedComponents"),"count");i++){
var _2c=objj_msgSend(objj_msgSend(_29,"orderedComponents"),"objectAtIndex:",i);
if(objj_msgSend(_2c,"horizontalResizing")!=GDFlexResizing){
_2b+=objj_msgSend(_2c,"width");
}else{
_2b+=objj_msgSend(_2c,"minimumWidth");
}
}
_2b+=objj_msgSend(objj_msgSend(_29,"table"),"borderLeftWidth");
_2b+=objj_msgSend(objj_msgSend(_29,"table"),"borderRightWidth");
return _2b;
}
}),new objj_method(sel_getUid("maximumWidthResizable"),function(_2d,_2e){
with(_2d){
var _2f=0;
for(var i=0;i<objj_msgSend(objj_msgSend(_2d,"orderedComponents"),"count");i++){
var _30=objj_msgSend(objj_msgSend(_2d,"orderedComponents"),"objectAtIndex:",i);
if(objj_msgSend(_30,"horizontalResizing")!=GDFlexResizing){
_2f+=objj_msgSend(_30,"width");
}else{
_2f+=objj_msgSend(_30,"maximumWidth");
}
}
_2f+=objj_msgSend(objj_msgSend(_2d,"table"),"borderLeftWidth");
_2f+=objj_msgSend(objj_msgSend(_2d,"table"),"borderRightWidth");
return _2f;
}
}),new objj_method(sel_getUid("table"),function(_31,_32){
with(_31){
return objj_msgSend(_31,"container");
}
}),new objj_method(sel_getUid("previousRow"),function(_33,_34){
with(_33){
var _35=objj_msgSend(_33,"index");
if(_35==0){
return nil;
}
return objj_msgSend(objj_msgSend(objj_msgSend(_33,"table"),"orderedRows"),"objectAtIndex:",_35-1);
}
}),new objj_method(sel_getUid("nextRow"),function(_36,_37){
with(_36){
var _38=objj_msgSend(_36,"table");
var _39=objj_msgSend(_36,"index")+1;
if(_39<objj_msgSend(objj_msgSend(_38,"orderedRows"),"count")){
return objj_msgSend(objj_msgSend(_38,"orderedRows"),"objectAtIndex:",_39);
}
return nil;
}
}),new objj_method(sel_getUid("drawRect:atScale:"),function(_3a,_3b,_3c,_3d){
with(_3a){
var _3e=GDGetCurrentContext();
CGContextSaveGState(_3e);
objj_msgSend(objj_msgSend(_3a,"affineTransform"),"concat");
var _3f=nil;
var _40=objj_msgSend(objj_msgSend(_3a,"orderedComponents"),"objectEnumerator");
while(_3f=objj_msgSend(_40,"nextObject")){
objj_msgSend(_3f,"drawRect:atScale:",_3c,_3d);
}
CGContextRestoreGState(_3e);
}
}),new objj_method(sel_getUid("allRenderObjectsAtPoint:"),function(_41,_42,p){
with(_41){
var _43=objj_msgSend(CPMutableArray,"array");
if(!NSPointInRect(p,objj_msgSend(_41,"bounds"))){
return _43;
}
var _44=objj_msgSend(_41,"affineTransform");
objj_msgSend(_44,"invert");
var _45=objj_msgSend(_44,"transformPoint:",p);
var _46=objj_msgSend(objj_msgSend(_41,"orderedComponents"),"reverseObjectEnumerator");
var _47=nil;
while((_47=objj_msgSend(_46,"nextObject"))!=nil){
var _48=objj_msgSend(_47,"allRenderObjectsAtPoint:",_45);
if(objj_msgSend(_48,"count")>0){
objj_msgSend(_43,"addObjectsFromArray:",_48);
return _43;
}
}
return _43;
}
}),new objj_method(sel_getUid("renderObjectAtPoint:"),function(_49,_4a,p){
with(_49){
var _4b=objj_msgSend(_49,"affineTransform");
objj_msgSend(_4b,"invert");
var _4c=objj_msgSend(_4b,"transformPoint:",p);
var _4d=nil;
var it=objj_msgSend(orderedComponents,"reverseObjectEnumerator");
while(_4d=objj_msgSend(it,"nextObject")){
var f=nil;
if((f=objj_msgSend(_4d,"renderObjectAtPoint:",_4c))!=nil){
return f;
}
}
return nil;
}
}),new objj_method(sel_getUid("createHorizontalLayoutAdaptor"),function(_4e,_4f){
with(_4e){
return nil;
}
}),new objj_method(sel_getUid("createVerticalLayoutAdaptor"),function(_50,_51){
with(_50){
return objj_msgSend(GDTableRowLayoutAdaptor,"adaptorForRenderObject:",_50);
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(_52,_53){
with(_52){
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalLayout:",_52);
}
}),new objj_method(sel_getUid("setNeedsCellLayout"),function(_54,_55){
with(_54){
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalCellLayout:",_54);
}
}),new objj_method(sel_getUid("setNeedsContainerLayout"),function(_56,_57){
with(_56){
objj_msgSend(screenChangeManager,"renderObjectNeedsVerticalContainerLayout:",_56);
}
}),new objj_method(sel_getUid("setNeedsComponentsLayout"),function(_58,_59){
with(_58){
for(var i=0;i<objj_msgSend(objj_msgSend(_58,"orderedComponents"),"count");i++){
objj_msgSend(objj_msgSend(objj_msgSend(_58,"orderedComponents"),"objectAtIndex:",i),"setNeedsVerticalLayoutCellOnly:",YES);
}
}
})]);
p;37;GDTableStructureElementRenderObject.jt;9795;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;GDRenderObject.ji;19;GDLayoutConstants.ji;18;NSArrayAdditions.ji;17;GDLayoutAdaptor.ji;22;GDLayoutRenderObject.jt;9611;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDRenderObject.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("NSArrayAdditions.j",YES);
objj_executeFile("GDLayoutAdaptor.j",YES);
objj_executeFile("GDLayoutRenderObject.j",YES);
var _1=objj_allocateClassPair(GDLayoutRenderObject,"GDTableStructureElementRenderObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("flexPercentage"),new objj_ivar("maximumSize"),new objj_ivar("minimumSize"),new objj_ivar("resizingMode"),new objj_ivar("orderedComponents"),new objj_ivar("origin"),new objj_ivar("size")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFigure:screenChangeManager:table:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDTableStructureElementRenderObject").super_class},"initWithFigure:screenChangeManager:",_5,_6);
if(_3==nil){
return nil;
}
orderedComponents=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
var _8=objj_msgSend(objj_msgSend(_5,"table"),"activeState");
if(_5!=nil){
var _9=_5;
objj_msgSend(_3,"setMaximumSize:",objj_msgSend(_9,"maximumSizeInState:",_8));
objj_msgSend(_3,"setMinimumSize:",objj_msgSend(_9,"minimumSizeInState:",_8));
objj_msgSend(_3,"setSize:",objj_msgSend(_9,"sizeInState:",_8));
objj_msgSend(_3,"setOrigin:",objj_msgSend(_9,"originInState:",_8));
objj_msgSend(_3,"setResizingMode:",objj_msgSend(_9,"resizingModeInState:",_8));
objj_msgSend(_3,"setFlexPercentage:",objj_msgSend(_9,"flexPercentageInState:",_8));
}else{
size=0;
origin=0;
maximumSize=10000000;
minimumSize=0;
resizingMode=GDFlexResizing;
flexPercentage=100;
}
return _3;
}
}),new objj_method(sel_getUid("updateValuesToState:"),function(_a,_b,_c){
with(_a){
var _d=objj_msgSend(_a,"figure");
objj_msgSend(_a,"setMaximumSize:",objj_msgSend(_d,"maximumSizeInState:",_c));
objj_msgSend(_a,"setMinimumSize:",objj_msgSend(_d,"minimumSizeInState:",_c));
objj_msgSend(_a,"setSize:",objj_msgSend(_d,"sizeInState:",_c));
objj_msgSend(_a,"setResizingMode:",objj_msgSend(_d,"resizingModeInState:",_c));
objj_msgSend(_a,"setFlexPercentage:",objj_msgSend(_d,"flexPercentageInState:",_c));
objj_msgSend(_a,"setNeedsHorizontalLayout");
objj_msgSend(_a,"setNeedsVerticalLayout");
}
}),new objj_method(sel_getUid("updateFromFigure"),function(_e,_f){
with(_e){
}
}),new objj_method(sel_getUid("size"),function(_10,_11){
with(_10){
return size;
}
}),new objj_method(sel_getUid("drawBounds"),function(_12,_13){
with(_12){
var _14=objj_msgSend(_12,"bounds");
var _15=objj_msgSend(_12,"orderedComponents");
var _16=nil;
var _17=objj_msgSend(_15,"objectEnumerator");
var _18=objj_msgSend(_12,"affineTransform");
while((_16=objj_msgSend(_17,"nextObject"))!=nil){
var _19=objj_msgSend(_16,"drawBounds");
_19.origin=objj_msgSend(_18,"transformPoint:",_19.origin);
_14=NSUnionRect(_14,_19);
}
return _14;
}
}),new objj_method(sel_getUid("globalDrawBounds"),function(_1a,_1b){
with(_1a){
var _1c=objj_msgSend(_1a,"drawBounds");
_1c.origin=objj_msgSend(objj_msgSend(_1a,"absoluteAffineTransform"),"transformPoint:",_1c.origin);
return _1c;
}
}),new objj_method(sel_getUid("setSize:"),function(_1d,_1e,_1f){
with(_1d){
_1f=floorf(_1f);
var _20=objj_msgSend(_1d,"size");
if(_1f==_20){
return;
}
if(_1f<minimumSize){
_1f=minimumSize;
}
if(_1f>maximumSize){
_1f=maximumSize;
}
size=_1f;
objj_msgSend(_1d,"setNeedsComponentsLayout");
objj_msgSend(_1d,"setNeedsLayout");
objj_msgSend(screenChangeManager,"renderObjectNoteUpdateRect:",_1d);
}
}),new objj_method(sel_getUid("origin"),function(_21,_22){
with(_21){
return origin;
}
}),new objj_method(sel_getUid("setOrigin:"),function(_23,_24,_25){
with(_23){
_25=floorf(_25);
if(_25==origin){
return;
}
origin=_25;
objj_msgSend(_23,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setFlexPercentage:"),function(_26,_27,_28){
with(_26){
if(flexPercentage==_28){
return;
}
flexPercentage=_28;
objj_msgSend(_26,"setNeedsLayout");
}
}),new objj_method(sel_getUid("flexPercentage"),function(_29,_2a){
with(_29){
return flexPercentage;
}
}),new objj_method(sel_getUid("maximumSize"),function(_2b,_2c){
with(_2b){
return maximumSize;
}
}),new objj_method(sel_getUid("setMaximumSize:"),function(_2d,_2e,_2f){
with(_2d){
if(maximumSize==_2f){
return;
}
maximumSize=_2f;
if(size>_2f){
objj_msgSend(_2d,"setSize:",_2f);
}
}
}),new objj_method(sel_getUid("minimumSize"),function(_30,_31){
with(_30){
return minimumSize;
}
}),new objj_method(sel_getUid("setMinimumSize:"),function(_32,_33,_34){
with(_32){
if(minimumSize==_34){
return;
}
minimumSize=_34;
if(size<_34){
objj_msgSend(_32,"setSize:",_34);
}
}
}),new objj_method(sel_getUid("resizingMode"),function(_35,_36){
with(_35){
return resizingMode;
}
}),new objj_method(sel_getUid("setResizingMode:"),function(_37,_38,_39){
with(_37){
if(resizingMode==_39){
return;
}
resizingMode=_39;
objj_msgSend(_37,"setNeedsLayout");
}
}),new objj_method(sel_getUid("orderedComponents"),function(_3a,_3b){
with(_3a){
return orderedComponents;
}
}),new objj_method(sel_getUid("isDeepDrawingAboveAll"),function(_3c,_3d){
with(_3c){
return objj_msgSend(objj_msgSend(_3c,"container"),"isDeepDrawingAboveAll");
}
}),new objj_method(sel_getUid("deepDrawingAboveAllComponents"),function(_3e,_3f){
with(_3e){
var _40=objj_msgSend(CPMutableArray,"array");
var _41=objj_msgSend(objj_msgSend(_3e,"orderedComponents"),"objectEnumerator");
var _42=nil;
while((_42=objj_msgSend(_41,"nextObject"))!=nil){
objj_msgSend(_40,"addObjectsFromArray:",objj_msgSend(_42,"deepDrawingAboveAllComponents"));
}
return _40;
}
}),new objj_method(sel_getUid("renderObjectForFigure:"),function(_43,_44,f){
with(_43){
var _45=objj_msgSend(_43,"figure");
if(objj_msgSend(_45,"isEqual:",f)){
return _43;
}
var _46=nil;
var it=objj_msgSend(orderedComponents,"objectEnumerator");
while(_46=objj_msgSend(it,"nextObject")){
var _47=objj_msgSend(_46,"renderObjectForFigure:",f);
if(_47!=nil){
return _47;
}
}
return nil;
}
}),new objj_method(sel_getUid("affineOriginTransform"),function(_48,_49){
with(_48){
return objj_msgSend(GDAffineTransform,"transform");
}
}),new objj_method(sel_getUid("isDraggable"),function(_4a,_4b){
with(_4a){
return NO;
}
}),new objj_method(sel_getUid("isTableElement"),function(_4c,_4d){
with(_4c){
return YES;
}
}),new objj_method(sel_getUid("verticalLayoutIfNeeded"),function(_4e,_4f){
with(_4e){
}
}),new objj_method(sel_getUid("horizontalLayoutIfNeeded"),function(_50,_51){
with(_50){
}
}),new objj_method(sel_getUid("layoutIfNeededUsingAdaptor:"),function(_52,_53,_54){
with(_52){
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(_55,_56){
with(_55){
}
}),new objj_method(sel_getUid("setNeedsCellLayout"),function(_57,_58){
with(_57){
}
}),new objj_method(sel_getUid("setNeedsContainerLayout"),function(_59,_5a){
with(_59){
}
}),new objj_method(sel_getUid("setNeedsComponentsLayout"),function(_5b,_5c){
with(_5b){
}
}),new objj_method(sel_getUid("needsVerticalLayout"),function(_5d,_5e){
with(_5d){
return NO;
}
}),new objj_method(sel_getUid("needsPassOnVerticalLayout"),function(_5f,_60){
with(_5f){
return objj_msgSend(objj_msgSend(_5f,"container"),"needsPassOnVerticalLayout");
}
}),new objj_method(sel_getUid("setNeedsVerticalLayout"),function(_61,_62){
with(_61){
objj_msgSend(_61,"setNeedsContainerLayout");
}
}),new objj_method(sel_getUid("setNeedsPassOnVerticalLayout"),function(_63,_64){
with(_63){
objj_msgSend(objj_msgSend(_63,"container"),"setNeedsPassOnVerticalLayout");
}
}),new objj_method(sel_getUid("setNeedsVerticalCellLayout"),function(_65,_66){
with(_65){
objj_msgSend(_65,"setNeedsVerticalContainerLayout");
}
}),new objj_method(sel_getUid("setNeedsVerticalContainerLayout"),function(_67,_68){
with(_67){
objj_msgSend(objj_msgSend(_67,"container"),"setNeedsVerticalCellLayout");
}
}),new objj_method(sel_getUid("needsHorizontalLayout"),function(_69,_6a){
with(_69){
return NO;
}
}),new objj_method(sel_getUid("needsPassOnHorizontalLayout"),function(_6b,_6c){
with(_6b){
return objj_msgSend(objj_msgSend(_6b,"container"),"needsPassOnHorizontalLayout");
}
}),new objj_method(sel_getUid("setNeedsHorizontalLayout"),function(_6d,_6e){
with(_6d){
objj_msgSend(_6d,"setNeedsHorizontalContainerLayout");
}
}),new objj_method(sel_getUid("setNeedsPassOnHorizontalLayout"),function(_6f,_70){
with(_6f){
objj_msgSend(objj_msgSend(_6f,"container"),"setNeedsPassOnHorizontalLayout");
}
}),new objj_method(sel_getUid("setNeedsHorizontalCellLayout"),function(_71,_72){
with(_71){
objj_msgSend(_71,"setNeedsHorizontalContainerLayout");
}
}),new objj_method(sel_getUid("setNeedsHorizontalContainerLayout"),function(_73,_74){
with(_73){
objj_msgSend(objj_msgSend(_73,"container"),"setNeedsHorizontalCellLayout");
}
}),new objj_method(sel_getUid("setNeedsHorizontalLayoutCellOnly:"),function(_75,_76,_77){
with(_75){
for(var i=0;i<objj_msgSend(objj_msgSend(_75,"orderedComponents"),"count");i++){
objj_msgSend(objj_msgSend(objj_msgSend(_75,"orderedComponents"),"objectAtIndex:",i),"setNeedsHorizontalLayoutCellOnly:",_77);
}
}
}),new objj_method(sel_getUid("setNeedsVerticalLayoutCellOnly:"),function(_78,_79,_7a){
with(_78){
for(var i=0;i<objj_msgSend(objj_msgSend(_78,"orderedComponents"),"count");i++){
objj_msgSend(objj_msgSend(objj_msgSend(_78,"orderedComponents"),"objectAtIndex:",i),"setNeedsVerticalLayoutCellOnly:",_7a);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("renderObjectForFigure:screenChangeManager:table:"),function(_7b,_7c,_7d,_7e,_7f){
with(_7b){
return objj_msgSend(objj_msgSend(objj_msgSend(_7b,"alloc"),"initWithFigure:screenChangeManager:table:",_7d,_7e,_7f),"autorelease");
}
})]);
p;20;GDTextRenderObject.jt;9149;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;19;GDLayoutConstants.ji;20;CGContextAdditions.jt;9033;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDLayoutConstants.j",YES);
objj_executeFile("CGContextAdditions.j",YES);
var _1=100000;
var _2=objj_allocateClassPair(CPObject,"GDTextRenderObject"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("text"),new objj_ivar("font"),new objj_ivar("color"),new objj_ivar("verticalAlignment"),new objj_ivar("horizontalAlignment"),new objj_ivar("wordWrap"),new objj_ivar("lineHeight"),new objj_ivar("lineHeightMultiply"),new objj_ivar("cellRenderObject"),new objj_ivar("cachedBoundingSize"),new objj_ivar("lines"),new objj_ivar("textShadow"),new objj_ivar("textShadowOffset"),new objj_ivar("textShadowOpacity"),new objj_ivar("textShadowAngle"),new objj_ivar("textShadowBlur"),new objj_ivar("textShadowColor")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("textShadow"),function(_4,_5){
with(_4){
return textShadow;
}
}),new objj_method(sel_getUid("setTextShadow:"),function(_6,_7,_8){
with(_6){
textShadow=_8;
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_9,_a){
with(_9){
return textShadowOffset;
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_b,_c,_d){
with(_b){
textShadowOffset=_d;
}
}),new objj_method(sel_getUid("textShadowOpacity"),function(_e,_f){
with(_e){
return textShadowOpacity;
}
}),new objj_method(sel_getUid("setTextShadowOpacity:"),function(_10,_11,_12){
with(_10){
textShadowOpacity=_12;
}
}),new objj_method(sel_getUid("textShadowAngle"),function(_13,_14){
with(_13){
return textShadowAngle;
}
}),new objj_method(sel_getUid("setTextShadowAngle:"),function(_15,_16,_17){
with(_15){
textShadowAngle=_17;
}
}),new objj_method(sel_getUid("textShadowBlur"),function(_18,_19){
with(_18){
return textShadowBlur;
}
}),new objj_method(sel_getUid("setTextShadowBlur:"),function(_1a,_1b,_1c){
with(_1a){
textShadowBlur=_1c;
}
}),new objj_method(sel_getUid("textShadowColor"),function(_1d,_1e){
with(_1d){
return textShadowColor;
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_1f,_20,_21){
with(_1f){
textShadowColor=_21;
}
}),new objj_method(sel_getUid("init"),function(_22,_23){
with(_22){
_22=objj_msgSendSuper({receiver:_22,super_class:objj_getClass("GDTextRenderObject").super_class},"init");
if(_22==nil){
return nil;
}
hideText=NO;
antialias=YES;
wordWrap=YES;
lineHeight=1;
lineHeightMultiply=YES;
verticalAlignment=GDCenterAlignment;
horizontalAlignment=GDCenterAlignment;
textShadow=NO;
textShadowOffset=2;
textShadowOpacity=0.5;
textShadowAngle=180;
textShadowBlur=1;
cachedBoundingSize=CGSizeMake(-1,-1);
lines=[];
return _22;
}
}),new objj_method(sel_getUid("initWithCellRenderObject:"),function(_24,_25,_26){
with(_24){
_24=objj_msgSend(_24,"init");
if(_24==nil){
return nil;
}
cellRenderObject=_26;
return _24;
}
}),new objj_method(sel_getUid("setAttributedString:"),function(_27,_28,_29){
with(_27){
text=_29;
}
}),new objj_method(sel_getUid("attributedString"),function(_2a,_2b){
with(_2a){
return text;
}
}),new objj_method(sel_getUid("stringValue"),function(_2c,_2d){
with(_2c){
return text;
}
}),new objj_method(sel_getUid("setStringValue:"),function(_2e,_2f,_30){
with(_2e){
text=_30;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_31,_32,_33){
with(_31){
if(color==_33){
return;
}
color=_33;
}
}),new objj_method(sel_getUid("textColor"),function(_34,_35){
with(_34){
return color;
}
}),new objj_method(sel_getUid("font"),function(_36,_37){
with(_36){
return font;
}
}),new objj_method(sel_getUid("setFont:"),function(_38,_39,_3a){
with(_38){
if(font==_3a){
return;
}
font=_3a;
}
}),new objj_method(sel_getUid("antialias"),function(_3b,_3c){
with(_3b){
return YES;
}
}),new objj_method(sel_getUid("setAntialias:"),function(_3d,_3e,_3f){
with(_3d){
}
}),new objj_method(sel_getUid("createLineWithText:size:"),function(_40,_41,_42,_43){
with(_40){
var _44=new Object();
_44.text=_42;
_44.textSize=CGSizeMake(_43.width,_43.height);
_44.lineSize=CGSizeMake(_43.width,_43.height);
if(lineHeightMultiply){
_44.lineSize.height=_44.textSize.height*lineHeight;
}else{
_44.lineSize.height=lineHeight;
}
return _44;
}
}),new objj_method(sel_getUid("breakParagraph:"),function(_45,_46,p){
with(_45){
var _47=objj_msgSend(" ","sizeWithFont:",font);
var _48=_47.width;
if(p.trim().length==0){
return [objj_msgSend(_45,"createLineWithText:size:","",CGSizeMake(0,_47.height))];
}
var _49=objj_msgSend(cellRenderObject,"innerBounds").size.width;
var _4a=p.split(" ");
var _4b=_49;
var _4c=[];
var _4d=[];
for(var i=0;i<_4a.length;i++){
var _4e=_4a[i];
var _4f=objj_msgSend(_4e,"sizeWithFont:",font);
if(_4f.width<=_4b){
_4d.push(_4e);
_4b-=_4f.width+_48;
}else{
var _50=_4d.join(" ");
_4c.push(objj_msgSend(_45,"createLineWithText:size:",_50,objj_msgSend(_50,"sizeWithFont:",font)));
_4d=[];
_4d.push(_4e);
_4b=_49-_4f.width;
}
}
if(_4d.length>0){
var _50=_4d.join(" ");
_4c.push(objj_msgSend(_45,"createLineWithText:size:",_50,objj_msgSend(_50,"sizeWithFont:",font)));
}
return _4c;
}
}),new objj_method(sel_getUid("breakIntoLines"),function(_51,_52){
with(_51){
lines=[];
var _53=text.split("\n");
for(var i=0;i<_53.length;i++){
var p=_53[i];
if(!wordWrap||objj_msgSend(cellRenderObject,"horizontalResizing")==GDIntrinsicResizing){
lines.push(objj_msgSend(_51,"createLineWithText:size:",p,objj_msgSend(p,"sizeWithFont:",font)));
}else{
var _54=objj_msgSend(_51,"breakParagraph:",p);
for(var j=0;j<_54.length;j++){
lines.push(_54[j]);
}
}
}
}
}),new objj_method(sel_getUid("boundingSize"),function(_55,_56){
with(_55){
objj_msgSend(_55,"breakIntoLines");
var _57=CGSizeMake(0,0);
for(var i=0;i<lines.length;i++){
var _58=lines[i];
_57.height+=_58.lineSize.height;
_57.width=MAX(_57.width,_58.lineSize.width);
}
return _57;
}
}),new objj_method(sel_getUid("globalTextBounds"),function(_59,_5a){
with(_59){
return CGRectMake(0,0,0,0);
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_5b,_5c){
with(_5b){
return verticalAlignment;
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_5d,_5e,_5f){
with(_5d){
verticalAlignment=_5f;
if(verticalAlignment==null){
verticalAlignment=0;
}
}
}),new objj_method(sel_getUid("horizontalAlignment"),function(_60,_61){
with(_60){
return horizontalAlignment;
}
}),new objj_method(sel_getUid("setHorizontalAlignment:"),function(_62,_63,_64){
with(_62){
horizontalAlignment=_64;
if(horizontalAlignment==null){
horizontalAlignment=0;
}
}
}),new objj_method(sel_getUid("wordWrap"),function(_65,_66){
with(_65){
return wordWrap;
}
}),new objj_method(sel_getUid("setWordWrap:"),function(_67,_68,_69){
with(_67){
wordWrap=_69;
}
}),new objj_method(sel_getUid("lineHeight"),function(_6a,_6b){
with(_6a){
return lineHeight;
}
}),new objj_method(sel_getUid("setLineHeight:"),function(_6c,_6d,_6e){
with(_6c){
lineHeight=_6e;
}
}),new objj_method(sel_getUid("lineHeightMultiply"),function(_6f,_70){
with(_6f){
return lineHeightMultiply;
}
}),new objj_method(sel_getUid("setLineHeightMultiply:"),function(_71,_72,_73){
with(_71){
lineHeightMultiply=_73;
}
}),new objj_method(sel_getUid("adjustTextContainerSize"),function(_74,_75){
with(_74){
}
}),new objj_method(sel_getUid("textLocation"),function(_76,_77){
with(_76){
var _78=objj_msgSend(_76,"boundingSize");
var _79=objj_msgSend(cellRenderObject,"innerBounds");
var x=_79.origin.x;
var y=_79.origin.y;
switch(verticalAlignment){
case GDTopAlignment:
break;
case GDCenterAlignment:
y+=(_79.size.height-_78.height)/2;
break;
case GDBottomAlignment:
y+=_79.size.height-_78.height;
break;
default:
return CGPointMake(0,0);
}
switch(horizontalAlignment){
case GDJustifiedAlignment:
case GDLeftAlignment:
break;
case GDCenterAlignment:
if(objj_msgSend(cellRenderObject,"horizontalResizing")==GDIntrinsicResizing||!wordWrap){
x+=(_79.size.width-_1)/2;
}
break;
case GDRightAlignment:
if(objj_msgSend(cellRenderObject,"horizontalResizing")==GDIntrinsicResizing||!wordWrap){
x+=_79.size.width-_1;
}
break;
default:
return CGPointMake(0,0);
}
if(y<0){
y=0;
}
if(x<0){
x=0;
}
return CGPointMake(x,y+objj_msgSend(font,"ascender"));
}
}),new objj_method(sel_getUid("draw"),function(_7a,_7b){
with(_7a){
if(!text){
return;
}
var _7c=GDGetCurrentContext();
CGContextSaveGState(_7c);
var _7d=objj_msgSend(_7a,"textLocation");
_7c.font=objj_msgSend(font,"cssString");
var _7e=objj_msgSend(cellRenderObject,"innerBounds");
var x=_7e.origin.x;
var _7f=_7e.size.width;
switch(horizontalAlignment){
case GDLeftAlignment:
_7c.textAlign="left";
break;
case GDCenterAlignment:
_7c.textAlign="center";
x+=_7f/2;
break;
case GDRightAlignment:
_7c.textAlign="right";
x+=_7f;
break;
}
CGContextSetFillColorWithAlpha(_7c,color,objj_msgSend(color,"alphaComponent"));
if(textShadow){
CGContextSetAntetypeTextShadow(_7c,textShadowOffset,textShadowAngle,textShadowOpacity,textShadowBlur,textShadowColor);
}
var _80=nil;
var _81=objj_msgSend(lines,"objectEnumerator");
while((_80=objj_msgSend(_81,"nextObject"))!=nil){
_7c.fillText(_80.text,x,_7d.y+_80.lineSize.height-_80.textSize.height);
_7d.y+=_80.lineSize.height;
}
CGContextRestoreGState(_7c);
}
})]);
p;8;GDTool.jt;863;@STATIC;1.0;I;21;Foundation/CPObject.jt;819;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"GDTool"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("view")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithView:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSend(_3,"init");
if(_3==nil){
return nil;
}
view=_5;
return _3;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_6,_7,_8){
with(_6){
}
}),new objj_method(sel_getUid("mouseUp:"),function(_9,_a,_b){
with(_9){
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_c,_d,_e){
with(_c){
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_f,_10,_11){
with(_f){
}
}),new objj_method(sel_getUid("keyUp:"),function(_12,_13,_14){
with(_12){
}
}),new objj_method(sel_getUid("keyDown:"),function(_15,_16,_17){
with(_15){
}
})]);
p;15;GDTrackHandle.jt;5885;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;18;GDAbstractHandle.jt;5795;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("GDAbstractHandle.j",YES);
var _1=objj_allocateClassPair(GDAbstractHandle,"GDTrackHandle"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("keyPath"),new objj_ivar("cursor"),new objj_ivar("currentScale")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithOwner:keyPath:screenChangeManager:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDTrackHandle").super_class},"initWithOwner:screenChangeManager:",_5,_7);
if(_3==nil){
return nil;
}
keyPath=objj_msgSend(_6,"copy");
cursor=objj_msgSend(CPCursor,"pointingHandCursor");
currentScale=CGSizeMake(1,1);
objj_msgSend(_3,"updateBounds");
objj_msgSend(_3,"updateHitZone");
return _3;
}
}),new objj_method(sel_getUid("updateBounds"),function(_8,_9){
with(_8){
var p=objj_msgSend(objj_msgSend(owner,"absoluteAffineTransform"),"transformPoint:",objj_msgSend(objj_msgSend(owner,"valueForKeyPath:",keyPath),"pointValue"));
var _a=objj_msgSend(objj_msgSend(_8,"class"),"handleSize")*currentScale.width;
objj_msgSend(_8,"setBounds:",CGRectMake(p.x-_a/2,p.y-_a/2,_a,_a));
}
}),new objj_method(sel_getUid("updateHitZone"),function(_b,_c){
with(_b){
objj_msgSend(_b,"setHitZone:",objj_msgSend(_b,"bounds"));
}
}),new objj_method(sel_getUid("isEqual:"),function(_d,_e,_f){
with(_d){
if(!objj_msgSend(_f,"isMemberOfClass:",objj_msgSend(_d,"class"))){
return NO;
}
return objj_msgSend(keyPath,"isEqual:",objj_msgSend(_f,"keyPath"))&&objj_msgSend(owner,"isEqual:",objj_msgSend(_f,"owner"));
}
}),new objj_method(sel_getUid("hash"),function(_10,_11){
with(_10){
return objj_msgSend(owner,"hash")^objj_msgSend(keyPath,"hash");
}
}),new objj_method(sel_getUid("ownerPoint"),function(_12,_13){
with(_12){
return objj_msgSend(objj_msgSend(owner,"valueForKeyPath:",keyPath),"pointValue");
}
}),new objj_method(sel_getUid("setOwnerPoint:"),function(_14,_15,p){
with(_14){
objj_msgSend(owner,"setValue:forKeyPath:",objj_msgSend(CPValue,"valueWithPoint:",p),keyPath);
}
}),new objj_method(sel_getUid("drawRect:atScale:"),function(_16,_17,_18,_19){
with(_16){
currentScale=_19;
objj_msgSend(_16,"updateBounds");
objj_msgSend(_16,"updateHitZone");
objj_msgSend(objj_msgSend(CPColor,"colorWithDeviceHue:saturation:brightness:alpha:",0,0,0.44,objj_msgSend(_16,"isActive")?0.8:0.4),"setFill");
objj_msgSend(objj_msgSend(CPColor,"whiteColor"),"setStroke");
var _1a=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
var r=CGRectOffset(alignRectToUserSpace(_1a,cgRectFromNSRect(bounds)),0.5,0.5);
CGContextFillRect(_1a,r);
CGContextStrokeRectWithWidth(_1a,r,alignSizeToUserSpace(_1a,CGSizeMake(_19.width,_19.height)).width);
}
}),new objj_method(sel_getUid("handleAtPoint:"),function(_1b,_1c,p){
with(_1b){
if(!objj_msgSend(_1b,"isActive")){
return nil;
}
return objj_msgSendSuper({receiver:_1b,super_class:objj_getClass("GDTrackHandle").super_class},"handleAtPoint:",p);
}
}),new objj_method(sel_getUid("keyPath"),function(_1d,_1e){
with(_1d){
return keyPath;
}
}),new objj_method(sel_getUid("cursor"),function(_1f,_20){
with(_1f){
if(!objj_msgSend(_1f,"isActive")){
return nil;
}
return cursor;
}
}),new objj_method(sel_getUid("isActive"),function(_21,_22){
with(_21){
var _23=objj_msgSend(owner,"container");
var _24=objj_msgSend(objj_msgSend(_23,"valueForKey:","layoutPolicy"),"layoutPolicyCode");
var _25=objj_msgSend(objj_msgSend(_23,"valueForKey:","verticalAlignment"),"intValue");
var _26=objj_msgSend(objj_msgSend(_23,"valueForKey:","horizontalAlignment"),"intValue");
if(_24!=GDFixedLayoutPolicyCode){
if((_26==GDLeftAlignment)&&(objj_msgSend(keyPath,"isEqualToString:","leftCenter")||objj_msgSend(keyPath,"isEqualToString:","bottomLeft")||objj_msgSend(keyPath,"isEqualToString:","topLeft"))){
return NO;
}
if((_26==GDRightAlignment)&&(objj_msgSend(keyPath,"isEqualToString:","rightCenter")||objj_msgSend(keyPath,"isEqualToString:","bottomRight")||objj_msgSend(keyPath,"isEqualToString:","topRight"))){
return NO;
}
if((_25==GDTopAlignment)&&(objj_msgSend(keyPath,"isEqualToString:","topCenter")||objj_msgSend(keyPath,"isEqualToString:","topLeft")||objj_msgSend(keyPath,"isEqualToString:","topRight"))){
return NO;
}
if((_25==GDBottomAlignment)&&(objj_msgSend(keyPath,"isEqualToString:","bottomCenter")||objj_msgSend(keyPath,"isEqualToString:","bottomLeft")||objj_msgSend(keyPath,"isEqualToString:","bottomRight"))){
return NO;
}
}
if(objj_msgSend(keyPath,"isEqualToString:","leftCenter")||objj_msgSend(keyPath,"isEqualToString:","rightCenter")){
return objj_msgSend(owner,"horizontalResizing")==GDFixResizing;
}
if(objj_msgSend(keyPath,"isEqualToString:","topCenter")||objj_msgSend(keyPath,"isEqualToString:","bottomCenter")){
return objj_msgSend(owner,"verticalResizing")==GDFixResizing;
}
if(objj_msgSend(keyPath,"isEqualToString:","topLeft")||objj_msgSend(keyPath,"isEqualToString:","topRight")||objj_msgSend(keyPath,"isEqualToString:","bottomLeft")||objj_msgSend(keyPath,"isEqualToString:","bottomRight")){
return objj_msgSend(owner,"verticalResizing")==GDFixResizing&&objj_msgSend(owner,"horizontalResizing")==GDFixResizing;
}
return YES;
}
}),new objj_method(sel_getUid("mouseDraggedToPoint:constrained:centered:originalBounds:guideCoordinator:"),function(_27,_28,p,_29,_2a,_2b,_2c){
with(_27){
objj_msgSend(_27,"setOwnerPoint:",p);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_2d,_2e){
with(_2d){
if(_2d==objj_msgSend(GDTrackHandle,"class")){
}
}
}),new objj_method(sel_getUid("trackHandleOn:keyPath:screenChangeManager:"),function(_2f,_30,_31,_32,_33){
with(_2f){
return objj_msgSend(objj_msgSend(objj_msgSend(_2f,"alloc"),"initWithOwner:keyPath:screenChangeManager:",_31,_32,_33),"autorelease");
}
})]);
p;28;GDTriangleCellRenderObject.jt;24313;@STATIC;1.0;i;20;GDCellRenderObject.jt;24268;
objj_executeFile("GDCellRenderObject.j",YES);
var _1=objj_allocateClassPair(GDCellRenderObject,"GDTriangleCellRenderObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("A"),new objj_ivar("B"),new objj_ivar("C"),new objj_ivar("a"),new objj_ivar("b"),new objj_ivar("c"),new objj_ivar("aLength"),new objj_ivar("bLength"),new objj_ivar("cLength"),new objj_ivar("bisectionANormal"),new objj_ivar("bisectionBNormal"),new objj_ivar("bisectionCNormal"),new objj_ivar("aIntersection"),new objj_ivar("bIntersection"),new objj_ivar("cIntersection"),new objj_ivar("angleA"),new objj_ivar("angleB"),new objj_ivar("angleC"),new objj_ivar("maximalBorderWidth"),new objj_ivar("A1"),new objj_ivar("B1"),new objj_ivar("C1")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("triangleBorderOneWidth"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"borderLeftWidth");
}
}),new objj_method(sel_getUid("setTriangleBorderOneWidth:"),function(_5,_6,_7){
with(_5){
objj_msgSend(_5,"setBorderLeftWidth:",_7);
}
}),new objj_method(sel_getUid("triangleBorderOneWidthAdjusted"),function(_8,_9){
with(_8){
return objj_msgSend(_8,"borderLeftWidthAdjusted");
}
}),new objj_method(sel_getUid("setTriangleBorderOneWidthAdjusted:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_a,"setBorderLeftWidthAdjusted:",_c);
}
}),new objj_method(sel_getUid("triangleBorderOneColor"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"borderLeftColor");
}
}),new objj_method(sel_getUid("setTriangleBorderOneColor:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setBorderLeftColor:",_11);
}
}),new objj_method(sel_getUid("triangleBorderTwoWidth"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"borderRightWidth");
}
}),new objj_method(sel_getUid("setTriangleBorderTwoWidth:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"setBorderRightWidth:",_16);
}
}),new objj_method(sel_getUid("triangleBorderTwoWidthAdjusted"),function(_17,_18){
with(_17){
return objj_msgSend(_17,"borderRightWidthAdjusted");
}
}),new objj_method(sel_getUid("setTriangleBorderTwoWidthAdjusted:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_19,"setBorderRightWidthAdjusted:",_1b);
}
}),new objj_method(sel_getUid("triangleBorderTwoColor"),function(_1c,_1d){
with(_1c){
return objj_msgSend(_1c,"borderRightColor");
}
}),new objj_method(sel_getUid("setTriangleBorderTwoColor:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_1e,"setBorderRightColor:",_20);
}
}),new objj_method(sel_getUid("triangleBorderThreeWidth"),function(_21,_22){
with(_21){
return objj_msgSend(_21,"borderBottomWidth");
}
}),new objj_method(sel_getUid("setTriangleBorderThreeWidth:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_23,"setBorderBottomWidth:",_25);
}
}),new objj_method(sel_getUid("triangleBorderThreeWidthAdjusted"),function(_26,_27){
with(_26){
return objj_msgSend(_26,"borderBottomWidthAdjusted");
}
}),new objj_method(sel_getUid("setTriangleBorderThreeWidthAdjusted:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_28,"setBorderBottomWidthAdjusted:",_2a);
}
}),new objj_method(sel_getUid("triangleBorderThreeColor"),function(_2b,_2c){
with(_2b){
return objj_msgSend(_2b,"borderBottomColor");
}
}),new objj_method(sel_getUid("setTriangleBorderThreeColor:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_2d,"setBorderBottomColor:",_2f);
}
}),new objj_method(sel_getUid("triangleBorderOneType"),function(_30,_31){
with(_30){
return objj_msgSend(_30,"borderLeftType");
}
}),new objj_method(sel_getUid("setTriangleBorderOneType:"),function(_32,_33,_34){
with(_32){
objj_msgSend(_32,"setBorderLeftType:",_34);
}
}),new objj_method(sel_getUid("triangleBorderTwoType"),function(_35,_36){
with(_35){
return objj_msgSend(_35,"borderRightType");
}
}),new objj_method(sel_getUid("setTriangleBorderTwoType:"),function(_37,_38,_39){
with(_37){
objj_msgSend(_37,"setBorderRightType:",_39);
}
}),new objj_method(sel_getUid("triangleBorderThreeType"),function(_3a,_3b){
with(_3a){
return objj_msgSend(_3a,"borderBottomType");
}
}),new objj_method(sel_getUid("setTriangleBorderThreeType:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_3c,"setBorderBottomType:",_3e);
}
}),new objj_method(sel_getUid("A"),function(_3f,_40){
with(_3f){
return A;
}
}),new objj_method(sel_getUid("B"),function(_41,_42){
with(_41){
return B;
}
}),new objj_method(sel_getUid("C"),function(_43,_44){
with(_43){
return C;
}
}),new objj_method(sel_getUid("cellType"),function(_45,_46){
with(_45){
return GDTriangleCellType;
}
}),new objj_method(sel_getUid("hasBorders"),function(_47,_48){
with(_47){
return objj_msgSend(_47,"triangleBorderOneWidth")>0||objj_msgSend(_47,"triangleBorderTwoWidth")>0||objj_msgSend(_47,"triangleBorderThreeWidth")>0;
}
}),new objj_method(sel_getUid("updateOtherTriangleValues"),function(_49,_4a){
with(_49){
a=CGPointMake(C.x-B.x,C.y-B.y);
b=CGPointMake(A.x-C.x,A.y-C.y);
c=CGPointMake(B.x-A.x,B.y-A.y);
aLength=Math.sqrt(powf(a.x,2)+powf(a.y,2));
bLength=Math.sqrt(powf(b.x,2)+powf(b.y,2));
cLength=Math.sqrt(powf(c.x,2)+powf(c.y,2));
var _4b=cLength/(bLength+cLength);
var _4c=CGPointMake(a.x*_4b,a.y*_4b);
aIntersection=CGPointMake(B.x+_4c.x,B.y+_4c.y);
_4b=aLength/(cLength+aLength);
var _4d=CGPointMake(b.x*_4b,b.y*_4b);
bIntersection=CGPointMake(C.x+_4d.x,C.y+_4d.y);
_4b=bLength/(aLength+bLength);
var _4e=CGPointMake(c.x*_4b,c.y*_4b);
cIntersection=CGPointMake(A.x+_4e.x,A.y+_4e.y);
var _4f=CGPointMake(aIntersection.x-A.x,aIntersection.y-A.y);
var _50=CGPointMake(bIntersection.x-B.x,bIntersection.y-B.y);
var _51=CGPointMake(cIntersection.x-C.x,cIntersection.y-C.y);
var _52=Math.sqrt(powf(_4f.x,2)+powf(_4f.y,2));
var _53=Math.sqrt(powf(_50.x,2)+powf(_50.y,2));
var _54=Math.sqrt(powf(_51.x,2)+powf(_51.y,2));
bisectionANormal=CGPointMake(_4f.x*(1/_52),_4f.y*(1/_52));
bisectionBNormal=CGPointMake(_50.x*(1/_53),_50.y*(1/_53));
bisectionCNormal=CGPointMake(_51.x*(1/_54),_51.y*(1/_54));
angleA=acosf((pow(aLength,2)-pow(bLength,2)-pow(cLength,2))/(-2*bLength*cLength));
angleB=acosf((pow(bLength,2)-pow(aLength,2)-pow(cLength,2))/(-2*aLength*cLength));
angleC=M_PI-angleA-angleB;
}
}),new objj_method(sel_getUid("updateABC"),function(_55,_56){
with(_55){
var _57=objj_msgSend(_55,"bounds");
_57.origin=NSZeroPoint();
var rot=floorf(rotationAngle);
rot=rot%360;
switch(rot){
case 0:
B=CGPointMake(NSMidX(_57),NSMinY(_57));
A=CGPointMake(NSMinX(_57),NSMaxY(_57));
C=CGPointMake(NSMaxX(_57),NSMaxY(_57));
break;
case 45:
B=CGPointMake(NSMaxX(_57),NSMinY(_57));
A=CGPointMake(NSMinX(_57),NSMinY(_57));
C=CGPointMake(NSMaxX(_57),NSMaxY(_57));
break;
case 90:
B=CGPointMake(NSMaxX(_57),NSMidY(_57));
A=CGPointMake(NSMinX(_57),NSMinY(_57));
C=CGPointMake(NSMinX(_57),NSMaxY(_57));
break;
case 135:
B=CGPointMake(NSMaxX(_57),NSMaxY(_57));
A=CGPointMake(NSMaxX(_57),NSMinY(_57));
C=CGPointMake(NSMinX(_57),NSMaxY(_57));
break;
case 180:
B=CGPointMake(NSMidX(_57),NSMaxY(_57));
A=CGPointMake(NSMaxX(_57),NSMinY(_57));
C=CGPointMake(NSMinX(_57),NSMinY(_57));
break;
case 225:
B=CGPointMake(NSMinX(_57),NSMaxY(_57));
A=CGPointMake(NSMaxX(_57),NSMaxY(_57));
C=CGPointMake(NSMinX(_57),NSMinY(_57));
break;
case 270:
B=CGPointMake(NSMinX(_57),NSMidY(_57));
A=CGPointMake(NSMaxX(_57),NSMaxY(_57));
C=CGPointMake(NSMaxX(_57),NSMinY(_57));
break;
case 315:
B=CGPointMake(NSMinX(_57),NSMinY(_57));
A=CGPointMake(NSMinX(_57),NSMaxY(_57));
C=CGPointMake(NSMaxX(_57),NSMinY(_57));
break;
default:
CPLog("invalid angle");
A=NSZeroPoint();
B=NSZeroPoint();
C=NSZeroPoint();
}
objj_msgSend(_55,"updateOtherTriangleValues");
}
}),new objj_method(sel_getUid("updateCornerPoints"),function(_58,_59){
with(_58){
objj_msgSend(_58,"updateABC");
}
}),new objj_method(sel_getUid("adjustRoundedCornersToAvailableSize"),function(_5a,_5b){
with(_5a){
cornerRadiusTopLeftAdjusted=0;
cornerRadiusTopRightAdjusted=0;
cornerRadiusBottomLeftAdjusted=0;
cornerRadiusBottomRightAdjusted=0;
}
}),new objj_method(sel_getUid("adjustBordersToAvailableSize"),function(_5c,_5d){
with(_5c){
var s=(cLength+aLength+bLength)/2;
maximalBorderWidth=Math.sqrt(((s-cLength)*(s-aLength)*(s-bLength))/s);
maximalBorderWidth=floorf(maximalBorderWidth);
(objj_msgSend(_5c,"triangleBorderOneWidth")>maximalBorderWidth)?objj_msgSend(_5c,"setTriangleBorderOneWidthAdjusted:",maximalBorderWidth):objj_msgSend(_5c,"setTriangleBorderOneWidthAdjusted:",objj_msgSend(_5c,"triangleBorderOneWidth"));
(objj_msgSend(_5c,"triangleBorderTwoWidth")>maximalBorderWidth)?objj_msgSend(_5c,"setTriangleBorderTwoWidthAdjusted:",maximalBorderWidth):objj_msgSend(_5c,"setTriangleBorderTwoWidthAdjusted:",objj_msgSend(_5c,"triangleBorderTwoWidth"));
(objj_msgSend(_5c,"triangleBorderThreeWidth")>maximalBorderWidth)?objj_msgSend(_5c,"setTriangleBorderThreeWidthAdjusted:",maximalBorderWidth):objj_msgSend(_5c,"setTriangleBorderThreeWidthAdjusted:",objj_msgSend(_5c,"triangleBorderThreeWidth"));
}
}),new objj_method(sel_getUid("borderFillPathColors"),function(_5e,_5f){
with(_5e){
return objj_msgSend(CPArray,"arrayWithObjects:",objj_msgSend(_5e,"triangleBorderOneColor"),objj_msgSend(_5e,"triangleBorderTwoColor"),objj_msgSend(_5e,"triangleBorderThreeColor"),nil);
}
}),new objj_method(sel_getUid("fillPoints:inPath:"),function(_60,_61,_62,_63){
with(_60){
if(_62.length==0){
return;
}
CGPathMoveToPoint(_63,NULL,_62[0].x,_62[0].y);
for(var i=1;i<_62.length;i++){
CGPathAddLineToPoint(_63,NULL,_62[i].x,_62[i].y);
}
CGPathCloseSubpath(_63);
}
}),new objj_method(sel_getUid("drawBorderFromA:toB:widthAB:widthAC:widthBC:angleA:angleB:bisectionANormal:bisectionBNormal:edgeABNormal:edgeACNormal:edgeBCNormal:color:borderType:fillPaths:"),function(_64,_65,_66,_67,_68,_69,_6a,_6b,_6c,_6d,_6e,_6f,_70,_71,_72,_73,_74){
with(_64){
if(_68<=0){
return;
}
var _75=objj_msgSend(_74,"objectForKey:",objj_msgSend(_72,"cssString"));
var _76=GDGetCurrentContext();
CGContextSaveGState(_76);
CGContextSetFillColorWithAlpha(_76,_72,objj_msgSend(_72,"alphaComponent"));
CGContextSetStrokeColorWithAlpha(_76,_72,objj_msgSend(_72,"alphaComponent"));
var _77=CGPointMake(_6f.y,_6f.x*(-1));
var _78=CGPointMake(_70.y*(-1),_70.x);
var _79=CGPointMake(_71.y,_71.x*(-1));
var _7a=objj_msgSend(_64,"borderOverlap")/cosf(angleA/2)*(-1);
var _7b=CGPointMake(_66.x+_7a*_6d.x,_66.y+_7a*_6d.y);
var _7c=objj_msgSend(_64,"borderOverlap")/cosf(angleB/2)*(-1);
var _7d=CGPointMake(_67.x+_7c*_6e.x,_67.y+_7c*_6e.y);
var _7e;
if(_69>0){
var _7f=_68/sinf(_6b/2);
var _80=CGPointMake(_66.x+_6d.x*_7f,_66.y+_6d.y*_7f);
var _81=_68/tanf(_6b/2);
var _82=CGPointMake(_66.x+_6f.x*_81,_66.y+_6f.y*_81);
var _83=CGPointMake(_82.x+_77.x*objj_msgSend(_64,"borderOverlap"),_82.y+_77.y*objj_msgSend(_64,"borderOverlap"));
var _84=new Array(_7b,_80,_83);
objj_msgSend(_64,"fillPoints:inPath:",_84,_75);
_7e=CGPointMake(_83.x+(_80.x-_83.x)/2,_83.y+(_80.y-_83.y)/2);
}else{
if(_6b==M_PI_2){
_7e=CGPointMake(_66.x+_70.x*(_68/2)-_6f.x*objj_msgSend(_64,"borderOverlap"),_66.y+_70.y*(_68/2)-_6f.y*objj_msgSend(_64,"borderOverlap"));
}else{
var _80;
var _82;
if(_6b<M_PI_2){
var _7f=_68/sinf(_6b);
_80=CGPointMake(_66.x+_70.x*_7f,_66.y+_70.y*_7f);
var _85=CGPointMake(_80.x+_78.x*objj_msgSend(_64,"borderOverlap"),_80.y+_78.y*objj_msgSend(_64,"borderOverlap"));
var _86=_68/tanf(_6b);
_82=CGPointMake(_66.x+_6f.x*_86,_66.y+_6f.y*_86);
var _83=CGPointMake(_82.x+_77.x*objj_msgSend(_64,"borderOverlap"),_82.y+_77.y*objj_msgSend(_64,"borderOverlap"));
var _84=new Array(_7b,_85,_80,_83);
objj_msgSend(_64,"fillPoints:inPath:",_84,_75);
_7e=CGPointMake(_83.x+(_80.x-_83.x)/2,_83.y+(_80.y-_83.y)/2);
}else{
var _7f=_68/sinf(M_PI-_6b);
_80=CGPointMake(_66.x+_70.x*_7f,_66.y+_70.y*_7f);
var _85=CGPointMake(_80.x+_78.x*objj_msgSend(_64,"borderOverlap"),_80.y+_78.y*objj_msgSend(_64,"borderOverlap"));
var _86=_68/tanf(M_PI-_6b);
_82=CGPointMake(_80.x+_6f.x*_86,_80.y+_6f.y*_86);
var _83=CGPointMake(_66.x+_77.x*objj_msgSend(_64,"borderOverlap"),_66.y+_77.y*objj_msgSend(_64,"borderOverlap"));
var _84=new Array(_7b,_85,_80,_82,_83);
objj_msgSend(_64,"fillPoints:inPath:",_84,_75);
_7e=CGPointMake(_82.x+(_83.x-_82.x)/2,_82.y+(_83.y-_82.y)/2);
}
}
}
var _87;
if(_6a>0){
var _88=_68/sinf(_6c/2);
var _80=CGPointMake(_67.x+_6e.x*_88,_67.y+_6e.y*_88);
var _81=_68/tanf(_6c/2);
var _82=CGPointMake(_67.x+_6f.x*(-1)*_81,_67.y+_6f.y*(-1)*_81);
var _83=CGPointMake(_82.x+_77.x*objj_msgSend(_64,"borderOverlap"),_82.y+_77.y*objj_msgSend(_64,"borderOverlap"));
var _84=new Array(_83,_80,_7d);
objj_msgSend(_64,"fillPoints:inPath:",_84,_75);
_87=CGPointMake(_83.x+(_80.x-_83.x)/2,_83.y+(_80.y-_83.y)/2);
}else{
var _80;
var _82;
if(_6c==M_PI_2){
_87=CGPointMake(_67.x+_71.x*(_68/2)-_6f.x*objj_msgSend(_64,"borderOverlap"),_67.y+_71.y*(_68/2)-_6f.y*objj_msgSend(_64,"borderOverlap"));
}else{
if(_6c<M_PI_2){
var _7f=_68/sinf(_6c);
_80=CGPointMake(_67.x+_71.x*_7f,_67.y+_71.y*_7f);
var _85=CGPointMake(_80.x+_79.x*objj_msgSend(_64,"borderOverlap"),_80.y+_79.y*objj_msgSend(_64,"borderOverlap"));
var _86=_68/tanf(_6c);
_82=CGPointMake(_67.x+_6f.x*(-1)*_86,_67.y+_6f.y*(-1)*_86);
var _83=CGPointMake(_82.x+_77.x*objj_msgSend(_64,"borderOverlap"),_82.y+_77.y*objj_msgSend(_64,"borderOverlap"));
var _84=new Array(_83,_80,_85,_7d);
objj_msgSend(_64,"fillPoints:inPath:",_84,_75);
_87=CGPointMake(_83.x+(_80.x-_83.x)/2,_83.y+(_80.y-_83.y)/2);
}else{
var _7f=_68/sinf(M_PI-_6c);
_80=CGPointMake(_67.x+_71.x*_7f,_67.y+_71.y*_7f);
var _85=CGPointMake(_80.x+_79.x*objj_msgSend(_64,"borderOverlap"),_80.y+_79.y*objj_msgSend(_64,"borderOverlap"));
var _86=_68/tanf(M_PI-_6c);
_82=CGPointMake(_80.x+_6f.x*(-1)*_86,_80.y+_6f.y*(-1)*_86);
var _83=CGPointMake(_67.x+_77.x*objj_msgSend(_64,"borderOverlap"),_67.y+_77.y*objj_msgSend(_64,"borderOverlap"));
var _84=new Array(_83,_82,_80,_85,_7d);
objj_msgSend(_64,"fillPoints:inPath:",_84,_75);
_87=CGPointMake(_82.x+(_83.x-_82.x)/2,_82.y+(_83.y-_82.y)/2);
}
}
}
if(_73!=GDBorderTypeSolid){
var _89=CGPathCreateMutable();
CGPathMoveToPoint(_89,NULL,_7e.x,_7e.y);
CGPathAddLineToPoint(_89,NULL,_87.x,_87.y);
objj_msgSend(_64,"drawBorderPath:inContext:borderType:borderWidth:phase:",_89,_76,_73,_68,0);
CGPathRelease(_89);
}else{
var _8a=(objj_msgSend(_64,"borderOverlap")+_68)/2;
var _8b=NSMakePoint(_7e.x+_8a*_77.x,_7e.y+_8a*_77.y);
var _8c=NSMakePoint(_7e.x+_8a*_77.x*(-1),_7e.y+_8a*_77.y*(-1));
var _8d=NSMakePoint(_87.x+_8a*_77.x*(-1),_87.y+_8a*_77.y*(-1));
var _8e=NSMakePoint(_87.x+_8a*_77.x,_87.y+_8a*_77.y);
var _84=new Array(_8b,_8c,_8d,_8e);
objj_msgSend(_64,"fillPoints:inPath:",_84,_75);
}
CGContextRestoreGState(_76);
}
}),new objj_method(sel_getUid("drawRegularBorder"),function(_8f,_90){
with(_8f){
var _91=objj_msgSend(_8f,"prepareBorderFillPaths");
var _92=1/sqrtf(powf(a.x,2)+powf(a.y,2));
var _93=CGPointMake(a.x*_92,a.y*_92);
var _94=1/sqrtf(powf(b.x,2)+powf(b.y,2));
var _95=CGPointMake(b.x*_94,b.y*_94);
var _96=1/sqrtf(powf(c.x,2)+powf(c.y,2));
var _97=CGPointMake(c.x*_96,c.y*_96);
objj_msgSend(_8f,"drawBorderFromA:toB:widthAB:widthAC:widthBC:angleA:angleB:bisectionANormal:bisectionBNormal:edgeABNormal:edgeACNormal:edgeBCNormal:color:borderType:fillPaths:",A,B,objj_msgSend(_8f,"triangleBorderOneWidthAdjusted"),objj_msgSend(_8f,"triangleBorderThreeWidthAdjusted"),objj_msgSend(_8f,"triangleBorderTwoWidthAdjusted"),angleA,angleB,bisectionANormal,bisectionBNormal,_97,CGPointMake(_95.x*(-1),_95.y*(-1)),_93,objj_msgSend(_8f,"triangleBorderOneColor"),objj_msgSend(_8f,"triangleBorderOneType"),_91);
objj_msgSend(_8f,"drawBorderFromA:toB:widthAB:widthAC:widthBC:angleA:angleB:bisectionANormal:bisectionBNormal:edgeABNormal:edgeACNormal:edgeBCNormal:color:borderType:fillPaths:",B,C,objj_msgSend(_8f,"triangleBorderTwoWidthAdjusted"),objj_msgSend(_8f,"triangleBorderOneWidthAdjusted"),objj_msgSend(_8f,"triangleBorderThreeWidthAdjusted"),angleB,angleC,bisectionBNormal,bisectionCNormal,_93,CGPointMake(_97.x*(-1),_97.y*(-1)),_95,objj_msgSend(_8f,"triangleBorderTwoColor"),objj_msgSend(_8f,"triangleBorderTwoType"),_91);
objj_msgSend(_8f,"drawBorderFromA:toB:widthAB:widthAC:widthBC:angleA:angleB:bisectionANormal:bisectionBNormal:edgeABNormal:edgeACNormal:edgeBCNormal:color:borderType:fillPaths:",C,A,objj_msgSend(_8f,"triangleBorderThreeWidthAdjusted"),objj_msgSend(_8f,"triangleBorderTwoWidthAdjusted"),objj_msgSend(_8f,"triangleBorderOneWidthAdjusted"),angleC,angleA,bisectionCNormal,bisectionANormal,_95,CGPointMake(_93.x*(-1),_93.y*(-1)),_97,objj_msgSend(_8f,"triangleBorderThreeColor"),objj_msgSend(_8f,"triangleBorderThreeType"),_91);
objj_msgSend(_8f,"drawBorderFillPaths:inContext:",_91,GDGetCurrentContext());
}
}),new objj_method(sel_getUid("updateA1B1C1"),function(_98,_99){
with(_98){
var _9a=(-1)*(dropShadowSize/sinf(angleA/2));
var _9b=(-1)*(dropShadowSize/sinf(angleB/2));
var _9c=(-1)*(dropShadowSize/sinf(angleC/2));
A1=CGPointMake(A.x+_9a*bisectionANormal.x,A.y+_9a*bisectionANormal.y);
B1=CGPointMake(B.x+_9b*bisectionBNormal.x,B.y+_9b*bisectionBNormal.y);
C1=CGPointMake(C.x+_9c*bisectionCNormal.x,C.y+_9c*bisectionCNormal.y);
}
}),new objj_method(sel_getUid("updateDropShadowLayerOrigin"),function(_9d,_9e){
with(_9d){
var _9f=dropShadowAngle*(M_PI/180);
var _a0=sinf(_9f);
var _a1=(-1)*cosf(_9f);
var _a2=(1/Math.sqrt((_a0*_a0)+(_a1*_a1)));
var _a3=_a0*_a2*dropShadowOffset;
var _a4=_a1*_a2*dropShadowOffset;
var _a5=fminf(fminf(A1.x,B1.x),C1.x);
var _a6=fminf(fminf(A1.y,B1.y),C1.y);
var _a7=_a3+_a5-dropShadowBlur*2;
var _a8=_a4+_a6-dropShadowBlur*2;
cachedDropShadowLayerOrigin=CGPointMake(_a7,_a8);
}
}),new objj_method(sel_getUid("updateDropShadowLayerSize"),function(_a9,_aa){
with(_a9){
var _ab=CGPointMake(fminf(fminf(A1.x,B1.x),C1.x),fminf(fminf(A1.y,B1.y),C1.y));
var _ac=CGPointMake(fmaxf(fmaxf(A1.x,B1.x),C1.x),fmaxf(fmaxf(A1.y,B1.y),C1.y));
var s=NSMakeSize(_ac.x-_ab.x,_ac.y-_ab.y);
s.width+=4*dropShadowBlur;
s.height+=4*dropShadowBlur;
cachedDropShadowLayerSize=s;
}
}),new objj_method(sel_getUid("updateDropShadowLayerBounds"),function(_ad,_ae){
with(_ad){
objj_msgSend(_ad,"updateA1B1C1");
objj_msgSend(_ad,"updateDropShadowLayerOrigin");
objj_msgSend(_ad,"updateDropShadowLayerSize");
}
}),new objj_method(sel_getUid("drawDropShadowToLayerContext:"),function(_af,_b0,_b1){
with(_af){
var _b2=objj_msgSend(GDAffineTransform,"transform");
objj_msgSend(_b2,"translateXBy:yBy:",(2*dropShadowBlur+(-1)*fminf(fminf(A1.x,B1.x),C1.x)),(2*dropShadowBlur+(-1)*fminf(fminf(A1.y,B1.y),C1.y)));
A1=objj_msgSend(_b2,"transformPoint:",A1);
B1=objj_msgSend(_b2,"transformPoint:",B1);
C1=objj_msgSend(_b2,"transformPoint:",C1);
CGContextBeginPath(_b1);
CGContextMoveToPoint(_b1,A1.x,A1.y);
CGContextAddLineToPoint(_b1,B1.x,B1.y);
CGContextAddLineToPoint(_b1,C1.x,C1.y);
CGContextAddLineToPoint(_b1,A1.x,A1.y);
CGContextFillPath(_b1);
}
}),new objj_method(sel_getUid("createPathInContext:size:"),function(_b3,_b4,_b5,_b6){
with(_b3){
CGContextBeginPath(_b5);
var x=0;
var y=0;
CGContextMoveToPoint(_b5,A.x-x,A.y-y);
CGContextAddLineToPoint(_b5,B.x-x,B.y-y);
CGContextAddLineToPoint(_b5,C.x-x,C.y-y);
CGContextClosePath(_b5);
}
}),new objj_method(sel_getUid("innerBounds"),function(_b7,_b8){
with(_b7){
var _b9=objj_msgSend(_b7,"bounds");
return CGRectMake(_b9.origin.x+objj_msgSend(_b7,"paddingLeft"),_b9.origin.y+objj_msgSend(_b7,"paddingTop"),_b9.size.width-objj_msgSend(_b7,"paddingLeft")-objj_msgSend(_b7,"paddingRight"),_b9.size.height-objj_msgSend(_b7,"paddingTop")-objj_msgSend(_b7,"paddingBottom"));
}
}),new objj_method(sel_getUid("setInnerBounds:"),function(_ba,_bb,r){
with(_ba){
objj_msgSend(_ba,"setBounds:",CGRectMake(r.origin.x-objj_msgSend(_ba,"paddingLeft"),r.origin.y-objj_msgSend(_ba,"paddingTop"),r.size.width+objj_msgSend(_ba,"paddingLeft")+objj_msgSend(_ba,"paddingRight"),r.size.height+objj_msgSend(_ba,"paddingTop")+objj_msgSend(_ba,"paddingBottom")));
}
}),new objj_method(sel_getUid("globalInnerBounds"),function(_bc,_bd){
with(_bc){
var _be=objj_msgSend(_bc,"globalBounds");
return CGRectMake(_be.origin.x+objj_msgSend(_bc,"paddingLeft"),_be.origin.y+objj_msgSend(_bc,"paddingTop"),_be.size.width-objj_msgSend(_bc,"paddingLeft")-objj_msgSend(_bc,"paddingRight"),_be.size.height-objj_msgSend(_bc,"paddingTop")-objj_msgSend(_bc,"paddingBottom"));
}
}),new objj_method(sel_getUid("affineBorderTransform"),function(_bf,_c0){
with(_bf){
return objj_msgSend(GDAffineTransform,"transform");
}
}),new objj_method(sel_getUid("addOuterCellPathToContext:"),function(_c1,_c2,_c3){
with(_c1){
CGContextMoveToPoint(_c3,A.x,A.y);
CGContextAddLineToPoint(_c3,B.x,B.y);
CGContextAddLineToPoint(_c3,C.x,C.y);
CGContextAddLineToPoint(_c3,A.x,A.y);
}
}),new objj_method(sel_getUid("addInnerCellPathToContext:"),function(_c4,_c5,_c6){
with(_c4){
var _c7=1/sqrtf(powf(a.x,2)+powf(a.y,2));
var _c8=CGPointMake(a.x*_c7,a.y*_c7);
var _c9=1/sqrtf(powf(b.x,2)+powf(b.y,2));
var _ca=CGPointMake(b.x*_c9,b.y*_c9);
var _cb=1/sqrtf(powf(c.x,2)+powf(c.y,2));
var _cc=CGPointMake(c.x*_cb,c.y*_cb);
var _cd;
if(objj_msgSend(_c4,"triangleBorderThreeWidthAdjusted")==0){
var _ce=0;
if(angleA==M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderOneWidthAdjusted");
}else{
if(angleA<M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderOneWidthAdjusted")/sinf(angleA);
}else{
_ce=objj_msgSend(_c4,"triangleBorderOneWidthAdjusted")/sinf(M_PI-angleA);
}
}
CGContextMoveToPoint(_c6,A.x+_ca.x*(-1)*_ce,A.y+_ca.y*(-1)*_ce);
_cd=CGPointMake(A.x+_ca.x*(-1)*_ce,A.y+_ca.y*(-1)*_ce);
}else{
if(objj_msgSend(_c4,"triangleBorderOneWidthAdjusted")==0){
var _ce=0;
if(angleA==M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderThreeWidthAdjusted");
}else{
if(angleA<M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderThreeWidthAdjusted")/sinf(angleA);
}else{
_ce=objj_msgSend(_c4,"triangleBorderThreeWidthAdjusted")/sinf(M_PI-angleA);
}
}
CGContextMoveToPoint(_c6,A.x+_cc.x*_ce,A.y+_cc.y*_ce);
_cd=CGPointMake(A.x+_cc.x*_ce,A.y+_cc.y*_ce);
}else{
var _ce=objj_msgSend(_c4,"triangleBorderThreeWidthAdjusted")/sinf(angleA/2);
CGContextMoveToPoint(_c6,A.x+bisectionANormal.x*_ce,A.y+bisectionANormal.y*_ce);
_ce=objj_msgSend(_c4,"triangleBorderOneWidthAdjusted")/sinf(angleA/2);
CGContextAddLineToPoint(_c6,A.x+bisectionANormal.x*_ce,A.y+bisectionANormal.y*_ce);
_cd=CGPointMake(A.x+bisectionANormal.x*_ce,A.y+bisectionANormal.y*_ce);
}
}
if(objj_msgSend(_c4,"triangleBorderOneWidthAdjusted")==0){
var _ce=0;
if(angleB==M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderTwoWidthAdjusted");
}else{
if(angleB<M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderTwoWidthAdjusted")/sinf(angleB);
}else{
_ce=objj_msgSend(_c4,"triangleBorderTwoWidthAdjusted")/sinf(M_PI-angleB);
}
}
CGContextAddLineToPoint(_c6,B.x+_cc.x*(-1)*_ce,B.y+_cc.y*(-1)*_ce);
}else{
if(objj_msgSend(_c4,"triangleBorderTwoWidthAdjusted")==0){
var _ce=0;
if(angleB==M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderOneWidthAdjusted");
}else{
if(angleB<M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderOneWidthAdjusted")/sinf(angleB);
}else{
_ce=objj_msgSend(_c4,"triangleBorderOneWidthAdjusted")/sinf(M_PI-angleB);
}
}
CGContextAddLineToPoint(_c6,B.x+_c8.x*_ce,B.y+_c8.y*_ce);
}else{
var _ce=objj_msgSend(_c4,"triangleBorderOneWidthAdjusted")/sinf(angleB/2);
CGContextAddLineToPoint(_c6,B.x+bisectionBNormal.x*_ce,B.y+bisectionBNormal.y*_ce);
_ce=objj_msgSend(_c4,"triangleBorderTwoWidthAdjusted")/sinf(angleB/2);
CGContextAddLineToPoint(_c6,B.x+bisectionBNormal.x*_ce,B.y+bisectionBNormal.y*_ce);
}
}
if(objj_msgSend(_c4,"triangleBorderTwoWidthAdjusted")==0){
var _ce=0;
if(angleC==M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderThreeWidthAdjusted");
}else{
if(angleC<M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderThreeWidthAdjusted")/sinf(angleC);
}else{
_ce=objj_msgSend(_c4,"triangleBorderThreeWidthAdjusted")/sinf(M_PI-angleC);
}
}
CGContextAddLineToPoint(_c6,C.x+_c8.x*(-1)*_ce,C.y+_c8.y*(-1)*_ce);
}else{
if(objj_msgSend(_c4,"triangleBorderThreeWidthAdjusted")==0){
var _ce=0;
if(angleC==M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderTwoWidthAdjusted");
}else{
if(angleC<M_PI_2){
_ce=objj_msgSend(_c4,"triangleBorderTwoWidthAdjusted")/sinf(angleC);
}else{
_ce=objj_msgSend(_c4,"triangleBorderTwoWidthAdjusted")/sinf(M_PI-angleC);
}
}
CGContextAddLineToPoint(_c6,C.x+_ca.x*_ce,C.y+_ca.y*_ce);
}else{
var _ce=objj_msgSend(_c4,"triangleBorderTwoWidthAdjusted")/sinf(angleC/2);
CGContextAddLineToPoint(_c6,C.x+bisectionCNormal.x*_ce,C.y+bisectionCNormal.y*_ce);
_ce=objj_msgSend(_c4,"triangleBorderThreeWidthAdjusted")/sinf(angleC/2);
CGContextAddLineToPoint(_c6,C.x+bisectionCNormal.x*_ce,C.y+bisectionCNormal.y*_ce);
}
}
CGContextAddLineToPoint(_c6,_cd.x,_cd.y);
}
})]);
p;27;GDVerticalBoxLayoutPolicy.jt;1554;@STATIC;1.0;i;19;GDBoxLayoutPolicy.ji;20;GDCellRenderObject.ji;19;GDLayoutConstants.jt;1462;
objj_executeFile("GDBoxLayoutPolicy.j",YES);
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDLayoutConstants.j",YES);
var _1=objj_allocateClassPair(GDBoxLayoutPolicy,"GDVerticalBoxLayoutPolicy"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("resizeComponentsOfAdaptor:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDVerticalBoxLayoutPolicy").super_class},"resizeComponentsOfAdaptor:",_5);
if(objj_msgSend(_5,"isVertical")){
objj_msgSend(_3,"resizeComponentsOfPrimaryAdaptor:",_5);
}else{
objj_msgSend(_3,"resizeComponentsOfSecondaryAdaptor:",_5);
}
}
}),new objj_method(sel_getUid("alignComponentsOfAdaptor:"),function(_6,_7,_8){
with(_6){
objj_msgSendSuper({receiver:_6,super_class:objj_getClass("GDVerticalBoxLayoutPolicy").super_class},"alignComponentsOfAdaptor:",_8);
if(objj_msgSend(_8,"isVertical")){
objj_msgSend(_6,"alignComponentsOfPrimaryAdaptor:",_8);
}else{
objj_msgSend(_6,"alignComponentsOfSecondaryAdaptor:",_8);
}
}
}),new objj_method(sel_getUid("calculateContentSizeOfAdaptor:"),function(_9,_a,_b){
with(_9){
if(objj_msgSend(_b,"isVertical")){
return objj_msgSend(_9,"calculateContentSizeOfPrimaryAdaptor:",_b);
}else{
return objj_msgSend(_9,"calculateContentSizeOfSecondaryAdaptor:",_b);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("layoutPolicyCode"),function(_c,_d){
with(_c){
return GDVerticalBoxLayoutPolicyCode;
}
})]);
p;25;GDVerticalLayoutAdaptor.jt;5574;@STATIC;1.0;i;20;GDCellRenderObject.ji;21;GDTableRenderObject.ji;18;GDTableConstants.ji;25;GDTableCellRenderObject.ji;16;GDRenderObject.jt;5430;
objj_executeFile("GDCellRenderObject.j",YES);
objj_executeFile("GDTableRenderObject.j",YES);
objj_executeFile("GDTableConstants.j",YES);
objj_executeFile("GDTableCellRenderObject.j",YES);
objj_executeFile("GDRenderObject.j",YES);
var _1=objj_allocateClassPair(GDLayoutAdaptor,"GDVerticalLayoutAdaptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isVertical"),function(_3,_4){
with(_3){
return YES;
}
}),new objj_method(sel_getUid("_adaptorForRenderObject:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_7,"createVerticalLayoutAdaptor");
}
}),new objj_method(sel_getUid("size"),function(_8,_9){
with(_8){
return objj_msgSend(renderObject,"height");
}
}),new objj_method(sel_getUid("setSize:"),function(_a,_b,_c){
with(_a){
objj_msgSend(renderObject,"setHeight:",_c);
}
}),new objj_method(sel_getUid("fullSize"),function(_d,_e){
with(_d){
return objj_msgSend(renderObject,"fullHeight");
}
}),new objj_method(sel_getUid("setFullSize:"),function(_f,_10,_11){
with(_f){
objj_msgSend(renderObject,"setFullHeight:",_11);
}
}),new objj_method(sel_getUid("innerSize"),function(_12,_13){
with(_12){
return objj_msgSend(renderObject,"innerBounds").size.height;
}
}),new objj_method(sel_getUid("setInnerSize:"),function(_14,_15,_16){
with(_14){
objj_msgSend(renderObject,"setInnerHeight:",_16);
}
}),new objj_method(sel_getUid("setMaximumSize:"),function(_17,_18,max){
with(_17){
objj_msgSend(renderObject,"setMaximumHeight:",max);
}
}),new objj_method(sel_getUid("maximumSize"),function(_19,_1a){
with(_19){
return objj_msgSend(renderObject,"maximumHeight");
}
}),new objj_method(sel_getUid("setMinimumSize:"),function(_1b,_1c,min){
with(_1b){
objj_msgSend(renderObject,"setMinimumHeight:",min);
}
}),new objj_method(sel_getUid("minimumSize"),function(_1d,_1e){
with(_1d){
return objj_msgSend(renderObject,"minimumHeight");
}
}),new objj_method(sel_getUid("textSize"),function(_1f,_20){
with(_1f){
return objj_msgSend(renderObject,"textHeight");
}
}),new objj_method(sel_getUid("origin"),function(_21,_22){
with(_21){
return objj_msgSend(renderObject,"y");
}
}),new objj_method(sel_getUid("setOrigin:"),function(_23,_24,_25){
with(_23){
objj_msgSend(renderObject,"setY:",_25);
}
}),new objj_method(sel_getUid("fullOrigin"),function(_26,_27){
with(_26){
return objj_msgSend(renderObject,"fullY");
}
}),new objj_method(sel_getUid("setFullOrigin:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(renderObject,"setFullY:",_2a);
}
}),new objj_method(sel_getUid("resizingMode"),function(_2b,_2c){
with(_2b){
return objj_msgSend(renderObject,"verticalResizing");
}
}),new objj_method(sel_getUid("flexPercentage"),function(_2d,_2e){
with(_2d){
return objj_msgSend(renderObject,"flexHeightPercentage");
}
}),new objj_method(sel_getUid("alignment"),function(_2f,_30){
with(_2f){
return objj_msgSend(renderObject,"verticalAlignment");
}
}),new objj_method(sel_getUid("activeAlignment"),function(_31,_32){
with(_31){
return objj_msgSend(renderObject,"activeVerticalAlignment");
}
}),new objj_method(sel_getUid("borderSize"),function(_33,_34){
with(_33){
return objj_msgSend(renderObject,"borderTopWidth")+objj_msgSend(renderObject,"borderBottomWidth");
}
}),new objj_method(sel_getUid("margin"),function(_35,_36){
with(_35){
return objj_msgSend(renderObject,"marginTop")+objj_msgSend(renderObject,"marginBottom");
}
}),new objj_method(sel_getUid("firstPadding"),function(_37,_38){
with(_37){
return objj_msgSend(renderObject,"paddingTop");
}
}),new objj_method(sel_getUid("secondPadding"),function(_39,_3a){
with(_39){
return objj_msgSend(renderObject,"paddingBottom");
}
}),new objj_method(sel_getUid("shiftComponentsToOrigin:ignoreFlex:"),function(_3b,_3c,_3d,_3e){
with(_3b){
objj_msgSend(renderObject,"shiftNonActiveComponentsToY:ignoreFlex:",_3d,_3e);
}
})]);
var _1=objj_allocateClassPair(GDVerticalLayoutAdaptor,"GDVerticalTableLayoutAdaptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("textSize"),function(_3f,_40){
with(_3f){
return 0;
}
}),new objj_method(sel_getUid("alignment"),function(_41,_42){
with(_41){
return 0;
}
}),new objj_method(sel_getUid("firstPadding"),function(_43,_44){
with(_43){
return 0;
}
}),new objj_method(sel_getUid("secondPadding"),function(_45,_46){
with(_45){
return 0;
}
}),new objj_method(sel_getUid("shiftComponentsToOrigin:ignoreFlex:"),function(_47,_48,_49,_4a){
with(_47){
}
}),new objj_method(sel_getUid("_components"),function(_4b,_4c){
with(_4b){
return objj_msgSend(renderObject,"orderedRows");
}
})]);
var _1=objj_allocateClassPair(GDVerticalLayoutAdaptor,"GDVerticalTableCellLayoutAdaptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("borderSize"),function(_4d,_4e){
with(_4d){
if(!((objj_msgSend(renderObject,"approximatePosition")&GDTableCellPositionOuterBottom)>0)){
return objj_msgSend(renderObject,"borderTopWidth");
}else{
return objj_msgSendSuper({receiver:_4d,super_class:objj_getClass("GDVerticalTableCellLayoutAdaptor").super_class},"borderSize");
}
}
})]);
var _1=objj_allocateClassPair(GDTableStructureElementLayoutAdaptor,"GDTableRowLayoutAdaptor"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isVertical"),function(_4f,_50){
with(_4f){
return YES;
}
}),new objj_method(sel_getUid("_adaptorForRenderObject:"),function(_51,_52,_53){
with(_51){
return objj_msgSend(_53,"createVerticalLayoutAdaptor");
}
})]);
p;10;GDWidget.jt;2555;@STATIC;1.0;i;15;GDModelObject.ji;24;GDWidgetCellDefinition.jt;2487;
objj_executeFile("GDModelObject.j",YES);
objj_executeFile("GDWidgetCellDefinition.j",YES);
var _1=objj_allocateClassPair(GDModelObject,"GDWidget"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("hierarchy"),new objj_ivar("states"),new objj_ivar("type"),new objj_ivar("library"),new objj_ivar("identifier")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("hierarchy"),function(_8,_9){
with(_8){
return hierarchy;
}
}),new objj_method(sel_getUid("setHierarchy:"),function(_a,_b,_c){
with(_a){
hierarchy=_c;
}
}),new objj_method(sel_getUid("states"),function(_d,_e){
with(_d){
return states;
}
}),new objj_method(sel_getUid("setStates:"),function(_f,_10,_11){
with(_f){
states=_11;
}
}),new objj_method(sel_getUid("library"),function(_12,_13){
with(_12){
return library;
}
}),new objj_method(sel_getUid("setLibrary:"),function(_14,_15,_16){
with(_14){
library=_16;
}
}),new objj_method(sel_getUid("identifier"),function(_17,_18){
with(_17){
return identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_19,_1a,_1b){
with(_19){
identifier=_1b;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_1c,_1d,_1e){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("GDWidget").super_class},"initWithCoder:",_1e);
if(_1c==nil){
return nil;
}
name=objj_msgSend(_1e,"decodeObjectForKey:","name");
hierarchy=objj_msgSend(_1e,"decodeObjectForKey:","hierarchy");
objj_msgSend(hierarchy,"setWidget:",_1c);
states=objj_msgSend(objj_msgSend(_1e,"decodeObjectForKey:","states"),"allObjects");
type=objj_msgSend(_1e,"decodeIntForKey:","type");
identifier=objj_msgSend(_1e,"decodeObjectForKey:","identifier");
return _1c;
}
}),new objj_method(sel_getUid("stateWithType:"),function(_1f,_20,_21){
with(_1f){
var _22=states.filter(function(_23){
return objj_msgSend(_23,"type")==_21;
});
if(_22.length==0){
return nil;
}
return _22[0];
}
}),new objj_method(sel_getUid("stateWithIdentifier:"),function(_24,_25,_26){
with(_24){
var _27=states.filter(function(_28){
return objj_msgSend(objj_msgSend(_28,"identifier"),"isEqual:",_26);
});
if(_27.length==0){
return nil;
}
return _27[0];
}
}),new objj_method(sel_getUid("definitionWithIdentifier:"),function(_29,_2a,_2b){
with(_29){
return objj_msgSend(hierarchy,"definitionWithIdentifier:",_2b);
}
})]);
p;24;GDWidgetCellDefinition.jt;4775;@STATIC;1.0;i;15;GDModelObject.jt;4736;
objj_executeFile("GDModelObject.j",YES);
GDWidgetCellDefinitionDictionary={};
var _1=objj_allocateClassPair(GDModelObject,"GDWidgetCellDefinition"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("identifier"),new objj_ivar("orderedComponents"),new objj_ivar("individualContent"),new objj_ivar("container")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("identifier"),function(_8,_9){
with(_8){
return identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_a,_b,_c){
with(_a){
identifier=_c;
}
}),new objj_method(sel_getUid("orderedComponents"),function(_d,_e){
with(_d){
return orderedComponents;
}
}),new objj_method(sel_getUid("setOrderedComponents:"),function(_f,_10,_11){
with(_f){
orderedComponents=_11;
}
}),new objj_method(sel_getUid("individualContent"),function(_12,_13){
with(_12){
return individualContent;
}
}),new objj_method(sel_getUid("setIndividualContent:"),function(_14,_15,_16){
with(_14){
individualContent=_16;
}
}),new objj_method(sel_getUid("container"),function(_17,_18){
with(_17){
return container;
}
}),new objj_method(sel_getUid("setContainer:"),function(_19,_1a,_1b){
with(_19){
container=_1b;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_1c,_1d,_1e){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("GDWidgetCellDefinition").super_class},"initWithCoder:",_1e);
if(_1c==nil){
return nil;
}
name=objj_msgSend(_1e,"decodeObjectForKey:","name");
orderedComponents=objj_msgSend(_1e,"decodeObjectForKey:","orderedComponents");
individualContent=objj_msgSend(_1e,"decodeBoolForKey:","individualContent");
container=objj_msgSend(_1e,"decodeObjectForKey:","container");
identifier=objj_msgSend(_1e,"decodeObjectForKey:","identifier");
GDWidgetCellDefinitionDictionary[identifier]=_1c;
return _1c;
}
}),new objj_method(sel_getUid("definitionWithIdentifier:"),function(_1f,_20,_21){
with(_1f){
if(objj_msgSend(identifier,"isEqual:",_21)){
return _1f;
}
var _22=objj_msgSend(orderedComponents,"objectEnumerator");
var _23=nil;
while(_23=objj_msgSend(_22,"nextObject")){
var d=objj_msgSend(_23,"definitionWithIdentifier:",_21);
if(d!=nil){
return d;
}
}
return nil;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("objectWithIdentifier:"),function(_24,_25,_26){
with(_24){
return GDWidgetCellDefinitionDictionary[_26];
}
})]);
var _1=objj_allocateClassPair(GDWidgetCellDefinition,"GDWidgetRootCellDefinition"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("widget")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("widget"),function(_27,_28){
with(_27){
return widget;
}
}),new objj_method(sel_getUid("setWidget:"),function(_29,_2a,_2b){
with(_29){
widget=_2b;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_2c,_2d,_2e){
with(_2c){
_2c=objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("GDWidgetRootCellDefinition").super_class},"initWithCoder:",_2e);
if(_2c==nil){
return nil;
}
widget=objj_msgSend(_2e,"decodeObjectForKey:","widget");
return _2c;
}
})]);
var _1=objj_allocateClassPair(GDWidgetCellDefinition,"GDEmbeddedWidgetDefinition"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("embeddedWidget")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("embeddedWidget"),function(_2f,_30){
with(_2f){
return embeddedWidget;
}
}),new objj_method(sel_getUid("setEmbeddedWidget:"),function(_31,_32,_33){
with(_31){
embeddedWidget=_33;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_34,_35,_36){
with(_34){
_34=objj_msgSendSuper({receiver:_34,super_class:objj_getClass("GDEmbeddedWidgetDefinition").super_class},"initWithCoder:",_36);
if(_34==nil){
return nil;
}
embeddedWidget=objj_msgSend(_36,"decodeObjectForKey:","embeddedWidget");
return _34;
}
})]);
var _1=objj_allocateClassPair(GDWidgetCellDefinition,"GDTemporaryCellDefinition"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("widget")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("widget"),function(_37,_38){
with(_37){
return widget;
}
}),new objj_method(sel_getUid("setWidget:"),function(_39,_3a,_3b){
with(_39){
widget=_3b;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_3c,_3d,_3e){
with(_3c){
_3c=objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("GDTemporaryCellDefinition").super_class},"initWithCoder:",_3e);
if(_3c==nil){
return nil;
}
widget=objj_msgSend(_3e,"decodeObjectForKey:","widget");
return _3c;
}
})]);
var _1=objj_allocateClassPair(GDWidgetRootCellDefinition,"GDScreenDefinition"),_2=_1.isa;
objj_registerClassPair(_1);
p;22;GDWidgetInstanceCell.jt;4091;@STATIC;1.0;i;19;GDCompositeFigure.ji;21;GDTableLayoutPolicy.ji;24;GDPropertiesDictionary.ji;16;GDEventHandler.jt;3972;
objj_executeFile("GDCompositeFigure.j",YES);
objj_executeFile("GDTableLayoutPolicy.j",YES);
objj_executeFile("GDPropertiesDictionary.j",YES);
objj_executeFile("GDEventHandler.j",YES);
GDRectangleCellType=0;
GDCircleCellType=1;
GDTriangleCellType=2;
var _1=objj_allocateClassPair(GDCompositeFigure,"GDWidgetInstanceCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("statesPropertiesDictionary"),new objj_ivar("definition"),new objj_ivar("definitionIdentifier"),new objj_ivar("eventHandlers")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("definition"),function(_3,_4){
with(_3){
return definition;
}
}),new objj_method(sel_getUid("setDefinition:"),function(_5,_6,_7){
with(_5){
definition=_7;
}
}),new objj_method(sel_getUid("init"),function(_8,_9){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("GDWidgetInstanceCell").super_class},"init");
if(_8==nil){
return nil;
}
eventHandlers={};
return _8;
}
}),new objj_method(sel_getUid("initFromJSONObject:inProject:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("GDWidgetInstanceCell").super_class},"initFromJSONObject:inProject:",_c,_d);
if(_a==nil){
return nil;
}
definitionIdentifier=_c.definition;
definition=objj_msgSend(_d,"definitionWithIdentifier:",_c.definition);
statesPropertiesDictionary=_c.styleProperties;
var _e=nil;
var _f=objj_msgSend(_c.eventHandlers,"objectEnumerator");
while((_e=objj_msgSend(_f,"nextObject"))!=nil){
var _10=objj_msgSend(GDModelObject,"fromJSONObject:inProject:",_e,_d);
eventHandlers[objj_msgSend(_10,"eventType")]=_10;
}
return _a;
}
}),new objj_method(sel_getUid("valueForKey:inStateWithIdentifier:"),function(_11,_12,_13,_14){
with(_11){
var _15=statesPropertiesDictionary[_14];
if(_15){
var _16=gdValueOfPropertyInJSONDictionary(_13,_15);
if(_16!=nil){
return _16;
}
}
var _17=globalCurrentLookAndFeel;
return objj_msgSend(_17,"stylePropertyValueNamed:forHierarchyNodeWithIdentifier:inStateWithIdentifier:",_13,definitionIdentifier,_14);
}
}),new objj_method(sel_getUid("valueForKey:inState:"),function(_18,_19,_1a,_1b){
with(_18){
return objj_msgSend(_18,"valueForKey:inStateWithIdentifier:",_1a,objj_msgSend(_1b,"identifier"));
}
}),new objj_method(sel_getUid("acceptVisitor:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_1e,"visitWidgetInstanceCell:",_1c);
objj_msgSend(orderedComponents,"makeObjectsPerformSelector:withObject:",sel_getUid("acceptVisitor:"),_1e);
}
}),new objj_method(sel_getUid("isTable"),function(_1f,_20){
with(_1f){
var _21=objj_msgSend(_1f,"activeState");
return objj_msgSend(objj_msgSend(_1f,"valueForKey:inState:","layoutPolicyCode",_21),"intValue")==objj_msgSend(GDTableLayoutPolicy,"layoutPolicyCode");
}
}),new objj_method(sel_getUid("cellType"),function(_22,_23){
with(_22){
var _24=objj_msgSend(_22,"activeState");
if(_24==nil){
_24=objj_msgSend(objj_msgSend(_22,"widget"),"normalState");
}
return objj_msgSend(objj_msgSend(_22,"valueForKey:inState:","cellType",_24),"intValue");
}
}),new objj_method(sel_getUid("activeState"),function(_25,_26){
with(_25){
return objj_msgSend(objj_msgSend(_25,"rootInstanceCell"),"activeState");
}
}),new objj_method(sel_getUid("rootInstanceCell"),function(_27,_28){
with(_27){
return objj_msgSend(container,"rootInstanceCell");
}
}),new objj_method(sel_getUid("widget"),function(_29,_2a){
with(_29){
return objj_msgSend(objj_msgSend(_29,"rootInstanceCell"),"widget");
}
}),new objj_method(sel_getUid("currentLookAndFeel"),function(_2b,_2c){
with(_2b){
return globalCurrentLookAndFeel;
}
}),new objj_method(sel_getUid("actions"),function(_2d,_2e){
with(_2d){
var _2f=[];
for(var _30 in eventHandlers){
_2f=_2f.concat(objj_msgSend(eventHandlers[_30],"orderedActions"));
}
return _2f;
}
}),new objj_method(sel_getUid("actionsForEventType:"),function(_31,_32,_33){
with(_31){
var _34=eventHandlers[_33];
if(_34==null){
return objj_msgSend(CPArray,"array");
}
return objj_msgSend(_34,"orderedActions");
}
})]);
p;35;GDWidgetInstanceCellTableCategory.jt;9362;@STATIC;1.0;i;22;GDWidgetInstanceCell.ji;18;NSArrayAdditions.jt;9293;
objj_executeFile("GDWidgetInstanceCell.j",YES);
objj_executeFile("NSArrayAdditions.j",YES);
var _1=objj_allocateClassPair(CPObject,"GDNewTableStructureElement"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("orderedComponents"),new objj_ivar("table")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("orderedComponents"),function(_3,_4){
with(_3){
return orderedComponents;
}
}),new objj_method(sel_getUid("setOrderedComponents:"),function(_5,_6,_7){
with(_5){
orderedComponents=_7;
}
}),new objj_method(sel_getUid("table"),function(_8,_9){
with(_8){
return table;
}
}),new objj_method(sel_getUid("setTable:"),function(_a,_b,_c){
with(_a){
table=_c;
}
}),new objj_method(sel_getUid("initWithTable:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSend(_d,"init");
if(_d==nil){
return nil;
}
table=_f;
orderedComponents=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
return _d;
}
}),new objj_method(sel_getUid("addCell:"),function(_10,_11,_12){
with(_10){
objj_msgSend(orderedComponents,"addObject:",_12);
}
}),new objj_method(sel_getUid("sizeInState:"),function(_13,_14,_15){
with(_13){
objj_msgSend(_13,"subclassResponsibility");
return 0;
}
}),new objj_method(sel_getUid("maximumSizeInState:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_16,"subclassResponsibility");
return 0;
}
}),new objj_method(sel_getUid("minimumSizeInState:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_19,"subclassResponsibility");
return 0;
}
}),new objj_method(sel_getUid("flexPercentageInState:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_1c,"subclassResponsibility");
return 0;
}
}),new objj_method(sel_getUid("resizingModeInState:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_1f,"subclassResponsibility");
return 0;
}
}),new objj_method(sel_getUid("isTableCell"),function(_22,_23){
with(_22){
return NO;
}
}),new objj_method(sel_getUid("originInState:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"subclassResponsibility");
return 0;
}
}),new objj_method(sel_getUid("name"),function(_27,_28){
with(_27){
return "Table Element";
}
})]);
var _1=objj_allocateClassPair(GDNewTableStructureElement,"GDNewTableColumn"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("sizeInState:"),function(_29,_2a,_2b){
with(_29){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","width",_2b),"floatValue");
}
}),new objj_method(sel_getUid("maximumSizeInState:"),function(_2c,_2d,_2e){
with(_2c){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","maximumWidth",_2e),"floatValue");
}
}),new objj_method(sel_getUid("maximumWidthInState:"),function(_2f,_30,_31){
with(_2f){
return objj_msgSend(_2f,"maximumSizeInState:",_31);
}
}),new objj_method(sel_getUid("minimumSizeInState:"),function(_32,_33,_34){
with(_32){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","minimumWidth",_34),"floatValue");
}
}),new objj_method(sel_getUid("minimumWidthInState:"),function(_35,_36,_37){
with(_35){
return objj_msgSend(_35,"minimumSizeInState:",_37);
}
}),new objj_method(sel_getUid("minimumHeightInState:"),function(_38,_39,_3a){
with(_38){
var _3b=0;
for(var i=0;i<objj_msgSend(orderedComponents,"count");i++){
_3b+=objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"objectAtIndex:",i),"valueForKey:inState:","minimumHeight",_3a),"floatValue");
}
return _3b;
}
}),new objj_method(sel_getUid("maximumHeightInState:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=0;
for(var i=0;i<objj_msgSend(orderedComponents,"count");i++){
_3f+=objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"objectAtIndex:",i),"valueForKey:inState:","maximumHeight",_3e),"floatValue");
}
return _3f;
}
}),new objj_method(sel_getUid("flexPercentageInState:"),function(_40,_41,_42){
with(_40){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","flexWidthPercentage",_42),"unsignedIntValue");
}
}),new objj_method(sel_getUid("resizingModeInState:"),function(_43,_44,_45){
with(_43){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","horizontalResizing",_45),"intValue");
}
}),new objj_method(sel_getUid("originInState:"),function(_46,_47,_48){
with(_46){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","x",_48),"floatValue");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("columnForTable:"),function(_49,_4a,_4b){
with(_49){
return objj_msgSend(objj_msgSend(objj_msgSend(_49,"alloc"),"initWithTable:",_4b),"autorelease");
}
})]);
var _1=objj_allocateClassPair(GDNewTableStructureElement,"GDNewTableRow"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("sizeInState:"),function(_4c,_4d,_4e){
with(_4c){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","height",_4e),"floatValue");
}
}),new objj_method(sel_getUid("maximumSizeInState:"),function(_4f,_50,_51){
with(_4f){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","maximumHeight",_51),"floatValue");
}
}),new objj_method(sel_getUid("maximumHeightInState:"),function(_52,_53,_54){
with(_52){
return objj_msgSend(_52,"maximumSizeInState:",_54);
}
}),new objj_method(sel_getUid("minimumSizeInState:"),function(_55,_56,_57){
with(_55){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","minimumHeight",_57),"floatValue");
}
}),new objj_method(sel_getUid("minimumHeightInState:"),function(_58,_59,_5a){
with(_58){
return objj_msgSend(_58,"minimumSizeInState:",_5a);
}
}),new objj_method(sel_getUid("minimumWidthInState:"),function(_5b,_5c,_5d){
with(_5b){
var _5e=0;
for(var i=0;i<objj_msgSend(orderedComponents,"count");i++){
_5e+=objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"objectAtIndex:",i),"valueForKey:inState:","minimumWidth",_5d),"floatValue");
}
return _5e;
}
}),new objj_method(sel_getUid("maximumWidthInState:"),function(_5f,_60,_61){
with(_5f){
var _62=0;
for(var i=0;i<objj_msgSend(orderedComponents,"count");i++){
_62+=objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"objectAtIndex:",i),"valueForKey:inState:","maximumWidth",_61),"floatValue");
}
return _62;
}
}),new objj_method(sel_getUid("flexPercentageInState:"),function(_63,_64,_65){
with(_63){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","flexHeightPercentage",_65),"unsignedIntValue");
}
}),new objj_method(sel_getUid("resizingModeInState:"),function(_66,_67,_68){
with(_66){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","verticalResizing",_68),"intValue");
}
}),new objj_method(sel_getUid("originInState:"),function(_69,_6a,_6b){
with(_69){
return objj_msgSend(objj_msgSend(objj_msgSend(orderedComponents,"firstObject"),"valueForKey:inState:","y",_6b),"floatValue");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("rowForTable:"),function(_6c,_6d,_6e){
with(_6c){
return objj_msgSend(objj_msgSend(objj_msgSend(_6c,"alloc"),"initWithTable:",_6e),"autorelease");
}
})]);
var _1=objj_getClass("GDWidgetInstanceCell");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"GDWidgetInstanceCell\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("orderedRows"),function(_6f,_70){
with(_6f){
if(!objj_msgSend(_6f,"isTable")){
return objj_msgSend(CPArray,"array");
}
var _71=objj_msgSend(CPArray,"array");
var _72=nil;
var _73=objj_msgSend(orderedComponents,"objectEnumerator");
while(_72=objj_msgSend(_73,"nextObject")){
var row=objj_msgSend(GDNewTableRow,"rowForTable:",_6f);
var _74=nil;
var _75=objj_msgSend(objj_msgSend(_72,"orderedComponents"),"objectEnumerator");
while(_74=objj_msgSend(_75,"nextObject")){
objj_msgSend(row,"addCell:",_74);
}
objj_msgSend(_71,"addObject:",row);
}
return _71;
}
}),new objj_method(sel_getUid("orderedColumns"),function(_76,_77){
with(_76){
if(!objj_msgSend(_76,"isTable")){
return objj_msgSend(CPArray,"array");
}
var _78=objj_msgSend(CPArray,"array");
var _79=objj_msgSend(objj_msgSend(_76,"orderedRows"),"firstObject");
for(var i=0;i<objj_msgSend(objj_msgSend(_79,"orderedComponents"),"count");i++){
var _7a=objj_msgSend(GDNewTableColumn,"columnForTable:",_76);
var row=nil;
var _7b=objj_msgSend(objj_msgSend(_76,"orderedRows"),"objectEnumerator");
while(row=objj_msgSend(_7b,"nextObject")){
var _7c=objj_msgSend(objj_msgSend(row,"orderedComponents"),"objectAtIndex:",i);
objj_msgSend(_7a,"addCell:",_7c);
}
objj_msgSend(_78,"addObject:",_7a);
}
return _78;
}
})]);
var _1=objj_getClass("GDWidgetInstanceCell");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"GDWidgetInstanceCell\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("table"),function(_7d,_7e){
with(_7d){
var row=objj_msgSend(_7d,"container");
if(row){
var _7f=objj_msgSend(row,"container");
if(_7f){
if(objj_msgSend(_7f,"isTable")){
return _7f;
}
}
}
return nil;
}
}),new objj_method(sel_getUid("isTableCell"),function(_80,_81){
with(_80){
return objj_msgSend(_80,"table")!=nil;
}
})]);
p;26;GDWidgetInstanceRootCell.jt;975;@STATIC;1.0;i;22;GDWidgetInstanceCell.ji;9;GDState.jt;917;
objj_executeFile("GDWidgetInstanceCell.j",YES);
objj_executeFile("GDState.j",YES);
var _1=objj_allocateClassPair(GDWidgetInstanceCell,"GDWidgetInstanceRootCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("activeState")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initFromJSONObject:inProject:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("GDWidgetInstanceRootCell").super_class},"initFromJSONObject:inProject:",_5,_6);
if(_3==nil){
return nil;
}
activeState=objj_msgSend(_6,"stateWithIdentifier:",_5.activeState);
return _3;
}
}),new objj_method(sel_getUid("activeState"),function(_7,_8){
with(_7){
return activeState;
}
}),new objj_method(sel_getUid("rootInstanceCell"),function(_9,_a){
with(_9){
return _9;
}
}),new objj_method(sel_getUid("widget"),function(_b,_c){
with(_b){
return objj_msgSend(definition,"widget");
}
})]);
p;6;main.jt;267;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;9;NSArray.jt;439;@STATIC;1.0;I;21;Foundation/CPObject.jt;395;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"NSArray"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_5,"decodeObjectForKey:","NS.objects");
}
})]);
var _1=objj_allocateClassPair(NSArray,"NSMutableArray"),_2=_1.isa;
objj_registerClassPair(_1);
p;18;NSArrayAdditions.jt;593;@STATIC;1.0;I;20;Foundation/CPArray.jt;550;
objj_executeFile("Foundation/CPArray.j",NO);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("isEmpty"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"count")==0;
}
}),new objj_method(sel_getUid("firstObject"),function(_5,_6){
with(_5){
return objj_msgSend(_5,"objectAtIndex:",0);
}
}),new objj_method(sel_getUid("secondObject"),function(_7,_8){
with(_7){
return objj_msgSend(_7,"objectAtIndex:",1);
}
})]);
p;9;NSColor.jt;2097;@STATIC;1.0;I;19;Foundation/CPData.jI;16;AppKit/CPColor.jt;2033;
objj_executeFile("Foundation/CPData.j",NO);
objj_executeFile("AppKit/CPColor.j",NO);
var _1=-1,_2=0,_3=1,_4=2,_5=3,_6=4,_7=5,_8=6;
var _9=objj_getClass("CPColor");
if(!_9){
throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_d,"decodeIntForKey:","NSColorSpace"),_f;
switch(_e){
case 1:
case 2:
var rgb=objj_msgSend(_d,"decodeBytesForKey:","NSRGB"),_10=CFData.bytesToString(rgb),_11=objj_msgSend(_10,"componentsSeparatedByString:"," "),_12=[0,0,0,1];
for(var i=0;i<_11.length&&i<4;i++){
_12[i]=objj_msgSend(_11[i],"floatValue");
}
_f=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",_12[0],_12[1],_12[2],_12[3]);
break;
case 3:
case 4:
var _13=objj_msgSend(_d,"decodeBytesForKey:","NSWhite"),_10=CFData.bytesToString(_13),_11=objj_msgSend(_10,"componentsSeparatedByString:"," "),_12=[0,1];
for(var i=0;i<_11.length&&i<2;i++){
_12[i]=objj_msgSend(_11[i],"floatValue");
}
_f=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",_12[0],_12[1]);
break;
case 6:
var _14=objj_msgSend(_d,"decodeObjectForKey:","NSCatalogName"),_15=objj_msgSend(_d,"decodeObjectForKey:","NSColorName"),_16=objj_msgSend(_d,"decodeObjectForKey:","NSColor");
if(_14==="System"){
var _f=null;
if(_15==="controlColor"){
_f=nil;
}else{
if(_15==="controlBackgroundColor"){
_f=objj_msgSend(CPColor,"whiteColor");
}else{
if(!_f){
_f=_16;
}
}
}
}else{
_f=null;
if(!_f){
_f=_16;
}
}
break;
default:
CPLog("-[%@ %s] unknown color space %d",isa,_c,_e);
_f=objj_msgSend(CPColor,"blackColor");
break;
}
return _f;
}
})]);
var _9=objj_allocateClassPair(CPColor,"NSColor"),_a=_9.isa;
objj_registerClassPair(_9);
class_addMethods(_9,[new objj_method(sel_getUid("initWithCoder:"),function(_17,_18,_19){
with(_17){
return objj_msgSend(_17,"NS_initWithCoder:",_19);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_1a,_1b){
with(_1a){
return objj_msgSend(CPColor,"class");
}
})]);
p;8;NSFont.jt;910;@STATIC;1.0;I;15;AppKit/CPFont.jt;872;
objj_executeFile("AppKit/CPFont.j",NO);
var _1=objj_getClass("CPFont");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPFont\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("NS_initWithCoder:"),function(_3,_4,_5){
with(_3){
var _6=NO,_7=objj_msgSend(_5,"decodeObjectForKey:","NSName");
if(_7.indexOf("-Bold")===_7.length-"-Bold".length){
_6=YES;
}
return objj_msgSend(_3,"_initWithName:size:bold:",_7,objj_msgSend(_5,"decodeDoubleForKey:","NSSize"),_6);
}
})]);
var _1=objj_allocateClassPair(CPFont,"NSFont"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"NS_initWithCoder:",_a);
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_b,_c){
with(_b){
return objj_msgSend(CPFont,"class");
}
})]);
p;21;NSMutableDictionary.jt;393;@STATIC;1.0;t;375;
var _1=objj_allocateClassPair(CPObject,"NSMutableDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",objj_msgSend(_5,"decodeObjectForKey:","NS.objects"),objj_msgSend(_5,"decodeObjectForKey:","NS.keys"));
}
})]);
p;17;NSMutableString.jt;279;@STATIC;1.0;t;261;
var _1=objj_allocateClassPair(CPObject,"NSMutableString"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_5,"decodeObjectForKey:","NS.string");
}
})]);
p;7;NSSet.jt;558;@STATIC;1.0;I;21;Foundation/CPObject.jI;18;Foundation/CPSet.jt;491;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPSet.j",NO);
var _1=objj_allocateClassPair(CPObject,"NSSet"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(CPSet,"alloc"),"initWithArray:",objj_msgSend(_5,"decodeObjectForKey:","NS.objects"));
}
})]);
var _1=objj_allocateClassPair(NSSet,"NSMutableSet"),_2=_1.isa;
objj_registerClassPair(_1);
e;