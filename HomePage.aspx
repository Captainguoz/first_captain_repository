<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="AutoCurriculum.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatable/css/jquery.dataTables.css" />
    <script type="text/javascript" src="datatable/js/jquery.js"></script>
    <script type="text/javascript" src="datatable/js/jquery.dataTables.js"></script>
    <title>习题课自动排课</title>
</head>
<body>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#">习题课自动排课应用</a>
            </div>
        </div>
        <!-- /.navbar-collapse -->
    </nav>

    <div class="container-fluid">

        <form id="form1" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <h4 style="display: inline">第一步：选取习题课Execl文件</h4>
                    <asp:FileUpload Style="display: inline" CssClass="btn btn-block" ID="fupChooseExecl" runat="server" Width="431px" />
                </div>
                <div class="col-md-12">
                    <span>学年</span>
                    <asp:DropDownList ID="ddlSchoolYear" runat="server" Height="20px" Width="107px">
                        <%--<asp:ListItem>2021-2022</asp:ListItem>
                        <asp:ListItem>2022-2023</asp:ListItem>
                        <asp:ListItem>2023-2024</asp:ListItem>
                        <asp:ListItem>2024-2025</asp:ListItem>
                        <asp:ListItem>2025-2026</asp:ListItem>
                        <asp:ListItem>2026-2027</asp:ListItem>
                        <asp:ListItem>2027-2028</asp:ListItem>--%>
                    </asp:DropDownList>

                    &nbsp;&nbsp;
                    <span>学期</span>
                    <asp:DropDownList ID="ddlCourseTerm" runat="server" Height="20px" Width="66px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <hr />

            <div class="row">
                <div class="col-md-11">
                    <h4 style="display: inline">第二步：</h4>
                    <asp:Button CssClass="btn btn-primary" ID="btnShowData" runat="server" OnClick="btnShowData_Click" Text="显示原始数据" />
                    <asp:Label CssClass="label label-success" ID="lblMessage_step_two" runat="server" />
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-default" style="border:none" onclick="step_two()">
                        <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>展开
                    </button>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12" id="step_two_dispaly" style="display:block" runat="server">
                    <table id="original_table" class="display" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>教学班编号/CourseID</th>
                                <th>课程名称</th>
                                <th>教师</th>
                                <th>工号</th>
                                <th>起止周</th>
                                <th>单双周</th>
                                <th>周几</th>
                                <th>节次</th>
                                <th>教室</th>
                                <th>课程层次</th>
                            </tr>
                        </thead>

                        <tbody runat="server" id="original_curriculum_content">
                        </tbody>
                    </table>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-11">
                    <h4 style="display: inline">第三步：</h4>
                    <asp:Button CssClass="btn btn-primary" ID="btnFormatData" runat="server" OnClick="btnFormatData_Click" Text="排课数据标准化" />
                    <asp:Label CssClass="label label-success" ID="lblMessage_step_three" runat="server" />
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-default" style="border:none" onclick="step_three()">
                        <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>展开
                    </button>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12" id="step_three_dispaly" style="display:block" runat="server">
                    <table id="original_table_format" class="display" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>学年</th>
                                <th>学期</th>
                                <th>课程ID</th>
                                <th>教学班编号</th>
                                <th>课程名称</th>
                                <th>教师</th>
                                <th>工号</th>
                                <th>教学周</th>
                                <th>周几</th>
                                <th>节次</th>
                                <th>教室</th>
                                <th>课程层次</th>
                                <th>开始周</th>
                                <th>结束周</th>
                            </tr>
                        </thead>

                        <tbody runat="server" id="original_curriculum_content_format">
                        </tbody>
                    </table>
                </div>
            </div>
            <hr />

            <div class="row">
                <div class="col-md-11">
                    <h4 style="display: inline">第四步：</h4>
                    &nbsp;<asp:RadioButton ID="rdbCheckMiddle" runat="server" Checked="True" GroupName="checkMiddle" Text="校验中间库" />
&nbsp;<asp:RadioButton ID="rdbCheckNotMiddle" runat="server" GroupName="checkMiddle" Text="不检验中间库" />
&nbsp;
                    <asp:Button CssClass="btn btn-primary" ID="btnDataCompare" runat="server" OnClick="btnDataCompare_Click" Text="排课数据校验" />
                    <asp:Label ID="lblMessage_step_four" runat="server" />
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-default" style="border:none" onclick="step_four()">
                        <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>展开</button>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12" id="step_four_dispaly" style="display:none" runat="server">
                    <table id="table_conflict_four" cellspacing="0" width="100%">
                        <thead>
                            <tr>                                
                                <th>课程ID</th>
                                <th>教学班编号</th>
                                <th>课程名称</th>
                                <th>教师</th>
                                <th>工号</th>
                                <th>教学周-周几-节次-教室</th>  
                                <th>教学周-周几-节次-教师工号</th>
                                <th>课程层次</th>                                
                            </tr>
                        </thead>

                        <tbody runat="server" id="data_conflict" style="color: red">
                        </tbody>
                    </table>
                </div>
            </div>
            <hr />

            <div class="row">
                <div class="col-md-12">
                    <h4 style="display: inline">第五步：</h4>
                    <asp:Button CssClass="btn btn-primary" ID="btnDataWrite" runat="server" OnClick="btnDataWrite_Click" Text="写入数据" />
                    <asp:Label ID="Label_step_five" runat="server" />
                </div>
            </div>
        </form>
    </div>

    <!--初始化代码-->
    <script>

        function step_four() {
            //alert("hello world");
            var value = document.getElementById("step_four_dispaly").style.display;
            if (value == "none") {
                document.getElementById("step_four_dispaly").style.display = "block";
            }
            else if (value=="block")
            {
                document.getElementById("step_four_dispaly").style.display = "none";
            }
        }

        function step_three() {
            //alert("hello world");
            var value = document.getElementById("step_three_dispaly").style.display;
            if (value == "none") {
                document.getElementById("step_three_dispaly").style.display = "block";
            }
            else if (value == "block") {
                document.getElementById("step_three_dispaly").style.display = "none";
            }
        }

        function step_two() {
            //alert("hello world");
            var value = document.getElementById("step_two_dispaly").style.display;
            if (value == "none") {
                document.getElementById("step_two_dispaly").style.display = "block";
            }
            else if (value == "block") {
                document.getElementById("step_two_dispaly").style.display = "none";
            }
        }

        $(document).ready(function () {
            $('#original_table').DataTable(
                {
                    "language": {
                        "lengthMenu": "每页 _MENU_ 条记录",
                        "zeroRecords": "没有找到记录",
                        "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                        "infoEmpty": "无记录",
                        "infoFiltered": "(从 _MAX_ 条记录过滤)",
                        "search": "搜索",
                        "paginate": {
                            "first": "首页",
                            "previous": "上页",
                            "next": "下页",
                            "last": "末页"
                        }
                    }
                }
            );

            $('#original_table_format').DataTable(
                {
                    "language": {
                        "lengthMenu": "每页 _MENU_ 条记录",
                        "zeroRecords": "没有找到记录",
                        "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                        "infoEmpty": "无记录",
                        "infoFiltered": "(从 _MAX_ 条记录过滤)",
                        "search": "搜索",
                        "paginate": {
                            "first": "首页",
                            "previous": "上页",
                            "next": "下页",
                            "last": "末页"
                        }
                    }
                }
            );

            $('#table_conflict_four').DataTable(
                {
                    "language": {
                        "lengthMenu": "每页 _MENU_ 条记录",
                        "zeroRecords": "没有找到记录",
                        "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                        "infoEmpty": "无记录",
                        "infoFiltered": "(从 _MAX_ 条记录过滤)",
                        "search": "搜索",
                        "paginate": {
                            "first": "首页",
                            "previous": "上页",
                            "next": "下页",
                            "last": "末页"
                        }
                    }
                }
            );

        });

    </script>

</body>
</html>
