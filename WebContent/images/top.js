function realtime()
{
	var com=document.getElementById("time");
	var date=new Date();
	var year=date.getFullYear();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var hour=date.getHours();
	var min=date.getMinutes();
	var second=date.getSeconds();
	
	com.innerHTML="现在的时间是"+year+"年"+month+"月"+day+"日"+hour+":"+min+":"+second;
	
	setTimeout('realtime()',1000);
	
}