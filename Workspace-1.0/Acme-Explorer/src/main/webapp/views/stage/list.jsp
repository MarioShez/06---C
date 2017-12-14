<%--
 * list.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing grid -->

<security:authorize access="hasRole('MANAGER')">
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="stageManager" requestURI="stage/manager/list.do" id="row">

	<!-- Attributes -->

	<spring:message code="stage.edit" />
	<display:column>
		<a href="stage/manager/edit.do?stageId=${row.id}"> <spring:message code="stage.edit" /></a>
	</display:column>

	<spring:message code="stage.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />

	<spring:message code="stage.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}" sortable="true" />

	<spring:message code="stage.price" var="priceHeader" />
	<display:column property="price" title="${priceHeader}" sortable="true" />

	<spring:message code="stage.trip" var="tripHeader" />
	<display:column property="trip.title" title="${tripHeader}" sortable="true" />

</display:table>

<a href="stage/create.do">
	<button>
		<spring:message code="stage.create" />
	</button>
</a>

</security:authorize>

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="stage" requestURI="stage/list.do" id="row">

	<!-- Attributes -->

	<spring:message code="stage.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />

	<spring:message code="stage.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}" sortable="true" />

	<spring:message code="stage.price" var="priceHeader" />
	<display:column property="price" title="${priceHeader}" sortable="true" />

	<spring:message code="stage.trip" var="tripHeader" />
	<display:column property="trip.title" title="${tripHeader}" sortable="true" />

</display:table>
