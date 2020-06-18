﻿/*
*  首页用JS
*/
//场景切换
function ScenceFunc(id, v)//Scence Switch
{
    if (v.indexOf("0") > -1) {
        var arr = v.split(',');
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] != 0) continue;
            $("." + id + (i + 1)).hide();
        }
    }
}
function ScenceHead(cid,v)
{
    //从menu2开始计算
    if (v.indexOf("0") > -1) {
        var arr = v.split(',');
            for (var i = 0; i < arr.length; i++) {
                if (arr[i] != 0) continue;
                $("." + cid + (i + 2)).hide();
            }
    }
}
//清除首页的选中缓存
function ClearDefault()
{
    window.localStorage.removeItem("Default_leftin");
}
//----首页左边栏等JS
function openmenu(id) {
    $(".m_top_bottom").find("ul").hide();
    $(".m_top_bottom").find("." + id).show();
}
function hideleft() {
    var close_i = $(".m_bottom .b_close a .close_i");
    var close_t = $(".m_bottom .b_close a .close_t");
    if ($("#right").hasClass("col-lg-10 col-md-10 col-sm-10")) {
        window.localStorage.Default_leftStatus = 0;
        $("#left").hide();
        $("#right").removeClass("col-lg-10 col-md-10 col-sm-10").addClass("col-lg-12 col-md-12 col-sm-12");
        $("#right").removeClass("main_right");
    }
    else {
        window.localStorage.Default_leftStatus = 1;
        $("#left").show();
        $("#right").removeClass("col-lg-12 col-md-12 col-sm-12").addClass("col-lg-10 col-md-10 col-sm-10");
        $("#right").addClass("main_right");
    }
    LeftSwitchFunc();
}
function LeftSwitchFunc() {
    if (window.localStorage.Default_leftStatus == 0) {
        $("#leftSwitch").css("left", "2px");
        $("#leftSwitch img").attr("src", "/MIS/OA/Images/butOpen.gif");
        $("#leftSwitch img").attr("alt", "打开左边栏");
    }
    else {
        var leftWidth = $("#left").width();
        $("#leftSwitch").css("left", leftWidth + "px");
        $("#leftSwitch img").attr("src", "/MIS/OA/Images/butClose.gif");
        $("#leftSwitch img").attr("alt", "关闭左边栏");
    }
    $("#leftSwitch").show();
}
function showsearch() {
    if ($("#search_div").hasClass("hidden-lg hidden_group"))
        $("#search_div").removeClass("hidden-lg hidden_group");
    else
        $("#search_div").addClass("hidden-lg hidden_group");
}
//顶部按钮,显示左边栏
//子页边栏等JS
//-------OnLoad
$().ready(function () {
    if (window.localStorage.Default_leftStatus == 0) {
        $("#left").hide();
        $("#right").removeClass("col-lg-10 col-md-10 col-sm-10").addClass("col-lg-12 col-md-12 col-sm-12");
        $("#right").removeClass("main_right");
    }
    else {
        $("#left").show();
        $("#right").removeClass("col-lg-12 col-md-12 col-sm-12").addClass("col-lg-10 col-md-10 col-sm-10");
        $("#right").addClass("main_right");
    }
    LeftSwitchFunc();
});
$().ready(function () {
    $(".m_top_menu").find("ul li").click(function () {
        $(this).siblings("li").removeClass("active");
        $(this).addClass("active");
    });
    $("#myModal").find(".modal-content .modal_ul li .modal_a").click(function () {
        $(this).parent().siblings("li").find("ul").slideUp();
        $(this).parent().find("ul").slideToggle();
    });
    if (getCookie("SetLock") == "1") {//锁屏
        showWindow('Lockin.aspx', 900, 460);
    }
})
var a = function (id, str) {
    var s = str;
    $("#" + id).val(s).css('color', '#999')
    .focus(function () { if (this.value == s) { this.value = ''; this.style.color = '#555'; } })
    .blur(function () { if (this.value == '') { this.value = s; this.style.color = '#999'; } });
}
$().ready(function () {
    $(".m_top_bottom").find("ul li").click(function ()
    {
        $(this).siblings("li").removeClass("active");
        $(this).addClass("active");
    })
})

//设置Cookies
function setCookie(obj) {
    if (!navigator.cookieEnabled) {
        alert('不允许设置Cookie项!');
    } else {

        var date = new Date();
        date.setTime(date.getTime() + 60000 * 10);
        document.cookie = "SetLock=" + escape(obj) + ";expires=" + date.toGMTString() + ";path=/" + ";domaim=zgdsc.cn" + ":secure";
    }
}
function getCookie(cookie_name) {
    var allcookies = document.cookie;
    var cookie_pos = allcookies.indexOf(cookie_name);
    // 如果找到了索引，就代表cookie存在，
    // 反之，就说明不存在。  
    if (cookie_pos != -1) {
        // 把cookie_pos放在值的开始，只要给值加1即可。   
        cookie_pos += cookie_name.length + 1;
        var cookie_end = allcookies.indexOf(";", cookie_pos);
        if (cookie_end == -1) {
            cookie_end = allcookies.length;
        }
        var value = unescape(allcookies.substring(cookie_pos, cookie_end));
    }
    return value;
}
//----
//用于锁屏
function showWindow(url, width, height) {
    setCookie('1');
    var windowstr = "<p align=center><iframe src='" + url + "' width='900px' height='660px' scrolling='no' frameborder='0'></iframe></p>";
    document.getElementById("infoDiv").innerHTML = windowstr;
    document.getElementById("infoDiv").style.top = "0px";
    document.getElementById("infoDiv").style.width = "100%";
    document.getElementById("infoDiv").style.height = "100%";
    //document.getElementById("tranDiv").style.height = document.body.clientHeight + "px";
    document.getElementById("tranDiv").style.width = document.body.clientWidth + "px";
    document.getElementById("tranDiv").style.display = "";
    document.getElementById("tranDivBack").style.display = "";
    document.getElementById("infoDiv").style.display = "";
    document.getElementById("frameBar").style.display = "none";
}
//-----Tab切换,左边栏效果(需要升级为AJAX加载的缓存)
var myFrame =
  {
      TabJsonArr: [{ tid: "1", left: "menu1_1",htmls:"" }],
      AddTabJson: function (id, url,ht) {
          var flag = false;
          jsonArr = myFrame.TabJsonArr;
          for (var i = 0; i < jsonArr.length; i++) {
              if (jsonArr[i].tid == id) { jsonArr[i].left = url; jsonArr[i].htmls = ht; flag = true; break; }
          }
          if (!flag)//无匹配，新增
          {
              var newTab = { "tid": id, "left": url, "htmls": ht };
              jsonArr.push(newTab);
          }
          var s = "";
          for (var i = 0; i < jsonArr.length; i++) {
              s += jsonArr[i].tid + ":" + jsonArr[i].left + ",";
          }
      },
      GetLeftUrl: function (id) {//获取当前的ID，如有则更新，无则创建
          jsonArr = myFrame.TabJsonArr;
          for (var i = 0; i < jsonArr.length; i++) {
              if (jsonArr[i].tid == id) return jsonArr[i].left;
          }
      },
      SwitchLeft: function (id) {//根据url切换
          if (!id || id == "") return;
          var jsonArr = myFrame.TabJsonArr;
          var json = "";
          for (var i = 0; i < jsonArr.length; i++) {
              if (jsonArr[i].tid == id) { json = jsonArr[i]; break; }
          }
          if (json.htmls && json.htmls != ""){
              $("#left_Div").html(json.htmls);
              $("#left_Div").show();
              $("#left_ul_div").hide();
              ascxInit(json.left);
          }
          else showleft(json.left);
      }
  }
function showleft(id, rightUrl) {
    $("#left_ul_div").show();
    $("#left_Div").hide();
    if (id && id != "") {
        $("#" + id).parent().find(".m_left_ulin").removeClass("open");//第二层
        $("#" + id).addClass("open");
        $("#" + id).parent().parent().find(".m_left_ul").removeClass("open");//第一层
        $("#" + id).parent().addClass("open");
        var pid = id.split('_')[0];
        $("#" + pid).removeClass("hidden");
        $("#" + pid).addClass("open");
        lastLeft = id;
    }
    window.localStorage.Default_leftStatus = 1;
    myFrame.AddTabJson(currentFrameTabId, id);
    if (rightUrl && rightUrl != "")
        ShowMain('', rightUrl);

}
function ShowMain(leftUrl, rightUrl) {//优先加载右边iframe
    var temp;
    if (rightUrl && rightUrl != "") {
        rightUrl = rightUrl.replace("{$path}", Path);
        temp = document.getElementById("main_right");
        temp.src = rightUrl;
        temp.contentWindow.window.name = "main_right";
        frames["main_right"] = temp.contentWindow.window;
    }
    setTimeout(function () {
        if (leftUrl && leftUrl != "") {
            $("#left_Hid").val(leftUrl);
            $("#leftSwitch_Btn").click();
            myFrame.AddTabJson(currentFrameTabId, leftUrl);
            window.localStorage.Default_leftStatus = 1;
            lastLeft = leftUrl;
        }
    }, 100);
}
function ClearSpin() {
    $("#left_ul_div").hide();
}