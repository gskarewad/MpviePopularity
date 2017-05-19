package com.ontology.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;

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
 * Servlet implementation class SearchServlet
 */
@SuppressWarnings("deprecation")
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings({ "resource", "unused" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchkey = request.getParameter("key");
		String api = "https://webhose.io/search?";
		String token = "f65fd73d-96c2-49a5-9245-b17ecdb8257c";
		String format = "json";
		String result = "";
		String q = searchkey.replaceAll(" ", "%" + "20");
		String destination = api + "token=" + token + "&fromat=" + format + "&q=" + q;
		String encodeUrl = searchkey.replace(" ", "%20");
		System.out.println(searchkey.replace(" ", "%20"));
		try {
			encodeUrl = URLEncoder.encode(searchkey, "UTF-8");
		} catch (UnsupportedEncodingException ignored) {
			// Can be safely ignored because UTF-8 is always supported
		}

		try {

			// https://maps.googleapis.com/maps/api/place/textsearch/json?query=tourist+places+near+pune&key=AIzaSyANiv2gjGmrsnCQWsT74T3nU5WZmTi_Vu0

			URL url = new URL("https://maps.googleapis.com/maps/api/place/textsearch/json?query=tourist+places+near"
					+ searchkey.replace(" ", "+") + "&key=AIzaSyANiv2gjGmrsnCQWsT74T3nU5WZmTi_Vu0");
			System.out.println(url.toString());
			HttpClient client = new DefaultHttpClient();
			HttpGet req = new HttpGet(url.toString());
			HttpResponse resp = client.execute((HttpUriRequest) req);
			BufferedReader rd = new BufferedReader(
					new InputStreamReader(((HttpResponse) resp).getEntity().getContent()));

			String line = "";
			while ((line = rd.readLine()) != null) {
			//	System.out.println(line);
				// response.getWriter().write(line);
				// response.getWriter().write("\n");
				result += line;
			}
			response.getWriter().write(result);
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
