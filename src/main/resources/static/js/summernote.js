/**
 * 
 */
 
 	function summernotInit(selector, code){
	 	//summernote
	$("#"+selector).summernote({
		height:400,
		placeholder:'내용을 입력하세요',
		callbacks: {
			onImageUpload:function(files){
				//files upload한 이미지 파일객체
				let formData = new FormData();
				formData.append("files", files[0]);
				console.log($(":file"));
				console.log($(".note-image-input").val())
				// /board/summerFileUpload
  	 			$.ajax({
					type:"POST",
					url:"./summerFileUpload",
					data:formData,
					contentType:false,
					processData:false,
					success:function(data){
						//$("input:first-child").val('');
						$(".note-image-input").val('')
						//$(":file").val('');
						//$("[type=file]").remove();
						//formData.delete("files");
						//console.log(formData.get("file").name);
						
						//$(".filess").replaceWith($(".filess").clone(true));
						
						
						$("#"+selector).summernote('editor.insertImage', data.trim());
					}
					
				});  
				
			},//onImageUpload 끝
			onMediaDelete:function(files){
				let fileName = $(files[0]).attr("src");
				console.log(fileName);
				$.ajax({
					type:"GET",
					url: "./summerFileDelete",
					data:{
						fileName:fileName
					},
					success:function(data){
						console.log(data);
					}
				});
			}//onMediaDelete 끝
		}
	});
	
		$("#"+selector).summernote('code', code);
	}
 
	

