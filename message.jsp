
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!-- Success message printing -->
			<%
			String smsg = (String) request.getAttribute("smsg");
			if (smsg != null) {
			%>
			<div class="alert alert-success" role="alert">
				<%=smsg%>
			</div>

			<%
			}
			%>

			<!-- Error message Print -->

			<%
			String emsg = (String) request.getAttribute("emsg");
			if (emsg != null) {
			%>
			<div class="alert alert-danger" role="alert">
				<%=emsg%>
			</div>
			<%}%>