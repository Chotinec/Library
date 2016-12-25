<%@page import="com.library.enums.SearchType"%>
<%@page import="java.util.List"%>
<%@page import="com.library.beans.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../WEB-INF/jspf/left_menu.jspf" %>

<%@include file="../WEB-INF/jspf/letters.jspf" %>

    <div class="book_list">
    
        <jsp:useBean id="bookList" class="com.library.beans.BookList" scope="page"/>

        <% 
            request.setCharacterEncoding("UTF-8");
            
            List<Book> books = null;
            if (request.getParameter("genre_id") != null) {
                long genre_id = Long.valueOf(request.getParameter("genre_id"));
                books = bookList.getBooksByGenre(genre_id);
            } else if (request.getParameter("letter") != null) {
                String letter = request.getParameter("letter");
                session.setAttribute("letter", letter);
                books = bookList.getBooksByLetter(letter);
            } else if (request.getParameter("search_String") != null) {  
                System.out.println("search!");
                String searchString = request.getParameter("search_String");
                SearchType type = SearchType.TITLE;
                if (request.getParameter("search_option").equals("Автор")) {
                    type = SearchType.AUTHOR;
                }
                if (searchString != null && !searchString.trim().equals("")) {
                    books = bookList.getBooksBySearch(searchString, type);
                }
            } else if (session.getAttribute("currentBookList") != null) {
                books = (List<Book>)session.getAttribute("currentBookList");
            }
        %>
        
        <h5 style="text-align: left; margin-top:20px;">Найдено книг: <%=books.size() %> </h5>
        
        <%
            session.setAttribute("currentBookList", books);
            for (Book book : books) {
        %>
        
        <div class="book_info">
            
            <div class="book_title">
                <p><%=book.getName()%></h3><p>
            </div>
            
            <div class="book_image">
                <a href="<%=request.getContextPath()%>/PdfContent?index=<%=books.indexOf(book)%>"><img src="<%=request.getContextPath()%>/ShowImage?index=<%=books.indexOf(book)%>" height="250" width="190"></a>
            </div>
        
            <div class="book_details">
                <br><strong>ISBN: </strong><%=book.getIsbn()%>
                <br><strong>Издательство: </strong><%=book.getPublisher()%>
                <br><strong>Количество страниц: </strong><%=book.getPageCount()%>
                <br><strong>Год издания: </strong><%=book.getPublishDate()%>
                <br><strong>Автор: </strong><%=book.getAuther()%>
                <p style="margin: 10px"><a href="<%=request.getContextPath()%>/PdfContent?index=<%=books.indexOf(book)%>">Читать</a></p>
            </div>
        </div>
       
        <%}%>
        
    </div>
    
