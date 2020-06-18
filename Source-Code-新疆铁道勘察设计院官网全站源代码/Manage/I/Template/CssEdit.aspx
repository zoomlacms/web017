<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="ZoomLa.WebSite.Manage.Template.CssEdit, App_Web_bzhz350p" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>样式编辑</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
    <tr class="title" style="font-weight:normal;">
        <td> 
            <%=ShowPath.Trim()%>
        <asp:TextBox ID="TxtFilename" runat="server" /><asp:Label ID="lblFielName" style="text-align:left;" runat="server"/>
        &nbsp;提示:风格文件命名必须是.css格式！</td>
    </tr>
    <tr>
        <td style="text-align:center;">
          <asp:TextBox ID="textContent" runat="server" Rows="40" TextMode="MultiLine" Width="99%"></asp:TextBox>
        </td>
    </tr>
</table>
<div style="text-align:center; width:100%">
    <asp:Button ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" class="btn btn-primary"/>
    <asp:Button ID="Button3" runat="server" Text="重置" onclick="Reset_Click" class="btn btn-primary"/>
    <asp:Button ID="Button2" runat="server" Text="取消" OnClick="Button2_Click" class="btn btn-primary"/>
  
</div>
    <asp:HiddenField ID="HdnShowPath" runat="server" />
    <asp:HiddenField ID="Hdnmethod" runat="server" />
    <asp:HiddenField ID="HdnFilePath" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function goBack() {
            window.history.back();
        }
</script>
</asp:Content>