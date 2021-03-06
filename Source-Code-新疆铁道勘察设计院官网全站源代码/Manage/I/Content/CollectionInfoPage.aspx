﻿<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_CollectionInfoPage, App_Web_oo4sanix" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>采集配置字段设置</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="border">
<tr align="center">
<td colspan="2" class="spacingtitle">
	<%=type%><asp:HiddenField ID="HiddenField1" runat="server" />
</td>
</tr>
<tr class="tdbg">
<td colspan="2">
	<table width="750px" border="0" cellpadding="5" cellspacing="1" class="table table-bordered table-hover table-striped">
		<tr class="tdbg">
			<td align="right" valign="top">
				<table width="500px" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td align="left">
										<asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" Width="400px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
										</asp:DropDownList>
									</td>
									<td>
										<asp:Label ID="lblLink" runat="server" Text=""></asp:Label>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<asp:TextBox ID="txtHtml" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="10" Width="500px" Height="420px"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td align="left">
							<asp:Button ID="Button4" CssClass="btn btn-primary" style="width:110px;"  runat="server" Text="获取源代码" OnClick="Button4_Click" />
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<table width="240px" border="0" cellpadding="0" cellspacing="0">
					<tr align="center">
						<td id="TabTitle0" class="titlemouseover" onclick="ShowTabs(0)">
							字段设置
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
				</table>
				<table width="240px" border="0" cellpadding="0" cellspacing="0" class="border">
					<tbody id="Tabs0">
						<tr class="tdbg">
							<td class="tdbgleft">
								&nbsp;字段设置开始：
							 
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="字段设置开始不能为空！" ControlToValidate="txtListStart"></asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr class="tdbg">
							<td class="tdbgleft">
								&nbsp;<asp:TextBox ID="txtListStart" CssClass="form-control" runat="server" TextMode="MultiLine" Width="230px" Rows="5" Height="60px"></asp:TextBox></td>
						</tr>
						<tr class="tdbg">
							<td class="tdbgleft">
								&nbsp;字段设置结束：                
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="字段设置结束不能为空！" ControlToValidate="txtListEnd"></asp:RequiredFieldValidator>
							
							</td>
						</tr>
						<tr class="tdbg">
							<td class="tdbgleft">
&nbsp;<asp:TextBox ID="txtListEnd" CssClass="form-control" runat="server" TextMode="MultiLine" Width="230px" Rows="5" Height="60px"></asp:TextBox></td>
						</tr>
				<br />
					<tbody id="Tbody1">
						<tr class="tdbg">
							<td class="tdbgleft">
								&nbsp;排除规则：
                                <asp:DropDownList ID="DropGui" runat="server" CssClass="form-control">
								<asp:ListItem  Value="1">不选择排除</asp:ListItem>
								<asp:ListItem Value="2">选择排除</asp:ListItem>
								</asp:DropDownList>
							</td>
						</tr>
						<tr class="tdbg">
						<td class="tdbgleft">&nbsp;公用过滤项目：&nbsp;&nbsp;私有过滤项目：</td>
						
						</tr>
						<tr class="tdbg">
							<td class="tdbgleft">
							    <asp:ListBox ID="ListBox2" CssClass="form-control pull-left" Width="50%"  runat="server" EnableTheming="True" Height="162px">
                                    <asp:ListItem Value="no">不设置过滤</asp:ListItem>
                                </asp:ListBox>
                                <asp:ListBox ID="listPrivate" CssClass="form-control pull-left" Width="50%" runat="server" EnableTheming="True" Height="163px" SelectionMode="Multiple">
								    <asp:ListItem Value="iframe">过滤内联页</asp:ListItem>
								    <asp:ListItem Value="flash">过滤Flash</asp:ListItem>
								    <asp:ListItem Value="script">过滤脚本</asp:ListItem>
								    <asp:ListItem Value="css">过滤样式</asp:ListItem>
								    <asp:ListItem Value="div">过滤Div容器</asp:ListItem>
								    <asp:ListItem Value="span">过滤Span容器</asp:ListItem>
								    <asp:ListItem Value="table">过滤表格</asp:ListItem>
								    <asp:ListItem Value="img">过滤图片</asp:ListItem>
								    <asp:ListItem Value="font">过滤字体</asp:ListItem>
								    <asp:ListItem Value="a">过滤链接</asp:ListItem> 
								    <asp:ListItem Value="html">过滤html元素</asp:ListItem>  
								</asp:ListBox>
							</td>
						</tr>
					   
						
						<tr class="tdbg">
							<td class="style1" align="center">
								<asp:Button ID="Button5" CssClass="btn btn-primary"  style="width:110px;"  runat="server" Text="测试字段" OnClick="Button5_Click" OnClientClick="return checkList('txtListStart','txtListEnd')" />
							</td>
						</tr>
				</table>
			</td>
		</tr>
		<tr class="tdbg">
			<td colspan="2" align="center">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="Button2" class="btn btn-primary" type="button" value="保  存" onclick="SetConfig()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="Button3" type="button" value="取  消" class="btn btn-primary"    onclick="window.close();" />
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
<script language="javascript" type="text/javascript">
    function SetConfig() {
        var v = document.getElementById("HiddenField1").value;
        var str = GetList();
        opener.SetHr(v, document.getElementById("txtListStart").value, document.getElementById("txtListEnd").value, str);
        window.close();
    }

    function GetList() {
        var ddl = document.getElementById("DropGui");
        var selectvalue = ddl.options[ddl.selectedIndex].value
        if (selectvalue == "2") {
            var objlist = document.getElementById("listPrivate");
            var str = "";
            for (var i = 0; i < objlist.length; i++) {
                if (objlist.options[i].selected) {
                    str += objlist.options[i].value + ",";
                }
            }
            if (str.substring(str.length - 1, str.length) == ',') {
                str = str.substring(0, str.length - 1);
            }
            return str;
        }
        else {
            return "";
        }
    }
</script>
</asp:Content>