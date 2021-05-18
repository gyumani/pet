<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="com.pet.dao.PetBoardMgr" />

<% dao.downLoad(request, response, out, pageContext); %>