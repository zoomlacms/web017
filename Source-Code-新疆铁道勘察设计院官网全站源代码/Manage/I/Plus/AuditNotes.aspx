<%@ page language="C#" autoeventwireup="true" inherits="manage_Plus_AuditNotes, App_Web_vamiqaqk" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>审核记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <asp:GridView ID="Egv" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" PageSize="20" Width="100%" EmptyDataText="无相关数据">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="内容标题">
                    <ItemStyle CssClass="rap" />
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="18%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%# GetStatus(Eval("Status", "{0}")) %>
                    </ItemTemplate>
                    <HeaderStyle Width="10%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="UpDateTime" HeaderText="更新时间">
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
                    <HeaderStyle Width="16%" />
                </asp:BoundField>
                <asp:BoundField DataField="because_back" HeaderText="审核原因">
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
                    <HeaderStyle Width="20%" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <div style="text-align: center" class="tdbgleft">
            <span style="text-align: center">
                共
                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条数据
                <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：
                <asp:Label ID="Nowpage" runat="server" Text="" />
                /
                <asp:Label ID="PageSize" runat="server" Text="" />
                页
                <asp:Label ID="pagess" runat="server" Text="" />
                <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="24" Height="24" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                条数据/页 转到第
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnTextChanged="DropDownList1_TextChanged"></asp:DropDownList>
                页
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </span>
        </div>
    </div>
    <asp:HiddenField ID="HdnCate" runat="server" />
</asp:Content>
