<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Log.LogManage, App_Web_vamiqaqk" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>日志管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <asp:GridView ID="Egv" class="table table-striped table-bordered table-hover" DataKeyNames="LogID" runat="server" AutoGenerateColumns="False"
            AllowPaging="True" PageSize="20" Width="100%" OnPageIndexChanging="Egv_PageIndexChanging"
            OnRowCommand="Lnk_Click" EmptyDataText="无相关数据">
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSel" runat="server" />
                    </ItemTemplate>
                    <ItemStyle CssClass="TdWrap" HorizontalAlign="Center" />
                    <HeaderStyle Width="3%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="标题">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="View" CommandArgument='<%# Eval("LogID") %>'><%# Eval("Title")%></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="rap" HorizontalAlign="left" />
                    <HeaderStyle Width="12%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类型">
                    <ItemTemplate>
                        <%# GetCate(Eval("Category", "{0}"))%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="8%" />
                </asp:TemplateField>
                <asp:BoundField DataField="ScriptName" HeaderText="访问地址">
                    <ItemStyle HorizontalAlign="left" />
                </asp:BoundField>
                <asp:BoundField DataField="Timestamp" HeaderText="操作时间">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="UserIP" HeaderText="IP地址">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="操作人">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="6%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="查看">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="View" CommandArgument='<%# Eval("LogID") %>'>查看</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
                    <HeaderStyle Width="5%" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div style="text-align: center">
            <span style="text-align: center">共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条信息
            <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />
                /
            <asp:Label ID="PageSize" runat="server" Text="" />
                页  
            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged" Width="30px"></asp:TextBox>
                条信息/页  转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                页
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </span>
        </div>
    </div>
    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox2_CheckedChanged" Text="全选" />
    <asp:Button ID="btndelete" class="btn btn-primary" runat="server" OnClientClick="return confirm('确定要删除选中的日志吗？')" Text="删除选定的日志" OnClick="btndelete_Click" />
    <asp:HiddenField ID="HdnCate" runat="server" />
</asp:Content>
