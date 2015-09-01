<%@page import="java.util.ArrayList"%>
<%@page import="com.adnan.zohobooks.Controller"%>
<%@page import="com.adnan.zohobooks.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Zoho Books</title>
</head>
<body>


<%
Controller controller = new Controller();
application.setAttribute("controller", controller);
controller.loadItems();
ArrayList<Item> itemsObject = controller.getItemsObject();
Integer i  = 15;%>
<script type="text/javascript">
var firstRate = <%=itemsObject.get(0).getRate()%>;
var items = {};
loadItems();
function loadItems(){
	<%for(Item item : itemsObject){
	%>
	var index = <%=item.getItemID()%>;
	items["<%=item.getItemID()%>"] = <%=item.getRate()%>;
	
	<%	}%>
}


function addRow(tableID) {

	var table = document.getElementById(tableID);

	var rowCount = table.rows.length;
	var row = table.insertRow(rowCount);

	var colCount = table.rows[0].cells.length;

	for(var i=0; i<colCount; i++) {

		var newcell	= row.insertCell(i);

		newcell.innerHTML = table.rows[1].cells[i].innerHTML;
		
		if(i == 1){
			newcell.getElementsByTagName('label')[0].innerHTML = firstRate;
		}
			
			
	}
}

function updateTotal(){
	var table = document.getElementById("dataTable");
	var rowCount = table.rows.length;
	var total = 0;
	for(var i=1; i<rowCount; i++) {
		var rate = table.rows[i].getElementsByTagName('label')[0].innerHTML;
		var quantity = table.rows[i].getElementsByTagName('input')[0].value;
		
		total += quantity*rate;
		
	}
	document.getElementById("total").innerHTML = total;
}
function updatePrice(droplist){
	var rowElement = droplist.parentNode.parentNode;
	var item_id = droplist.value;
	rowElement.getElementsByTagName('label')[0].innerHTML = items[item_id];
	updateTotal();
	
}

</script>

<BODY>

	
<center>
<h1>Zoho Books</h1>
<form action="/zohobooks" method="post">
	<TABLE id="dataTable" width="350px" border="1">
		<TR>
			<TH><b><label>العدد</label></b></TH>
			<TH><b><label>القيمة</label></b></TH>
			<TH><b><label>المنتج</label></b></TH>
		</TR>
		<TR>
			<TD><input type="number" name="quantity" min="0" max="1000000" onchange="updateTotal();" value="0"></TD>
			<TD>
				<label name="rate">
					<%=itemsObject.get(0).getRate()	 %>
				</label>
			</TD>
			<TD>
				<SELECT name="product" onchange="updatePrice(this);">
					<%
						for(Item item : itemsObject){
					%>		
							<OPTION value=<%=item.getItemID() %>><%=item.getName() %>
							</OPTION>
							
					<%	}
					%>
					
				</SELECT>
			</TD>
		</TR>
	</TABLE>
	<INPUT type="button" value="إضافة منتج" onclick="addRow('dataTable')" /><br/> <br/>
	<label id="total">0</label> <label  dir="rtl">المجموع: </label><br/> <br/>
	<input type="submit" value="إرسال">
	</form>
	
</center>

</BODY>



</body>
<SCRIPT language="javascript">


	</SCRIPT>

</html>