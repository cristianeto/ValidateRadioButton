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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<PreguntaEspecifica> lisPreguntasE = new ArrayList<PreguntaEspecifica>();
            PreguntaEspecifica objPreguntaEspecifica1 = new PreguntaEspecifica();
            PreguntaEspecifica objPreguntaEspecifica2 = new PreguntaEspecifica();
            objPreguntaEspecifica1.setIntCodigo(1);
            objPreguntaEspecifica1.setStrBase("pregunta1");
            objPreguntaEspecifica2.setIntCodigo(2);
            objPreguntaEspecifica2.setStrBase("pregunta2");
            lisPreguntasE.add(objPreguntaEspecifica1);
            lisPreguntasE.add(objPreguntaEspecifica2);

            List<PreguntaGeneral> lisPreguntasG = new ArrayList<PreguntaGeneral>();
            PreguntaGeneral objPreguntaGeneral1 = new PreguntaGeneral();
            PreguntaGeneral objPreguntaGeneral2 = new PreguntaGeneral();
            objPreguntaGeneral1.setIntCodigo(3);
            objPreguntaGeneral1.setStrBase("pregunta3");
            objPreguntaGeneral2.setIntCodigo(4);
            objPreguntaGeneral2.setStrBase("pregunta4");
            lisPreguntasG.add(objPreguntaGeneral1);
            lisPreguntasG.add(objPreguntaGeneral2);
        %>
        <h1>Hello World!</h1>

        <form action="" class="validar_form" method="post">
            <h2>Checkbox</h2>
            <div><input type="checkbox" name="chck[]" value="opt 1 chckd" /><label>Opt 1</label></div>
            <div><input type="checkbox" name="chck[]" value="opt 2 chckd" /><label>Opt 2</label></div>
            <div><input type="checkbox" name="chck[]" value="opt 3 chckd" /><label>Opt 3</label></div>
            <div class="errors error1"></div>
            <h2>Radio1</h2>
            <div><input type="radio" name="gruporad" value="rad 1 chckd" /><label>Radio 1</label></div>
            <div><input type="radio" name="gruporad" value="rad 2 chckd" /><label>Radio 2</label></div>
            <div><input type="radio" name="gruporad" value="rad 3 chckd" /><label>Radio 3</label></div>
            <div class="errors error2"></div>
            
            <h2>Radio2</h2>
            <div><input type="radio" name="gruporad1" value="rad 1 chckd" /><label>Radio 1</label></div>
            <div><input type="radio" name="gruporad1" value="rad 2 chckd" /><label>Radio 2</label></div>
            <div><input type="radio" name="gruporad1" value="rad 3 chckd" /><label>Radio 3</label></div>
            <div class="errors error2"></div>
            
            
            <h2>Select</h2>
            <div>
                <select name="select">
                    <option value="" selected>------</option>
                    <option value="select 1 chckd">Opcion 1</option>
                    <option value="select 1 chckd">Opcion 2</option>
                    <option value="select 1 chckd">Opcion 3</option>
                </select>
                <div class="errors error3"></div>
            </div>
            <button class="enviar">Enviar</button>
        </form>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript">
            $(".validar_form").submit( function(){
                
                var cont=0;
        var check = $("input[type='checkbox']:checked").length;
        var radio = $("input[type='radio']:checked").length;
        var select = $("select option:selected").val();
 
            if(check === ""){
                $('.error1').text("Seleccione al menos un checkbox");
                return false;
            } else if(radio == ""){
                $('.error2').text("Seleccione un radio button");
                return false;
            } else if(select == ""){
                $('.error3').text("Seleccione una opcion");
                return false;
            } else {
                $('.errors').hide();
                alert('Ok!');
                return true;
            }   
    });
        </script>
    </body>
</html>
