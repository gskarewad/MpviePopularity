<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <html>
    <head>
      
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="css1/index.css">
        <link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css1/main.css">
         
    </head>
    <body>

      <form action="RegisterServlet" method="post">
      
        <h1>Sign Up</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Your Basic Info</legend>
          <label for="name">Name:</label>
          <input type="text"   name="name" required>
           
          <label for="mail">Email_ID:</label>
          <input type="email"   name="email" required>
          
          <label for="password">Password:</label>
          <input type="password"   name="password" required>
            
        </fieldset>
        <button type="submit">Sign Up</button>
    
      </form>
      
    </body>
</html>