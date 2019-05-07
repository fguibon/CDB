<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Computer Database</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<!-- Bootstrap -->
<link href="static/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="static/css/font-awesome.css" rel="stylesheet" media="screen">
<link href="static/css/main.css" rel="stylesheet" media="screen">
</head>
<body>
	<header class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<a class="navbar-brand" href="dashboard"> Application - Computer
				Database </a>
		</div>
	</header>

	<section id="main">
		<div class="container">
			<h1 id="homeTitle">${numberOfComputers} Computers found</h1>
			<div id="actions" class="form-horizontal">
				<div class="pull-left">
					<form id="searchForm" action="dashboard" method="GET"
						class="form-inline">

						<input type="search" id="searchbox" name="search"
							class="form-control" placeholder="Search name" value="${filter}" />
						<input type="submit" id="searchsubmit" value="Filter by name"
							class="btn btn-primary" />
					</form>
				</div>
				<div class="pull-right">
					<a class="btn btn-success" id="addComputer" href="add-computer">Add
						Computer</a> <a class="btn btn-default" id="editComputer" href="#"
						onclick="$.fn.toggleEditMode();">Edit</a>
				</div>
			</div>
		</div>

		<form id="deleteForm" action="dashboard" method="POST">
			<input type="hidden" name="selection" value="">
		</form>

		<div class="container" style="margin-top: 10px;">
			<table id="table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<!-- Variable declarations for passing labels as parameters -->
						<!-- Table header for Computer Name -->

						<th class="editMode" style="width: 60px; height: 22px;"><input
							type="checkbox" id="selectall" /> <span
							style="vertical-align: top;"> - <a href="#"
								id="deleteSelected" onclick="$.fn.deleteSelected();"> <i
									class="fa fa-trash-o fa-lg"></i>
							</a>
						</span></th>
						<th class="th-sm">Computer name   <a
							title="Order by name ascendant" href="?field=name&order=asc"><i
								class="fa fa-arrow-down"></i></a> <a
							title="Order by name descendant" href="?field=name&order=desc"><i
								class="fa fa-arrow-up"></i></a></th>
						
						<th class="th-sm">Introduced date  <a
							title="Order by introducted date ascendant"
							href="?field=intro&order=asc"><i class="fa fa-arrow-down"></i></a> <a
							title="Order by introducted date descendant"
							href="?field=intro&order=desc"><i class="fa fa-arrow-up"></i></a></th>
						
						<th class="th-sm">Discontinued date  <a
							title="Order by discontinued ascendant"
							href="?field=disco&order=asc"><i class="fa fa-arrow-down"></i></a> <a
							title="Order by discontinued descendant"
							href="?field=disco&order=desc"><i class="fa fa-arrow-up"></i></a></th>

						<th class="th-sm">Company  <a
							title="Order by company name ascendant"
							href="?field=company&order=asc"><i class="fa fa-arrow-down"></i></a>
							<a title="Order by company name descendant"
							href="?field=company&order=desc"><i class="fa fa-arrow-up"></i></a></th>

					</tr>
				</thead>
				<!-- Browse attribute computers -->
				<tbody id="results">
					<c:forEach var="computer" items="${computers}">
						<tr>
							<td class="editMode"><input type="checkbox" name="cb"
								class="cb" value="${computer.getId()}"></td>
							<td><a href="edit-computer?id=${computer.getId()}"
								onclick="">${computer.getName()}</a></td>
							<td>${computer.getIntroduced()}</td>
							<td>${computer.getDiscontinued()}</td>
							<td>${computer.getCompanyName()}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</section>

	<footer class="navbar-fixed-bottom">
		<div class="container text-center">
			<ul class="pagination">
				<li><a
					href="?page=${currentPage - 1}&noOfRecords=${limit}&search=${filter}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a href="?page=1&noOfRecords=${limit}&search=${filter}">1</a></li>
				<li><a href="?page=2&noOfRecords=${limit}&search=${filter}">2</a></li>
				<li><a href="?page=3&noOfRecords=${limit}&search=${filter}">3</a></li>
				<li><a href="?page=4&noOfRecords=${limit}&search=${filter}">4</a></li>
				<li><a href="?page=5&noOfRecords=${limit}&search=${filter}">5</a></li>
				<li><a
					href="?page=${currentPage + 1}&noOfRecords=${limit}&search=${filter}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>


			<div class="btn-group btn-group-sm pull-right" role="group">
				<a class="btn btn-default"
					href="?page=${currentPage}&noOfRecords=10&search=${filter}">10</a>
				<a class="btn btn-default"
					href="?page=${currentPage}&noOfRecords=50&search=${filter}">50</a>
				<a class="btn btn-default"
					href="?page=${currentPage}&noOfRecords=100&search=${filter}">100</a>
			</div>
		</div>

	</footer>
	<script src="static/js/jquery.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/dashboard.js"></script>

</body>
</html>