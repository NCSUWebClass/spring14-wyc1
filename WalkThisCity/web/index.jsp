<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"
    import = "java.util.List"
    import = "com.walkthiscity.beans.Location"
    import = "com.walkthiscity.beans.PlacesBean"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Walk This City</title>
<link href = "CSS/yelp.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<form id = "form1" action = "SearchServlet" method = "post">
		Enter Search Term: <input type = "text" name = "searchTerm"><br>
		Enter Address: <input id = "address" type = "text" name = "address"><br>
        Enter Latitude (Optional): <input id = "lat" type = "text" name = "lat"><br>
        Enter Longitude (Optional): <input id = "lng" type = "text" name = "lng"><br>
		<input type = "submit" name = "submitButton" value = "Submit">		
	</form>
    <button onclick="getLocation()">Use Current Location</button>
    <script type="text/javascript">
        var x=document.getElementById("demo");
        function getLocation()
        {
            if (navigator.geolocation)
            {
                navigator.geolocation.getCurrentPosition(showPosition);
            }
            else{x.innerHTML="Geolocation is not supported by this browser.";}
        }
        function showPosition(position)
        {
            document.getElementById("lat").value = position.coords.latitude;
            document.getElementById("lng").value = position.coords.longitude;
        }
    </script>

<div class = "tabs">
    <div class = "tab">
        <input type = "radio" id = "tab-1" name = "tab-group-1" checked>
        <label for = "tab-1">Yelp</label>
        <div class = "content">
            <%
                if(request.getAttribute("locations") != null)
                {
                    List<Location> locations = (List<Location>)request.getAttribute("locations");
            %>
            <div>
                <center><table>
                    <tr>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Rating</th>
                        <th>Phone Number</th>
                        <th>Distance</th>
                        <th>Slow Pace (20/mi)</th>
                        <th>Moderate Pace (15/mi)</th>
                        <th>Fast Pace (10/mi)</th>
                        <th>WalkScore (0-100)</th>
                        <th>WalkScore Description</th>
                    </tr>
                    <%
                        for(Location loc : locations)
                        {
                    %>
                    <tr>
                        <td><%=loc.getName()%></td>
                        <td><%=loc.getAddress()%></td>
                        <td><%=loc.getRating()%></td>
                        <td><%=loc.getPhoneNumber()%></td>
                        <td><%=loc.getDistance()%></td>
                        <td><%=loc.getSlowTime()%></td>
                        <td><%=loc.getModerateTime()%></td>
                        <td><%=loc.getFastTime()%></td>
                        <td><%=loc.getWalkscore()%></td>
                        <td><%=loc.getWalkDescption()%></td>
                    </tr>
                    <%
                        }
                    %>
                </table></center>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <div class="tab">
        <input type="radio" id="tab-2" name="tab-group-1">
        <label for="tab-2">Google Places</label>

        <div class="content">
            <%
                if(request.getAttribute("places") != null)
                {
                    List<PlacesBean> placesBean = (List<PlacesBean>)request.getAttribute("places");
            %>
            <div>
                <center><table>
                    <tr>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Rating</th>
                        <th>Phone Number</th>
                        <th>Distance</th>
                        <th>Slow Pace (20/mi)</th>
                        <th>Moderate Pace (15/mi)</th>
                        <th>Fast Pace (10/mi)</th>
                        <th>WalkScore (0-100)</th>
                        <th>WalkScore Description</th>
                    </tr>
                    <%
                        for(PlacesBean place : placesBean)
                        {
                    %>
                    <tr>
                        <td><%=place.getName()%></td>
                        <td><%=place.getAddress()%></td>
                        <td><%=place.getRating()%></td>
                        <td><%=place.getPhoneNumber()%></td>
                        <td><%=place.getDistance()%></td>
                        <td><%=place.getSlowTime()%></td>
                        <td><%=place.getModerateTime()%></td>
                        <td><%=place.getFastTime()%></td>
                        <td><%=place.getWalkscore()%></td>
                        <td><%=place.getWalkDescription()%></td>
                    </tr>
                    <%
                        }
                    %>
                </table></center>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <div class="tab">
        <input type="radio" id="tab-3" name="tab-group-1">
        <label for="tab-3">Dark Skies</label>

        <div class="content">
            stuff 3
        </div>
    </div>
 </div>
</body>
</html>