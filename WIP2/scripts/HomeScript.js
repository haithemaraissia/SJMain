
var flashvars = {};
flashvars.cssSource = "piecemaker.css";
flashvars.xmlSource = "piecemaker.xml";
var params = {};
params.play = "true";
params.menu = "false";
params.scale = "showall";
params.wmode = "transparent";
params.allowfullscreen = "true";
params.allowscriptaccess = "always";
params.allownetworking = "all";
swfobject.embedSWF('piecemaker.swf', 'piecemaker', '540', '525', '10', null, flashvars,
      params, null);
