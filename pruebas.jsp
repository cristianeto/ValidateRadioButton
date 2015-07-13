<%-- 
    Document   : pruebas
    Created on : 07-jul-2015, 13:59:28
    Author     : Cristian
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="espoch.secge.accesodatos.entidades.PreguntaEspecifica"%>
<%@page import="espoch.secge.accesodatos.entidades.PreguntaGeneral"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
        <style>
            #myBtn {
                width: 300px;
                padding: 10px;
                font-size:20px;
                position: absolute;
                margin: 0 auto;
                right: 0;
                left: 0;
                bottom: 50px;
                z-index: 9999;
            }
        </style>
    </head>
    <body>
        <%
            List<PreguntaEspecifica> lisPreguntasE = new ArrayList<PreguntaEspecifica>();
            PreguntaEspecifica objPreguntaEspecifica1 = new PreguntaEspecifica();
            PreguntaEspecifica objPreguntaEspecifica2 = new PreguntaEspecifica();
            PreguntaEspecifica objPreguntaEspecifica5 = new PreguntaEspecifica();
            objPreguntaEspecifica1.setIntCodigo(1);
            objPreguntaEspecifica1.setStrBase("pregunta1");
            objPreguntaEspecifica2.setIntCodigo(2);
            objPreguntaEspecifica2.setStrBase("pregunta2");
            objPreguntaEspecifica5.setIntCodigo(5);
            objPreguntaEspecifica5.setStrBase("pregunta5");
            lisPreguntasE.add(objPreguntaEspecifica1);
            lisPreguntasE.add(objPreguntaEspecifica2);
            lisPreguntasE.add(objPreguntaEspecifica5);

            for (PreguntaEspecifica obj : lisPreguntasE) {
                out.print(obj.getIntCodigo() + ", ");
            }

            List<PreguntaGeneral> lisPreguntasG = new ArrayList<PreguntaGeneral>();
            PreguntaGeneral objPreguntaGeneral1 = new PreguntaGeneral();
            PreguntaGeneral objPreguntaGeneral2 = new PreguntaGeneral();
            objPreguntaGeneral1.setIntCodigo(3);
            objPreguntaGeneral1.setStrBase("pregunta3");
            objPreguntaGeneral2.setIntCodigo(4);
            objPreguntaGeneral2.setStrBase("pregunta4");
            lisPreguntasG.add(objPreguntaGeneral1);
            lisPreguntasG.add(objPreguntaGeneral2);
            Integer intTotalPreguntas = lisPreguntasE.size() + lisPreguntasG.size();
        %>

        <script>


            var grupos = [];
            <% for (PreguntaEspecifica objEspecifica : lisPreguntasE) {%>
            grupos.push("<%=objEspecifica.getIntCodigo()%>");
            <%
                }
            %>

            <% for (PreguntaGeneral objGeneral : lisPreguntasG) {%>
            grupos.push("<%=objGeneral.getIntCodigo()%>");
            <%
                }
            %>

        </script>


        <h1>hello</h1>

        lista preguntasTotales:
        <p id="vec"> </p>
        <div class="progress">
            <div id="barra" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 85%; text-decoration-color: #000">
                <span class="sr-only">100%</span>Total preguntas
            </div>
        </div>
        <!-- Tabla de Preguntas Contestadas -->
        <div class="col-md-1 table-responsive">          
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th><%=intTotalPreguntas%> Preguntas</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (int contT = 1; contT <= intTotalPreguntas; contT++) {%>
                    <tr>
                        <td id="p<%=contT%>" class="danger" ><%=contT%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div><br>  
        <form id="formulario"  action="pruebas_1.jsp" >
            <%for (PreguntaEspecifica objPreguntaEspecific : lisPreguntasE) {%>
            one<input id="p<%=lisPreguntasE.indexOf(objPreguntaEspecific) + 1%>" onclick="preguntaRespondida(this.id)" type="radio" name="<%=objPreguntaEspecific.getIntCodigo()%>"><br>
            two<input id="p<%=lisPreguntasE.indexOf(objPreguntaEspecific) + 1%>" onclick="preguntaRespondida(this.id)" type="radio" name="<%=objPreguntaEspecific.getIntCodigo()%>"><br>
            three<input id="p<%=lisPreguntasE.indexOf(objPreguntaEspecific) + 1%>" onclick="preguntaRespondida(this.id)" type="radio" name="<%=objPreguntaEspecific.getIntCodigo()%>"><br><br>
            <div class="errors error1"></div>

            <%}%>

            <%for (PreguntaGeneral objPreguntaGenera : lisPreguntasG) {%>
            one<input id="p<%=lisPreguntasE.size() + lisPreguntasG.indexOf(objPreguntaGenera) + 1%>" onclick="preguntaRespondida(this.id)" type="radio" name="<%=objPreguntaGenera.getIntCodigo()%>"><br>
            two<input id="p<%=lisPreguntasE.size() + lisPreguntasG.indexOf(objPreguntaGenera) + 1%>" onclick="preguntaRespondida(this.id)" type="radio" name="<%=objPreguntaGenera.getIntCodigo()%>"><br>
            three<input id="p<%=lisPreguntasE.size() + lisPreguntasG.indexOf(objPreguntaGenera) + 1%>" onclick="preguntaRespondida(this.id)" type="radio" name="<%=objPreguntaGenera.getIntCodigo()%>"><br><br>
            <div class="errors error1"></div>

            <%}%>

            <!--<input type="submit">-->
            <input type="button" onclick="validarRadios(this)" value="Finalizar Examen" class="btn btn-info" id="myBtn">
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Alerta</h4>
                        </div>
                        <div class="modal-body">
                            <p class="bg-danger" id="res">The <strong>shown.bs.modal</strong> event occurs when the modal is fully shown.</p>
                            <p>Da clic en <strong>Finalizar</strong> para enviar el examen o <strong>Cancelar</strong> para volver al examen</p>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <input type="submit" class="btn btn-success" value="Finalizar">
                        </div>
                    </div>

                </div>
            </div> 
        </form>

        <!-- Trigger the modal with a button 
        <button type="button" class="btn btn-info btn-lg" id="myBtn">Open Modal</button>-->




        <script>
            $(document).ready(function () {
                $("#myBtn").click(function () {
                    $("#myModal").modal("show");
                });
                $("#myModal").on('shown.bs.modal', function () {
                    //alert('The modal is fully shown.');
                    var noContestadas = [];
                    for (i = 0; elem = formulario.elements[i]; i++) {
                        if (elem.type == "radio") {
                            if (!grupos[elem.id]) {
                                grupos[elem.id] = elem.checked;
                            }
                        }
                    }
                    for (grupo in grupos) {
                        if (!grupos[grupo]) {
                            noContestadas.push(grupo);

                        }
                    }

                    if (noContestadas != "") {
                        document.getElementById("res").innerHTML = "Tienes preguntas no contestadas! " + noContestadas;
                    } else {
                        document.getElementById("res").innerHTML = "Estas a punto de finalizar el examen!";
                        document.getElementById("res").className = "bg-success";

                    }
                });
            });
        </script> 
        <script>
            function preguntaRespondida(id) {
                document.getElementById(id).className="success";
            }

        </script>
    </body>
</html>
