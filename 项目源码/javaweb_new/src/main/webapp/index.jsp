<%@ page import="note.po.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Moon Light</title>

    <link rel="stylesheet" type="text/css" href="static/css/index1.css">

    <link rel="stylesheet" href="static/css/stars.css">

    <link rel="stylesheet" type="text/css" href="static/live_2D_assets/waifu.css" />
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="static/css/navigate.css">
    <link rel="stylesheet" href="static/css/index.css">

<%--    新手引导栏--%>
    <link href="https://cdn.bootcdn.net/ajax/libs/driver.js/0.9.8/driver.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/driver.js/0.9.8/driver.min.js"></script>



    <!-- 音乐播放器 -->
    <link rel="stylesheet" href="static/node_modules/aplayer/dist/APlayer.min.css">
    <script src="static/node_modules/aplayer/dist/APlayer.min.js">
    </script>
    <script src="static/node_modules/meting/dist/Meting.min.js">
    </script>

    <meting-js server="netease" type="playlist" id="2091761965" fixed="true" autoplay="false" loop="all" order="list"
               preload="auto" list-folded="true" list-max-height="500px" lrc-type="1">

    </meting-js>

</head>

<style>

</style>
<body>

<div class="section-style-1">
    <img src="static/background_img/1.jpg" id="bg">
    <img src="static/background_img/moon.png" id="moon">
    <img src="static/background_img/mountain.png" id="mountain">
    <img src="static/background_img/road.png" id="road">
    <h2 id="text">虚空终端文献管理系统</h2>
</div>

<div class="container">
    <section id="img-one" class="img">
        <h1>网站功能介绍</h1>
    </section>
    <section class="content-one">
        <div class="text-box">
            <div class="cnt">
                <h2>登录注册</h2>
                <p>
                    在这里，您可以登录以及注册，登录后可以使用更多功能，如：用户数据报表，AI问答，创作笔记等等功能！！Ｏ(≧▽≦)Ｏ
                </p>
                <p>
                    <a href="login.jsp" class="btn">点击跳转</a>
                </p>
            </div>
        </div>
    </section>
    <section class="content-two">
        <div class="text-box">
            <div class="cnt">
                <h2>用户中心</h2>
                <p>
                    Ｏ(≧▽≦)Ｏ 在这里，您可以修改您的用户信息，暂不支持上传图片，更新头像，敬请期待！Ｏ(≧▽≦)Ｏ
                </p>
                <p>
                    <a href="user.jsp" class="btn">点击跳转</a>
                </p>
            </div>
        </div>
    </section>
    <section class="content-three">
        <div class="text-box">
            <div class="cnt">
                <h2>小虚AI助手</h2>
                <p>
                    Ｏ(≧▽≦)Ｏ 在这里，您可以和小虚AI助手进行聊天和提问，小虚AI助手会根据您的输入进行回复Ｏ(≧▽≦)Ｏ
                    ps:目前只有前端，后端还在开发中，敬请期待！
                </p>
                <p>
                    <a href="chatAI.jsp" class="btn">点击跳转</a>
                </p>
            </div>
        </div>
    </section>
    <section class="content-four">
        <div class="text-box">
            <div class="cnt">
                <h2>创作中心</h2>
                <p>
                    在这里，您可以进行笔记的创作，笔记的创作支持富文本编辑框，您可以在这里进行创作！同时包括新增笔记类型功能Ｏ(≧▽≦)Ｏ
                </p>
                <p>
                    <a href="write.jsp" class="btn">点击跳转</a>
                </p>
            </div>
        </div>
    </section>
    <section class="content-five">
        <div class="text-box">
            <div class="cnt">
                <h2>笔记管理</h2>
                <p>
                    Ｏ(≧▽≦)Ｏ 在这里，您可以管理创作的笔记以及查看笔记，包括分页查询，按类别查询，按标题名查询等等功能Ｏ(≧▽≦)Ｏ
                </p>
                <p>
                    <a href="docs.jsp" class="btn">点击跳转</a>
                </p>
            </div>
        </div>
    </section>
    <section class="content-six">
        <div class="text-box">
            <div class="cnt">
                <h2>英汉互译</h2>
                <p>
                    在这里，您可以进行对一些不太理解的中文或英文进行互译Ｏ(≧▽≦)Ｏ
                </p>
                <p>
                    <a href="write.jsp" class="btn">点击跳转</a>
                </p>
            </div>
        </div>
    </section>
    <section class="content-seven">
        <div class="text-box">
            <div class="cnt">
                <h2>待开发页面</h2>
                <p>
                    Ｏ(≧▽≦)Ｏ 还有一些功能待开发中，我们为您设计了一款简单的网页2048小游戏Ｏ(≧▽≦)Ｏ
                </p>
                <p>
                    <a href="game.jsp" class="btn">点击游玩</a>
                </p>
            </div>
        </div>
    </section>
    <section id="img-two" class="img">
        <h1>更多功能敬请期待!!</h1>
    </section>
<%--    <section id="footer">FOOTER</section>--%>
</div>



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
                <span class="image" id="step1">
                    <a href="user.jsp"><img src="UserServlet?actionName=userHead&iamgeName=${user.head}" alt="" ></a>
                </span>
            <div class="text logo-text">
                <span class="name">${user.username}</span>
                <span class="software">${user.name}</span>
            </div>
        </div>
        <i class="iconfont icon-xiangyoujiantou toggle" id="step2"></i>
    </header>
    <div class="menu-bar">
        <div class="menu">
            <li class="search-box" >
                <i class="iconfont icon-sousuo icon"> <img src="static/icon/搜索.png" style="max-width: 30px;"id="step3" ></i>

                <input type="text" placeholder="搜索...">
            </li>
            <ul class="menu-links">
                <li class="nav-link" >
                    <a href="index.jsp">
                        <i class="iconfont icon-shouye icon"><img src="static/icon/主页.png" style="max-width: 30px;" id="setp4"></i>

                        <span class="text nac-text">主页</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="docs.jsp">
                        <i class="iconfont icon-shoucangxiao icon"><img src="static/icon/星星.png"
                                                                        style="max-width: 30px;" id="setp5"></i>
                        <span class="text nac-text">我的收藏</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="translate.html">
                        <i class="iconfont icon-lishi icon"><img src="static/icon/翻译.png" style="max-width: 45px;" id="setp6"></i>
                        <span class="text nac-text">中英互译</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="game.jsp">
                        <i class="iconfont icon-xiaoxi icon"><img src="static/icon/消息.png" style="max-width: 24px;" id="setp7"></i>
                        <span class="text nac-text">消息</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="dataVison.jsp">
                        <i class="iconfont icon-fensi icon"><img src="static/icon/用户.png" style="max-width: 30px;" id="setp8"></i>
                        <span class="text nac-text">用户数据</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="write.jsp">
                        <i class="iconfont icon-chuangzuo icon"><img src="static/icon/创作.png" style="max-width: 26px;" id="setp9"></i>
                        <span class="text nac-text">创作中心</span>
                    </a>
                </li>
                <li class="nav-link">
                    <a href="chatAI.jsp">
                        <i class="iconfont icon-chuangzuo icon"><img src="static/icon/设备-AI求助.png"
                                                                     style="max-width: 26px;" id="setp10"></i>
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
                                                                       style="max-width: 30px;" id="setp11"></i>
                        <span class="text nac-text">注销</span>
                    </a>
                </li>
                <li class="mode">
                    <div class="sun-moon">
                        <i class="iconfont icon-rijian icon sun"></i>
                        <i class="iconfont icon-yejian icon moon"></i>
                    </div>
                    <span class="mode-text text" id="setp12">夜间模式</span>
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
<div class="waifu " id="step13">
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

<script>
    const driver = new Driver({
        allowClose: true,
    });

    driver.defineSteps([
        {
            element: '#step1',
            popover: {
                title: '欢迎来到虚空终端文献管理系统',
                description: '这里是您的个人中心，您可以在这里修改您的个人信息。ᕙ(• ॒ ູ•)ᕘ',
                position: 'bottom'
            }
        },
        {
            element: '#step2',
            popover: {
                className: 'first-step-popover-class',
                title: '教程一',
                description: '点击这里可以扩展导航栏。(๑•̀ㅂ•́)و✧（貌似教程有些许bug，高亮吧导航栏给覆盖了，还请原谅）',
                position: 'bottom'
            }
        },
        {
            element: '#step3',
            popover: {
                title: '教程二',
                description: '<img src="static/icon/搜索.png" style="max-width: 30px;" >点击这里可以进行搜索。(暂不支持)(ᇂ_ᇂ|||)',
                position: 'right'
            }
        }
        ,
        {
            element: '#setp4',
            popover: {
                title: '教程三',
                description: '<img src="static/icon/主页.png" style="max-width: 30px;" >点击这里可以跳转到主页。(u‿ฺu✿)',
                position: 'right'
            }
        }
        ,
        {
            element: '#setp5',
            popover: {
                title: '教程四',
                description: '<img src="static/icon/星星.png" style="max-width: 30px;" >点击这里可以跳转到我的笔记。',
                position: 'right'
            }
        }
        ,
        {
            element: '#setp6',
            popover: {
                title: '教程五',
                description: '<img src="static/icon/翻译.png" style="max-width: 45px;" >点击这里可以跳转到中英互译。ฅ( ̳• · • ̳ฅ)',
                position: 'right'
            }
        }
        ,
        {
            element: '#setp7',
            popover: {
                title: '教程六',
                description: '<img src="static/icon/消息.png" style="max-width: 24px;" >点击这里可以跳转到消息。(っ◞‸◟c)',
                position: 'right'
            }
        }
        ,
        {
            element: '#setp8',
            popover: {
                title: '教程七',
                description: '<img src="static/icon/用户.png" style="max-width: 30px;" >点击这里可以跳转到用户数据。੭ ᐕ)੭*⁾⁾',
                position: 'right'
            }
        }
        ,
        {
            element: '#setp9',
            popover: {
                title: '教程八',
                description: '<img src="static/icon/创作.png" style="max-width: 26px;" >点击这里可以跳转到创作中心。(⌯꒪꒫꒪)੭',
                position: 'right'
            }
        }
        ,
        {
            element: '#setp10',
            popover: {
                title: '教程九',
                description: '<img src="static/icon/设备-AI求助.png" style="max-width: 26px;" >点击这里可以跳转到AI助手。૮₍ ˃ ⤙ ˂ ₎ა',
                position: 'right'
            }
        }
        ,
        {
            element: '#setp11',
            popover: {
                title: '教程十',
                description: '<img src="static/icon/注销登录.png" style="max-width: 30px;" >点击这里可以注销登录。๑ᵒᯅᵒ๑',
                position: 'right'
            }
        }
        ,
        {
            element: '#setp12',
            popover: {
                title: '教程十一',
                description: '<img src="static/icon/夜间.png" style="max-width: 30px;" >点击这里可以切换夜间模式。ᕙ(`▿´)ᕗ',
                position: 'right'
            }
        }
        ,
        {
            element: '#step13',
            popover: {
                title: '教程十二',
                description: '这是我们可爱的看板娘，你可以与他进行一些简单的互动，并且可以更换，如果不喜欢，也可以关闭૮(˶ᵔ ᵕ ᵔ˶)ა',
                position: 'left'
            }
        }
        ,
    ]);
    driver.start();
</script>



</body>
<script src="static/live_2D_assets/waifu-tips.js"></script>
<script src="static/live_2D_assets/live2d.js"></script>
<script type="text/javascript">initModel("static/live_2D_assets/")</script>



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
<script type="text/javascript">
    let bg = document.getElementById("bg");
    let moon = document.querySelector("#moon");
    let mountain = document.querySelector("#mountain");
    let road = document.querySelector("#road");
    let text = document.querySelector("#text");

    window.addEventListener("scroll", function () {
        var value = window.scrollY;
        bg.style.top = value * 0.5 + "px";
        moon.style.left = -value * 4.5 + "px";
        mountain.style.top = -value * 0.15 + "px";
        road.style.top = value * 0.15 + "px";
        text.style.top = value * 1 + "px";
    });
</script>

</html>