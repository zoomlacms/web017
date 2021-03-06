﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.ModifyPassword, App_Web_wojghwgi" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>修改密码</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr style="text-align: center;">
            <td colspan="2"><strong>修改密码</strong></td>
        </tr>
        <tr>
            <td style="width:120px;"><strong>用 户 名：</strong></td>
            <td>
                <asp:Label runat="server" ID="Name_Text"></asp:Label>
            </td>
        </tr>
        <tr>
            <td><strong>原 密 码：</strong></td>
            <td>
                <asp:TextBox ID="TxtOldPassword" class="form-control" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtOldPassword" runat="server" ErrorMessage="原密码不能为空！" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td><strong>新 密 码：</strong></td>
            <td>
                <asp:TextBox ID="TxtPassword" class="form-control" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="ValrUserPassword" ControlToValidate="TxtPassword" runat="server" ErrorMessage="新密码不能为空！" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtPassword" ErrorMessage="管理员密码字符数要在3-18之间！" ValidationExpression="\S{3,18}" SetFocusOnError="True" Display="None"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td><strong>确认密码：</strong></td>
            <td>
                <asp:TextBox ID="TxtPassword2" class="form-control" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtPassword2" runat="server" ErrorMessage="确认密码不能为空！" Display="Dynamic" />
                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TxtPassword2" ControlToCompare="TxtPassword" ErrorMessage="新密码和确认密码不一致！" runat="server" />
            </td>
        </tr>
        <tr>
            <td><strong>操作:</strong></td>
            <td>
                <asp:Button ID="BtnSubmit" runat="server" class="btn btn-primary" Text="修改" OnClick="BtnSubmit_Click" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <style type="text/css">
        .tdLeft {
            text-align: right;
            width: 50%;
        }
    </style>
</asp:Content>
