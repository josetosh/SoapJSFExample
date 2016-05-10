<%-- 
    Document   : feedback
    Created on : Apr 22, 2016, 8:23:48 PM
    Author     : jnjeru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Feedback Page</title>
            <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>                                  

        </head>
        <body onload='document.form1.email.focus()'>

        <nav class="navbar navbar-dark bg-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Dummy-Shop Ltd</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active btn btn-primary"><a href="index.xhtml" data-toggle="tooltip" title="Our Home Page">Home</a></li>
                    <li class="active btn btn-primary"><a href="index.xhtml" data-toggle="tooltip" title="All About Us">About Us</a></li>
                    <li class="active btn btn-primary"><a href="index.xhtml" data-toggle="tooltip" title="Our Products">Products</a></li> 
                    <li class="active btn btn-primary"><a href="index.xhtml" data-toggle="tooltip" title="Reach US">Contact Us</a></li> 
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.xhtml"><span class="glyphicon glyphicon-plus-sign"></span> Shop Again</a></li>
                    <li><a href="index.xhtml"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                    <li><a href="index.xhtml"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <h1><h:outputText value="Feedback Page Below"/></h1>

            <!--<form id="myForm" action="Feedback" method="get"> 
                Name: <input type="text" name="name" /> <br/>
                Mobile No.: <input type="text" name="comment"></input> <br/>
                Email: <input type="text" name="name" /> <br/>
                Facebook Acc.: <input type="text" name="comment"></input><br/>
                Twitter Acc.: <input type="text" name="name" /> <br/>
                LinkedIn Acc.: <input type="text" name="comment"></input><br/>
                Google Hangouts Acc.: <input type="text" name="comment"></input><br/>
                Comment: <textarea name="comment"></textarea><br/>
                <input type="submit" value="Submit Comment" /> 
            </form>-->              
            <form name="form1" method="POST" action="Feedback" id="feedback" onsubmit="return validateform()">
                <table>
                    <fieldset class="form-group">
                        <tr class="row">
                            <td class="col-md-6 text-info"><span class="span6 bg-primary" style="padding-right:120px;">Name:</span> <input type="text" name="name" /> <br/></td>
                        </tr>
                    </fieldset>
                    <fieldset class="form-group">
                        <tr class="row">
                            <td class="col-md-6 text-info"><span class="span6 bg-primary" style="padding-right:90px;">Mobile No.:</span> <input type="text" name="mobile"></input> <br/></td>
                        </tr>
                        <fieldset class="form-group">
                            <tr class="row">
                                <td class="col-md-6 text-info"><span class="span6 bg-primary" style="padding-right:123px;">Email:</span> <input type="email" name="email" id="email"  required placeholder="Enter a valid email address" required /><br/></td>
                            </tr>
                        </fieldset>
                        <fieldset class="form-group">
                            <tr class="row">
                                <td class="col-md-6 text-info"><span class="span6 bg-primary" style="padding-right:64px;">Facebook Acc.:</span> <input type="text" name="fb"></input><br/></td>
                            </tr>
                        </fieldset>
                        <fieldset class="form-group">
                            <tr class="row">
                                <td class="col-md-6 text-info"><span class="span6 bg-primary" style="padding-right:85px;">Twitter Acc.:</span> <input type="text" name="twitter" /><br/></td>
                            </tr>
                        </fieldset>
                        <fieldset class="form-group">
                            <tr class="row">
                                <td class="col-md-6 text-info"><span class="span6 bg-primary" style="padding-right:73px;">LinkedIn Acc.:</span> <input type="text" name="linkedin"></input><br/></td>
                            </tr>
                        </fieldset>
                        <fieldset class="form-group">
                            <tr class="row">
                                <td class="col-md-6 text-info"><span class="span6 bg-primary" style="padding-right:16px;">Google Hangouts Acc.:</span> <input type="text" name="hangouts"></input><br/></td>
                            </tr>
                        </fieldset>
                        <fieldset class="form-group">
                            <tr class="row">
                                <td class="col-md-6 text-info"><span class="span6 bg-primary" style="padding-right:96px;">Comment:</span> <textarea name="comment"></textarea><br/></td>
                            </tr>
                        </fieldset>
                        <tr>
                            <td><br/></td>
                        </tr>
                        <fieldset class="form-group">
                            <tr class="row">
                                <td class="col-md-6 text-info"></td><td><span id="send" name="submit" onclick="form1.submit()" class="btn btn-primary" data-toggle="tooltip" title="Post to us" >Post</span></td>
                            </tr>
                        </fieldset>
                </table>
            </form>
        </div>    

        <script language="javascript">
            $(document).ready(function() {

                function validateform(email) {
                    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                    if (filter.test(email)) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }

                $('#send').click(function(event) {
                    event.preventDefault();
                    var lEmail = $('#email').val();
                    var name = $('#name').val();
                    var mobile = $('#mobile').val();
                    if (name === null || name === "") {
                        alert("Name can't be blank");
                        event.preventDefault();
                        return false;
                    }
                    if (mobile === null || mobile === "") {
                        alert("Mobile No. can't be blank");
                        event.preventDefault();
                        return false;
                    }
                    if (!validateform(lEmail)) {
                        alert('Invalid Email Address');
                        event.preventDefault();
                        return false;
                    }                    
                });
                return false;
            });
        </script>




    </body>
</html>
</f:view>
