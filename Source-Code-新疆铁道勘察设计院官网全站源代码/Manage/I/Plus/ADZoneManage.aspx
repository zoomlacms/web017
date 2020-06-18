﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Plus.ADZoneManage, App_Web_vamiqaqk" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>广告版位管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb" style="vertical-align: central; height: 48px; line-height: 30px;">
        <li class="pull-left"><a style="margin-bottom: -10px;" href="<%= CustomerPageAction.customPath2 %>I/Main.aspx">工作台</a></li>
        <li class="pull-left"><a href="ADZoneManage.aspx">广告管理</a></li>
        <li class="active pull-left"><a href="ADManage.aspx">版位管理</a><a href="ADZone.aspx">[添加版位]</a></li>
        <div class="input-group" style="width: 300px; float: left; margin-left: 10px;">
            <asp:TextBox runat="server" ID="TxtADName" CssClass="form-control" onkeydown="return GetEnterCode('click','Search_hid');" placeholder="请输入需要搜索的内容" />
            <span class="input-group-btn">
                <asp:LinkButton runat="server" CssClass="btn btn-default" ID="BntSearch" OnClick="BntSearch_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
            </span>
        </div>
        <a href="JSTemplate.aspx" class="pull-right" title="模板代码">
            <span class="glyphicon glyphicon-list-alt"></span>
        </a>
    </ol>
    <asp:Button ID="Search_hid" runat="server" OnClick="BntSearch_Click" Style="display: none;" Text="Button" />
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab" onclick="ShowTab('-1');" data-toggle="tab">所有版位</a></li>
        <li><a href="#tab0" onclick="ShowTab('0');" data-toggle="tab">矩形横幅</a></li>
        <li><a href="#tab1" onclick="ShowTab('1');" data-toggle="tab">弹出窗口</a></li>
        <li><a href="#tab2" onclick="ShowTab('2');" data-toggle="tab">随屏移动</a></li>
        <li><a href="#tab3" onclick="ShowTab('3');" data-toggle="tab">固定位置</a></li>
        <li><a href="#tab4" onclick="ShowTab('4');" data-toggle="tab">漂浮移动</a></li>
        <li><a href="#tab5" onclick="ShowTab('5');" data-toggle="tab">文字代码</a></li>
        <li><a href="#tab6" onclick="ShowTab('6');" data-toggle="tab">对联广告</a></li>
    </ul>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ZoneID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无版位信息！！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="chkSel" value='<%#Eval("ZoneID") %>' />
                </ItemTemplate>
                <ItemStyle Width="5%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="序号" DataField="zoneid">
                <ItemStyle Width="5%" HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="版位名称">
                <ItemTemplate>
                    <a href='<%# Eval("ZoneId", "ADManage.aspx?ZoneId={0}") %>' title='<%# Eval("ZoneName")%>'><%# Eval("ZoneName")%></a>
                </ItemTemplate>
                <ItemStyle Width="20%" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类型">
                <HeaderStyle Width="10%" />
                <ItemTemplate>
                    <a href="ADZoneManage.aspx?type=<%#Eval("ZoneType") %>">
                        <%#getzonetypename(DataBinder.Eval(Container.DataItem, "ZoneType").ToString())%></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="显示类型">
                <HeaderStyle Width="10%" />
                <ItemTemplate>
                    <%#getzoneshowtypename(DataBinder.Eval(Container.DataItem, "ShowType").ToString())%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="尺寸">
                <HeaderStyle Width="10%" />
                <ItemTemplate>
                    <%#Eval("ZoneWidth")%>
                    x
                    <%#Eval("ZoneHeight")%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <HeaderStyle Width="5%" />
                <ItemTemplate>
                    <%#GetActive(DataBinder.Eval(Container.DataItem, "Active").ToString())%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <HeaderStyle />
                <ItemTemplate>
                    <a href="Advertisement.aspx?ZoneId=<%# Eval("ZoneID") %>">添加</a>
                    |
                    <a href="ADZone.aspx?ZoneId=<%# Eval("ZoneID") %>">修改</a>
                    |
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Copy" CommandArgument='<%# Eval("ZoneID") %>'>复制</asp:LinkButton><br />
                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Del" OnClientClick="return confirm('确定删除此版位？');" CommandArgument='<%# Eval("ZoneID") %>'>删除</asp:LinkButton>
                    |
                    <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Clear" OnClientClick="return confirm('确定清空此版位？');" CommandArgument='<%# Eval("ZoneID") %>'>清空</asp:LinkButton>
                    |
                    <asp:LinkButton ID="LinkButton6" runat="server" CommandName="SetAct" CommandArgument='<%# Eval("ZoneID") %>'><%# GetUnActive(DataBinder.Eval(Container.DataItem, "Active").ToString())%>  </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="版位JS">
                <HeaderStyle Width="15%" />
                <ItemTemplate>
                    <a href="PreviewAD.aspx?ZoneID=<%# Eval("ZoneID") %>&Type=Zone">预览</a>
                    |
                    <asp:LinkButton ID="LinkButton9" runat="server" CommandName="Refresh" CommandArgument='<%# Eval("ZoneID") %>'>刷新</asp:LinkButton><br />
                    <a href="ShowJSCode.aspx?ZoneID=<%# Eval("ZoneID") %>">获取广告代码</a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="BtnDelete" runat="server" Text="批量删除" OnClientClick="if(!IsSelectedId()){alert('请选择版位');return false;}else{return confirm('确定删除选中版位？')}" OnClick="BtnDelete_Click" class="btn btn-primary" />
    <asp:Button ID="BtnActive" runat="server" Text="激活版位" OnClientClick="if(!IsSelectedId()){alert('请选择版位');return false;}else{return confirm('你确定要激活选中的版位吗？')}" OnClick="BtnActive_Click" class="btn btn-primary" />
    <asp:Button ID="BtnPause" runat="server" Text="暂停版位" OnClientClick="if(!IsSelectedId()){alert('请选择版位');return false;}else{return confirm('你确定要暂停选中版位吗？')}" OnClick="BtnPause_Click" class="btn btn-primary" />
    <asp:Button ID="BtnRefurbish" runat="server" Text="刷新版位JS" OnClick="BtnRefurbish_Click" class="btn btn-primary" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
            if (getParam("type"))
            {
                $("li a[href='#tab" + getParam("type") + "']").parent().addClass("active").siblings("li").removeClass("active");
            }
        })
        function CheckInfo(obj) {
            if (event.keyCode == 13) {
                document.getElementById("BntSearch").click();
            }
        }
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
        function ShowTab(n)
        {
            if (n == "-1")
                location.href = "ADZoneManage.aspx";
            else
                location.href = "ADZoneManage.aspx?type=" + n;
        }
    </script>
    <style>
        #BreadNav {
            display: none;
        }
    </style>
</asp:Content>
