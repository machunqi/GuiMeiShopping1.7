<%--
  Created by IntelliJ IDEA.
  User: machunqi
  Date: 2018-12-30
  Time: 03:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生信息</title>
    <base href="<%=request.getContextPath() %>/" />
    <%@include file="/pages/beforePages/layUI.jsp"%>
    <style>
        table{
            background-color: #fffffb;
            text-align: center;
            margin: auto;
        }

        input{
            border-radius: 5px;
            height: 30px;
            font-size: 15px;
            padding-left: 5px;
        }

        #del{
            background-color: red;
        }
    </style>
</head>
<body>

<form action="/doSeller?action=unionQuery&pageNumber=1" method="post">
    <label>学号:</label>
    <input type="text" name="id" placeholder="请输入学号" />
    <label>姓名:</label>
    <input type="text" name="cusName" placeholder="请输入姓名"  />
    <label>性别:</label>
    <select name="cusSex">
        <option value="">请选择</option>
        <option value="男">男</option>
        <option value="女">女</option>
    </select>
    <input class="layui-btn " type="submit"  value="查询"/>
</form>
<c:choose>
    <c:when test="${not empty sessionScope.Page.pageData}">
        <table class="layui-table" width="80%">
            <thead>
            <tr>
                <th>商家ID</th>
                <th>商家姓名</th>
                <th>商家账号</th>
                <th>商家性别</th>
                <th>商家生日</th>
                <th>商家身份证号</th>
                <th>商家邮箱</th>
                <th>商家电话</th>
                <th>商家地址</th>
                <th colspan="2">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.Page.pageData}" var="Se">
                <tr>
                    <td>${Se.id}</td>
                    <td>${Se.sellerName}</td>
                    <td>${Se.sellerUser}</td>
                    <td>${Se.sellerSex}</td>
                    <td>${Se.sellerBirthday}</td>
                    <td>${Se.sellerIdCard}</td>
                    <td>${Se.sellerEmail}</td>
                    <td>${Se.sellerTel}</td>
                    <td>${Se.sellerAddress}</td>
                    <td><a id="del" class="layui-btn" href="/doSeller?action=delById&id=${Se.id}">删除</a></td>
                    <td><a  class="layui-btn" href="/doSeller?action=queryById&id=${Se.id}">修改</a></td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="6">
                    第<b>${sessionScope.Page.pageNumber}</b>页&nbsp;&nbsp;
                    <a class="layui-btn" href="/doSeller?action=queryAll&pageNumber=1">首页</a>
                    <a class="layui-btn" href="/doSeller?action=queryAll&pageNumber=${sessionScope.Page.pageNumber-1>0?Page.pageNumber-1:1}">上一页</a>
                    <a class="layui-btn" href="/doSeller?action=queryAll&pageNumber=${sessionScope.Page.pageNumber+1>Page.totalPage?Page.totalPage:Page.pageNumber+1}">下一页</a>
                    <a class="layui-btn" href="/doSeller?action=queryAll&pageNumber=${sessionScope.Page.totalPage}">尾页</a>
                    &nbsp;&nbsp;共<b>${sessionScope.Page.totalPage}</b>页 &nbsp;&nbsp;

                    <select id="jumpNumber">
                        <c:forEach begin="1" varStatus="num" end="${sessionScope.Page.totalPage}">
                            <option value="${num.count}">-${num.count}页-</option>
                        </c:forEach>
                    </select>
                    &nbsp;&nbsp;
                    <b class="layui-btn" onclick="jump()">跳转</b>

                </td>
            </tr>
            </tfoot>

        </table>
        <script>
            function jump() {
                var number = document.getElementById("jumpNumber").value;
                open("/doSeller?action=queryAll&pageNumber="+number,"iframe_context");
            }
        </script>
    </c:when>
    <c:otherwise>
        <h2>暂无商家数据</h2>
    </c:otherwise>
</c:choose>
</body>
</html>
