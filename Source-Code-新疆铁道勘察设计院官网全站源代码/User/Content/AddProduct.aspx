﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="Zoomla.Website.User.Shop.AddProduct, App_Web_cdkcukv2" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>添加商品</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">添加商品</li>
    </ol>
    <!-- Nav tabs -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#Tabs0" data-toggle="tab">基本信息</a></li>
        <li><a href="#Tabs1" data-toggle="tab">介绍及图片</a></li>
        <li><a href="#Tabs2" data-toggle="tab">其他信息</a></li>
        <li><a href="#Tabs3" data-toggle="tab">价格设置</a></li>
        <li><a href="#Tabs4" data-toggle="tab">商品属性</a></li>
        <li><a href="#Tabs5" data-toggle="tab">其他设置</a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane active" id="Tabs0">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr>
                        <td style="width: 20%">
                            <strong>所属节点：</strong>
                        </td>
                        <td>
                            <asp:Label ID="nodename" runat="server"></asp:Label>
                            <asp:HiddenField ID="HdnNode" runat="server" />
                            <asp:HiddenField ID="HdnModel" runat="server" />
                            <asp:HiddenField ID="ClickType" runat="server" />
                            <asp:HiddenField ID="ID" runat="server" Value="0" />
                            <asp:HiddenField ID="I_tem" runat="server" />
                            <asp:HiddenField ID="ComModelID" runat="server" />
                            <asp:HiddenField ID="Hiddenbind" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 26px">
                            <strong>商品编号：</strong>
                        </td>
                        <td style="width: 592px; height: 26px;">
                            <asp:TextBox ID="ProCode" runat="server" disabled="disabled" CssClass="form-control" Width="155px" />
                            <asp:CheckBox ID="CheckBox1" Text="自动编号" onclick="SetDisabled(this.checked)" runat="server" Checked="True" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>条形码：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="BarCode" runat="server" Width="155px" CssClass="form-control" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品名称：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Proname" runat="server" Width="442px" CssClass="form-control" />
                            <span class="STYLE1">*
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Proname" Display="Dynamic" ErrorMessage="商品名称不能为空!" SetFocusOnError="True">
                                </asp:RequiredFieldValidator></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>用户分类：</strong>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>关键字：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Kayword" runat="server" Width="155px" CssClass="form-control" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品单位：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="ProUnit" runat="server" Width="155px" CssClass="form-control" />
                            <span class="STYLE1">*
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ProUnit" Display="Dynamic" ErrorMessage="商品单位不能为空!" SetFocusOnError="True">
                                </asp:RequiredFieldValidator>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品重量：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Weight" runat="server" Width="91px" CssClass="form-control" />
                            千克（Kg）
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                                    ControlToValidate="Weight" ErrorMessage="商品重量必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$"
                                    SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 26px">
                            <strong>服务期限：</strong>
                        </td>
                        <td style="height: 26px">
                            <asp:TextBox ID="ServerPeriod" runat="server" Width="53px" CssClass="form-control" />
                            <asp:DropDownList ID="ServerType" CssClass="form-control" Width="80" runat="server">
                                <asp:ListItem Selected="True" Value="3">年</asp:ListItem>
                                <asp:ListItem Value="2">月</asp:ListItem>
                                <asp:ListItem Value="1">日</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                                ControlToValidate="ServerPeriod" ErrorMessage="服务期限必须是数字!" ValidationExpression="^\d+$"
                                SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品类型：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="ProClass" runat="server" RepeatDirection="Horizontal" Width="272px"
                                OnSelectedIndexChanged="ProClass_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Selected="True" Value="1">正常销售</asp:ListItem>
                                <asp:ListItem Value="2">特价处理</asp:ListItem>
                                <asp:ListItem Value="3">积分商品</asp:ListItem>
                                <asp:ListItem Value="4">团购</asp:ListItem>
                            </asp:RadioButtonList>
                            <div id="TG">
                                <table class="table table-bordered">
                                    <tr>
                                        <td>团购订金：</td>
                                        <td>
                                            <asp:TextBox ID="txtColoneDeposit" runat="server" CssClass="form-control"></asp:TextBox>元
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtColoneDeposit"
                                                ErrorMessage="团购订金格式不对!" ValidationExpression="\d+[.]?\d*" Display="Dynamic"
                                                SetFocusOnError="True"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>最低团购人数</td>
                                        <td>
                                            <asp:TextBox ID="NumberText" runat="server" CssClass="form-control"></asp:TextBox>人&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>团购价格:</td>
                                        <td>
                                            <asp:TextBox ID="TGPrice" runat="server" CssClass="form-control"></asp:TextBox>元
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>开始时间
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ColonelStartTimetxt" runat="server" OnFocus="setday(this)" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" CssClass="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>结束时间:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ColonelendTimetxt" runat="server" OnFocus="setday(this)" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" CssClass="form-control"></asp:TextBox>
                                            <asp:HiddenField ID="hfEndTime" runat="server" />
                                            <asp:HiddenField ID="hfBeginTime" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:Button ID="Button14" CssClass="btn btn-primary" runat="server" Text="添加"
                                                CausesValidation="false" OnClick="Button14_Click" />
                                            <asp:Button ID="Button15" CssClass="btn btn-primary" runat="server" Text="浏览价格"
                                                CausesValidation="false" OnClientClick="OpenSelect2();return false;" />
                                            <asp:Button ID="TGButtion" CssClass="btn btn-primary" runat="server" Text="取消"
                                                CausesValidation="false" OnClick="TGButtion_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>属性设置：</strong>
                        </td>
                        <td>
                            <asp:CheckBox ID="isnew" runat="server" Text="新品" />
                            <asp:CheckBox ID="ishot" runat="server" Text="热销" />
                            <asp:CheckBox ID="isbest" runat="server" Text="精品" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>销售状态：</strong>
                        </td>
                        <td>
                            <asp:CheckBox ID="Sales" Text="打勾表示销售中，否则为停售状态" runat="server" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs1">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr>
                        <td style="width: 20%">
                            <strong>商品简介：</strong>
                        </td>
                        <td>用于首页及栏目页显示，最多255个字符<br />
                            <asp:TextBox ID="Proinfo" runat="server" Height="50px" TextMode="MultiLine" Width="500px" CssClass="form-control" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; height: 24px">
                            <strong>详细介绍：</strong>
                        </td>
                        <td style="height: 24px; width: 592px;">
                            <textarea cols="80" id="Procontent" style="width: 580px; height: 200px;" name="Procontent" rows="10" runat="server"></textarea>
                            <script id="headscript" type="text/javascript">
                                UE.getEditor('Procontent');
                                //UE.getEditor('Procontent', {
                                //     toolbars : [['fullscreen', 'source', '|', 'undo', 'redo', '|',
                                // 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                                // 'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                                //  'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                                //  'directionalityltr', 'directionalityrtl', 'indent', '|',
                                //  'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                                //  'link', 'unlink', 'anchor', '|','pagebreak','|', 'template', 'horizontal', 'date', 'time', '|', 'spechars', 'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', '|', 'print', 'preview', 'searchreplace','|', 'help']]
                                // });
                            </script>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            <strong>商品清晰图：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Clearimg" runat="server" Width="300px" CssClass="form-control" /><iframe
                                id="bigimgs" style="top: 2px" src="../fileupload.aspx?menu=Clearimg" width="100%"
                                height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                        </td>
                    </tr>
                    <tr id="addsmallimg">
                        <td style="width: 20%">
                            <strong>商品缩略图：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Thumbnails" runat="server" Width="300px" CssClass="form-control" /><iframe
                                id="smallimgs" style="top: 2px" src="../fileupload.aspx?menu=Thumbnails" width="100%"
                                height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs2">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr>
                        <td style="width: 20%">
                            <strong>生 产 商：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Producer" runat="server" Width="214px" CssClass="form-control"></asp:TextBox>
                            【<a href="###" onclick="SelectProducer();">请选择</a>】
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>品牌/商标：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Brand" runat="server" Width="214px" CssClass="form-control"></asp:TextBox>
                            【<a href="###" onclick="SelectBrand();">请选择</a>】
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>缺货时允许购买:</strong>
                        </td>
                        <td>
                            <asp:CheckBox ID="Allowed" runat="server" Text="打勾表示缺货时允许购买， 否则缺货时不允许购买" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>限购数量:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Quota" runat="server" Width="100px" CssClass="form-control">-1</asp:TextBox>
                            -1为不限制数量 0为不允许购买
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Quota"
                                    ErrorMessage="限购数量必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>最低购买数量:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="DownQuota" runat="server" Width="100px" CssClass="form-control">-1</asp:TextBox>-1为不限制数量
                                0为不允许购买
                                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="DownQuota"
                                    ErrorMessage="最低购买数量必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 24px">
                            <strong>库存数量:</strong>
                        </td>
                        <td style="height: 24px">
                            <asp:TextBox ID="Stock" runat="server" Width="100px" CssClass="form-control">10</asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="Stock"
                                ErrorMessage="库存数量必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 24px">
                            <strong>库存报警下限:</strong>
                        </td>
                        <td style="height: 24px; width: 592px;">
                            <asp:TextBox ID="StockDown" runat="server" Width="100px" CssClass="form-control">1</asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="StockDown"
                                ErrorMessage="库存报警下限必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>税率设置:</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="Rateset" runat="server">
                                <asp:ListItem Selected="True" Value="1">含税，不开发票时有税率优惠 </asp:ListItem>
                                <asp:ListItem Value="2">含税，不开发票时没有税率优惠</asp:ListItem>
                                <asp:ListItem Value="3">不含税，开发票时需要加收税费</asp:ListItem>
                                <asp:ListItem Value="4">不含税，开发票时不需要加收税费</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品税率:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Rate" runat="server" Text="0" CssClass="form-control" />%
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                    ControlToValidate="Rate" ErrorMessage="商品税率必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$"
                                    SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品推荐等级:</strong>
                        </td>
                        <td>
                            <asp:DropDownList ID="Dengji" CssClass="form-control" runat="server">
                                <asp:ListItem Value="5">★★★★★</asp:ListItem>
                                <asp:ListItem Value="4">★★★★</asp:ListItem>
                                <asp:ListItem Selected="True" Value="3">★★★</asp:ListItem>
                                <asp:ListItem Value="2">★★</asp:ListItem>
                                <asp:ListItem Value="1">★</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs3">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr>
                        <td style="width: 20%">
                            <strong>市场参考价：</strong>
                        </td>
                        <td>
                            <table class="table table-bordered">
                                <tr>
                                    <td style="width: 23%; height: 21px;">
                                        <asp:TextBox ID="ShiPrice" runat="server" Width="93px" CssClass="form-control" />元
                                            <span style="color: red;">*</span>
                                    </td>
                                    <td style="width: 76%; height: 21px">购买时参考的市场零售价，可以比当前零售价高。<asp:RegularExpressionValidator ID="RegularExpressionValidator13"
                                        runat="server" ControlToValidate="ShiPrice" ErrorMessage="市场价格格式不对!" ValidationExpression="\d+[.]?\d*"
                                        Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator3" runat="server" ControlToValidate="ShiPrice" ErrorMessage="市场价不能为空!"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>当前零售价：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 23%; height: 20px;">
                                        <asp:TextBox ID="LinPrice" runat="server" Width="93px" CssClass="form-control" />元
                                            <span style="color: red;">*</span>
                                    </td>
                                    <td style="width: 78%; height: 20px">商店销售此商品时的价格。<asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                                        ControlToValidate="LinPrice" ErrorMessage="零售价格式不对!" ValidationExpression="\d+[.]?\d*"
                                        Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator4" runat="server" ControlToValidate="LinPrice" ErrorMessage="零售价不能为空!"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>打折优惠率:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txtRecommend" runat="server" Text="0" Width="93px" CssClass="form-control" />
                            %
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtRecommend"
                                    ErrorMessage="优惠率必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>积分价格:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPoint" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPoint"
                                ErrorMessage="积分价格必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>允许批发：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="Wholesales" runat="server" RepeatDirection="Horizontal"
                                            Width="106px">
                                            <asp:ListItem Value="1" onclick="show(this);">是</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="0" onclick="show(this);">否</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr id="pifaji" style="display: none">
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td style="height: 24px">① 一次性购买此商品数量满<asp:TextBox ID="s1" runat="server" Text='10' Width="49px" />时，批发价为
                                                        <asp:TextBox ID="j1" runat="server" CssClass="form-control" Width="68px">0</asp:TextBox>元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 24px">② 一次性购买此商品数量满<asp:TextBox ID="s2" runat="server" CssClass="form-control" Text='50' Width="49px" />时，批发价为
                                                        <asp:TextBox ID="j2" runat="server" CssClass="form-control" Width="68px">0</asp:TextBox>元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 24px">③ 一次性购买此商品数量满<asp:TextBox ID="s3" CssClass="form-control" runat="server" Text='100' Width="49px" />时，批发价为
                                                        <asp:TextBox ID="j3" CssClass="form-control" runat="server" Width="68px">0</asp:TextBox>元
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>允许单独销售：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="Wholesaleone" runat="server" RepeatDirection="Horizontal" Width="106px">
                                <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs4">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs5">
            <table class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr>
                        <td class="style1" style="width: 20%">
                            <strong>更新时间：</strong>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="UpdateTime" CssClass="form-control" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" runat="server" />
                            <span class="STYLE1">*<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                ControlToValidate="UpdateTime" Display="Dynamic" ErrorMessage="更新时间不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="UpdateTime"
                                    ErrorMessage="更新时间必须是日期!" ValidationExpression="^(\d{4}[-/]?\d{1,2}[-/]?\d{1,2})?([ ]?)(\d{1,2}[:]?\d{1,2}[:]?\d{1,2})?$"
                                    SetFocusOnError="True"></asp:RegularExpressionValidator>
                            </span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    </div>
    <table class="table table-striped table-bordered table-hover" id="TABLE1">
        <tr>
            <td align="center">
                <asp:Button ID="EBtnSubmit" Text="保存商品信息" runat="server" OnClick="EBtnSubmit_Click1" CssClass="btn btn-primary" />
                <input type="button" name="Button2" class="btn btn-primary" value="返回列表" onclick="location.href='MyProduct.aspx?NodeID=<%=Request.QueryString["NodeID"]%>    '" id="Button2" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/JavaScript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5", "TabTitle6");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2", "Tabs3", "Tabs4", "Tabs5", "Tabs6");
        function ShowTabs(ID) {
            if (ID != tID) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                document.getElementById(arrTabs[tID].toString()).style.display = "none";
                document.getElementById(arrTabs[ID].toString()).style.display = "";
                tID = ID;
            }
        }
        function deleteRow(tableID, rowIndex, rowsid) {
            var ccd = confirm('你确定将此绑定的商品删除吗？');
            if (ccd) {
                var table = document.all[tableID]
                var bindstr = "," + document.getElementById("Hiddenbind").value + ",";
                rowsid = "," + rowsid + ",";
                var reg = new RegExp(rowsid, "g")
                bindstr = bindstr.replace(reg, ",");
                reg = new RegExp(",,", "g")
                bindstr = bindstr.replace(reg, ",");
                document.getElementById("Hiddenbind").value = bindstr;
                table.deleteRow(rowIndex);
                document.getElementById("Hiddenbind").value = document.getElementById("Hiddenbind").value.replace(reg, ",");
                if (document.getElementById("Hiddenbind").value == "" || document.getElementById("Hiddenbind").value == ",") {
                    document.getElementById("Span1").innerHTML = "";
                    document.getElementById("Hiddenbind").value = "";
                }
            }
        }
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id && elm[i].id.indexOf("Item", false) > -1) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
        function SelectProducer() {
            window.open('<%=CustomerPageAction.customPath2%>Shop/Producerlist.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }
        function OpenSelect() {
            window.open('AddbindPro.aspx?id=<%=Request.QueryString["ID"] %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
            return false;
        }
        function ProductsSelect(act) {
            window.open('ProductsSelect.aspx?act=' + act, '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }
        function OpenprojectSelect() {
            window.open('projectSelect.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');
            return false;
        }
        function ClearSelect() {
            document.getElementById("Span1").innerHTML = "";
            document.getElementById("Hiddenbind").value = "";
        }
        function SelectBrand() {
            window.open('<%=CustomerPageAction.customPath2%>Shop/Brandlist.aspx?producer=' + document.getElementById('Producer').value + '', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }
        function SetDisabled(checked) {
            document.getElementById('ProCode').disabled = checked;
        }
        function show(checked) {
            if (checked.value == 1) {
                document.getElementById("pifaji").style.display = "";
            }
            else {
                document.getElementById("pifaji").style.display = "none";
            }
        }
        function showpf() {
            if (document.getElementById("Wholesales_0").checked == true) {
                document.getElementById("pifaji").style.display = "";
            } else {
                document.getElementById("pifaji").style.display = "none";
            }
        }
        function Clearoption() {
            var hiddenidvalue = document.getElementById("OtherProject"); //获取已经存在的ID值
            for (var i = hiddenidvalue.options.length - 1; i >= 0; i--) {
                if (hiddenidvalue[i].selected == true) {
                    hiddenidvalue[i] = null;
                }
            }
        }
        //团购信息
        function OpenSelect2() {
            window.open('TGALL.aspx?shopid=<%=Request.QueryString["ID"] %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
            return false;
        }
    </script>
</asp:Content>
