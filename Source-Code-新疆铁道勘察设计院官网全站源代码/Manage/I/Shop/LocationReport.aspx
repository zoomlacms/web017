﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_LocationReport, App_Web_132jl1cw" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>省市报表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:GridView ID="EGV" DataKeyNames="code" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" class="table table-striped table-bordered table-hover"
        OnRowDataBound="Gdv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" OnRowEditing="Gdv_Editing" EmptyDataText="无相关数据">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="省份">
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
                <HeaderStyle Width="50%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="订单总数">
                <ItemTemplate>
                    <%# GetOrderNum(Container.DataItem) %>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="订单总额">
                <ItemTemplate>
                    <%# GetOrderAmount(Container.DataItem) %>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="列表">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DicList" CommandArgument='<%#Eval("code") %>'>地区列表</asp:LinkButton>|
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="CheckList" CommandArgument='<%# Eval("name") %>'>订单列表</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" Text="返 回" OnClick="btnBack_Click" class="btn btn-primary" />
    <asp:HiddenField ID="HdnGradeID" Value="0" runat="server" />
    <asp:HiddenField ID="HdnParentID" Value="0" runat="server" />
    <asp:HiddenField ID="HdnCateID" Value="0" runat="server" />
    <asp:HiddenField ID="HdnLastLevel" Value="0" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>