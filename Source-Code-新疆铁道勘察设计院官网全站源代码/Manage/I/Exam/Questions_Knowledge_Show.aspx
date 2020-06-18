<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Questions_Knowledge_Show, App_Web_xnxog2lk" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>知识点管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HyperLink ID="hlAdd" runat="server" Visible="false"></asp:HyperLink>
    <table  class="table table-striped table-bordered table-hover" style="display:none;">
        <tr class="tdbg">
            <td style="height: 24px">
                <asp:Label ID="lblClass" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <div class="clearbox">
    </div>
    <div class="divbox" id="nocontent" runat="server" style="display: none">
        暂无知识点信息</div>
    <div class="clearbox">
    </div>
    <div>
        <asp:GridView ID="EGV" runat="server" AutoGenerateColumns="False"  CssClass="table table-striped table-bordered table-hover" 
            AllowSorting="true" EnableTheming="False" GridLines="None" OnRowCommand="gvCard_RowCommand">
            <Columns>
                <asp:BoundField DataField="TestPoint" HeaderText="知识点" />
                <asp:BoundField DataField="OrderBy" HeaderText="排序" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Upd" CommandArgument='<%#Eval("ID") %>'>修改</asp:LinkButton>
                        |
                        <asp:LinkButton ID="lbDetele" runat="server" CommandName="Del" CommandArgument='<%#Eval("ID") %>'
                            OnClientClick="if(confirm('确定删除?')) return true; else return false;">删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <table  class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td>
                <div class="tdbg">
                    <span style="text-align: center">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" /> 页次：
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
    
