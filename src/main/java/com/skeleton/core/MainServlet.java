package com.skeleton.core;

import com.skeleton.util.WebUtil;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Daniel Thengvall
 */
public class MainServlet extends HttpServlet {

  private static final Logger LOG = Logger.getLogger(MainServlet.class.getSimpleName());

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

    LOG.info(req.getParameter("value"));

    WebUtil.setSessionAttribute("value", req.getParameter("value"), req);

    res.sendRedirect(WebUtil.buildUrl(req, "/"));
  }
}
