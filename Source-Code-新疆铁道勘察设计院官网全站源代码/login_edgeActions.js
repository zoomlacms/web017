
(function($,Edge,compId){var Composition=Edge.Composition,Symbol=Edge.Symbol;
//Edge symbol: 'stage'
(function(symbolName){Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",15010,function(sym,e){window.open("/index.shtml","_self");});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_Text}","click",function(sym,e){sym.play(0);});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_Text2}","click",function(sym,e){sym.play(2000);});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_Text2Copy}","click",function(sym,e){sym.play(5000);});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_Text2Copy2}","click",function(sym,e){sym.play(8000);});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_Text2Copy3}","click",function(sym,e){sym.play(11000);});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_banners2}","click",function(sym,e){window.open("/index.shtml","_self");});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_banners}","click",function(sym,e){window.open("/index.shtml","_self");});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_banners1}","click",function(sym,e){window.open("/index.shtml","_self");});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_banners3}","click",function(sym,e){window.open("/index.shtml","_self");});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_banners4}","click",function(sym,e){window.open("/index.shtml","_self");});
//Edge binding end
})("stage");
//Edge symbol end:'stage'
})(jQuery,AdobeEdge,"EDGE-30155283");