function checkPasswordMatch() {
    var password = $("#password").val();
    var confirmPassword = $("#confirmPassword").val();

    if (password != confirmPassword){
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    	$("#divCheckPasswordMatch").css("color","Red"); }
    else{
        $("#divCheckPasswordMatch").html("Passwords matched!");
    	$("#divCheckPasswordMatch").css("color","Green");
    }
}

$(document).ready(function () {
   $("#password, #confirmPassword").keyup(checkPasswordMatch);
   
//   $('#email').keyup(function ()
//		    {
//	   
//		        $.ajax({
//		            type: "get",
//		            url: "/test",
//		            data: "email=" +$('#email').val(),
//		            success: function(msg){      
//		            	console.log("I am here outside" +msg);
//		                    $('#output').html(msg);
//		                    if(msg.includes("Email Not Available")){
//		                    	console.log("I am here");
//		                    	document.getElementById("output").style.color="Red";
//		                    	//document.getElementById("mySubmit").style.backgroundColor="Red";
//		                    	//document.getElementById("mySubmit").style.borderColor="Red";
//		                    	//document.getElementById("mySubmit").disabled = true;
//		                }else{
//		                	document.getElementById("output").style.color="Green";
//		                	//document.getElementById("mySubmit").disabled = false;
//		                	//document.getElementById("mySubmit").style.backgroundColor="#62C192";
//		                	//document.getElementById("mySubmit").style.borderColor="#62C192";
//
//		                }
//		            }
//		        });
//		    });
   
});

function encodeImageFileAsURL(element) {
    var file = element.files[0];
    var reader = new FileReader();
    reader.onloadend = function() {
        console.log('RESULT', reader.result)
        sessionStorage.setItem("imageSrc",reader.result);
        document.getElementById('defaultValue').src=sessionStorage.getItem('imageSrc');
    }
    reader.readAsDataURL(file);
}
