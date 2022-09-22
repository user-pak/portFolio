<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hello WebSocket</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the chat form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
/*   position: fixed; */
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup chat - hidden by default */
.chat-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px; 
  padding: 10px;
  background-color: white;
}

/* Full-width textarea */
.form-container textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
  resize: none;
  min-height: 200px;
}

/* When the textarea gets focus, do something */
.form-container textarea:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/send button */
.form-container .btn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100px;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
</head>
<body>

<h2>STOMP 웹소켓 메시징</h2>
<p>해당 버튼을 클릭하면 입력창이 열리고 서버로부터 받은 메시지를 보여줍니다</p>
<div class="row">
<button id="connectQuestion" class="open-button" onclick="openForm()" type="submit">질문하기</button>
<button id="connectChat" class="open-button" onclick="openForm()" type="submit">채팅하기</button>
</div>
    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th style="text-align:left">대화창</th>
                </tr>
                </thead>
                <tbody id="greetings">
                </tbody>
            </table>
        </div>
    </div>
  

<div class="chat-popup" id="myForm">
  <form class="form-container">
    <h1>입력창</h1>

    <label for="msg"><b>메시지를 입력하고 '보내기'버튼을 클릭합니다</b></label><br>
    <div id="chat_name_div"><label>대화명 : </label><input type="text" id="chat_name" name="chatName"></div>
    <textarea placeholder="메시지를 입력하세요" id="clientMessage"></textarea>

    <button id="send" type="submit" class="btn">보내기</button>
    <button id="disconnect" type="submit" class="btn cancel" disabled ="disabled" onclick="closeForm()">닫기</button>
  </form>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
function openForm() {
	  document.getElementById("myForm").style.display = "block";
	}

	function closeForm() {
	  document.getElementById("myForm").style.display = "none";
	}
	$(function() {
		var stompClient = null;
		var status = "undefined";
		function setConnected(connected) {
		    $("#connect").prop("disabled", connected);
		    $("#disconnect").prop("disabled", !connected);
		    if (connected) {
		        $("#conversation").show();
		    }
		    else {
		        $("#conversation").hide();
		    }
		    $("#greetings").html("");
		}

		function connectChat() {
			document.getElementById("chat_name_div").style.display = "block";
		    if (stompClient !== null) {
		        stompClient.disconnect();
		    }
		    var socket = new SockJS('/portfolio/gs-guide-websocket');
		    stompClient = Stomp.over(socket);
		    stompClient.connect({}, function (frame) {
		        setConnected(true);
		        console.log('Connected: ' + frame);
		        stompClient.subscribe('/topic/greetings', function (echoing) {
		        	console.log(echoing.body);
		        	$("#chat_name").prop("disabled",true);
					showEchoing(echoing);
		        });
		    });
		    status = "chat";
		}
		function connectQuestion() {
			document.getElementById("chat_name_div").style.display = "none";
		    if (stompClient !== null) {
		        stompClient.disconnect();
		    }
		    var socket = new SockJS('/portfolio/gs-guide-websocket');
		    stompClient = Stomp.over(socket);
		    stompClient.connect({}, function (frame) {
		        setConnected(true);
		        console.log('Connected: ' + frame);
		        stompClient.subscribe("/user/queue/errors", function(answer) {
		            console.log("Error " + answer.body);
		        });
		        stompClient.subscribe("/user/queue/questions", function(answer) {
		            showAnswer(answer);
		        });
		    }, function(error) {
		       console.log("STOMP error " + error);
		    });     
		    status = "question";
		}
	
		function disconnect() {
		    if (stompClient !== null) {
		        stompClient.disconnect();
		    }
		    setConnected(false);
		    console.log("Disconnected");
		}

		function sendName() {
		    stompClient.send("/app/hello", {}, JSON.stringify({'chatName':$("#chat_name").val(),'clientMessage': $("#clientMessage").val()}));
		    $("#clientMessage").val("");
		}

		function showEchoing(echoing) {
		    $("#greetings").append("<tr><td>" + JSON.parse(echoing.body).chatName + ":" + JSON.parse(echoing.body).clientMessage + "</td></tr>");
		}
		
 		function sendQuestion() {
			stompClient.send("/app/knockknock", {}, JSON.stringify({'clientMessage': $("#clientMessage").val()}));
    		$("#clientMessage").val("");
		} 
		function showAnswer(answer) {
		    $("#greetings").append("<tr><td>" + JSON.parse(answer.body).clientMessage + "</td></tr>").append("<tr><td>" + JSON.parse(answer.body).serverMessage + "</td></tr/>");
		}


		$(function () {
		    $("form").on('submit', function (e) {
		        e.preventDefault();
		    });
 		    $( "#connectQuestion" ).click(function() { connectQuestion(); }); 
 		    $( "#connectChat").click(function() {connectChat();});
		    $( "#disconnect" ).click(function() { disconnect(); });
		    $( "#send" ).click(function() {
		    	console.log(status);
		    	if(status == "chat") {
		    		sendName();
		    	}
		    	else if(status == "question") {
		    		sendQuestion();
		    	}
		    });
		 })
		    

	})
</script>
</html>