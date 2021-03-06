<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>LiveStockTrading Login</title>
    <link rel="stylesheet" href="gen.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
	</script>
    <script type="text/javascript">
// <!CDATA[

function login_onclick() {
	console.log("login");
	if(document.myForm.username.value == ""){
	    alert("Username Can Not Be Null!");
	    return;
	}
	if(document.myForm.password.value == ""){
		alert("Password Can Not Be Null!");
		return;
	}
	console.log("login end");
	javascript:myForm.submit();
}

function register_customer_onclick() {
    window.open("register_customer","_self");

}

function register_employee_onclick() {
    window.open("register_employee","_self");

}

function cancel_onclick() {
    document.myForm.username.value = "";
   	document.myForm.password.value = "";

}

function help_onclick() {
    window.open("main_help","_self");

}

// ]]>
</script>
 </head>

<body>
	<jsp:include page="_index_header.jsp"></jsp:include>
	
	<div class="body" align="center">
		<h1>Login</h1>
		<button class="btn-default" onclick="return register_customer_onclick()">Register: Customer</button>
		<button class="btn-default" onclick="return register_employee_onclick()">Register: Employee</button>
		<div class="clear-fix"></div>
		<div class = "form-class">
		<form id="myForm" name="myForm" action="doLogin" method="post">
			<table>
				<tr>
					<td><span class="formlabel">Username:</span></td>
					<td><input class="forminput" id="usrn" name="username" type="text" value="${user.username}"/ required></td>
				</tr>
				<tr>
					<td><span class="formlabel">Password:</span></td>
					<td><input class="forminput" id="pw" name="password" type="password" value="${user.password}"/ required></td>
				</tr>
			</table>
			<button value="Login" class="btn-main" id="login" onclick="return login_onclick()">Login</button>
			<button class="btn-main" onclick="return cancel_onclick()">Cancel</button>
		</form>
		</div>
		<button class="btn-default" onclick="return help_onclick()">Help</button>
	</div>
	
	<div class="footer">
	<p>We herd you loud and clear. You are ready to take the stock market by the horns.</p>
	<p>That's udderly brilliant! Don't make a misteak, trade with LiveStock&copy;!</p>
</div>
</body>
</html>