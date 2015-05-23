<!DOCTYPE html>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/chwapaw/ico/chwapaw.jpg">

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
            <li  id="profileImg" class="profileImg"><span class="upload-btn"><img class="update" style="display:none" id="update"  src="/chwapaw/ico/camera.png"/><input id="input" type="file" onMouseOut="updateProfile();" onmouseover="updateProfile();" /></span><p><img class="profile" src="/chwapaw/ico/profile.jpg" /></p>
			<li ><p class="name">&nbsp &nbsp Encarnacion Lorry James &nbsp &nbsp <img  onclick="editProfile();" src="/chwapaw/ico/pencil.png" /></p></li>
			</li>
			<li class="active"><a href="index.html">User </a></li>
			<li class="selected"><a href="user.html"><img src="/chwapaw/ico/users.png" class="icon"> </span> Users <span class="badge">42 </a></li>
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
	   
	  <h3 class="sub-header">Users(${nbr_users}) ${success}</h3>
          <div class="col-lg-12">
		<ul class="pagination">
			<li class="previous"><a href="#"><span class="glyphicon glyphicon-backward"></span></a></li>
			<li><a href="#"><<</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">of</a></li>
			<li><a href="#">10</a></li>
			<li><a href="#">>></a></li>
			<li class="next"><a href="#"><span class="glyphicon glyphicon-forward"></span></a></li> 
			<li class="previous"><a href="<co:url value="/user/create.cp"/>"><span class="glyphicon glyphicon-saved"></span>&nbsp Add</a></li>
			<li class="previous"><a href="#"><span class="glyphicon glyphicon-filter"></span>&nbsp Find</a></li>
		</ul>
		<div>
		
			
			
         
		  
          <div class="table-responsive">
            <table class="table table-striped" >
              <thead>
                <tr bgcolor="#d43434">
				  <th>Photo</th>
				   <th>Username*</th>
                  <th>First_name</th>
                  <th>Last_name</th>
                  <th>Gender</th>
                   <th>Status</th>
				  <th colspan=2 align="right">Action</th>
                </tr>
              </thead>
              <tbody>
              	<co:forEach items="${listUser}" var="u">
				<tr>
                  <td>
                  	<p>
                  		<img class="icon" src="/chwapaw/ico/profile.jpg"/>
                  	</p>
                  </td>
                  <td>
                  	<co:out value="${u.username}"/>
                  </td>
                  <td>
                  	<co:out value="${u.person.firstname}"/>
                  </td>
                  <td>
                  	<co:out value="${u.person.lastname}"/>
                  </td>
                  <td>
                  	<co:out value="${u.person.gender eq 'm'? 'Masculin': 'Feminin'}"/>
                  </td>
                  <td>
                  	<co:out value="${u.status eq '1'? 'Actif': 'Inactif'}"/>
                  </td>
				  <td>
				  	<a href="javascript:go('edit.cp?uuid=${u.uuid}');">
				  		<img src="/chwapaw/ico/edit.png" width="16" height="16">
				  	</a>	
				  </td>
				  <td>
				  	<a href="javascript:rmv('remove.cp?uuid=${u.uuid}', '<ft:message key="chwapaw.remove.obj"/>');">
				  		<img src="/chwapaw/ico/delete.png" width="16" height="16">
				  	</a>
				  </td>
				
                </tr>  
                </co:forEach>              
              </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="/chwapaw/js/ie-emulation-modes-warning.js"></script>
	<script src="/chwapaw/js/holder.js"></script>
	<script src="/chwapaw/js/jquery.js"></script>
	<script src="/chwapaw/js/dropdown.js"></script>
	<script src="/chwapaw/js/tooltip.js"></script>
	<script src="/chwapaw/js/tab.js"></script> 
	<script src="/chwapaw/js/chwapaw.js"></script> 
  </body>
</html>
