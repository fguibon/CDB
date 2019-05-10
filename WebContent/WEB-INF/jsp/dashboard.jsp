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
							</span>
						</th>
						<th class="th-sm">Computer name 
							<a <c:url value="/dashboard" var="url">
								<c:param name="page" value="${page}"/>
								<c:param name="number" value="${limit}"/>
								<c:param name="filter" value="${filter}"/>
 								<c:param name="field" value="name"/>
 								<c:param name="order" value="asc"/>
							</c:url>
							title="Order by name ascendant" href="${url}">
							<i class="fa fa-arrow-down"></i></a> 
							<a <c:url value="/dashboard" var="url">
								<c:param name="page" value="${page}"/>
								<c:param name="number" value="${limit}"/>
								<c:param name="filter" value="${filter}"/>
 								<c:param name="field" value="name"/>
 								<c:param name="order" value="desc"/>
							</c:url>
							title="Order by name descendant" href="${url}">
							<i class="fa fa-arrow-up"></i></a>
						</th>

						<th class="th-sm">Introduced date <a
							<c:url value="/dashboard" var="url">
								<c:param name="page" value="${page}"/>
								<c:param name="number" value="${limit}"/>
								<c:param name="filter" value="${filter}"/>
 								<c:param name="field" value="intro"/>
 								<c:param name="order" value="asc"/>
							</c:url> 
							title="Order by introducted date ascendant"
							href="${url}"><i class="fa fa-arrow-down"></i></a>
							<a <c:url value="/dashboard" var="url">
								<c:param name="page" value="${page}"/>
								<c:param name="number" value="${limit}"/>
								<c:param name="filter" value="${filter}"/>
 								<c:param name="field" value="intro"/>
 								<c:param name="order" value="desc"/>
							</c:url> 
							title="Order by introducted date descendant"
							href="${url}">
							<i class="fa fa-arrow-up"></i></a>
						</th>

						<th class="th-sm">Discontinued date <a
							<c:url value="/dashboard" var="url">
								<c:param name="page" value="${page}"/>
								<c:param name="number" value="${limit}"/>
								<c:param name="filter" value="${filter}"/>
 								<c:param name="field" value="disco"/>
 								<c:param name="order" value="asc"/>
							</c:url>
							title="Order by discontinued ascendant"
							href="${url}"><i class="fa fa-arrow-down"></i></a>
							<a <c:url value="/dashboard" var="url">
								<c:param name="page" value="${page}"/>
								<c:param name="number" value="${limit}"/>
								<c:param name="filter" value="${filter}"/>
 								<c:param name="field" value="disco"/>
 								<c:param name="order" value="desc"/>
							</c:url> title="Order by discontinued descendant"
							href="${url}"><i class="fa fa-arrow-up"></i></a>
						</th>

						<th class="th-sm">Company 
							<a
							<c:url value="/dashboard" var="url">
								<c:param name="page" value="${page}"/>
								<c:param name="number" value="${limit}"/>
								<c:param name="filter" value="${filter}"/>
 								<c:param name="field" value="company"/>
 								<c:param name="order" value="asc"/>
							</c:url>
							title="Order by company name ascendant" href="${url}">
							<i class="fa fa-arrow-down"></i></a> 
							<a
							<c:url value="/dashboard" var="url">
								<c:param name="page" value="${page}"/>
								<c:param name="number" value="${limit}"/>
								<c:param name="filter" value="${filter}"/>
 								<c:param name="field" value="company"/>
 								<c:param name="order" value="desc"/>
							</c:url>
							title="Order by company name descendant" href="${url}">
							<i class="fa fa-arrow-up"></i>
							</a>
						</th>
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
					<c:url value="/dashboard" var="url">
						<c:param name="page" value="${page - 1}"/>
						<c:param name="number" value="${limit}"/>
						<c:param name="filter" value="${filter}"/>
 						<c:param name="field" value="${field}"/>
 						<c:param name="order" value="${order}"/>
					</c:url> href="${url}" aria-label="Previous"> 
					<span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="currentPage" items="${pages}">
					<li ${page==currentPage?"class='activated'":""}><a <c:url value="/dashboard" var="url">
								<c:param name="page" value="${currentPage}"/>
								<c:param name="number" value="${limit}"/>
								<c:param name="filter" value="${filter}"/>
 								<c:param name="field" value="${field}"/>
 								<c:param name="order" value="${order}"/>
							</c:url> href="${url}" >${currentPage}</a></li>
				</c:forEach>
				<li><a
					<c:url value="/dashboard" var="url">
						<c:param name="page" value="${page + 1}"/>
						<c:param name="number" value="${limit}"/>
						<c:param name="filter" value="${filter}"/>
 						<c:param name="field" value="${field}"/>
 						<c:param name="order" value="${order}"/>
					</c:url> href="${url}" aria-label="Next"> 
					<span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>


			<div class="btn-group btn-group-sm pull-right" role="group">
				<a class="btn btn-default" 
					<c:url value="/dashboard" var="url">
						<c:param name="page" value="${page}"/>
						<c:param name="number" value="10"/>
						<c:param name="filter" value="${filter}"/>
 						<c:param name="field" value="${field}"/>
 						<c:param name="order" value="${order}"/>
					</c:url> href="${url}">10</a> 
				<a class="btn btn-default"
					<c:url value="/dashboard" var="url">
						<c:param name="page" value="${page}"/>
						<c:param name="number" value="50"/>
						<c:param name="filter" value="${filter}"/>
 						<c:param name="field" value="${field}"/>
 						<c:param name="order" value="${order}"/>
					</c:url> href="${url}">50</a> 
				<a class="btn btn-default"
					<c:url value="/dashboard" var="url">
						<c:param name="page" value="${page}"/>
						<c:param name="number" value="100"/>
						<c:param name="filter" value="${filter}"/>
 						<c:param name="field" value="${field}"/>
 						<c:param name="order" value="${order}"/>
					</c:url> href="${url}">100</a>
			</div>
		</div>

	</footer>
	<script src="static/js/jquery.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/dashboard.js"></script>

</body>
</html>