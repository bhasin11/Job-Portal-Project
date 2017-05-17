<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Register Here!</title>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/company-registration.js"></script>
	<script src="${pageContext.request.contextPath}/js/login-validation.js"/></script>   
	<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"> 
	<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script>
	   $(document).ready(function(){
	       $('#myTable').dataTable();
	   });
   </script>
<style>

	
    
    

body{
	background-color: white;
	background-image: url("1.jpg");
}

.head{
	height: 80px;
	background-color: #62C192;
}

.rounder{
	border-radius: 50%;
}

.field{
	background: #f2f5f6;
	border-style: none;
	border-bottom-style: solid;
	border-bottom-width: .5px;
	border-bottom-color: #62C192;
}

.field:focus {
  border-color: #62C192;
  box-shadow: #62C192;  
}

.btn1{
	background-color: #62C192;
	border-color: #62C192;
	margin-left: 70px;
}

.btn1: hover{
	background-color: #62C192;
	border-color: #62C192;
}

h1{
	margin-left: 520px;
}

#error{
	text-align: middle;
}
html,
body{
margin:0;
padding: 0;
backhround: #f2f5f6;
}

.btn1{
	background: #62C192;
}

.nv{
	background-color: black!Important;
}

.wh{
	color: white!Important;
}

.ack{
	margin-left: 30%;
}

.sidebar{
	background-color: yellow;
	height: 400px;
	width: 100%;
}

.dp{
	margin-top: 30px;
	margin-left: 33%;
	border-radius: 50%;
}

.comp{
	font-size: 14px;
}

.outer{
	margin-top: 60px;
}

.name{
	text-align: center;
  	margin: 0 auto;
	width: 250px;
	margin-top: 10px;
}

.data{
	margin-left: 100px;
    min-width: 100%;
    width: 657px;
}

.desc{

}

.item{
	height: 290px;
	min-height: 100px;
	width: 100%;
	background-color: #f2f5f6;
	margin-left: 5px;
	margin-top: 10px;
}

.cl{
	width: 69px;
	height: 69px;
	border-radius: 50%;
	margin-left: 8px;
	margin-top: 8px;
}

.headd{
	float: left;
}

</style>

</head>
<body>

<nav class="navbar navbar-toggleable-md navbar-light bg-faded nv" style="height: 70px">
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="container">
	  <a class="navbar-brand wh" href="#">Spring Onions</a>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav ml-auto">
	      
	      <li class="nav-item active dropdown">
	        <a class="nav-link dropdown-toggle wh" data-toggle="dropdown">
	          My Account
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" href="/jobseeker/register">View Profile</a>
	          <a class="dropdown-item" href="/company/register">View Job History</a>
	          <a class="dropdown-item" href="/company/register">Edit Profile</a>
	        </div>
	      </li>
	      
	       <li class="nav-item active">
	        <a class="nav-link mr-sm-2 wh" href="/jobseeker/logout">Log Out <span class="sr-only">(current)</span></a>
	      </li>
	    </ul>
	  </div>
</div>

</nav>

	<div class="row outer">
	
	<div class="col-md-1"></div>
	<div class="col-md-2 sidebar" style="text-align">
		<!-- side bar for profile review -->
		<img class="img-responsive dp" src="${picture}" width="34%">
	
		<div class="name"><p>${firstName} ${lastName}</div>
		<div class="name">${selfIntroduction}</div>
	</div>
	<div class="col-md-7">
	<!-- job card section -->
	
		<table id="myTable" class="table">
	 		<thead>
				<tr>
		      		<th>Popular Jobs</th>
		    	</tr>
		    </thead>
		    
			<c:forEach items="${topJobs}" var="topJobValue">
	  	    <tbody>
	  	    	<tr class="row item">
	  	    		<td style="max-width: 100px">
	  	    			<img class="img-responsive cl" alt="error" src="${topJobValue.getJobPostedByCompany().getLogoUrl()}">
	  	    			<br>
	  	    			<div class="data" style="color:grey">
	  	    				<div class="desc">
	  	    					Description<br>
	  	    					<c:out value="${topJobValue.getJobDescription()}" />
	  	    				</div>
	  	    				
	  	    				<div class="desc">
	  	    					Responsibilities<br>
	  	    					<c:out value="${topJobValue.getJobResponsibilities()}" />
	  	    				</div>
	  	    				
	  	    				<div class="desc">
	  	    					Salary: <c:out value="${topJobValue.getJobSalary()}" />
	  	    				</div>
	  	    				
	  	    				<div class="desc">
	  	    					Location: <c:out value="${topJobValue.getEligibility()}" />
	  	    				</div>
	  	    				
	  	    				<div class="desc">
	  	    					Posted On: <c:out value="${topJobValue.getPostedOn()}" />
	  	    				</div>
	  	    				
	  	    				<div class="desc">
	  	    					Eligibility: <c:out value="${topJobValue.getEligibility()}" />
	  	    				</div>
	  	    			</div>
	  	    		</td>
	  	    		
	  	    		<td style="padding-top: 24px;font-size: 21px;">
	  	    			<c:out value="${topJobValue.getJobTitle()}" /><br>
	  	    			<div class="comp">CompanyName</div>
	  	    		</td>
			      	<td style="padding-top:27px;margin-left:300px;">
			       		<form action="/positions/searchByFields" method="POST" >
			       			<input type="submit" value="Apply Now!"/>
			       		</form>
			      	</td>
			    </tr>	    
		    </tbody>
		    </c:forEach>
		</table>
		
	
	</div>
	<div class="col-md-2">
	<!-- right section -->

	</div>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>