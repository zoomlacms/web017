﻿<%@ page language="C#" autoeventwireup="true" inherits="V_Content_ContentShow, App_Web_oo4sanix" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<title>显示内容</title>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered">
            <caption class="t_caption"><asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></caption>
            <tbody>
                <tr>
                    <td class="text-right" style="width:120px;">所属栏目：</td>
                    <td><asp:Label ID="NodeName" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="text-right">标题：</td>
                    <td><asp:Label ID="Title_T" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="text-right">状态：</td>
                    <td><asp:Label ID="statess" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
			        <td height="22" align="center" colspan="2" style="line-height: 25px;">
				        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
				        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
				        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
				        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
				        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
				        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
			        </td>
		        </tr>
            </tbody>
        </table>
        <br />
        <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>