package cn.mldn.shop.servlet.front;


import cn.mldn.shop.factory.ServiceBackFactory;
import cn.mldn.shop.factory.ServiceFrontFactory;
import cn.mldn.shop.vo.Member;
import cn.mldn.util.validate.ValidateUtil;
import com.jspsmart.upload.SmartUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "MemberInfoServletFront", urlPatterns = "/pages/front/member/MemberInfoServletFront/*")
public class MemberInfoServletFront extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "/pages/errors.jsp"; // 程序错误跳转页面
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
        if (status != null || "".equals(status)) {
            if ("updatePre".equals(status)) {
                path = this.updatePre(request);
            } else if ("update".equals(status)) {
                path = this.update(request, response);
            }
        }
        request.getRequestDispatcher(path).forward(request, response);
    }

    public String updatePre(HttpServletRequest request) {
        String mid = (String) request.getSession().getAttribute("mid");
        try {
            request.setAttribute("member", ServiceFrontFactory.getIMemberServiceFrontInstance().updatePre(mid));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/pages/front/member/member_update.jsp";
    }

    public String update(HttpServletRequest request, HttpServletResponse response) {
        String mid = (String) request.getSession().getAttribute("mid");
        SmartUpload smart = new SmartUpload();
        try {
            smart.initialize(super.getServletConfig(), request, response);
            smart.upload();
        } catch (Exception e) {
        }
        String name = smart.getRequest().getParameter("name");
        String phone = smart.getRequest().getParameter("phone");
        String address = smart.getRequest().getParameter("address");
        String msg = null;
        String url = null;
        if (ValidateUtil.validatEmpty(name) && ValidateUtil.validatEmpty(phone) && ValidateUtil.validatEmpty(address)) {
            Member vo = new Member();
            vo.setMid(mid);
            vo.setName(name);
            vo.setAddress(address);
            vo.setPhone(phone);
            vo.setPhoto(smart.getRequest().getParameter("oldpic"));
            try {
                if (smart.getFiles().getSize() > 0) { // 用新的数据
                    // 判断上传文件是图片
                    if (smart.getFiles().getFile(0).getContentType().contains("image")) {
                        if ("nophoto.jpg".equals(vo.getPhoto())) {
                            vo.setPhoto(UUID.randomUUID().toString().replace("-", "") + smart.getFiles().getFile(0).getFileExt());
                        }
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if (ServiceFrontFactory.getIMemberServiceFrontInstance().update(vo)) {
                    if (smart.getFiles().getSize() > 0) { // 用新的数据
                        // 判断上传文件是图片
                        if (smart.getFiles().getFile(0).getContentType().contains("image")) {
                            //  拼凑地址
                            String filePath = super.getServletContext().getRealPath("/upload/member/") + vo.getPhoto();
                            smart.getFiles().getFile(0).saveAs(filePath); // 文件信息保存
                        }
                    }
                    msg = "用户信息更新成功!";
                    request.setAttribute("photo",vo.getPhoto());
                } else {
                    msg = "用户信息更新失败!";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            msg = "更新数据不完整，请重新输入";
        }
        url = "/pages/front/member/MemberInfoServletFront/updatePre";
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return "/pages/forward.jsp";
    }
}
