<%@ page import = "common.CallService" %>
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ page import = "org.json.simple.parser.ParseException" %>
<%
	//String product2 = null;

	CallService cs = new CallService();
	String part2 = cs.getJSON("http://part2:8080");
	String part3 = cs.getJSON("http://part3:8080");

	JSONParser parser = new JSONParser();
	Object obj2 = parser.parse(part2);
	Object obj3 = parser.parse(part3);
	
	JSONObject jsonObj2 = (JSONObject) obj2;
	String nm_part2 = (String) jsonObj2.get("name");
	String up_part2_tmp = (String) jsonObj2.get("unitprice");
	Long up_part2 = Long.parseLong(up_part2_tmp);
	
	JSONObject jsonObj3 = (JSONObject) obj3;
	String nm_part3 = (String) jsonObj3.get("name");
	String up_part3_tmp = (String) jsonObj3.get("unitprice");
	Long up_part3 = Long.parseLong(up_part3_tmp);
	
	Integer quantity = 10;
	Long tuprice = up_part2 + up_part3;
	Integer expense = 20;
	Long price = tuprice + expense;	
	
	JSONObject product2 = new JSONObject();
	product2.put("name", "product2");
	product2.put("quantity", quantity);
	product2.put("unitprice", tuprice);
	product2.put("expense", expense);
	product2.put("price", price);
				
	out.print(product2.toString());
	
%>
