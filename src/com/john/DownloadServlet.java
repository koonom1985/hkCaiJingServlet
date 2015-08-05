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
        String fileName = request.getParameter("filename");

        if(fileName==null || "".equals(fileName.trim())) {
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<body>");
            out.println("<form style='width: 300px;margin: 0 auto;'>");
            out.println("Please input filename :");
            out.println("<br><input type='text' name='filename' value='104_201508010930'>");
            out.println("<br><input type='submit' value='Submit'>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
            return;
        }

        ServletOutputStream stream = null;
        BufferedInputStream buf = null;
        fileName=fileName+".mp3";
        try {
            stream = response.getOutputStream();
            File mp3 = new File("/home/jenkins/.jenkins/jobs/hkCaiJingServlet/workspace" + "/" + fileName);

            if (mp3==null || mp3.length()==0)
                response.sendError(response.SC_NO_CONTENT,"no file found");

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
            System.err.println(ioe);
//            throw new ServletException(ioe.getMessage());
        } finally {
            if (stream != null)
                stream.close();
            if (buf != null)
                buf.close();
        }
    }
}
