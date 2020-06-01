
//======== 클래스에 on 주기 ======== 
$('.rank_tab a').click(function(){
   $('.rank_tab a').removeClass('on');
   $(this).addClass('on');
});
 
$('.rank_cate a').click(function(){
   $('.rank_cate a').removeClass('on');
   $(this).addClass('on');
});





//======== 랭킹 TAB 클릭 시 ======== 
$('.rank_tab > a').click(function(){
	$(".rank_best div").remove();
	$(".rank_list div").remove();
	$(".rank_empty p").remove();
	var sGenre =$(this).attr("value");
	var date =$(".rank_cate").find("a.on").attr("value");
	//alert("sGenre ="+sGenre);
	//alert("date ="+date);
	rank(sGenre,date);
	return false;
}); 



function rank(sGenre,date) {
	$.ajax({
		type:"GET",
		url:"rank1",
		dataType:"json",
		data:{"sGenre":sGenre,"date":date},
		success:function(data) {
			console.log(data);
			//console.log(data[1].tfShow.sCode);
			//console.log(data[3]);
			console.log(data.length);
			
			if(data.length==0){
				var html="<p style='margin: 50px 0 289px 0;text-align: center;font-size: 30px;color: red;'>공연 정보가 없습니다.</p>";
				$(".rank_empty").append(html);
			} else {
				for(i=0; i<3; i++){
					var html="<div>";
					html+="<a href='${pageContext.request.contextPath}/perform/"+data[i].tfShow.sCode+"'>";
					html+="<img src='"+data[i].tfShow.sPoster+"'>";
					html+="<p class='rlb_tit'>"+data[i].showDetail.showName+"</p>";
					html+="<p class='rlb_sub_tit'>"+data[i].tfShow.sSDate.substring(0,10)
					+" ~ "+data[i].tfShow.sEDate.substring(0,10)+"</br>"+data[i].showDetail.showHallName+"</p>";
					html+="<p class='rankNo'><span>"+(i+1)+"위</span></p>";
					html+="</a>";
					html+="</div>";				
					$(".rank_best").append(html);
				}
				
				
				for(i=3; i<data.length; i++){
					var html="<div>";
					html+="<div class='flu'><p><span>"+(i+1)+"위</span></p></div>";
					html+="<div>";
					html+="<a href='${pageContext.request.contextPath}/perform/"+data[i].tfShow.sCode+"'>";
					html+="<img src='"+data[i].tfShow.sPoster+"'>";
					html+="</div>";				
					html+="<div>";
					html+="<p class='rank_tit'>";
					html+="<a href='${pageContext.request.contextPath}/perform/"+data[i].tfShow.sCode+"'>"+data[i].showDetail.showName+"</a>";
					html+="</p>";
					html+="</div>";				
					html+="<div>";
					html+="<p>"+data[i].tfShow.sSDate.substring(0,10)+" ~ "+data[i].tfShow.sEDate.substring(0,10)+"</br>"+data[i].showDetail.showHallName+"</p>";
					html+="</div>";				
					html+="<div>";
					html+="<p>"+data[i].showDetail.showHallName+"</p>";
					html+="</div>";
					$(".rank_list").append(html);
				}
			}
			
		}, 
		error:function(request,status,error){
	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	    }
	   });
}



//======== 랭킹 TAB 클릭 시 ======== 
$('.rank_cate > a').click(function(){
	$(".rank_best div").remove();
	$(".rank_list div").remove();
	$(".rank_empty p").remove();
	var sGenre =$(".rank_tab").find("a.on").attr("value");
	var date =$(this).attr("value");
	//alert("sGenre ="+sGenre);
	//alert("date ="+date);
	rank1(sGenre,date);
	return false;
}); 


function rank1(sGenre,date) {
	$.ajax({
		type:"GET",
		url:"rank1",
		dataType:"json",
		data:{"sGenre":sGenre,"date":date},
		success:function(data) {
			
			if(data.length==0){
				var html="<p style='margin: 50px 0 289px 0;text-align: center;font-size: 30px;color: red;'>공연 정보가 없습니다.</p>";
				$(".rank_empty").append(html);
			} else {
				for(i=0; i<3; i++){
					var html="<div>";
					html+="<a href='${pageContext.request.contextPath}/perform/"+data[i].tfShow.sCode+"'>";
					html+="<img src='"+data[i].tfShow.sPoster+"'>";
					html+="<p class='rlb_tit'>"+data[i].showDetail.showName+"</p>";
					html+="<p class='rlb_sub_tit'>"+data[i].tfShow.sSDate.substring(0,10)
					+" ~ "+data[i].tfShow.sEDate.substring(0,10)+"</br>"+data[i].showDetail.showHallName+"</p>";
					html+="<p class='rankNo'><span>"+(i+1)+"위</span></p>";
					html+="</a>";
					html+="</div>";				
					$(".rank_best").append(html);
				}
				
				
				for(i=3; i<data.length; i++){
					var html="<div>";
					html+="<div class='flu'><p><span>"+(i+1)+"위</span></p></div>";
					html+="<div>";
					html+="<a href='${pageContext.request.contextPath}/perform/"+data[i].tfShow.sCode+"'>";
					html+="<img src='"+data[i].tfShow.sPoster+"'>";
					html+="</div>";				
					html+="<div>";
					html+="<p class='rank_tit'>";
					html+="<a href='${pageContext.request.contextPath}/perform/"+data[i].tfShow.sCode+"'>"+data[i].showDetail.showName+"</a>";
					html+="</p>";
					html+="</div>";				
					html+="<div>";
					html+="<p>"+data[i].tfShow.sSDate.substring(0,10)+" ~ "+data[i].tfShow.sEDate.substring(0,10)+"</br>"+data[i].showDetail.showHallName+"</p>";
					html+="</div>";				
					html+="<div>";
					html+="<p>"+data[i].showDetail.showHallName+"</p>";
					html+="</div>";
					$(".rank_list").append(html);
				}
			}
			
		}, 
		error:function(request,status,error){
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		}
	});
}





