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
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing grid -->
<security:authorize access="hasRole('ADMIN')">


<table class="displaytag"  name="informationApplication">
	<tr>
		<th>
			<spring:message code="administrator.average" var="averageHeader" />
			<jstl:out value="${averageHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.minimum" var="minimumHeader" />
			<jstl:out value="${minimumHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.maximum" var="maximumHeader" />
			<jstl:out value="${maximumHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.standardDeviation" var="standardDeviationHeader" />
			<jstl:out value="${standardDeviationHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<jstl:forEach var="datos" items="${informationApplication}">
			<td>
				<jstl:out value="${datos}"></jstl:out>
			</td>
		</jstl:forEach>
	</tr>
</table>

<table class="displaytag"  name="avgMinMaxSqtrManager">
	<tr>
		<th>
			<spring:message code="administrator.average" var="averageHeader" />
			<jstl:out value="${averageHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.minimum" var="minimumHeader" />
			<jstl:out value="${minimumHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.maximum" var="maximumHeader" />
			<jstl:out value="${maximumHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.standardDeviation" var="standardDeviationHeader" />
			<jstl:out value="${standardDeviationHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<jstl:forEach var="datos" items="${avgMinMaxSqtrManager}">
			<td>
				<jstl:out value="${datos}"></jstl:out>
			</td>
		</jstl:forEach>
	</tr>
</table>

<table class="displaytag"  name="avgMinMaxSqtr2">
	<tr>
		<th>
			<spring:message code="administrator.average" var="averageHeader" />
			<jstl:out value="${averageHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.minimum" var="minimumHeader" />
			<jstl:out value="${minimumHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.maximum" var="maximumHeader" />
			<jstl:out value="${maximumHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.standardDeviation" var="standardDeviationHeader" />
			<jstl:out value="${standardDeviationHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<jstl:forEach var="datos" items="${avgMinMaxSqtr2}">
			<td>
				<jstl:out value="${datos}"></jstl:out>
			</td>
		</jstl:forEach>
	</tr>
</table>

<table class="displaytag"  name="avgMinMaxSqtrRanger">
	<tr>
		<th>
			<spring:message code="administrator.average" var="averageHeader" />
			<jstl:out value="${averageHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.minimum" var="minimumHeader" />
			<jstl:out value="${minimumHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.maximum" var="maximumHeader" />
			<jstl:out value="${maximumHeader}"></jstl:out>
		</th>
		<th>
			<spring:message code="administrator.standardDeviation" var="standardDeviationHeader" />
			<jstl:out value="${standardDeviationHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<jstl:forEach var="datos" items="${avgMinMaxSqtrRanger}">
			<td>
				<jstl:out value="${datos}"></jstl:out>
			</td>
		</jstl:forEach>
	</tr>
</table>

<table class="displaytag"  name="applicationPending">
	<tr>
		<th>
			<spring:message code="administrator.ratio" var="ratioHeader" />
			<jstl:out value="${ratioHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<td>
			<jstl:out value="${applicationPending}"></jstl:out>
		</td>
	</tr>
</table>

<table class="displaytag"  name="applicationDue">
	<tr>
		<th>
			<spring:message code="administrator.ratio" var="ratioHeader" />
			<jstl:out value="${ratioHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<td>
			<jstl:out value="${applicationDue}"></jstl:out>
		</td>
	</tr>
</table>

<table class="displaytag"  name="applicationAccepted">
	<tr>
		<th>
			<spring:message code="administrator.ratio" var="ratioHeader" />
			<jstl:out value="${ratioHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<td>
			<jstl:out value="${applicationAccepted}"></jstl:out>
		</td>
	</tr>
</table>

<table class="displaytag"  name="applicationCancelled">
	<tr>
		<th>
			<spring:message code="administrator.ratio" var="ratioHeader" />
			<jstl:out value="${ratioHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<td>
			<jstl:out value="${applicationCancelled}"></jstl:out>
		</td>
	</tr>
</table>

<table class="displaytag"  name="ratioTripsCancelled">
	<tr>
		<th>
			<spring:message code="administrator.ratio" var="ratioHeader" />
			<jstl:out value="${ratioHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<td>
			<jstl:out value="${ratioTripsCancelled}"></jstl:out>
		</td>
	</tr>
</table>


<table class="displaytag"  name="tripsThanAverage">
	<tr>
		<th>
			<spring:message code="administrator.trip" var="titleHeader" />
			<jstl:out value="${titleHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<td>
			<jstl:out value="${tripsThanAverage}"></jstl:out>
		</td>
	</tr>
</table>
<%--
<display:table class="displaytag"  name="tripsThanAverage" id="row">
	<spring:message code="trip.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="false">
	<jstl:out value="${row.title}"></jstl:out>
	</display:column>
</display:table>
 --%>


<table class="displaytag"  name="tripsLegalTextReferenced">
	<tr>
		<th>
			<spring:message code="administrator.legalText" var="legalTextHeader" />
			<jstl:out value="${legalTextHeader}"></jstl:out>
		</th>
	</tr>
	<tr>
		<td>
			<jstl:out value="${tripsLegalTextReferenced}"></jstl:out>
		</td>
	</tr>
</table>


<%--
<form:label path="applicationsTrip">
		<spring:message code="administrator.informationApplicationLabel" />:
</form:label>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="informationApplication" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->

	<spring:message code="administrator.average" var="averageHeader" />
	<display:column property="average" title="${averageHeader}" sortable="true" />

	<spring:message code="administrator.minimum" var="minimumHeader" />
	<display:column property="minimum" title="${minimumHeader}" sortable="true" />

	<spring:message code="administrator.maximum" var="maximumHeader" />
	<display:column property="maximum" title="${maximumHeader}" sortable="true" />
	
	<spring:message code="administrator.standardDeviation" var="standardDeviationHeader" />
	<display:column property="standardDeviation" title="${standardDeviationHeader}" sortable="true" />
	
</display:table>


<form:label path="tripsManager">
		<spring:message code="administrator.informationTripsManagerLabel" />:
</form:label>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="informationTripsManager" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->

	<spring:message code="administrator.average" var="averageHeader" />
	<display:column property="average" title="${averageHeader}" sortable="true" />

	<spring:message code="administrator.minimum" var="minimumHeader" />
	<display:column property="minimum" title="${minimumHeader}" sortable="true" />

	<spring:message code="administrator.maximum" var="maximumHeader" />
	<display:column property="maximum" title="${maximumHeader}" sortable="true" />
	
	<spring:message code="administrator.standardDeviation" var="standardDeviationHeader" />
	<display:column property="standardDeviation" title="${standardDeviationHeader}" sortable="true" />
	
</display:table>


<form:label path="priceTrips">
		<spring:message code="administrator.informationPriceTripsLabel" />:
</form:label>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="informationPriceTrips" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->

	<spring:message code="administrator.average" var="averageHeader" />
	<display:column property="average" title="${averageHeader}" sortable="true" />

	<spring:message code="administrator.minimum" var="minimumHeader" />
	<display:column property="minimum" title="${minimumHeader}" sortable="true" />

	<spring:message code="administrator.maximum" var="maximumHeader" />
	<display:column property="maximum" title="${maximumHeader}" sortable="true" />
	
	<spring:message code="administrator.standardDeviation" var="standardDeviationHeader" />
	<display:column property="standardDeviation" title="${standardDeviationHeader}" sortable="true" />
	
</display:table>


<form:label path="guidedRanger">
		<spring:message code="administrator.informationTripsRangerLabel" />:
</form:label>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="informationTripsRanger" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->

	<spring:message code="administrator.average" var="averageHeader" />
	<display:column property="average" title="${averageHeader}" sortable="true" />

	<spring:message code="administrator.minimum" var="minimumHeader" />
	<display:column property="minimum" title="${minimumHeader}" sortable="true" />

	<spring:message code="administrator.maximum" var="maximumHeader" />
	<display:column property="maximum" title="${maximumHeader}" sortable="true" />
	
	<spring:message code="administrator.standardDeviation" var="standardDeviationHeader" />
	<display:column property="standardDeviation" title="${standardDeviationHeader}" sortable="true" />
	
</display:table>


<form:label path="statusPending">
		<spring:message code="administrator.informationPendingLabel" />:
</form:label>
<display:table pagesize="1" class="displaytag" keepStatus="true"
	name="informationPending" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.ratio" var="ratioHeader" />
	<display:column property="ratio" title="${ratioHeader}" sortable="true" />

</display:table>


<form:label path="statusDue">
		<spring:message code="administrator.informationDueLabel" />:
</form:label>
<display:table pagesize="1" class="displaytag" keepStatus="true"
	name="informationDue" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.ratio" var="ratioHeader" />
	<display:column property="ratio" title="${ratioHeader}" sortable="true" />

</display:table>


<form:label path="statusAccepted">
		<spring:message code="administrator.informationAcceptedLabel" />:
</form:label>
<display:table pagesize="1" class="displaytag" keepStatus="true"
	name="informationAccepted" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.ratio" var="ratioHeader" />
	<display:column property="ratio" title="${ratioHeader}" sortable="true" />

</display:table>


<form:label path="statusCancelled">
		<spring:message code="administrator.informationCancelledLabel" />:
</form:label>
<display:table pagesize="1" class="displaytag" keepStatus="true"
	name="informationCancelled" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.ratio" var="ratioHeader" />
	<display:column property="ratio" title="${ratioHeader}" sortable="true" />

</display:table>


<form:label path="statusCancelled">
		<spring:message code="administrator.cancelledOrganisedLabel" />:
</form:label>
<display:table pagesize="1" class="displaytag" keepStatus="true"
	name="informationCancelledOrganised" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.cancelledOrganised" var="cancelledOrganisedHeader" />
	<display:column property="cancelledOrganised" title="${cancelledOrganisedHeader}" sortable="true" />

</display:table>


<form:label path="informationTripLabel">
		<spring:message code="administrator.informationTripLabel" />:
</form:label>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="informationTrip" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.trip" var="tripHeader" />
	<display:column property="trip" title="${tripHeader}" sortable="true" />

</display:table>


<form:label path="informationLegalTextLabel">
		<spring:message code="administrator.informationLegalTextLabel" />:
</form:label>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="informationLegalText" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.legalText" var="legalTextHeader" />
	<display:column property="legalText" title="${legalTextHeader}" sortable="true" />
	
	<spring:message code="administrator.referenced" var="referencedHeader" />
	<display:column property="referenced" title="${referencedHeader}" sortable="true" />
	
</display:table>


<form:label path="informationNotesLabel">
		<spring:message code="administrator.informationNotesLabel" />:
</form:label>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="informationNotes" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->

	<spring:message code="administrator.average" var="averageHeader" />
	<display:column property="average" title="${averageHeader}" sortable="true" />

	<spring:message code="administrator.minimum" var="minimumHeader" />
	<display:column property="minimum" title="${minimumHeader}" sortable="true" />

	<spring:message code="administrator.maximum" var="maximumHeader" />
	<display:column property="maximum" title="${maximumHeader}" sortable="true" />
	
	<spring:message code="administrator.standardDeviation" var="standardDeviationHeader" />
	<display:column property="standardDeviation" title="${standardDeviationHeader}" sortable="true" />
	
</display:table>


<form:label path="informationAuditLabel">
		<spring:message code="administrator.informationAuditLabel" />:
</form:label>
<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="informationAudit" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->

	<spring:message code="administrator.average" var="averageHeader" />
	<display:column property="average" title="${averageHeader}" sortable="true" />

	<spring:message code="administrator.minimum" var="minimumHeader" />
	<display:column property="minimum" title="${minimumHeader}" sortable="true" />

	<spring:message code="administrator.maximum" var="maximumHeader" />
	<display:column property="maximum" title="${maximumHeader}" sortable="true" />
	
	<spring:message code="administrator.standardDeviation" var="standardDeviationHeader" />
	<display:column property="standardDeviation" title="${standardDeviationHeader}" sortable="true" />
	
</display:table>


<form:label path="informationRatioAuditLabel">
		<spring:message code="administrator.informationRatioAuditLabel" />:
</form:label>
<display:table pagesize="1" class="displaytag" keepStatus="true"
	name="informationRatioAudit" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.ratio" var="ratioHeader" />
	<display:column property="ratio" title="${ratioHeader}" sortable="true" />

</display:table>


<form:label path="informationRatioCurriculaLabel">
		<spring:message code="administrator.informationRatioCurriculaLabel" />:
</form:label>
<display:table pagesize="1" class="displaytag" keepStatus="true"
	name="informationRatioCurricula" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.ratio" var="ratioHeader" />
	<display:column property="ratio" title="${ratioHeader}" sortable="true" />

</display:table>


<form:label path="informationRatioEndorsedLabel">
		<spring:message code="administrator.informationRatioEndorsedLabel" />:
</form:label>
<display:table pagesize="1" class="displaytag" keepStatus="true"
	name="informationRatioEndorsed" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.ratio" var="ratioHeader" />
	<display:column property="ratio" title="${ratioHeader}" sortable="true" />

</display:table>


<form:label path="informationRatioSuspiciousManagerLabel">
		<spring:message code="administrator.informationRatioSuspiciousManagerLabel" />:
</form:label>
<display:table pagesize="1" class="displaytag" keepStatus="true"
	name="informationRatioSuspiciousManager" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.ratio" var="ratioHeader" />
	<display:column property="ratio" title="${ratioHeader}" sortable="true" />

</display:table>


<form:label path="informationRatioSuspiciousRangerLabel">
		<spring:message code="administrator.informationRatioSuspiciousRangerLabel" />:
</form:label>
<display:table pagesize="1" class="displaytag" keepStatus="true"
	name="informationRatioSuspiciousRanger" requestURI="administrator/list.do" id="row">
	
	<!-- Attributes -->
	<spring:message code="administrator.ratio" var="ratioHeader" />
	<display:column property="ratio" title="${ratioHeader}" sortable="true" />

</display:table>
 --%>

</security:authorize>







