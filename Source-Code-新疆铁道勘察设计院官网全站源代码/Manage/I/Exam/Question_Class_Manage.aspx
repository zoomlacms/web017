<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Question_Class_Manage, App_Web_xnxog2lk" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>分类管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="divbox" id="nocontent" runat="server" style="display: none">暂无分类信息</div>
    <div id="gv" runat="server">
        <asp:GridView ID="gvCard" runat="server" AutoGenerateColumns="False" class="border"  AllowSorting="true" CellPadding="3" CellSpacing="1" BackColor="White"
        ForeColor="Black" CssClass="border" EnableTheming="False" GridLines="None"
            DataKeyNames="C_Id" Width="100%" OnRowDataBound="gvCard_RowDataBound" RowStyle-CssClass='tdbg'
            OnRowCommand="gvCard_RowCommand" HeaderStyle-Height="28px">
            <RowStyle CssClass="tdbg" Height="26px"></RowStyle>
            <Columns>
                <asp:BoundField DataField="C_Id" HeaderText="分类ID" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="C_ClassName" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderText="名称">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="所属分类" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfC_ClassId" runat="server" Value='<%#Eval("C_Classid") %>' />
                        <asp:Label ID="lblC_ClassId" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="C_OrderBy" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderText="排序">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="lBtnUpdate" CommandName="Upda" CommandArgument='<%#Eval("C_id") %>'
                            runat="server">修改</asp:LinkButton>&nbsp;/&nbsp;
                        <asp:LinkButton ID="LinkButton1" CommandName="Del" CommandArgument='<%#Eval("C_id") %>'
                            runat="server" OnClientClick="return confirm('你确定将该数据彻底删除吗？')">删除</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>
                <asp:Button ID="Button3" runat="server" OnClientClick="location.href='AddQuestion_Class.aspx?menu=Add&C_id=0';return false;"
                    Text="新建分类组" class="btn btn-primary" />
            </td>
        </tr>
    </table>
    <div id="geshi" runat="server">
        <asp:Repeater runat="server" ID="GroupList" OnItemCommand="GroupList_ItemCommand"
            OnItemDataBound="GroupList_ItemDataBound">
            <ItemTemplate>
                <table class="table table-striped table-bordered table-hover">
                    <tr class="spacingtitle">
                        <td align="left" style="width: 20%">
                            <%#Eval("C_ClassName")%>
                        </td>
                        <td align="left" style="width: 30%">
                            <asp:HiddenField ID="hfClassId" runat="server" Value='<%#Eval("C_Classid") %>' />
                            <asp:Label ID="lblClassId" runat="server" Text=""></asp:Label>
                        </td>
                        <td width="50%">
                            <input id="Button7" type="button" onclick="location.href='AddQuestion_Class.aspx?menu=Add&C_id=<%#Eval("C_id") %>    '"
                                value="新建分类" class="btn btn-primary" /><input id="Button5" type="button" onclick="location.href='AddQuestion_Class.aspx?menu=Edit&C_id=<%#Eval("C_id") %>    '"
                                    value="编辑分类组" class="btn btn-primary" /><input id="Button6" type="button" onclick="if(confirm('确认删除吗?')==true){location.href='Question_Class_Manage.aspx?menu=delete&C_id=<%#Eval("C_id") %>        ';}"
                                        value="删除分类组" class="btn btn-primary" />
                        </td>
                    </tr>
                    <%#loadtree(Eval("C_id").ToString())%>
                </table>
                <br>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>
                <asp:Button ID="Button4" runat="server" Text="切换到网格模式" class="btn btn-primary" OnClick="Button4_Click" />
            </td>
        </tr>
    </table>
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td class="">
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
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
</asp:Content>