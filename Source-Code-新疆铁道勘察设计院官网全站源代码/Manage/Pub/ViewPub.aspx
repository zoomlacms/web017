﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Pub_ViewPub, App_Web_zznbw4aj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>会员组模型</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script>
function OpenLink(lefturl, righturl) {
	if (lefturl != "") {
		parent.frames["left"].location = lefturl;
	}
	try {
		parent.MDIOpen(righturl); return false;
	} catch (Error) {
		parent.frames["main_right"].location = righturl;
	}
}
</script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理&gt;&gt; 内容管理 &gt;&gt;<a href="###" onclick="OpenLink('PubGuide.aspx','pubmanage.aspx')">互动模块管理</a>&gt;&gt; <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
    <div class="us_seta" id="manageinfo" runat="server">
        <asp:HiddenField ID="HdnModelID" runat="server" />
        <asp:HiddenField ID="HdnModelName" runat="server" />
        <asp:HiddenField ID="HiddenGuang" runat="server" />
        <asp:HiddenField ID="Hiddenpagenum" runat="server" />
        <asp:HiddenField ID="HiddenPubido" runat="server" />
        <asp:GridView ID="Egv" runat="server" AutoGenerateColumns="False"  DataKeyNames="ID" Width="100%" CellPadding="4" EmptyDataText="暂无数据" OnRowDataBound="Egv_RowDataBound" CssClass="r_navigation">
            <EmptyDataRowStyle Font-Bold="True" ForeColor="Black" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <FooterStyle BackColor="#DBF9D9" Font-Bold="True" ForeColor="White" />
            <RowStyle Height="23px" CssClass="tdbg" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#DBF9D9" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="25px" />
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
        </asp:GridView>
        <div>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="全选" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
            <asp:Button ID="btn_DeleteRecords" runat="server" class="C_input" OnClientClick="return judgeSelect();" Text="删除选中记录" OnClick="btn_DeleteRecords_Click" />
        </div>
        <div style="text-align: center;">
            共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            条信息
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
            <asp:Label ID="pagess" runat="server" Text="" />条信息/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
            </asp:DropDownList>
            页</div>
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    //根据传入的checkbox的选中状态设置所有checkbox的选中状态
    function selectAll(obj) {
        var allInput = document.getElementsByTagName("input");
        //alert(allInput.length);
        var loopTime = allInput.length;
        for (i = 0; i < loopTime; i++) {
            //alert(allInput[i].type);
            if (allInput[i].type == "checkbox") {
                allInput[i].checked = obj.checked;
            }
        }
    }
    //判断是否选中记录，用户确认删除
    function judgeSelect() {
        var result = false;
        var allInput = document.getElementsByTagName("input");
        var loopTime = allInput.length;
        for (i = 0; i < loopTime; i++) {
            if (allInput[i].checked) {
                result = true;
                break;
            }
        }
        if (!result) {
            alert("请先选则要删除的记录！");
            return result;
        }
        result = confirm("你确认要删除选定的记录吗？");
        return result;
    }
    //判断是否选中记录，判断是否取消生成
    function IsCreateSelect() {
        var result = false;
        var allInput = document.getElementsByTagName("input");
        var loopTime = allInput.length;
        for (i = 0; i < loopTime; i++) {
            if (allInput[i].checked) {
                result = true;
                break;
            }
        }
        if (!result) {
            alert("请先选则要还原的记录！");
            return result;
        }
        result = confirm("你确认要还原选定的记录吗？");
        return result;
    } 
</script>