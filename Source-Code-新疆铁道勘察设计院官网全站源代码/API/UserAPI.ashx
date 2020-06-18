<%@ WebHandler Language="C#" Class="UserAPI" %>

/*
 *用户API,检测是否登录等
 */
using System;
using System.Web;
using ZoomLa.BLL;
using ZoomLa.Model;

public class UserAPI : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        string action = context.Request["action"];
        string value=context.Request["value"];
        string result = "";
        B_User buser = new B_User();
        M_UserInfo info = new M_UserInfo();
        switch (action)
        {
            case "CheckLogin"://是否登录
                info = buser.GetLogin();
                if (!info.IsNull)
                    result = info.UserName;
                break; 
            case "Login"://登录
                string uname = value.Split(':')[0];
                string upwd = value.Split(':')[1];
                info = buser.AuthenticateUser(uname, upwd);
                if (!info.IsNull)
                {
                    buser.SetLoginState(info,"Day");
                    result = info.UserName;
                }
                break;
        }
        context.Response.Clear();
        context.Response.Write(result); context.Response.Flush(); context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}