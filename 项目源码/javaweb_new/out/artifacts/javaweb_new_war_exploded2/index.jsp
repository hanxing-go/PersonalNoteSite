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

<body>
</style>

<section>
    <img src="static/background_img/1.jpg" id="bg">
    <img src="static/background_img/moon.png" id="moon">
    <img src="static/background_img/mountain.png" id="mountain">
    <img src="static/background_img/road.png" id="road">
    <h2 id="text">虚空终端文献管理系统</h2>
</section>



<font color="#fffafa" face="Comic Sans MS" size="6" >
    Not from the stars do I my judgment pluck;<br>
    And yet methinks I have astronomy,<br>
    But not to tell of good or evil luck,<br>
    Of plagues, of dearths, or seasons'quality;<br>
    Nor can I fortune to brief minutes tell,<br>
    Pointing to each his thunder, rain and wind,<br>
    Or say with princes if it shall go well,<br>
    By oft predict that I in heaven find:<br>
    But from thine eyes my knowledge I derive,<br>
    And constant stars, in them I read such art<br>
    As truth and beauty shall together thrive,<br>
    If from thyself to store thou wouldst convert;<br>
    Or else of thee this I prognosticate:<br>
    Thy end is truth's and beauty's doom and date</font>



<!-- 导航栏 -->

<nav class="shell close">
    <header>
        <div class="image-text">
                <span class="image">
                    <a href="user.jsp"><img src="./雪乃2.webp" alt=""></a>
                </span>
            <div class="text logo-text">
                <span class="name">张旭</span>
                <span class="software">江西师范大学</span>
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
                    <a href="#">
                        <i class="iconfont icon-shoucangxiao icon"><img src="static/icon/星星.png"
                                                                        style="max-width: 30px;"></i>
                        <span class="text nac-text">我的收藏</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="#">
                        <i class="iconfont icon-lishi icon"><img src="static/icon/time.png" style="max-width: 35px;"></i>
                        <span class="text nac-text">历史记录</span>
                    </a>
                </li>

                <li class="nav-link">
                    <a href="#">
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
                    <a href="#">
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
                    <a href="login.jsp">
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