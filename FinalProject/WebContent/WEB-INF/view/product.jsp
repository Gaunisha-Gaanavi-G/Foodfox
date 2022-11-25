<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Product Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
		
body {
  background-image: url("https://media.istockphoto.com/id/589135154/photo/herbs-and-spices-over-black-stone-background.jpg?s=612x612&w=0&k=20&c=peSwSpCCMOjRuLoTE3bCv50_NPdNXLuyDIXVNobKahw=");
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
	</style>
</head>
<body>
<h1 style="color:white;">
	Add/Edit Product
</h1>

<c:url var="addAction" value="/admin/products/add" ></c:url>
<form:form action="${addAction}" modelAttribute="product" method ="post">
<table style="color:white;">

	<c:if test="${!empty product.productName}">
	<tr>
		<td>
			<form:label path="productId" text="ID"/>
		</td>
		<td>
			<form:input path="productId" readonly="true" size="8"  disabled="true" />
			<form:hidden path="productId" />
		</td> 
	</tr>
	</c:if>
	<tr>
	<td>Enter description :</td>
	<td><form:input path="description"/></td>
	<td><form:errors path="description" cssClass="error"/></td>
	</tr>
	<tr>
	<td>Enter Url:</td>
	<td><form:input  path ="imageUrl"/></td>
	<td><form:errors path="imageUrl" cssClass="error"/></td>
	</tr>
	<tr>
	<td>Enter Price:</td>
	<td><form:input  path="price"/></td>
	<td><form:errors path="price" cssClass="error"/></td>
	</tr>
	<tr>
	<td>Enter ProductName:</td>
	<td><form:input   path="productName"/></td>
	<td><form:errors path="productName" cssClass="error"/></td>
	</tr>
	<tr>
	<td>Enter Quantity:</td>
	<td><form:input  path="quantity"/></td>
	<td><form:errors path="quantity" cssClass="error"/></td>
	</tr>
	<tr>
		<td colspan="2">
		</br>
			<c:if test="${!empty product.productName}">
				<input type="submit"
					value="Edit Product"/>
			</c:if>
			</br>
			<c:if test="${empty product.productName}">
				<input type="submit"
					value="Add Product"/>
			</c:if>
		
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3 style="color:white;">Products List</h3>
<c:if test="${!empty listProducts}">
	<table class="tg">
	<tr>
		<th width="80">Product ID</th>
		<th width="120">Product Description</th>
		<th width="120">Product URL</th>
		<th width="120">Product Name</th>
		<th width="120">Product Price</th>
		<th width="120">Product Quantity</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listProducts}" var="product">
		<tr>
			<td>${product.productId}</td>
			<td>${product.description}</td>
			<td>${product.imageUrl}</td>
			<td>${product.productName}</td>
			<td>${product.price}</td>
			<td>${product.quantity}</td>
			<td><a href="<c:url value='/admin/edit/${product.productId}' />" >Edit</a></td>
			<td><a href="<c:url value='/admin/remove/${product.productId}'/>" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>