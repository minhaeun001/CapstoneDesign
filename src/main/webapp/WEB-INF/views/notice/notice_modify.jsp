<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String seqno = request.getParameter("seqno");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_notice_modify</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/script.js"></script>
    <script>

	/******************************************************************************************** 
	 1. 전역변수 선언                               						                              														  
	*********************************************************************************************/ 
	var seqno = "<%=seqno%>";
	
	/******************************************************************************************** 
	 2. 최초 실행 함수                               						                              														  
	*********************************************************************************************/ 
	$(document).ready(function() {
		
		init();
	});
	
	//초기화 작업
	function init(){
		
		fn_SearchDetail();
	}
	
	/******************************************************************************************** 
	 3. ajax 함수                                 						                              														  
	*********************************************************************************************/ 
	// 게시글 상세 페이지 호출
	function fn_SearchDetail() {
		
		var sUrl = "${pageContext.request.contextPath}/notice/notice_view.ajax" ;
		var params = {
				seqno:"<%=seqno%>"
		};
		
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				
				fn_Bind(response);
				
			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
		    }
		});
	}
	
	
	
	function fn_modify(){

		var sUrl = "${pageContext.request.contextPath}/notice/notice_modify.ajax" ;

		var data = new FormData();

		
		data.append( "title", $(".title").val());
		data.append( "contents", $(".contents").val());
		data.append( "category", $("input[name='category']:checked").val());
		data.append("seqno", seqno);

		
		if($("#origin_file_name1").is(":visible") && !$("#origin_file_name2").is(":visible")){
			data.append("data_num","1");
		} else if ($("#origin_file_name1").is(":visible") && $("#origin_file_name2").is(":visible")){
			data.append("data_num","3");
		} else if (!$("#origin_file_name1").is(":visible") && !$("#origin_file_name2").is(":visible")) {
			data.append("data_num","0");
		}
		if($("#origin_file_name2").is(":visible")){
			data.append("data_num","2");
		}
		if($("#file1").is(":visible")){
			data.append( "files", $("#file1")[0].files[0] );	
		}
		if($("#file2").is(":visible")){
			data.append( "files", $("#file2")[0].files[0] );
		}

		
		$.ajax({
			type: 'POST',
			enctype: 'multipart/form-data',
			url: sUrl,
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 60000,
			success: function(response) {
				
				alert("수정되었습니다.");
				location.href='./notice_view.do?seqno='+seqno;
				
			},
			error : function(xhr, error, status) {
				alert("저장 실패");
			},
			complete : function() {}
			
		});
		
	}
	
	function fn_del_file(obj){
		var data_seq = $(obj).attr("data-seq");
		var data_id = $(obj).attr("data-id");
		var data_num = $(obj).attr("data-num");
		var data_filepath = $(obj).attr("data-filepath");
		
		var sUrl = "${pageContext.request.contextPath}/notice/notice_del_file.ajax" ;
		var params = {
				seqno:data_seq,
				data_id:data_id,
				data_num:data_num,
				data_filepath:data_filepath
		};
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				var flag = response.result.flag;
				var msg = response.result.msg;
				
				alert(msg);
				if (flag == "T"){
					//첨부파일 삭제 성공했을 경우
					if (data_num == "1"){
						$("#origin_file_name1").remove();
					} else if (data_num == "2"){
						$("#origin_file_name2").remove();
					}
				}			
			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
		    }
		});
	}
	
	/******************************************************************************************** 
	 4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	*********************************************************************************************/ 
	function fn_Bind(response) {
		
		var title = response.result.TITLE;
		var contents = response.result.CONTENTS;
		var category = response.result.CATEGORY;
		var origin_file_name1 = response.result.ORIGIN_FILE_NAME1;
		var target_file_name1 = response.result.TARGET_FILE_NAME1;
		var file_size1 = response.result.FILE_SIZE1;
		var file_ext1 = response.result.FILE_EXT1;
		var origin_file_name2 = response.result.ORIGIN_FILE_NAME2;
		var target_file_name2 = response.result.TARGET_FILE_NAME2;
		var file_size2 = response.result.FILE_SIZE2;
		var file_ext2 = response.result.FILE_EXT2;
		var file_path = response.result.FILE_PATH;
		
		var seqno = "<%=seqno%>";
		
		$(".notice_title").val(title);
		$(".notice_contents").val(contents);
		$("input[name='category'][value='" + category + "']").prop("checked", true);
		
		var img_path = "<img src='../../img/ico_fileDown_black.png'>";

		if (origin_file_name1 !== null && origin_file_name1 !== undefined && origin_file_name1 !== ""){
			origin_file_name1 = origin_file_name1 + "<button type='button' class='btn_del_file' data-seq='"+seqno+"' data-id='"+target_file_name1+"' data-num='1' data-filepath='"+file_path+"'>삭제</button>";
		
			$("#origin_file_name1").html(img_path);
			$("#origin_file_name1").append(origin_file_name1);
		} else {
			$("#origin_file_name1").hide();
		}
		if (origin_file_name2 !== null && origin_file_name2 !== undefined && origin_file_name2 !== ""){
			origin_file_name2 = origin_file_name2 + "<button type='button' class='btn_del_file' data-seq='"+seqno+"' data-id='"+target_file_name2+"' data-num='2'  data-filepath='"+file_path+"'>삭제</button>";

			$("#origin_file_name2").html(img_path);
			$("#origin_file_name2").append(origin_file_name2);
		} else {
			$("#origin_file_name2").hide();
		}
	}
	
	
	/******************************************************************************************** 
	 5. 기타 함수                            						                              														  
	*********************************************************************************************/ 
	
	
	/******************************************************************************************** 
	 6. 이벤트 함수                            						                              														  
	*********************************************************************************************/ 
	//"저장" 버튼 클릭 시 수정 내용 서버로 전송
	$(document).on("click", ".btn_modify", function(){
	    var radioValue = $("input[name='category']:checked").val();
	    
		if (!radioValue){
			alert("분야를 선택해주세요.");
			return ;
		}
		if ($(".title").val() === "") {
			alert("제목은 필수항목입니다.");
			$(".title").focus();
			return ;
		}
		if ($(".contents").val() === "") {
			alert("분문은 필수항목입니다.");
			$(".contents").focus();
			return ;
		}
		
        fn_modify();
	});
	
	$(document).on("click", ".btn_del_file", function(){
		if(confirm("이 파일을 삭제하시겠습니까?")){
			fn_del_file(this);	
		}	
	});
</script>
</head>

<body>
    <div class="wrap">
	<%@include file="../include/header.jsp" %>
        <div class="main">
            <div class="inner">
                <div class="tit">
                    <h2>NOTICE</h2>
					<p>MAKEGYM 운영팀에서 알려 드립니다.</p>
                </div>
                <div class="baord bd_write">
                    <table class="tb_type2">
                        <colgroup>
                            <col style="width: 18%">
                            <col style="width: *;">
                        </colgroup>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                        <tr>
                            <th>CATEGORY&nbsp;&nbsp;<span class="require">*</span></th>
                            <td>
                                <div class="radioArea">
                                    <span><input type="radio" id="important" name="category" value="10"><label for="important">중요 공지</label></span>
                                    <span><input type="radio" id="normal" name="category" value="20"><label for="normal">일반 공지</label></span>
                                    <span><input type="radio" id="etc" name="category" value="30"><label for="etc">기타</label></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>TITLE&nbsp;&nbsp;<span class="require">*</span></th>
                            <td><input type="text" class="title notice_title" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>CONTENTS&nbsp;&nbsp;<span class="require">*</span></th>
                            <td><textarea name="" id="" class="contents notice_contents"></textarea></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                        	<td colspan="2">
	                        	<span id="origin_file_name1">첨부파일이 없습니다.</span>
		                        <span id="origin_file_name2"></span>
                        	</td>
                        </tr>
                        <tr>
                            <th>FILE</th>
                            <td><input type="file" name="files" id="file1" style="width: 100%"></td>
                        </tr>
                         <tr>
                            <th>FILE</th>
                            <td><input type="file" name="files" id="file2" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                    </table>
                    <div class="btn_area mt70">
                        <button class="btn_blue btn_modify">수정하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body></html>