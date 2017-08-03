// $(document).ready(function(){
// 	$("#votes_change").on("submit",function(event){
// 		event.preventDefault()
// 		form_inputs = $(this).serialize()
// 		$.ajax({
// 			url: "/answers/:answer_id/vote",
// 			method: "post",
// 			data: form_inputs,
// 			dataType: "json",
// 			success: function(data){
// 				$("#upvote").val(
// 					"Upvote " + data.upvote
// 				)
// 			}
// 		})
// 	})
// })