<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_SelectProjects, App_Web_kqqfcyzr" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>选择管理员</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <asp:GridView ID="Egv" runat="server" AllowPaging="True"
            AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" DataKeyNames="AdminID" OnPageIndexChanging="Egv_PageIndexChanging"
            OnRowCommand="Lnk_Click" OnRowDataBound="Egv_RowDataBound" Width="100%">
            <Columns>
                <asp:BoundField DataField="AdminId" HeaderText="ID">
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="管理员名" DataField="AdminName" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle Width="10%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="前台用户名" DataField="UserName" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle Width="10%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField HeaderText="管理员真实姓名" DataField="AdminTrueName"
                    ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle Width="15%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="LnkSelect" CommandName="SelectAdmin" CommandArgument='<%# Eval("AdminId")%>'
                            runat="server">选择</asp:LinkButton>
                        <%--<asp:LinkButton ID="LnkCancel" CommandName="CancelAdmin" CommandArgument='<%# Eval("AdminId")%>'
                        runat="server" OnClick="LnkCancel_Click">取消</asp:LinkButton>    --%>
                    </ItemTemplate>
                    <HeaderStyle Width="10%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
        </asp:GridView>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function setvalue(objname, valuetxt) {
            if (parent.window.frames['main_right'].document.getElementById(objname)) {
                parent.window.frames['main_right'].document.getElementById(objname).value = valuetxt;
            }
            else {
                parent.document.frames['main_right'].document.getElementById(objname).value = valuetxt;
            }
        }
        function onstr() {
            parent.Dialog.close();
        }
    </script>

</asp:Content>
