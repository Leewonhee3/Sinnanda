<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>

<title>�ų���</title>
 </head>
<body>
 
    <a href="index">�ų���</a>
  <!-- ���� ī�װ� -->
  <div>
  	<ul>
  		<li><a href ="/index">home</a></li>
  		<li><a href ="">Qna</a></li>
  		<li><a href ="">��������</a></li>
  		<li><a href ="">����������</a></li>
  		<li><a href ="">�α���</a></li>
  		<li><a href ="">ȸ������</a></li>
  		<li><a href=""> ������</a></li>
  	</ul>
  </div>
  <!-- ������  -->
  <h2>������ �ų���</h2>
 
   <form>
  <!-- ��ġ�� ����� -->
  <div>
  <select name ="">
  	<option value ="seoul">����</option>
  	<option value =""></option>
  	<option value =""></option>
  	<option value =""></option>
  </select>
  <!--��¥�� ��������  -->
 
 <!-- �ο��� -->
 	<select>
 		<option value ="onePeople">1��</option>
 		<option value ="twoPeople">2��</option>
 		<option value ="threePeople">3��</option>
 		<option value ="fourPeople">4��</option>
 	</select>
 	<!--ħ�� ���� -->
 	<select>
 		<option value ="onebed">ħ�� �ϳ�</option>
 		<option value ="twobed">ħ�� �ΰ�</option>
 		<option value ="QueenOnebed">�� ħ�� �ϳ�</option>
 		<option value ="QueenTwobed">�� ħ�� �ΰ�</option>
 		<option value ="...">.....</option>
 	</select>
   <button type ="submit">�˻��̴�</button>
  </div>
 </form>
  
  <!--�������� ȣ������ ���� ���� -->
    <span ><a href="#">����</a></span>
    <span ><a href="#">ȣ��</a></span> 
	<span ><a href="#">Ȩ</a></span> 
    <span ><a href="#">.....</a></span>
    
    
    <!--�������� -->
    <h3>��������</h3>
    
    <!-- ������ ���� ���� -->
    <h3>������ �ų���</h3>
    
    <!-- �湮�� ���� ���� -->
    <h3>�湮�� �ų���</h3>
    
    <!-- �����ڰ� ��õ�ϴ¼���  -->
  	 <h3>��õ�� �ų���</h3>
</body>
</html>