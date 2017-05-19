package com.ontology.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;

/**
 * Servlet implementation class SearchRestaurants
 */
@SuppressWarnings("deprecation")
@WebServlet("/SearchHotels")
public class SearchHotels extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchHotels() {
        super();
     }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "resource" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String place = request.getParameter("place");
    String result="";
    HttpClient client = new DefaultHttpClient();
	
    try {
		// https://maps.googleapis.com/maps/api/place/textsearch/json?query=tourist+places+near+pune&key=AIzaSyANiv2gjGmrsnCQWsT74T3nU5WZmTi_Vu0
		URL url = new URL("https://maps.googleapis.com/maps/api/place/textsearch/json?query=hotels+near"
				+place+"&key=AIzaSyANiv2gjGmrsnCQWsT74T3nU5WZmTi_Vu0");
		System.out.println(url.toString());
		HttpGet req = new HttpGet(url.toString());
		HttpResponse resp = client.execute((HttpUriRequest) req);
		BufferedReader rd = new BufferedReader(
				new InputStreamReader(((HttpResponse) resp).getEntity().getContent()));

		String line = "";
		while ((line = rd.readLine()) != null) {

			result += line;
		}
		response.getWriter().write(result);
	} catch (Exception e) {
		System.out.println(e);
	}
   
    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		doGet(request, response);
	}

}
