<%@ include file="/WEB-INF/jsp/include.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
     <link href="/chwapaw/css/chwapaw.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="/chwapaw/ico/chwapaw.jpg">

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->

	<link href="/chwapaw/css/bootstrap.css" rel="stylesheet">


    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
 

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button onclick="showIcon();" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
         <a href="index.html"><img class="logo" src="/chwapaw/ico/chwapaw.jpg"/></a>
        </div>
      </div>
    </nav>

	<div class="login">    
        <form method="POST" action="/chwapaw/j_spring_security_check">
			<div class="user-icon-container"><img class="icon128" src="/chwapaw/ico/chwapaw.jpg"/></div>
			 <table>
				<tr>
					<td>
						<h4>&nbsp &nbsp &nbsp &nbsp &nbsp PLEASE SIGN IN</h4>
					</td>
				</tr>
				<tr >
					<td></td>
				</tr>
				<tr>
					<td>
						<div class="input-group col-lg-3">
					<span class="input-group-addon"><img src="/chwapaw/ico/mail.png"/></span>
					<input type="text" name="j_username" id="j_username" maxlength="30" tabindex="1" class="form-control" placeholder="${username}" autofocus/>
					</div>
					</td>
				</tr>
				<tr>
					<td>
					&nbsp
					</td>
				</tr>
				<tr>
					<td>
					<div class="input-group col-lg-3">
					<span class="input-group-addon"><img src="/chwapaw/ico/password.jpg"/></span>
					<input type="password" name="j_password" id="j_password" class="form-control" maxlength="30" tabindex="2" placeholder="${password}"/>
					</div>
					</td>
				</tr>
				<tr style="${empty error?'display:none':'display:inline'}">
						<td class="error"><co:out value="${error}"/></td>
				</tr>
				<tr>
					<td>
						&nbsp
					</td>
				</tr>
				<tr>
					<td>
						<input id="submit" type="submit" value="Connect" tabindex="4">
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"  id="r" tabindex="3"><label for="r">Remember me</label>&nbsp<a href="#">Forgot Your Password?</a></td>
				</tr>
			</table>		
		</form>
    </div>
	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
