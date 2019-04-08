package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AddrService;
import service.impl.AddrServiceImpl;
import utils.Command;

public class AddrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AddrService as = new AddrServiceImpl();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = Command.getCmd(request);
		if("list".equals(cmd)) {
			as.selectAddrList(request);
			Command.goPage(request, response,"/views/addr/list");
			 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}