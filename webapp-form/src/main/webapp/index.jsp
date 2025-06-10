<%--Directivas para que funciona el .jsp puesto que la version gratuita de intellij no brinda soporte, solo la de pago--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
   Map<String, String> errors = (Map<String,String>)request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Form Users</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h3>Form Users:</h3>

<%if( errors != null && errors.size() > 0){%>
<ul class="alert alert-danger mx-5 px-5">
    <%for(String error : errors.values()){%>
        <li> <%=error%> </li>
    <%}%>
</ul>
<%}%>

<!--Los nombres del "name" seran los mismo que estan en el servlet-->
<!--"id" para capturarlos para javascript-->
<div class="px-5">
    <form action="/webapp-form/registration" method="post">
        <div class="row mb-3 ">
            <label for="username" class="col-form-label col-sm-2">Username:</label>
            <div class="col-sm-4">
                <input type="text" name="username" id="username" class="form-control" value="${param.username}" placeholder="Enter your name" required>
            </div>
            <%
                if(errors != null && errors.containsKey("username")){
                    out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("username") + "</small>");
                }
            %>
        </div>
        <div class="row mb-3 ">
            <label for="password" class="col-form-label col-sm-2">Password:</label>
            <div class="col-sm-4">
                <input type="password" name="password" id="password" class="form-control" placeholder="Enter your password" required>
            </div>
            <%
                if(errors != null && errors.containsKey("password")){
                    out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("password") + "</small>");
                }
            %>
        </div>
        <div class="row mb-3 ">
            <label for="email" class="col-form-label col-sm-2">Email:</label>
            <div class="col-sm-4">
                <input type="email" name="email" id="email" class="form-control" value="${param.email}" placeholder="Enter your email" required>
            </div>
            <%
                if(errors != null && errors.containsKey("email")){
                    out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("email") + "</small>");
                }
            %>
        </div>
        <div class="row mb-3 ">
            <label for="country" class="col-form-label col-sm-2">Country:</label>
            <div class="col-sm-4">
                <select name="country" id="country"  class="form-select" required>
                    <!--            "value" sera el valor que recibira el servlet-->
                    <option value="">-- SELECT: --</option>
                    <option value="COL" ${param.country.equals("COL")? "selected" : ""}>Colombia</option>
                    <option value="MX" ${param.country.equals("MX")? "selected" : ""}>Mexico</option>
                    <option value="ISR" ${param.country.equals("ISR")? "selected" : ""}>Israel</option>
                    <option value="EU" ${param.country.equals("EU")? "selected" : ""}>Estados Unidos</option>
                    <option value="SUI" ${param.country.equals("SUI")? "selected" : ""}>Suiza</option>
                    <option value="EGI" ${param.country.equals("EGI")? "selected" : ""}>Egipto</option>
                </select>
            </div>
            <%
                if(errors != null && errors.containsKey("country")){
                    out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("country") + "</small>");
                }
            %>
        </div>

        <div class="row mb-3 ">
            <label for="languages" class="col-form-label col-sm-2">Programming Languages:</label>
            <div class="col-sm-4">
                <select name="languages" id="languages" multiple class="form-select" required>
                    <option value="java" ${paramValues.languages.stream().anyMatch(v->v.equals("java")).get()? "selected":""}>Java</option>
                    <option value="javascript" ${paramValues.languages.stream().anyMatch(v->v.equals("javascript")).get()? "selected":""}>Javascript</option>
                    <option value="phyton" ${paramValues.languages.stream().anyMatch(v->v.equals("phyton")).get()? "selected":""}>Phyton</option>
                    <option value="kotlin" ${paramValues.languages.stream().anyMatch(v->v.equals("kotlin")).get()? "selected":""}>Kootlin</option>
                    <option value="c++" ${paramValues.languages.stream().anyMatch(v->v.equals("c++")).get()? "selected":""}>C++</option>
                </select>
            </div>
                <%
                    if(errors != null && errors.containsKey("country")){
                        out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("country") + "</small>");
                    }
                %>
        </div>
        <div class="row mb-3 ">
            <label class="col-form-label col-sm-2">Roles:</label>
            <div class="form-check col-sm-2" >
                <input type="checkbox" id="admin" name="roles" value="ROLE_ADMIN"
                 ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_ADMIN")).get()? "checked":""}
                 class="form-check-input">
                <label for="admin" class="form-check-label">Administrator</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="checkbox" id="user" name="roles" value="ROLE_USER"
                 ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_USER")).get()? "checked":""}
                 class="form-check-input">
                <label for="user" class="form-check-label">User</label>
            </div>
            <div class="form-check col-sm-2">
                <input type="checkbox" id="moderator" name="roles" value="ROLE_MODERATOR"
                 ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_MODERATOR")).get()? "checked":""}
                 class="form-check-input">
                <label for="moderator" class="form-check-label">Moderator</label>
            </div>
            <%
                if(errors != null && errors.containsKey("roles")){
                    out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("roles") + "</small>");
                }
            %>
        </div>

        <div class="row mb-3 ">
            <label class="col-form-label col-sm-2">Languages:</label>
            <div class="form-check col-sm-2">
                <label for="language_sp" class="form-check-label">Spanish</label>
                <input type="radio" id="language_sp" name="language" value="Sp" class="form-check-input" ${param.language.equals("Sp")? "checked" : ""}>
            </div>
            <div class="form-check col-sm-2">
                <label for="language_en" class="form-check-label">English</label>
                <input type="radio" id="language_en" name="language" value="En" class="form-check-input" ${param.language.equals("En")? "checked" : ""}>
            </div>
            <div class="form-check col-sm-2">
                <label for="language_fr" class="form-check-label">French</label>
                <input type="radio" id="language_fr" name="language" value="Fr" class="form-check-input" ${param.language.equals("Fr")? "checked" : ""}>
            </div>
            <%
                if(errors != null && errors.containsKey("language")){
                    out.println("<small class='alert alert-danger col-sm4' style='color:red';>" + errors.get("language") + "</small>");
                }
            %>
        </div>

        <div class="row mb-3 ">
            <label for="enabled" class="col-form-label col-sm-2">Enabled:</label>
            <div class="form-check col-sm-2">
                <input type="checkbox" id="enabled" name="enabled" checked class="form-check-input">
            </div>
        </div>

        <div class="row mb-3 ">
            <input type="submit" value="Submit" class="btn btn-primary">
        </div>
        <div>
            <input type="hidden" name="secret" value="1234567">
        </div>

    </form>
</div>
</body>
</html>