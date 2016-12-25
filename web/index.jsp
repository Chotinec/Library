<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/style_index.css">
    </head>
    <body>
       
        <div id="main">
            
            <div id="content">
                <div class="center"><img src="images/lib.png" alt="lib"></div>
                <p class="title">Онлайн библиотека</p>
                <p align="justify">Дообро пожаловать в онлайн библиотеку, где вы сможете найти любую книгу на ваш вкус. Доступны функционал поиска, просмотра, соортировки и многие другие.
                <p align="justify">Проект находится в разработке, поэтому дизайн и функционал будет постоянно обновлятся.
                <p align="justify">По всем вопросам обращаться по адресу <a href="URL">suport@gmail.com</a>
                <p>&nbsp;</p>
            </div>
            
            <div id="login" class="center">
                <p class="title">Для входа введите свои данные:</p>
                <form name="username" action="pages/main.jsp" method="POST">
                    Имя: <input type="text" name="username" value="" size="20" />
                    <input type="submit" value="Войти" />
                </form>  
            </div>
            
        </div>
        
    </body>
</html>
