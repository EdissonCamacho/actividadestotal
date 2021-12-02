<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${usuario.idUsuario!=null}">

        <jsp:include page="WEB-INF/similares/cabecera.jsp" />


        <br>
        <br>
        <br>

        <div class="container">
            <div class="row">


                <div class="col-md-6">


                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">fecha</th>
                                <th scope="col">Actividad</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Estado</th>

                            </tr>
                        </thead>
                        <tbody>








                            <c:forEach var="lista" items="${listaTareas}" varStatus="status" >

                                <c:if test = "${lista.estado=='1'}">
                                    <tr class="table-primary">


                                        <th >${lista.fecha}</th>
                                        <td>${lista.actividad}</td>
                                        <td>${lista.descripcion}</td>
                                        <td>Activo</td>




                                    </tr>
                                </c:if>
                                <c:if test = "${lista.estado=='2'}">
                                    <tr class="table-dark">


                                        <th >${lista.fecha}</th>
                                        <td>${lista.actividad}</td>
                                        <td>${lista.descripcion}</td>
                                        <td>Inactivo</td>




                                    </tr>
                                </c:if>



                            </c:forEach>
                        </tbody>
                    </table>

                </div>

            </div>

        </div>











    </c:when>  

    <c:when test="${usuario.idUsuario==null}">

        <jsp:include page="login.jsp" />



    </c:when>  

    <c:otherwise>









    </c:otherwise>
</c:choose>
