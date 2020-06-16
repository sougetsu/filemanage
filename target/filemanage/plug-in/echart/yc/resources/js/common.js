//var NH_MAP_SERVER_IP="223.84.218.80:6080";
var NH_MAP_SERVER_IP="221.6.106.201:16080";
var NH_MAP_BASE_URL="http://"+NH_MAP_SERVER_IP+"/arcgis/rest/services/";
function closePage() {
	if(!confirm("确定关闭？")){
		return;
	}
	window.close();
}

function isNullOrEmpty(obj){
	if(obj==null||obj==""||obj==undefined){
		return true;
	}else{
		return false;
	}
}