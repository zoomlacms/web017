﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Pub_Pubsinfo, App_Web_lr2y5ecy" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>信息列表</title> 
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script src="/JS/Common.js" type="text/javascript"></script>
<script type="text/javascript">
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
    var tID = 0;
    var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2");
    window.onload = function () {
        pload();
    }
    function ShowTabs(ID,type) {
        location.href = 'Pubsinfo.aspx?Pubid=<%=Request.QueryString["Pubid"] %>&ID=' + ID + '&type=' + type;
    }
    function pload() {
        var ID = '<%=Request.QueryString["ID"]%>';
        if (ID != tID) {
            document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            tID = ID;
        }
    }
</script>
</head>
<body>
<form id="form1" runat="server">
<div id="nav_box">
<div class="r_navigation">后台管理&gt;&gt; <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><span>管理</span><asp:HiddenField ID="HdnModelID" runat="server" />
<asp:HiddenField ID="HiddenNode" runat="server" />
<asp:HiddenField ID="HiddenType" runat="server" />
<asp:HiddenField ID="HiddenPubid" runat="server" />
</div>
</div>
<div class="h_30"></div>
<div>
<table width="" border="0" cellpadding="0" cellspacing="0">
	<tr  align="center">
		<td id="TabTitle0"onclick="ShowTabs(0,1)" class="titlemouseover" >所有信息 </td>
        <td id="TabTitle1" class="tabtitle" onclick="ShowTabs(1,3)"> 待审核信息 </td>
        <td id="TabTitle2" class="tabtitle" onclick="ShowTabs(2,2)"> 已审核信息 </td>
	</tr>
</table>
</div>
    <asp:GridView ID="Egv" runat="server" AllowPaging="True" CssClass="border" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="20" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <HeaderStyle Width="5%" BorderColor="White" HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:CheckBox ID="chkSel" runat="server" />
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" BorderColor="White"  HorizontalAlign="Center"/>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID">
                <HeaderStyle Width="5%" BorderColor="White"  HorizontalAlign="Center"/>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center"  BorderColor="White" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="标题">
                <HeaderStyle Width="25%" BorderColor="White"  HorizontalAlign="Center"/>
                <ItemTemplate>
                   <asp:LinkButton ID="LinkButton4" runat="server" CommandName="View" CommandArgument='<%# Eval("ID") %>'><%#GetPubTitle(Eval("PubTitle"))%></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="left"  BorderColor="White" />
            </asp:TemplateField>
            <asp:BoundField DataField="PubIP" HeaderText="IP地址">
                <HeaderStyle Width="10%" BorderColor="White"  HorizontalAlign="Center"/>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center"  BorderColor="White" />
            </asp:BoundField>
            <asp:BoundField DataField="Pubnum" HeaderText="参与人数">
                <HeaderStyle Width="8%" BorderColor="White"  HorizontalAlign="Center"/>
                <ItemStyle CssClass="tdbg" BorderColor="White" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="发表日期">
                <HeaderStyle Width="8%" BorderColor="White"  HorizontalAlign="Center"/>
                <ItemTemplate>
                    <%# Eval("PubAddTime", "{0:yyyy-MM-dd}")%>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center"  BorderColor="White"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <HeaderStyle Width="8%" BorderColor="White"  HorizontalAlign="Center"/>
                <ItemTemplate>
                    <%# shenhe(Eval("Pubstart", "{0}"))%>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center"  BorderColor="White" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="回复" >
            <HeaderStyle Width="5%" BorderColor="White"  HorizontalAlign="Center"/>
                 <ItemTemplate><%#GetCount(Eval("ID","{0}"))%></ItemTemplate>
                 <ItemStyle CssClass="tdbg" HorizontalAlign="Center"  BorderColor="White"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
            <HeaderStyle BorderColor="White"  HorizontalAlign="Center"/>
                <ItemTemplate>
                <a href="ViewSmallPub.aspx?Pubid=<%= this.HiddenPubid.Value %>&ID=<%# Eval("ID", "{0}")%><%= this.HiddenNode.Value %>&type=0 ">
                  相关信息与回复管理</a>
                    |
               <a href="AddPub.aspx?Pubid=<%#this.HiddenPubid.Value%>&Parentid=<%#Eval("ID") %><%= this.HiddenNode.Value %>&type=<%=Request["type"] %>"  >回复</a>&nbsp;
                    |
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>'>修改</asp:LinkButton>
                    |
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Audit" CommandArgument='<%# Eval("ID") %>'>审核</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White"  />
            </asp:TemplateField>
        </Columns>
        <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
        <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
        <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
    </asp:GridView>
          <table class="border" cellspacing="1" cellpadding="0" width="100%" border="0" align="center">
                <tr class="tdbg">
                    <td class="tdbgleft">
    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="全选" />
                    </td>
                    <td class="tdbgleft" colspan="7" align="center">共
                        <asp:Label ID="Allnum" runat="server" />条信息
                        <asp:Label ID="Toppage" runat="server" />
                        <asp:Label ID="Nextpage" runat="server" />
                        <asp:Label ID="Downpage" runat="server" />
                        <asp:Label ID="Endpage" runat="server" />页次：
                        <asp:Label ID="Nowpage" runat="server" />/
                        <asp:Label ID="PageSize" runat="server" />页
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" CssClass="l_input" Width="30px" OnTextChanged="txtPage_TextChanged" />条信息/页  转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" />页
                        <asp:RangeValidator ID="RangeValidator1" runat="server"  ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                    </td>
                </tr>
            </table>
     <div class="clearbox"></div>
    <asp:Button ID="Button1" class="C_input"  runat="server" Text="删除选定的信息" UseSubmitBehavior="False" OnClientClick="if(!confirm('确定要批量删除评论吗？')){return false;}" OnClick="Button1_Click" />
    <asp:Button ID="Button2" class="C_input" runat="server" Text="审核通过选定的信息" UseSubmitBehavior="False" OnClick="Button2_Click" />
    <asp:Button ID="Button3" class="C_input"  runat="server" Text="取消审核选定的信息" UseSubmitBehavior="False" OnClick="Button3_Click" />
    </form>
</body>
</html>