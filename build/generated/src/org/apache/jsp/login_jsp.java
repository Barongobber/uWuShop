package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/footer/footer.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_out_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_out_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_out_value_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\" />\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\" />\n");
      out.write("        <meta name=\"description\" content=\"\" />\n");
      out.write("        <meta name=\"author\" content=\"\" />\n");
      out.write("        <title>Login Page - UwuShop</title>\n");
      out.write("        <link href=\"dist/css/styles.css\" rel=\"stylesheet\" />\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-primary\">\n");
      out.write("        <div id=\"layoutAuthentication\">\n");
      out.write("            <div id=\"layoutAuthentication_content\">\n");
      out.write("                <main>\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <div class=\"row justify-content-center\">\n");
      out.write("                            <div class=\"col-lg-5\">\n");
      out.write("                                <div class=\"card shadow-lg border-0 rounded-lg mt-5\">\n");
      out.write("                                    <div class=\"card-header\"><h3 class=\"text-center font-weight-light my-4\">Customer Login</h3></div>\n");
      out.write("                                    <div class=\"card-body\">\n");
      out.write("                                    \n");
      out.write("                                        <form method=\"post\" action=\"UserController\">\n");
      out.write("                                            <div class=\"form-group\">\n");
      out.write("                                                <label class=\"small mb-1\" for=\"username\">Username</label>\n");
      out.write("                                                <input class=\"form-control py-4\" id=\"username\" name=\"username\" type=\"text\" placeholder=\"Enter username\" />\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group\">\n");
      out.write("                                                <label class=\"small mb-1\" for=\"password\">Password</label>\n");
      out.write("                                                <input class=\"form-control py-4\" id=\"password\" name=\"password\" type=\"password\" placeholder=\"Enter password\" />\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group\">\n");
      out.write("                                                <div class=\"custom-control custom-checkbox\">\n");
      out.write("                                                    <input class=\"custom-control-input\" id=\"rememberPasswordCheck\" type=\"checkbox\" />\n");
      out.write("                                                    <label class=\"custom-control-label\" for=\"rememberPasswordCheck\">Remember password</label>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <p style=\"color:red\">");
      if (_jspx_meth_c_out_0(_jspx_page_context))
        return;
      out.write("</p>\n");
      out.write("                                            <div class=\"form-group d-flex align-items-center justify-content-between mt-4 mb-0\">\n");
      out.write("                                                <a class=\"small\" href=\"password.html\">Forgot Password?</a>\n");
      out.write("                                                <input type=\"hidden\" name=\"control\" value=\"loginUser\"/> \n");
      out.write("                                                <input type=\"submit\" class=\"btn btn-primary\" value=\"Login\"/>\n");
      out.write("                                            </div>\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"card-footer text-center\">\n");
      out.write("                                        <div class=\"small\"><a href=\"register.jsp\">Need an account? Sign up!</a></div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </main>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"layoutAuthentication_footer\">\n");
      out.write("                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("                <footer class=\"py-4 bg-light mt-auto\">\n");
      out.write("                    <div class=\"container-fluid\">\n");
      out.write("                        <div class=\"d-flex align-items-center justify-content-between small\">\n");
      out.write("                            <div class=\"text-muted\">Copyright &copy; UwUshop 2021</div>\n");
      out.write("                            <div>\n");
      out.write("                                <a href=\"#\">Privacy Policy</a>\n");
      out.write("                                &middot;\n");
      out.write("                                <a href=\"#\">Terms &amp; Conditions</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </footer>");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"js/scripts.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_out_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:out
    org.apache.taglibs.standard.tag.rt.core.OutTag _jspx_th_c_out_0 = (org.apache.taglibs.standard.tag.rt.core.OutTag) _jspx_tagPool_c_out_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.OutTag.class);
    _jspx_th_c_out_0.setPageContext(_jspx_page_context);
    _jspx_th_c_out_0.setParent(null);
    _jspx_th_c_out_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${alert}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_out_0 = _jspx_th_c_out_0.doStartTag();
    if (_jspx_th_c_out_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_out_value_nobody.reuse(_jspx_th_c_out_0);
      return true;
    }
    _jspx_tagPool_c_out_value_nobody.reuse(_jspx_th_c_out_0);
    return false;
  }
}
