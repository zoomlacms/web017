﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Panoramic_PanoramicManage, App_Web_idxrdzqm" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>全景管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无相关信息！">
        <Columns>
            <asp:BoundField  HeaderText="ID" DataField="ID" HeaderStyle-Width="10%" />
            <asp:TemplateField HeaderText="全景名称">
                <HeaderStyle Width="30%" />
                <ItemTemplate>
                    <a href="AddPanoramic.aspx?menu=edit&id=<%#Eval("ID") %>"><%#Eval("PanoramicName")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="调用标签">
                <HeaderStyle Width="25%" />
                <ItemTemplate>
                    {ZL:Panoramic(<%#Eval("ID") %>,600,500)/}
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="创建时间" DataField="AddTime" HeaderStyle-Width="20%" />
            <asp:TemplateField HeaderText="操作">
               <HeaderStyle Width="15%" />
                <ItemTemplate>
                    <a href="AddPanoramic.aspx?menu=edit&id=<%#Eval("ID") %>">修改</a>
                    <a href="javascript:void(0);" onclick="Open_Select(<%#Eval("ID") %>)">预览</a>
                    <asp:LinkButton ID="LinkButton1" CommandName="del" CommandArgument='<%# Eval("ID") %>' runat="server" OnClientClick="return confirm('确实要删除吗？删除后该信息无法恢复!');">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <b>说明：</b>如全景调用标签为：<b style="color: Blue">{ZL:Panoramic(1,600,500)/}</b> ，则说明：调用ID为 1,显示宽度为 600 像素，高度为 500 像素 的场景
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        function hiddenlabel() {
            window.onload = function () {
                document.getElementById("showlable").style.display = "none";
            }
        }
        function openurls(url) {
            Dialog.open({ URL: url });
        }
        function Open_Select(id) {
            var diag = new Dialog();
            diag.Width = 650;
            diag.Height = 500;
            diag.Title = "选择音乐<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
            diag.URL = "PanoramicShow.aspx?id=" + id + "";
            diag.show();
        }
        function closdlg() {
            Dialog.close();
        }
        function removeOne() {
            var obj = document.getElementById('PanoramicViewList_music');
            for (var i = obj.options.length - 1; i >= 0; i--) {
                if (obj.options[i].selected) {
                    var index = i;
                    //alert(obj.options[i].text);
                    obj.options.remove(i);
                }
            }
        }
        function removepOne() {
            var obj = document.getElementById('PanoramicViewList_View');
            for (var i = obj.options.length - 1; i >= 0; i--) {
                if (obj.options[i].selected) {
                    var index = i;
                    //alert(obj.options[i].text);
                    obj.options.remove(i);
                }
            }
        }
    </script>
</asp:Content>