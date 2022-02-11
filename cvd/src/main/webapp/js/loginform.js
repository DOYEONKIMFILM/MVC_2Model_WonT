
$(document)
	.ready(function() {
		login();
	})
	;

function login_Exce() {
	let phoneNumber = $("#phoneNumber").val();
	let password = $("#password").val();

	if (phoneNumber == "") {
		alert("휴대폰번호를 입력해주세요.");
		return false;
	}

	if (password == "") {
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	else {
		$.ajax({
			url: "login.do",                 // url: .do, 폴더명/파일명(jsp)
			type: "post",					 // get, post 방식
			data: { phoneNumber: phoneNumber, password: password }, // 넘겨줄 값 [  넘겨줄 매개변수 변수명:값   ]
			dataType: "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data) {
				let temp = data.split(",");
				console.log(data, temp);

				if (temp[0] != "0") {
					alert("휴대전화와 비밀번호를 확인하세요.");
					return false;

				} else {
					alert(temp[2] + "님이 로그인하였습니다.");
					location.href = "main.do"
				}
			},
			error: function(jqXHR) { console.log("error"); }
		});

		return false;
	}
}

/*function join_Exce() {
	let name = $("#name").val();
	let birthday = $("#birthday").val();
	let gender = $("#gender").val();
	let phoneNumber = $("#phoneNumber").val();
	let password = $("#password").val();
	let address = $("#address").val();
	let startDate = $("#startDate").val();
	let authority = $("#authority").val();

	if (name == "") {
		alert("이름을 입력해주세요.");
		return false;

	} if (birthday == "") {
		alert("생년월일을 입력해주세요.");
		return false;

	} if (gender == "") {
		alert("성별을 입력해주세요.");
		return false;

	} if (phoneNumber == "") {
		alert("휴대폰번호를 입력해주세요.");
		return false;

	} if (password == "") {
		alert("비밀번호를 입력해주세요.");
		return false;

	} if (address == "") {
		alert("주소를 입력해주세요.");
		return false;
		
	} else {
		$.ajax({
			url: "join.do",
			type: "post",
			data: { name: name, birthday: birthday, gender: gender,  phoneNumber: phoneNumber, password: password, address: address, startDate: startDate, authority: authority },
			dataType: "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data) {
				let temp = data.split(",");
				console.log(data, temp);
				
				alert(temp[2] + "님 재택치료자로 등록되었습니다.");
				location.href = "main.do"
			},
			error: function(jqXHR) { console.log("error"); }
		});

		return false;
	}
}*/

function login() {
	$("#divLogin").css("display", "block");
	$("#frm").css("display", "none");
	$("#btn").css("left", "20px");
}

function register() {
	$("#divLogin").css("display", "none");
	$("#frm").css("display", "block");
	$("#btn").css("left", "205px");
}