﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_QuestionManage, App_Web_xnxog2lk" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>系统试题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="divbox" id="nocontent" runat="server" style="display: none"> 暂无试题信息</div>
    <div>
        <asp:GridView ID="gvCard" runat="server" AutoGenerateColumns="False" AllowSorting="true" 
           class="table table-striped table-bordered table-hover" EnableTheming="False" GridLines="None" 
            OnRowDataBound="gvCard_RowDataBound" OnRowCommand="gvCard_RowCommand" >
            <RowStyle CssClass="tdbg" Height="26px"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText="选择" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("p_id") %>' />
                        <asp:CheckBox ID="chkSel" runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="试题标题">
                    <ItemTemplate>
                        <img src="/App_Themes/AdminDefaultTheme/images/diagram1.png" border="0" width="15" alt="已共享" />
                       <asp:HyperLink ID="lbTitle" runat="server"><%# Eval("p_title")%></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_Inputer" HeaderText="作者" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle" />
                <asp:TemplateField HeaderText="难度" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label ID="lblDiff" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类别" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetClass(Eval("p_Class","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_Views" HeaderText="使用次数" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle" />
                <asp:TemplateField HeaderText="题型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetType(Eval("p_Type", "{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="考点" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetTestPoint(Eval("p_Knowledge", "{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_CreateTime" HeaderText="创建时间" ItemStyle-VerticalAlign="Middle"
                    ItemStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="相关操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Upd" CommandArgument='<%#Eval("p_id") %>'>修改</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del" CommandArgument='<%#Eval("p_id") %>'
                            OnClientClick="return confirm('你确定将该数据删除吗？');">删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td>
                <div class="tdbg">
                    <span>
                        <asp:CheckBox ID="CheckSelectAll" runat="server" AutoPostBack="True" Text="全选" OnCheckedChanged="CheckSelectAll_CheckedChanged" />
                    </span><span style="text-align: center">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/
                        <asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                        条数据/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                    </span>
                </div>
            </td>
        </tr>
    </table>
    <div>
        <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="导出数据" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="导入数据" OnClientClick="inputQMinfo();return false;" />
        <asp:Button ID="BtnDelete" runat="server" class="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}"
            Text="批量删除选定内容" Width="134px" OnClick="BtnDelete_Click" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/Drag.js"></script>
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        function inputQMinfo() {
            var diag = new Dialog();
            diag.Width = 600;
            diag.Height = 100;
            diag.Title = "导入试题[ESC键退出当前操作]";
            diag.URL = "ExportExcel.aspx";
            diag.show();
        }
    </script>
</asp:Content>