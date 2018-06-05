<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="jslib/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	var check = 0;//该变量是记录当前选择的评分
	var time = 0;

	/*over()是鼠标移过事件的处理方法*/
	function over(param) {
		if (param == 1) {
			$("#star1").attr("src", "img/star_red.png");//第一颗星星亮起来，下面以此类推
			$("#message").html("很差");//设置提示语，下面以此类推
		} else if (param == 2) {
			$("#star1").attr("src", "img/star_red.png");
			$("#star2").attr("src", "img/star_red.png");
			$("#message").html("比较差");
		} else if (param == 3) {
			$("#star1").attr("src", "img/star_red.png");
			$("#star2").attr("src", "img/star_red.png");
			$("#star3").attr("src", "img/star_red.png");
			$("#message").html("一般");
		} else if (param == 4) {
			$("#star1").attr("src", "img/star_red.png");
			$("#star2").attr("src", "img/star_red.png");
			$("#star3").attr("src", "img/star_red.png");
			$("#star4").attr("src", "img/star_red.png");
			$("#message").html("比较好");
		} else if (param == 5) {
			$("#star1").attr("src", "img/star_red.png");
			$("#star2").attr("src", "img/star_red.png");
			$("#star3").attr("src", "img/star_red.png");
			$("#star4").attr("src", "img/star_red.png");
			$("#star5").attr("src", "img/star_red.png");
			$("#message").html("很好");
		}
	}
	/*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
	function out() {
		if (check == 1) {//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
			$("#star1").attr("src", "img/star_red.png");
			$("#star2").attr("src", "img/star.png");
			$("#star3").attr("src", "img/star.png");
			$("#star4").attr("src", "img/star.png");
			$("#star5").attr("src", "img/star.png");
			$("#message").html("");
		} else if (check == 2) {
			$("#star1").attr("src", "img/star_red.png");
			$("#star2").attr("src", "img/star_red.png");
			$("#star3").attr("src", "img/star.png");
			$("#star4").attr("src", "img/star.png");
			$("#star5").attr("src", "img/star.png");
			$("#message").html("");
		} else if (check == 3) {
			$("#star1").attr("src", "img/star_red.png");
			$("#star2").attr("src", "img/star_red.png");
			$("#star3").attr("src", "img/star_red.png");
			$("#star4").attr("src", "img/star.png");
			$("#star5").attr("src", "img/star.png");
			$("#message").html("");
		} else if (check == 4) {
			$("#star1").attr("src", "img/star_red.png");
			$("#star2").attr("src", "img/star_red.png");
			$("#star3").attr("src", "img/star_red.png");
			$("#star4").attr("src", "img/star_red.png");
			$("#star5").attr("src", "img/star.png");
			$("#message").html("");
		} else if (check == 5) {
			$("#star1").attr("src", "img/star_red.png");
			$("#star2").attr("src", "img/star_red.png");
			$("#star3").attr("src", "img/star_red.png");
			$("#star4").attr("src", "img/star_red.png");
			$("#star5").attr("src", "img/star_red.png");
			$("#message").html("");
		} else if (check == 0) {
			$("#star1").attr("src", "img/star.png");
			$("#star2").attr("src", "img/star.png");
			$("#star3").attr("src", "img/star.png");
			$("#star4").attr("src", "img/star.png");
			$("#star5").attr("src", "img/star.png");
			$("#message").html("");
		}
	}
	/*click()点击事件处理，记录打分*/
	function click(param) {
		time++;//记录打分次数
		check = param;//记录当前打分
		out();//设置星星数
	}

	function submit(param) {
		var comment = document.getElementById('comment').value;
		var s = document.getElementById('s');

		var flag = confirm("确定提交评论吗?");

		if (flag) {
			s.setAttribute('href', s.href + "?star=" + check + "&&comment="
					+ comment);
			return true;

		}
		return false;

	}
</script>
<style>
table {
	border: 1px solid #0058a3; /* 表格边框 */
	font-family: Arial;
	border-collapse: collapse; /* 边框重叠 */
	background-color: #eaf5ff; /* 表格背景色 */
	font-size: 14px;
}

.h {
	color: #003e7e; /* 行、列名称颜色 */
	background-color: #7bb3ff; /* 行、列名称的背景色 */
}

.hd {
	position: absolute;
	left: 30px;
	top: 62px;
	height: 90px;
	width: 39px;
	line-height: 1.2em;
	background-image:
		url(//img.alicdn.com/tps/i4/T1zZF.XoNzXXXXXXXX-16-258.png);
	background-repeat: no-repeat;
	background-position: 24px -159px;
}
</style>
</head>
<body>

	<div style="position: relative; top: 30px;">

		<div>
			<h1 align="center" style="color: purple;">评论</h1>
			<sql:setDataSource var="buydetails" driver="com.mysql.cj.jdbc.Driver"
				url="jdbc:mysql:///ECommercePlatform?serverTimezone=UTC" user="root"
				password="123456" />
			<sql:query dataSource="${buydetails}" var="bd">
           		SELECT * FROM buydetails b join product p on b.p_id=p.p_id join shop s on p.s_id=s.s_id  where bd_id=<%=session.getAttribute("bd_id")%>
			</sql:query>

			<c:forEach items="${bd.rows}" var="b">



				<table width="100%" height="100px" cellspacing="1">
					<tr>
						<td width="10%">店铺信息
							<div class="hd"></div>
						</td>
						<td width="5%"><img src="images/shop.png" width="70"
							height="70" /></td>
						<td>被评卖家：<a href="#">${b.s_name}</a> <br /> 宝贝与描述相符：
						</td>
					</tr>
				</table>
		</div>
		<br />
		<div>
			<table width="100%" border="1" cellpadding="5" cellspacing="1">
				<tr>
					<td width="228" align="left">店铺动态评分</td>
					<td width="543" align="right"><input type="checkbox"
						align="right" /> 全部匿名评论</td>
				</tr>
				<tr>
					<td>宝贝</td>
					<td align="center">宝贝评分</td>
				</tr>

				<tr>
					<td align="center">${b.p_name}</td>
					<td>
						<div>
							<a href="javascript:click(1)"><img src="img/star.png"
								id="star1" onMouseOver="over(1)" onMouseOut="out(1)" /></a> <a
								href="javascript:click(2)"><img src="img/star.png"
								id="star2" onMouseOver="over(2)" onMouseOut="out(2)" /></a> <a
								href="javascript:click(3)"><img src="img/star.png"
								id="star3" onMouseOver="over(3)" onMouseOut="out(3)" /></a> <a
								href="javascript:click(4)"><img src="img/star.png"
								id="star4" onMouseOver="over(4)" onMouseOut="out(4)" /></a> <a
								href="javascript:click(5)"><img src="img/star.png"
								id="star5" onMouseOver="over(5)" onMouseOut="out(5)" /></a> <span
								id="message"></span>
						</div>
						<div>
							<textarea id="comment" style="width: 540px; height: 200px"></textarea>
							
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" width="50" height="50"><a
						id="s" href="submitComment"><input type="button"
							onclick="return submit()" value="发表评论" /></a></td>
				</tr>
			</table>
		</div>
		</c:forEach>
	</div>

</body>
</html>