<%@ page import="note.po.User" %><%--
  Created by IntelliJ IDEA.
  User: 12099
  Date: 2023/12/17
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>index</title>
    <!-- <script type="text/javascript" src="js/lizi.js"></script> -->
    <!-- App CSS -->
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

<%--    富文本编辑器--%>
    <script type="text/javascript" charset="utf-8" src="static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="static/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="static/ueditor/lang/zh-cn/zh-cn.js"></script>


    <!-- 音乐播放器 -->
    <link rel="stylesheet" href="static/node_modules/aplayer/dist/APlayer.min.css">
    <script src="static/node_modules/aplayer/dist/APlayer.min.js">
    </script>
    <script src="static/node_modules/meting/dist/Meting.min.js">
    </script>
    <meting-js server="netease" type="playlist" id="2091761965" fixed="true" autoplay="false" mutex="false" loop="all"
               order="list" preload="auto" list-folded="true" list-max-height="500px" lrc-type="1">

    </meting-js>
    <!-- 11111111111111111111111111 -->
</head>
<style>
    body {
        color: black !important;
        font-size: 16px;
        background-image: url(static/background_img/1.jpg);
    }
    .shubiao {
        width: 50px;
        height: 50px;
        position: absolute;
        background-image: url('./1393817219.gif');
        background-size: cover;
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

<body>

<%
    // 获取session中的note对象
//  Note note = (Note) session.getAttribute("note");
//  if (note != null) {
    //获取session中的user对象
    User user = (User) session.getAttribute("user");

%>
<!-- 导航栏 -->

<nav class="shell close">
    <header>
        <div class="image-text">
                <span class="image">
                    <a href="user.jsp"><img src="UserServlet?actionName=userHead&iamgeName=${user.head}" alt="" ></a>
                </span>
            <div class="text logo-text">
                <span class="name">${user.username}</span>
                <span class="software">${user.name}</span>
            </div>
        </div>
        <i class="iconfont icon-xiangyoujiantou toggle"></i>
    </header>
    <div class="menu-bar">
        <div class="menu">
            <li class="search-box">
                <i class="iconfont icon-sousuo icon"> <img src="static/icon/搜索.png" style="max-width: 30px;"></i>

                <input type="text" placeholder="搜索...">
            </li>
            <ul class="menu-links">
                <li class="nav-link">
                    <a href="index.jsp">
                        <i class="iconfont icon-shouye icon"><img src="static/icon/主页.png" style="max-width: 30px;"></i>

                        <span class="text nac-text">主页</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="docs.jsp">
                        <i class="iconfont icon-shoucangxiao icon"><img src="static/icon/星星.png"
                                                                        style="max-width: 30px;"></i>
                        <span class="text nac-text">我的收藏</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="translate.html">
                        <i class="iconfont icon-lishi icon"><img src="static/icon/翻译.png" style="max-width: 45px;"></i>
                        <span class="text nac-text">中英互译</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="game.jsp">
                        <i class="iconfont icon-xiaoxi icon"><img src="static/icon/消息.png" style="max-width: 24px;"></i>
                        <span class="text nac-text">消息</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="dataVison.jsp">
                        <i class="iconfont icon-fensi icon"><img src="static/icon/用户.png" style="max-width: 30px;"></i>
                        <span class="text nac-text">用户数据</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="write.jsp">
                        <i class="iconfont icon-chuangzuo icon"><img src="static/icon/创作.png" style="max-width: 26px;"></i>
                        <span class="text nac-text">创作中心</span>
                    </a>
                </li>
                <li class="nav-link">
                    <a href="chatAI.jsp">
                        <i class="iconfont icon-chuangzuo icon"><img src="static/icon/设备-AI求助.png"
                                                                     style="max-width: 26px;"></i>
                        <span class="text nac-text">chatgpt</span>
                    </a>
                </li>
                <li class="nav-link">
                </li>
                <li class="nav-link">
                </li>
                <li class="nav-link">
                </li>
                <li class="nav-link">
                </li>
                <li class="nav-link">
                </li>
            </ul>


            <div class="bottom-content">
                <li class="">
                    <a href="UserServlet?actionName=logout">
                        <i class="iconfont icon-zhuxiaoyuan icon"><img src="static/icon/注销登录.png"
                                                                       style="max-width: 30px;"></i>
                        <span class="text nac-text">注销</span>
                    </a>
                </li>
                <li class="mode">
                    <div class="sun-moon">
                        <i class="iconfont icon-rijian icon sun"></i>
                        <i class="iconfont icon-yejian icon moon"></i>
                    </div>
                    <span class="mode-text text">夜间模式</span>
                    <div class="toggle-switch">
                        <span class="switch"></span>
                    </div>
                </li>
            </div>
        </div>

    </div>

</nav>



<div class="shubiao"></div>
<!-- 星空 -->
<div class="main">
    <div class="star"></div>
    <div class="medium-star"></div>
    <div class="big-star"></div>
</div>

<!-- 看板娘 -->
<div class="waifu " position: fixed; bottom: 0; left: 0;>
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

<div class="container mt-5">
    <div class="card">
        <div class="card-header" style="color: black; text-align: center">
            <h3 class="card-title">创作中心</h3>
        </div>
        <div class="card-body">
            <form id="noteForm" method="post" action="NoteServlet" onsubmit="return checkFrom()">
                <input type="hidden" name="actionName" value="addOrUpdate" />
                <div class="form-group" style="display: flex; align-items: center;">
                    <div style="flex-grow: 1;">
                        <label for="typeId">类别:</label>
                        <select id="typeId" class="form-control" name="typeId" style="width: 100%;height: 100%">
                            <option v-for="noteType in noteTypes" :value="noteType.typeId">
                                {{ noteType.typeName }}
                            </option>
                        </select>
                    </div>
                    <div>
                        <button type="button" class="custom-btn btn-9" data-bs-toggle="modal" data-bs-target="#exampleModal1">新增类型</button>
                        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5"  style="color: #7a7a82;" id="exampleModalLabel">添加类型</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                        <div id="addTypeform">
                                            <div class="modal-body" style="color: #7a7a82;">
                                                <input type="hidden" name="actionName" value="addNotetype" />
                                                <input class="form-control me-2" style="width: 100%;" type="text" v-model="typeName" placeholder="请输入类型名称">
                                            </div>

<%--                                            <button @click="save">添加</button>--%>
                                            <div class="modal-footer">
                                                <button type="button" class="custom-btn btn-9" data-bs-dismiss="modal" @click="save" >保存</button>
                                            </div>
                                        </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="title">标题:</label>
                    <input type="text" class="form-control" name="title" id="title" placeholder="笔记标题" value="${resultInfo.result.title}">
                </div>
                <div class="form-group">
                    <label for="content">内容:</label>
                    <textarea id="content" name="content" rows="5" style="height: 550px; color: black;">${resultInfo.result.content}</textarea>
                </div>
                <div>
                    &nbsp;
                </div>
                <div style="text-align: center;">
                    <button class="custom-btn btn-9" type="submit" class="btn btn-primary">保存</button>
                    <span id="msg" class="text-danger"></span>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>--%>

<script type="text/javascript">
    var ue;
    $(function() {
        ue = UE.getEditor('content'); //加载富文本编辑器
    });
    // 表单校验
    // 1.获取表单元素的值
    // 获取下拉框选中的选项
    // var typeId = $("#typeId").val();
    // 获取文本框的值
    // var title = $("#title").val();
    // 获取富文本编辑器中的内容
    // var content = ue.getContent();//获取富文本编辑器的内容，包含html标签
    // var txt = ue.getContentTxt();//获取富文本编辑器的内容，不包含html标签
    // 2.校验表单元素的值
    // 校验类型是否选择
    // 校验标题是否为空
    // 校验内容是否为空
    // 3.校验通过，提交表单
    function checkFrom() {
        // 获取表单元素的值
        var typeId = $("#typeId").val();
        var title = $("#title").val();
        var content = ue.getContent();
        // 校验表单元素的值
        if (typeId == "") {
            $("#msg").html("请选择类型");
            return false;
        }
        if (title == "") {
            $("#msg").html("标题不能为空");
            return false;
        }
        if (content == "") {
            $("#msg").html("内容不能为空");
            return false;
        }
        // 校验通过，提交表单
        $("#noteForm").submit();
    }




</script>

<script>
    var vm = new Vue({
        el: '#typeId',
        data: {
            noteTypes: [],
            selectedTypeId: '${resultInfo.result.typeId}' // 添加这一行
        },
        mounted() {
            this.getNoteTypes();
            this.setSelectedOption();
        },
        methods: {
            getNoteTypes() {
                var xhr = new XMLHttpRequest();
                console.log(this.selectedTypeId)

                xhr.onreadystatechange = function() {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        this.noteTypes = JSON.parse(xhr.responseText);
                    }
                }.bind(this);
                xhr.open("GET", "NoteTypeServlet?actionName=findNoteType", true);
                xhr.send();
            },
            setSelectedOption() {
                var selectElement = document.querySelector('#typeId');
                var options = selectElement.options;
                for (var i = 0; i < options.length; i++) {
                    if (options[i].value == this.selectedTypeId) {
                        console.log(this.selectedTypeId);
                        selectElement.selectedIndex = i;
                        break;
                    }
                }
            }
        }
    });

    new Vue({
        el: '#addTypeform',
        data: {
            typeName: ''
        },
        methods: {
            save: function() {
                // alert("添加")
                // console.log(this.typeName);
                var self = this;
                axios.get('NoteTypeServlet', {
                    params: {
                        actionName: 'addNoteType',
                        typeName: self.typeName
                    }
                })
                    .then(function(response) {
                        var resultInfo = response.data;
                        if(resultInfo.code == 1) {
                            alert("添加成功");
                            // 刷新页面
                            vm.getNoteTypes();
                            self.typeName="";
                        } else {
                            alert("添加失败: " + resultInfo.msg);
                        }
                    })
                    .catch(function(error) {
                        alert("请求失败");
                    });
            }
        }
    });
</script>

</body>
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


<!-- 导航栏 -->
<script>
    const body = document.querySelector('body'),
        shell = body.querySelector('nav'),
        toggle = body.querySelector(".toggle"),
        searchBtn = body.querySelector(".search-box"),
        modeSwitch = body.querySelector(".toggle-switch"),
        modeText = body.querySelector(".mode-text");
    // 点击toggle元素时触发事件
    toggle.addEventListener("click", () => {
        // 切换shell元素的close类
        shell.classList.toggle("close");
    })
    // 点击searchBtn元素时触发事件
    searchBtn.addEventListener("click", () => {
        // 移除shell元素的close类
        shell.classList.remove("close");
    })
    // 点击modeSwitch元素时触发事件
    modeSwitch.addEventListener("click", () => {
        // 切换body元素的dark类
        body.classList.toggle("dark");
        // 如果body元素包含dark类
        if (body.classList.contains("dark")) {
            modeText.innerText = "白日模式";
        } else {
            modeText.innerText = "夜间模式";
        }
    });

</script>


</html>