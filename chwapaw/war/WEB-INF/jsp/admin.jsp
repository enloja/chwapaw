<!DOCTYPE html>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/chwapaw/ico/logo.png">
	
    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
<link href="/chwapaw/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
     <link href="/chwapaw/css/chwapaw.css" rel="stylesheet" type="text/css"/>


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
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Welcome Super Admin
				 <!--<img class="profile" src="/chwapaw/ico/profile.jpg" width="40" height="40" id="dropdown" onclick="showMenu();" 
				 class="btn btn-default dropdown-toggle" datatoggle="dropdown"><span id="dropdown" onclick="showMenu();"class="caret"></span> </img> -->
				<button class="btn btn-danger" type="submit">Logout</button>
			</a>
		</li>
			</ul>
			
        </div>
      </div>
    </nav>
    <div  class="container-fluid">
      <div class="row">
        <div id="nav" display="none" class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li  id="profileImg" class="profileImg"><span class="upload-btn"><img class="update" style="display:none" id="update"  src="/chwapaw/ico/camera.png"/><input id="input" type="file" onMouseOut="updateProfile();" onmouseover="updateProfile();" /></span><p><img class="profile" src="/chwapaw/ico/profile.jpg" /></p>
			<li ><p class="name">&nbsp &nbsp Encarnacion Lorry James &nbsp &nbsp <img  onclick="editProfile();" src="/chwapaw/ico/pencil.png" /></p></li>
			</li>
			<li class="active"><a href="index.html">User </a></li>
           <li><a href="<co:url value="/user/list-user.cp"/>"><img src="/chwapaw/ico/users.png" class="icon"> </span> Users <span class="badge">42 </a></li>
			<li><a href="group.html"><img src="/chwapaw/ico/group.png" class="icon">Group<span class="badge">50 </a></li>
            <li><a href="#"><img src="/chwapaw/ico/message.png" class="icon"> Messages <span class="badge">72</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li  class="active"><a href="">Vote</a></li>
           <li><a href="user.html"><img src="/chwapaw/ico/users.png" class="icon"> </span> Users <span class="badge">42 </a></li>
			<li><a href="#"><img src="/chwapaw/ico/group.png" class="icon">Group<span class="badge">50 </a></li>
            <li><a href="#"><img src="/chwapaw/ico/message.png" class="icon"> Messages <span class="badge">72</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a href="">Pools </a></li>
             <li><a href="user.html"><img src="/chwapaw/ico/users.png" class="icon"> </span> Users <span class="badge">42 </a></li>
			<li><a href="#"><img src="/chwapaw/ico/group.png" class="icon">Group<span class="badge">50 </a></li>
            <li><a href="#"><img src="/chwapaw/ico/message.png" class="icon"> Messages <span class="badge">72</a></li>
          </ul>
        </div>		
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h3 class="page-header">HOME</h3>
				<div class="row placeholders">
					<div  class="col-xs-6 col-sm-3 placeholder box">
						<p><img src="/chwapaw/ico/ico_msg.png"></p>
									Messages </br>
						<a href="#">Inbox </a> <span class="badge">32</span></br>
						<a href="#">Sent</a>  <span class="badge">32</span></br>
					</div>
				<div class="col-xs-6 col-sm-3 placeholder box">
					<p><img src="/chwapaw/ico/ic_friends.png"></p>
								Users </br>
					<a href="#">All members</a> <span class="badge">32</span></br>
					<a href="#">Unapprouved</a> <span class="badge">32</span>
				</div>
				<div class="col-xs-6 col-sm-3 placeholder box">
					<p><img src="/chwapaw/ico/ic_poll.png"></p>
								Polls </br>
					<a href="#">All Polls</a>  <span class="badge">58</span></br>
					<a href="#">Reported</a>  <span class="badge">12</span></br>		
				</div>
				<div class="col-xs-6 col-sm-3 placeholder box">
					<p><img src="/chwapaw/ico/ico_msg.png"></p>
								Vote </br>
					<a href="#">All Vote</a>  <span class="badge">32</span></br>
				</div>
				</div>
					<h2 class="sub-header"></h2>
					
			<img class="graphe" src="/chwapaw/ico/preview.png"/>
		</div>
      </div>
	  
	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
       <script src="/chwapaw/js/ie-emulation-modes-warning.js"></script>
	<script src="/chwapaw/js/holder.js"></script>
	<script src="/chwapaw/js/jquery.js"></script>
	<script src="/chwapaw/js/dropdown.js"></script>
	<script src="/chwapaw/js/tooltip.js"></script>
	<script src="/chwapaw/js/tab.js"></script> 
	<script src="/chwapaw/js/main.js"></script> 
	<script src="/chwapaw/js/jquery.flot.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
