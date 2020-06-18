﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Question_User_Manage, App_Web_xnxog2lk" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>用户试题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td style="height: 24px">
                <asp:Label ID="lblPaper" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <div class="divbox" id="nocontent" runat="server" style="display: none">暂无试题信息</div>
    <div>
        <asp:GridView ID="EGV" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover"
             OnRowDataBound="gvCard_RowDataBound" HeaderStyle-Height="28px" RowStyle-Height="26px">
            <Columns>
                <asp:TemplateField HeaderText="选择" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("p_id") %>' />
                        <asp:CheckBox ID="chkSel" runat="server" /><%# Eval("p_id"," {0}") %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="试题标题">
                    <ItemTemplate>
                        <asp:HyperLink ID="lbTitle" runat="server"><%# Eval("p_title")%></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_Inputer" HeaderText="作者" ItemStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="难度" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbldiff" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类别" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblClass" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_Views" HeaderText="使用次数" ItemStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="题型" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblType" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="知识点" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblKnow" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_CreateTime" HeaderText="创建时间" ItemStyle-HorizontalAlign="Center" />
                <%--<asp:BoundField DataField="p_User" HeaderText="相关操作" ItemStyle-HorizontalAlign="Center" />--%>
                
                <asp:TemplateField HeaderText="相关操作" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                   <a href="Questions_User_Show.aspx?p_Id=<%# Eval("p_id") %>">查看</a> <a href="Question_User_Manage.aspx?menu=del&p_Id=<%# Eval("p_id") %>" onclick="return confirm('你确定将该数据删除吗？');">删除</a>
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
                        <asp:Button ID="BtnAdd" runat="server" class="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定添加？')}"
                            Text="批量添加为系统试题" Width="134px" OnClick="BtnAdd_Click" />
                    </span><span style="text-align: center">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/
                        <asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                        条数据/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                        页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                    </span>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>