$(document).ready(function(){
	// $("#votes_change").on("submit",function(event){
	// 	event.preventDefault();
	// 	form_inputs = $(this).serialize()
	// 	$.ajax({
	// 		url: $(this).attr("action"),
	// 		method: "post",
	// 		data: form_inputs,
	// 		dataType: "json",
	// 		success: function(data){
	// 			$("#upvote").val(
	// 				"Upvote " + data.upvote
	// 			)
	// 		}
	// 	})
	// })
	console.log("hi")
	$("#master").on("mouseenter",function(event){
		$(this).css({"color": "initial","background-color": "white"});
	})
	$("#master").on("mouseleave",function(event){
		$(this).css({"color": "purple","background-color": "black"});
	})
})