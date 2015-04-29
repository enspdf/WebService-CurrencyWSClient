<%-- 
    Document   : index
    Created on : 28-abr-2015, 18:32:06
    Author     : shackox
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="boot/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <style type="text/css">
            html
            {
                position: relative;
                top: 225px;
            }
        </style>
    <center>
        <h1 style="font-size: 100px;">Currency Converter</h1>
        
        <form method="post" action="index.jsp">
            <input type="text" name="txtRinput" value="" placeholder="Dollars to convert" />
            <input class ="btn btn-danger"type="submit" value="Convert" />
        </form>
        
             <%-- start web service invocation --%>
    <%
    try {
	currency.CurrencyMethods_Service service = new currency.CurrencyMethods_Service();
	currency.CurrencyMethods port = service.getCurrencyMethodsPort();
	 // TODO initialize WS operation arguments here
	java.lang.Double dollar = Double.valueOf(request.getParameter("txtRinput"));
	// TODO process result here
	java.lang.Double euro = port.convertEuro(dollar);
        java.lang.Double yen = port.convertYen(dollar);
        java.lang.Double candollar = port.convertCDNDollar(dollar);
        java.lang.Double pound = port.convertPound(dollar);
        
        if (dollar <= 0) {
            out.println("<br>");
            out.println("Can't convert $ " + dollar);
        }
        else{
            out.println("<br>");
            out.println(dollar + " $ " + euro + " EUROS");
            out.println("<br> <br>");
            out.println(dollar + " $ " + yen + " YEN");
            out.println("<br> <br>");
            out.println(dollar + " $ " + candollar + " CANADIAN DOLLARS");
            out.println("<br> <br>");
            out.println(dollar + " $ " + pound + " POUNDS");
            out.println("<br> <br>");
        }
        
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    
    </body>
    <script src="boot/js/bootstrap.js" type="text/javascript"></script>
    <script src="boot/js/jquery-2.1.1.js" type="text/javascript"></script>
</html>
