package com.john;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadServlet extends HttpServlet{

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
//        PrintWriter out = response.getWriter();
//        out.println("<html>");
//        out.println("<body>");
//        out.println("<h1>Hello Servlet Get</h1>");
//        out.println("</body>");
//        out.println("</html>");

        String fileName = request.getParameter("filename");

        if(fileName==null || "".equals(fileName.trim())) {
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<body>");
            out.println("<h1>Please input filename parameter</h1>");
            out.println("</body>");
            out.println("</html>");
            return;
        }

        ServletOutputStream stream = null;
        BufferedInputStream buf = null;
        fileName=fileName+".mp3";
        try {
            stream = response.getOutputStream();
            File mp3 = new File("/home/jenkins/jenkins-home/workspace/hkcaijin" + "/" + fileName);

            //set response headers
            response.setContentType("audio/mpeg");

            response.addHeader("Content-Disposition", "attachment; filename=" + fileName);

            response.setContentLength((int) mp3.length());

            FileInputStream input = new FileInputStream(mp3);
            buf = new BufferedInputStream(input);
            int readBytes;
            //read from the file; write to the ServletOutputStream
            while ((readBytes = buf.read()) != -1)
                stream.write(readBytes);
        } catch (IOException ioe) {
            throw new ServletException(ioe.getMessage());
        } finally {
            if (stream != null)
                stream.close();
            if (buf != null)
                buf.close();
        }
    }
}
