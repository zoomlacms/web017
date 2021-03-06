﻿<%@ page language="C#" autoeventwireup="true" inherits="_3d_3DManage, App_Web_bfk4ymzi" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>3D商城管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
                      <asp:BoundField HeaderText="ID" DataField="ID"/>
                      <asp:BoundField HeaderText="店铺名" DataField="ShopName"/>
                      <asp:BoundField HeaderText="店铺图片" DataField="ShopImg"/>
                      <asp:BoundField HeaderText="用户名" DataField="UserName"/>
                      <asp:BoundField HeaderText="位置X轴" DataField="posX"/>
                      <asp:BoundField HeaderText="位置Y轴" DataField="posY"/>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="AddShop.aspx?ID=<%#Eval("ID") %>" title="修改">修改</a>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del2" CommandArgument='<%#Eval("UserID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">
                                删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                   </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                    <RowStyle Height="24px" HorizontalAlign="Center"  />
            </ZL:ExGridView>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>