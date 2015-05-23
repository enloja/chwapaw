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
    <link href="/chwapaw/css/chwapaw.css" rel="stylesheet">

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
			class="btn btn-default dropdown-toggle" datatoggle="dropdown"><span id="dropdown" onclick="showMenu();"class="caret"></span> </img>-->
			<button class="btn btn-danger" type="submit">Logout</button>
			</a></li>
          </ul>
        </div>
      </div>
    </nav>


    <div  class="container-fluid">
       <div class="row">
        <div id="nav" display="none" class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li  id="profileImg" class="profileImg"><span class="upload-btn"><img class="update" style="display:none" id="update"  src="/chwapaw/ico/camera.png"/><input id="input" type="file" onMouseOut="updateProfile();" onmouseover="updateProfile();" /></span><p><img class="profile" src="/chwapaw/ico/profile.jpg" /></p></li>
			<li ><p class="name">&nbsp &nbsp Encarnacion Lorry James &nbsp &nbsp <img  onclick="editProfile();" src="/chwapaw/ico/pencil.png" /></p></li>
			</li>
			<li class="active"><a href="index.html">User </a></li>
           <li><a href="user.html"><img src="/chwapaw/ico/users.png" class="icon"> </span> Users <span class="badge">42 </a></li>
			<li class="selected"><a href="group.html"><img src="/chwapaw/ico/group.png" class="icon">Group<span class="badge">50 </a></li>
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
		
     
		
	 
	  <div class="col-sm-9 col-sm-offset-3 col-md-8 col-md-offset-4 main">
 			<fm:form modelAttribute="user" method="POST" action="save.cp" class="form-horizontal col-lg-6">
				<div class="form-group">
					<legend>Save User </legend>
					<fm:errors name="user" cssClass="error"/>
				</div>
				<div class="row">
					<div class="form-group">
						<fm:label path="person.firstname" class="required col-lg-3" ><ft:message key="chwapaw.firstname"/></fm:label>
							<div class="col-lg-9">
								<fm:input path="person.firstname" tabindex="1" maxlength="60" class="form-control"/>
								<fm:hidden path="uuid"/>
							</div>
							
					</div>
					
				</div>
				<div class="row">
					<div class="form-group">
						<fm:label path="person.lastname" class="required col-lg-3" ><ft:message key="chwapaw.lastname"/></fm:label>
							<div class="col-lg-9">
								<fm:input path="person.lastname" tabindex="2" maxlength="60" class="form-control"/>
							</div>
							
					</div>
					<div class="row">
					<div class="form-group">
					<ft:message key="chwapaw.male" var="male"/> <ft:message key="chwapaw.female" var="female"/>
					<fm:label path="person.gender" class="required col-lg-3"><ft:message key="chwapaw.gender"/></fm:label>
							<div class="col-lg-9">
							<fm:select path="person.gender" class="form-control" tabindex="3">
								<fm:option value="0" label=""/>
								<fm:option value="m" label="${male}"/>
								<fm:option value="f" label="${female}"/>
							</fm:select>
							</div>							
					</div>
					
				</div>	
				
				<div class="row">
					<div class="form-group">
						<fm:label path="username" class="required col-lg-3" ><ft:message key="chwapaw.username"/></fm:label>
							<div class="col-lg-9">
								<fm:input path="username" tabindex="4" maxlength="60" class="form-control"/>
							</div>
							
					</div>
					
				</div>
				<div class="row">
					<div class="form-group">
						<fm:label path="password" class="required col-lg-3" ><ft:message key="chwapaw.password"/></fm:label>
							<div class="col-lg-9">
								<fm:input path="password" type="password" tabindex="5" maxlength="60" class="form-control"/>
							</div>							
					</div>
					
						<div class="row">
					<div class="form-group">
						<label for="passwordConfirm" class="required col-lg-3" ><ft:message key="chwapaw.password"/></label>
							<div class="col-lg-9">
								<input type="password" id="passwordConfirm" tabindex="6" maxlength="60" class="form-control"/>
							</div>
							
					</div>
					
					
					<div class="row">
					<div class="form-group">
						<fm:label path="email" class="required col-lg-3" ><ft:message key="chwapaw.email"/></fm:label>
							<div class="col-lg-9">
								<fm:input path="email" tabindex="7" maxlength="60" class="form-control"/>
							</div>
							
					</div>
					
					<div class="form-group">
					<ft:message key="chwapaw.english" var="en"/><ft:message key="chwapaw.french" var="fr"/>
					<ft:message key="chwapaw.creole" var="kr"/>
						<fm:label path="language" class="required col-lg-3" ><ft:message key="chwapaw.language"/></fm:label>
							<div class="col-lg-9">
							<fm:select path="language" tabindex="8" maxlength="60" class="form-control">
								<fm:option value="0" label=""/>
								<fm:option value="en" label="${en}"/>
								<fm:option value="fr" label="${fr}"/>
								<fm:option value="kr" label="${kr}"/>
							</fm:select>
							</div>
							
					</div>
					
					<div class="form-group">
						<fm:label path="image.path" class="required col-lg-3" ><ft:message key="chwapaw.image"/></fm:label>
							<div class="col-lg-9">
								<fm:input path="image.path" tabindex="9" maxlength="60" class="form-control"/>
							</div>
							
					</div>
					
				</div>
				<div class="form-group">
					<button class="pull-right btn btn-default">Envoyer</button>
				</div>
			</fm:form>
       
		  </div>
		    
       <!-- <form class="col-lg-6">
			<legend>L�gende</legend>
				<div class="form-group">
					<label for="texte">First Name : </label>
					<input id="text" type="text" class="form-control">
				</div>
				<div class="form-group">
					<label for="texte">Last Name : </label>
					<input id="text" type="text" class="form-control">
				</div>
				<div class="form-group">
					<label for="texte">Email : </label>
					<input id="text" type="text" class="form-control">
				</div>
				<div class="form-group">
					<label for="texte">Password : </label>
					<input id="text" type="text" class="form-control">
				</div>
				<div class="form-group">
					<label for="texte">Confirm Password : </label>
					<input id="text" type="text" class="form-control">
				</div>
				<button>Envoyer</button>
		</form>-->
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
  </body>
</html>

