<%-- 
    Document   : cevap
    Created on : Aug 11, 2022, 8:24:26 PM
    Author     : maytemur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <jsp:useBean id="ilkCekirdek" scope="session" class="veri.Kisi" />
        <!--bunu yandaki paletten ekliyoruz.scope olarak sesion süresince 
        geçerli olacak şekilde ayarladık bunun biraz daha
            gelişmişi örneğin 1 hafta sürecek şekilde bilgilerin saklanması işi Cookiler'le
            yapılıyor-->
        <jsp:setProperty name="ilkCekirdek" property="isim"/>
        <!--Burada Java Bean'i, set ile Kisi.java class'ındaki objeleri set ediyor, get ilede o
                değerleri alıyor-->
        <jsp:setProperty name="ilkCekirdek" property="sifre" />
        <!--bean'i yan paletten eklediğimizde value değerini kendi oluşturduğu için onu boş geçiyoruz
        eğer onu property="isim" value="değer" olarak verirsek hata veriyor--> 
        <h4>Merhaba</h4>
        <%--<jsp:getProperty name="ilkCekirdek" property="isim"/>--%>
        <%--<jsp:getProperty name="ilkCekirdek" property="sifre"/>--%>
        <!--ilk çekirdeğin içinden bunları okumamıza gerek yok!!!!-->
        <% if (ilkCekirdek.sifreKontrol()) {
                out.println("Sisteme Hoşgeldiniz şifreniz doğru!");
            } else {
                out.print("şifreniz hatalı");
            }%>

        <h4>  Siteme Hoşgeldiniz</h4>
        <!--Her seferinde rewuest ile kullanıcıdan bilgi almamak için kullanıcı bilgilerini session
        içine alıyoruz-->
        <%
            HttpSession oturum= request.getSession(); 
            //yukarıdaki gelen değerleri session içinede koyuyoruzki her seferinde 
            //requestle istemeyelim
            String kullanici= request.getParameter("isim");
            String sifre= request.getParameter("sifre");
            out.print("isminiz : "+ kullanici+" ve sifreniz "+sifre);
            oturum.setAttribute("oturumismi", kullanici); 
            //isimden gelen objeyi(kullanici) oturumismi olarak set ettik
            //mahsus farklı isimler veriyoruzki karışmasın diye
        
        %>
    </body>
</html>