﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_Reply, App_Web_cdkcukv2" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>信息回复</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">信息回复</li>
    </ol>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center"><asp:Label ID="Label2" runat="server" Text="信息回复"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align: right">标题：
            </td>
            <td>
                <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">内容：
            </td>
            <td>
                <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" Width="400px" Height="100px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="提 交" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
