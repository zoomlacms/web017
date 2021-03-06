﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_StoreManage, App_Web_zyan0s44" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>商品列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="GeneralID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有内容">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input type="checkbox" name="chkSel" title="" value='<%#Eval("GeneralID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" DataField="GeneralID" />
                <asp:TemplateField HeaderText="申请人用户名">
                    <ItemTemplate>
                        <a href="../User/UserInfo.aspx?id=<%# GetUserIDByInputer(GetUsername(Eval("GeneralID","{0}"))) %>"><%#GetUsername(Eval("GeneralID","{0}"))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="店铺名称">
                    <ItemTemplate>
                        <a href="/Store/Storeindex.aspx?id=<%# Eval("GeneralID")%>" target="_blank" title="点击进入店铺">
                            <%#GetStorename(Eval("GeneralID","{0}"))%>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="申请时间">
                    <ItemTemplate>
                        <%#GetAddtime(Eval("GeneralID","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="审核">
                    <ItemTemplate>
                        <%#GetStatus(Eval("GeneralID","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="StroeUpdate.aspx?username=<%#GetUsername(DataBinder.Eval(Container.DataItem, "GeneralID").ToString())%>">修改</a>&nbsp;<a href="StoreEdit.aspx?id=<%#Eval("GeneralID")%>">查看</a>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName='<%#Eval("GeneralID")%>' OnClick="Button2_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <asp:Button ID="Button1" class="btn btn-primary" Style="width: 110px;" runat="server" Text="设为推荐" CommandName="1" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" class="btn btn-primary" Style="width: 110px;" runat="server" Text="关闭店铺" CommandName="2" OnClick="Button1_Click" />
                    <asp:Button ID="Button6" class="btn btn-primary" Style="width: 110px;" runat="server" Text="取消推荐" CommandName="3" OnClick="Button1_Click" />
                    <asp:Button ID="Button5" class="btn btn-primary" Style="width: 110px;" runat="server" Text="取消关闭" CommandName="4" OnClick="Button1_Click" />
                    <asp:Button ID="Button3" class="btn btn-primary" Style="width: 110px;" runat="server" Text="批量删除" CommandName="5" OnClick="Button1_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" />
                    <asp:Button ID="Batch" CssClass="btn btn-primary" Style="width: 110px;" runat="server" CommandName="1" Text="批量审核" OnClick="Batch_Click" />
                    <asp:Button ID="Bcancle" CssClass="btn btn-primary" Style="width: 110px;" runat="server" CommandName="2" Text="取消审核" OnClick="Batch_Click" />
                </td>
            </tr>
        </table>
    </div>
    <%
        if (Request.QueryString["ShowMsg"] == "true")
        { %>
    <div id="wbg">
    </div>
    <div id="img" style="background: #fff; border: 1px solid #ccc; padding: 20px; height: 200px;">
        <div class="msgdiv">
            <a onclick="tb_remove()" href="javascript:void(0);" class="wbgNone">关闭</a>
            <strong>店铺审核通知_未通过</strong>
            <p>
                未通过理由：
                    <br />
                <asp:TextBox ID="ids" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="types" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="msgContent" runat="server" AutoCompleteType="Disabled" TextMode="MultiLine"
                    CssClass="x_input" Style="width: 300px; height: 100px;">店铺审核通知_未通过</asp:TextBox><br />
                <asp:Button ID="Sendemail" runat="server" Text="发送消息" CssClass="btn btn-primary" OnClick="msgsendBtn_Click" />
            </p>
        </div>
    </div>
    <%} %>
    <script type="text/javascript">
        function tb_remove() {
            document.getElementById('wbg').style.display = 'none';
            document.getElementById('img').style.display = 'none';
        }
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
        $().ready(function () {
            $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
        })
    </script>
</asp:Content>
