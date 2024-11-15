<%@ page import="note.po.Note" %><%--
  Created by IntelliJ IDEA.
  User: 12099
  Date: 2023/12/23
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Note Details</title>
    <link id="theme-style" rel="stylesheet" href="static/css/portal.css">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/bootstrap.min.js"></script>

    <script src="static/js/axios.min.js"></script>
    <script src="static/js/vue.js"></script>
    <link rel="stylesheet" href="static/css/buttons.css">


    <!-- <script type="text/javascript" src="js/lizi.js"></script> -->
    <link rel="stylesheet" href="static/css/dataVisonStyle.css">
    <link rel="stylesheet" href="static/css/stars.css">

    <link rel="stylesheet" type="text/css" href="static/live_2D_assets/waifu.css" />
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="static/css/navigate.css">

    <!-- 音乐播放器 -->
    <link rel="stylesheet" href="static/node_modules/aplayer/dist/APlayer.min.css">
    <script src="static/node_modules/aplayer/dist/APlayer.min.js">
    </script>
    <script src="static/node_modules/meting/dist/Meting.min.js">
    </script>
    <meting-js server="netease" type="playlist" id="2091761965" fixed="true" autoplay="false" mutex="false" loop="all"
               order="list" preload="auto" list-folded="true" list-max-height="500px" lrc-type="1">

    </meting-js>
    <style>
        .shubiao {
            width: 50px;
            height: 50px;
            position: absolute;
            background-image: url('./1393817219.gif');
            background-size: cover;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .note-container {
            max-width: 1600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .note-title {
            font-size: 30px;  /* 调整字体大小 */
            color: #333;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
            text-align: center;  /* 添加居中样式 */
        }
        .note-content {
            font-size: 18px;
            color: #666;
            line-height: 1.6;
            margin-top: 20px;
            width: 1600px;
            height: 950px;
            overflow: auto;  /* 修改为auto，使得内容超出时显示滚动条 */
            text-overflow: ellipsis;
            white-space: normal;  /* 修改为normal，使得内容超出宽度时自动换行 */

        }
        .custom-btn {
            width: 130px;
            height: 40px;
            color: #fff;
            border-radius: 5px;
            padding: 10px 25px;
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            background: #ce5fe2cf;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
            7px 7px 20px 0px rgba(0, 0, 0, .1),
            4px 4px 5px 0px rgba(0, 0, 0, .1);
            outline: none;
        }

        .btn-9 {
            border: none;
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .btn-9:after {
            position: absolute;
            content: " ";
            z-index: -1;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #1fd1f9;
            background-image: linear-gradient(315deg, #1fd1f9 0%, #b621fe 74%);
            transition: all 0.3s ease;
        }

        .btn-9:hover {
            background: transparent;
            box-shadow: 4px 4px 6px 0 rgba(255, 255, 255, .5),
            -4px -4px 6px 0 rgba(116, 125, 136, .2),
            inset -4px -4px 6px 0 rgba(255, 255, 255, .5),
            inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
            color: #fff;
        }

        .btn-9:hover:after {
            -webkit-transform: scale(2) rotate(180deg);
            transform: scale(2) rotate(180deg);
            box-shadow: 4px 4px 6px 0 rgba(255, 255, 255, .5),
            -4px -4px 6px 0 rgba(116, 125, 136, .2),
            inset -4px -4px 6px 0 rgba(255, 255, 255, .5),
            inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
        }

        .app-page-title {
            color: #5b99ea;
        }


        .g-4,
        .gy-4 {
            --bs-gutter-y: 1.0rem;
        }

        .g-4,
        .gx-4 {
            --bs-gutter-x: 1.0rem;
        }

        .app-wrapper {
            margin-left: 10px;
            margin-right: 300px;
        }

        .app {
            padding-top: 0px;
        }
    </style>
</head>
<body>
<div class="shubiao"></div>
<!-- 星空 -->
<div class="main">
    <div class="star"></div>
    <div class="medium-star"></div>
    <div class="big-star"></div>
</div>

<!-- 看板娘 -->
<div class="waifu ">
    <div class="waifu-tips"></div>
    <canvas id="live2d" width="270" height="270" class="live2d"></canvas>
    <div class="waifu-tool">
        <span class="fui-home"></span>
        <span class="fui-chat"></span>
        <span class="fui-eye"></span>
        <span class="fui-user"></span>
        <span class="fui-photo"></span>
        <span class="fui-info-circle"></span>
        <span class="fui-cross"></span>
    </div>
</div>
</div>


<div class="note-container">
    <%
        // 获取session中的note对象
        Note note = (Note) session.getAttribute("note");
        if (note != null) {
    %>
    <h1 class="note-title"><%= note.getTitle() %></h1>
    <div class="note-content" id="view">
        <%= note.getContent() %>
        <div class="note-content" style=" display: flex; justify-content: center; align-items: center;">
            <button class="custom-btn btn-9" @click="goBack()">返回</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="custom-btn btn-9" @click="editNote()">修改</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="custom-btn btn-9" @click="deleteNote(${note.noteId})">删除</button>
        </div>

    </div>

    <%
    } else {
    %>
    <p>查看失败了...</p>
    <%
        }
    %>
</div>
</body>
<script>
    var viewvm = new Vue({
        el: '#view',
        data: {
            note: {
                title: '',
                content: '',
                noteId: '',
            }
        },
        methods: {
            goBack: function () {
                window.location.href = 'docs.jsp';
            },
            deleteNote(noteId) {//有bug
                if (!confirm('辛辛苦苦写的笔记就要被删除了(⋟﹏⋞) 笔记id'+noteId+'确定删除吗？')) {
                    return;
                }
                axios.get('NoteServlet', {
                    params: {
                        actionName: 'Deletenote',
                        noteId: noteId
                    }
                })
                    .then(response => {
                        // 删除成功后，重新获取笔记列表
                        //提示删除成功
                        alert("删除成功 （ｖ＾＿＾）ｖ");
                        // console.log("删除成功");
                        // console.log(response.data);
                        // this.getNotes();
                        //跳转页面到docs.jsp
                        window.location.href = 'docs.jsp';
                    })
                    .catch(error => {
                        alert("不知道为什么删除失败   (╯﹏╰）");
                        // console.log("删除失败");
                        // console.log(error);
                    })
            }
        }
    })
</script>
<script src="static/live_2D_assets/waifu-tips.js"></script>
<script src="static/live_2D_assets/live2d.js"></script>
<script type="text/javascript">initModel("static/live_2D_assets/")</script>
<script>

    let img = document.querySelector('.shubiao')
    // 定义小图片的旋转角度
    let deg = 0
    // 定义小图片位于网页左侧的位置
    let imgx = 0
    // 定义小图片位于网页顶部的位置
    let imgy = 0
    // 定义小图片x轴的位置
    let imgl = 0
    // 定义小图片y轴的位置
    let imgt = 0
    // 定义小图片翻转的角度
    let y = 0
    // 定义一个计数器
    let index = 0

    window.addEventListener('mousemove', function (xyz) {
        // 获取网页左侧距离的图片位置
        imgx = xyz.x - img.offsetLeft - img.clientWidth / 2
        // 多去网页顶部距离图片的位置
        imgy = xyz.y - img.offsetTop - img.clientHeight / 2
        // 套入公式，定义图片的旋转角度
        deg = 360 * Math.atan(imgy / imgx) / (2 * Math.PI)
        // 每当鼠标移动的时候重置index
        index = 0
        // 定义当前鼠标的位置
        let x = event.clientX
        // 当鼠标的x轴大于图片的时候，提普安就要对着鼠标，所以需要将图片翻转过来
        // 否则就不用翻转
        if (img.offsetLeft < x) {
            y = -180
        } else {
            y = 0
        }
    })
    setInterval(() => {
        // 设置小图片的旋转和翻转
        img.style.transform = "rotateZ(" + deg + "deg) rotateY(" + y + "deg)"
        index++
        // 在这里设置小图片的位置和速度，并判断小图片到达鼠标位置时停止移动
        if (index < 100) {
            imgl += imgx / 100
            imgt += imgy / 100
        }
        img.style.left = imgl + "px"
        img.style.top = imgt + "px"
    }, 10)




</script>
</html>
