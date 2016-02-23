<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Admin Girişi</title>
    <link href="~/adminPanel/css/bootstrap.min.css" rel="stylesheet" />
    <link href="~/adminPanel/css/style.css" rel="stylesheet" />
    <link href="~/adminPanel/css/font-awesome.css" rel="stylesheet" />
    <script src="~/adminPanel/js/jquery.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
    <script src="~/adminPanel/js/bootstrap.min.js"></script>

    <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
    <script>
        function myFunction() {

            if ($('#kAdi').val() == "" || $('#kAdi').val() == "Kullanıcı Adı" || $("#kSifre").val() == "" || $('#kSifre').val() == "Şifre") {
                alert("kullanıcı adı veya sifre boş olamaz")
                return false;
            }

            else {
                return true;
            }
        }

    </script>

</head>
<body id="login">
    <div class="login-logo">
        <h1 style="color: #222224;">Kemal Tekin Blog Admin</h1>
    </div>
    <h2 class="form-heading">Giris</h2>
    <div class="app-cam">
            <%using (Html.BeginForm("giris", "admin",FormMethod.Post, new { @name = "frm", @id = "frm" }))
              {%>
            <%:Html.TextBox("txtKullaniciAdi", "Kullanıcı Adı",new{@id="kAdi",@name="kAdi",@class="text",onfocus="this.value = '';", onblur="if (this.value == '') {this.value = 'Kullanıcı Adı';}"} )%>
            <%:Html.Password("txtSifre", "Şifre",new{value="Password",@Id="kSifre",@name="kSifre",@class="text",onfocus="this.value = '';", onblur="if (this.value == '') {this.value = 'Password';}"} )%>
           
            <div class="submit">
                <input type="submit" value="giris" onclick="myFunction();" id="button">
            </div>

            <% }

              if (ViewBag.denem == "deneme")
              {
            %>
            <h1 style="color: #ffd800;">Kemal Tekin Blog Admin</h1>


            <%
              }
              //Admin controllerda kontrol ettirdik ama sonucu göstereceğimiz kısınm yine login.aspx olduğundan 
              //kullanılacak kodların bir kısmını buraya yazıcaz

              if (ViewBag.Bos == true)
              {

                  Response.Write("Lutfen Tum alanlari doldurunuz");
              }
              //sessionu kontrol ettirdiğimiz alan
              if (ViewBag.onay == false)
              {    %>
            <h1 style="color: #ffd800;">Kemal Tekin Blog Admin</h1>


            <%  Response.Write("kullanici adi veya sifre yanlis");

              }
          
            %>




            <ul class="new">
                <li class="new_left">
                    <p><a href="#">Forgot Password ?</a></p>
                </li>

            </ul>
            <%-- <div class="clearfix"></div>--%>
    </div>
</body>
</html>
