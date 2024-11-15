<%--
  Created by IntelliJ IDEA.
  User: 12099
  Date: 2023/12/23
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="note.po.User" %>
<!doctype html>
<html ng-app='calendarApp' ng-cloak='true'>

<head>
    <meta charset="utf-8">
    <title>User Center</title>
    <!-- <link rel="stylesheet" href="css/dataVisonStyle.css"> -->
    <link rel="stylesheet" href="static/css/stars.css">

    <link rel="stylesheet" type="text/css" href="static/live_2D_assets/waifu.css" />
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="static/css/navigate.css">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Montserrat:700,400' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="static/css/calendar.css">
    <script src="static/js/axios.min.js"></script>
    <script src="static/js/vue.js"></script>

    <link rel="stylesheet" href="static/css/weather.css">

    <link rel="stylesheet" href="static/css/buttons.css">
    <script src="static/js/vue.js"></script>



    <!-- 音乐播放器 -->
    <link rel="stylesheet" href="static/node_modules/aplayer/dist/APlayer.min.css">
    <script src="static/node_modules/aplayer/dist/APlayer.min.js">
    </script>
    <script src="static/node_modules/meting/dist/Meting.min.js">
    </script>
    <meting-js server="netease" type="playlist" id="2091761965" fixed="true" autoplay="false" loop="all" order="list"
               preload="auto" list-folded="true" list-max-height="500px" lrc-type="1">

    </meting-js>
    <!-- 11111111111111111111111111 -->



    <link  rel="stylesheet" href="static/css/user.css">

    <!-- axios -->
    <script src="static/js/axios.min.js"></script>



</head>
<style>
    .shubiao {
        width: 50px;
        height: 50px;
        position: absolute;
        background-image: url('./1393817219.gif');
        background-size: cover;
    }


</style>

<body>

<%
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






<div class="app-wrapper">

    <div class="app-content pt-3 p-md-3 p-lg-4">
        <div class="container-xl">

            <h1 class="app-page-title">账号管理</h1>
            <div class="row gy-4">
                <div class="col-12 col-lg-6">
                    <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
                        <div class="app-card-header p-3 border-bottom-0">
                            <div class="row align-items-center gx-3">
                                <div class="col-auto">
                                    <div class="app-icon-holder">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                                        </svg>
                                    </div><!--//icon-holder-->

                                </div><!--//col-->






                                <div class="col-auto">
                                    <h4 class="app-card-title">基础信息</h4>
                                </div><!--//col-->
                            </div><!--//row-->
                        </div><!--//app-card-header-->




                        <form>

                            <input type="hidden" name="actionName" value="userCenter" />
                            <div id="tz">
                                <div class="app-card-body px-4 w-100">
                                    <div class="item border-bottom py-3">
                                        <div class="row justify-content-between align-items-center">
                                            <div class="col-auto">
                                                <div class="item-label mb-2"><strong>头像</strong></div>
                                                <div class="item-data"><img class="profile-image" src="UserServlet?actionName=userHead&iamgeName=${user.head}" alt=""></div>
                                            </div><!--//col-->


                                            <div class="col text-end">
                                                <%--                                            <button class="btn-sm app-btn-secondary" href="#">修改</button>--%>
                                            </div><!--//col-->
                                        </div><!--//row-->
                                    </div><!--//item-->



                                    <div class="item border-bottom py-3">
                                        <div class="row justify-content-between align-items-center">
                                            <div class="col-auto">
                                                <div class="item-label"><strong>姓名</strong></div>


                                                <input class="item-data"  v-model="name" style="width: 350px" name="name"></input>


                                            </div><!--//col-->
                                        </div><!--//row-->
                                    </div><!--//item-->


                                    <div class="item border-bottom py-3">
                                        <div class="row justify-content-between align-items-center">
                                            <div class="col-auto">
                                                <div class="item-label"><strong>昵称</strong></div>

                                                <input class="item-data"  v-model="username" style="width: 350px" name="username"></input>

                                            </div><!--//col-->

                                        </div><!--//row-->
                                    </div><!--//item-->


                                    <div class="item border-bottom py-3">
                                        <div class="row justify-content-between align-items-center">
                                            <div class="col-auto">
                                                <div class="item-label"><strong>签名</strong></div>

                                                <input class="item-data"  v-model="moto" style="width: 350px" name="moto"></input>
                                                </input>
                                            </div><!--//col-->
                                        </div><!--//row-->
                                    </div><!--//item-->

                                </div><!--//app-card-body-->

                                <div class="app-card-footer p-4 mt-auto">

                                    <button  @click="updateUserInfo" class="btn app-btn-secondary" type="button">保存</button>

                                </div><!--//app-card-footer-->
                            </div>


                        </form>





                    </div><!--//app-card-->
                </div><!--//col-->
                <div class="col-12 col-lg-6">
                    <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
                        <div class="app-card-header p-3 border-bottom-0">
                            <div class="row align-items-center gx-3">
                                <div class="col-auto">
                                    <div class="app-icon-holder">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-sliders" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M11.5 2a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM9.05 3a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0V3h9.05zM4.5 7a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM2.05 8a2.5 2.5 0 0 1 4.9 0H16v1H6.95a2.5 2.5 0 0 1-4.9 0H0V8h2.05zm9.45 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm-2.45 1a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0v-1h9.05z"/>
                                        </svg>
                                    </div><!--//icon-holder-->

                                </div><!--//col-->
                                <div class="col-auto">
                                    <h4 class="app-card-title"></h4>
                                </div><!--//col-->
                            </div><!--//row-->
                        </div><!--//app-card-header-->






                        <div class="app-card-body px-4 w-100">
                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><strong>学校名称</strong></div>
                                        <div class="item-data">English</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <button class="btn-sm app-btn-secondary" href="#">Change</button>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->
                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><strong>专业</strong></div>
                                        <div class="item-data">Central Standard Time (UTC-6)</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <button class="btn-sm app-btn-secondary" href="#">Change</button>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->
                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><strong>入学时间</strong></div>
                                        <div class="item-data">xx年xx月xx日</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <button class="btn-sm app-btn-secondary" href="#">Change</button>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->
                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><strong>学历</strong></div>
                                        <div class="item-data">Off</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <button class="btn-sm app-btn-secondary" href="#">Change</button>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->
                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><strong>地区</strong></div>
                                        <div class="item-data">On</div>
                                    </div><!--//col-->




                                    <div class="col text-end">
                                        <button class="btn-sm app-btn-secondary" href="#">Change</button>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->
                        </div><!--//app-card-body-->


                        <div class="app-card-footer p-4 mt-auto">
                            <a class="btn app-btn-secondary" href="#">管理基础信息</a>
                        </div><!--//app-card-footer-->






                    </div><!--//app-card-->
                </div><!--//col-->
                <div class="col-12 col-lg-6">
                    <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
                        <div class="app-card-header p-3 border-bottom-0">
                            <div class="row align-items-center gx-3">
                                <div class="col-auto">
                                    <div class="app-icon-holder">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-shield-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M5.443 1.991a60.17 60.17 0 0 0-2.725.802.454.454 0 0 0-.315.366C1.87 7.056 3.1 9.9 4.567 11.773c.736.94 1.533 1.636 2.197 2.093.333.228.626.394.857.5.116.053.21.089.282.11A.73.73 0 0 0 8 14.5c.007-.001.038-.005.097-.023.072-.022.166-.058.282-.111.23-.106.525-.272.857-.5a10.197 10.197 0 0 0 2.197-2.093C12.9 9.9 14.13 7.056 13.597 3.159a.454.454 0 0 0-.315-.366c-.626-.2-1.682-.526-2.725-.802C9.491 1.71 8.51 1.5 8 1.5c-.51 0-1.49.21-2.557.491zm-.256-.966C6.23.749 7.337.5 8 .5c.662 0 1.77.249 2.813.525a61.09 61.09 0 0 1 2.772.815c.528.168.926.623 1.003 1.184.573 4.197-.756 7.307-2.367 9.365a11.191 11.191 0 0 1-2.418 2.3 6.942 6.942 0 0 1-1.007.586c-.27.124-.558.225-.796.225s-.526-.101-.796-.225a6.908 6.908 0 0 1-1.007-.586 11.192 11.192 0 0 1-2.417-2.3C2.167 10.331.839 7.221 1.412 3.024A1.454 1.454 0 0 1 2.415 1.84a61.11 61.11 0 0 1 2.772-.815z"/>
                                            <path fill-rule="evenodd" d="M10.854 6.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 8.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                                        </svg>
                                    </div><!--//icon-holder-->

                                </div><!--//col-->





                                <div class="col-auto">
                                    <h4 class="app-card-title">账号安全</h4>
                                </div><!--//col-->
                            </div><!--//row-->
                        </div><!--//app-card-header-->





                        <div class="app-card-body px-4 w-100">
                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><strong>账号</strong></div>
                                        <div class="item-data">English</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <a class="btn-sm app-btn-secondary" href="#">Change</a>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->
                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><strong>密码</strong></div>
                                        <div class="item-data">Central Standard Time (UTC-6)</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <a class="btn-sm app-btn-secondary" href="#">Change</a>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->
                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><strong>手机</strong></div>
                                        <div class="item-data"></div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <a class="btn-sm app-btn-secondary" href="#">Change</a>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->
                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><strong>邮箱</strong></div>
                                        <div class="item-data">Off</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <a class="btn-sm app-btn-secondary" href="#">Change</a>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->




                        </div><!--//app-card-body-->












                        <div class="app-card-footer p-4 mt-auto">
                            <a class="btn app-btn-secondary" href="#">管理账号安全</a>
                        </div><!--//app-card-footer-->

                    </div><!--//app-card-->
                </div>




                <div class="col-12 col-lg-6">
                    <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
                        <div class="app-card-header p-3 border-bottom-0">
                            <div class="row align-items-center gx-3">
                                <div class="col-auto">
                                    <div class="app-icon-holder">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-credit-card" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/>
                                            <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/>
                                        </svg>
                                    </div><!--//icon-holder-->

                                </div><!--//col-->
                                <div class="col-auto">
                                    <h4 class="app-card-title">工作信息</h4>
                                </div><!--//col-->
                            </div><!--//row-->
                        </div><!--//app-card-header-->
                        <div class="app-card-body px-4 w-100">

                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><i class="fab fa-cc-visa me-2"></i><strong>开始工作</strong></div>
                                        <div class="item-data">1234*******5678</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <a class="btn-sm app-btn-secondary" href="#">Change</a>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->



                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><i class="fab fa-paypal me-2"></i><strong>公司名称</strong></div>
                                        <div class="item-data">Not connected</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <a class="btn-sm app-btn-secondary" href="#">Change</a>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->




                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><i class="fab fa-paypal me-2"></i><strong>职位名称</strong></div>
                                        <div class="item-data">Not connected</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <a class="btn-sm app-btn-secondary" href="#">Change</a>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->




                            <div class="item border-bottom py-3">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-auto">
                                        <div class="item-label"><i class="fab fa-paypal me-2"></i><strong>所属行业</strong></div>
                                        <div class="item-data">Not connected</div>
                                    </div><!--//col-->
                                    <div class="col text-end">
                                        <a class="btn-sm app-btn-secondary" href="#">Change</a>
                                    </div><!--//col-->
                                </div><!--//row-->
                            </div><!--//item-->















                        </div><!--//app-card-body-->
                        <div class="app-card-footer p-4 mt-auto">
                            <a class="btn app-btn-secondary" href="#">管理工作信息</a>
                        </div><!--//app-card-footer-->

                    </div><!--//app-card-->
                </div>
            </div><!--//row-->

        </div><!--//container-fluid-->
    </div><!--//app-content-->



</div><!--//app-wrapper-->






<div><!-- 天气 -->
    <div class="container" id="app">
        <div class="weather-side">
            <div class="date-container">
                <h2 class="date-dayname" id="date-dayname">{{ weekDay }}</h2>
                <span class="iconfont" id="location">&#xe617;{{ city }}</span>
            </div>
            <div class="weather-conteiner">
                <span class="iconfont" id="weather-l">&#xe61f;</span>
                <div class="weather-temp" id="higesttmp">{{lowestTmp}} </div>
                <div class="weather-desc" id="lowesttmp">{{ highestTmp }}</div>
            </div>
        </div>

        <!-- 右边部分 -->
        <div class="info-side">



            <div class="week-container">
                <ul class="week-list">


                    <li v-for="forecast in forecasts.slice(0, 4)" :key="forecast.real">
                        <span class="iconfont">&#xe61f;</span>
                        <span class="day-name">{{ forecast.week }}</span>
                        <span class="day-temp">{{ forecast.real }}</span>
                    </li>



                </ul>


                <div class="location-container">
                    <input type="text" placeholder="位置" id="city" class="input_txt" v-model="city" v-on:keyup.enter="search">
                    <button class="location-button" id="location-button" @click="search">
                        <!-- location图标 -->
                        <span class="iconfont">&#xe617;查询</span>
                    </button>
                </div>
            </div>


        </div>
    </div>



    <!-- 日历随心记 -->
    <div class='calendar' ng-controller='calendarController as calendar'>
        <div class='calendar_left'>
            <div class='header'>
                <i class='material-icons' ng-click='calendar.prev()'>navigate_before</i>
                <h1>{{calendar.month}}</h1>
                <i class='material-icons' ng-click='calendar.next()'>navigate_next</i>
                <button class="small-custom-btn btn-8" ng-click='calendar.showDrawer = !calendar.showDrawer'>小记</button>
                <!-- <button ng-click='calendar.showDrawer = !calendar.showDrawer'>每日小记</button> -->
            </div>
            <div class='days'>
                <div class='day_item'>Mon</div>
                <div class='day_item'>Tue</div>
                <div class='day_item'>Wed</div>
                <div class='day_item'>Thu</div>
                <div class='day_item'>Fri</div>
                <div class='day_item'>Sat</div>
                <div class='day_item'>Sun</div>
            </div>
            <div class='dates'></div>

        </div>
        <div class='calendar_right' ng-show='calendar.showDrawer'>
            <div class='list'>
                <ul>
                    <li class='bounce-in' ng-repeat='events in calendar.events' ng-show='events.id === calendar.dataId'>
                        <span class='type'>这是一件 {{ events.type }} 的事 -</span>
                        <span class='description'>{{ events.description }}</span>
                    </li>
                </ul>
                <!-- 请注意，这里依然有一些小bug，但应该问题不大 -->
                <p ng-show='calendar.events.length === 0'
                   style='font-size: 40px; display: flex; align-items: center; justify-content: center; color: white;'>
                    今天</p>
                <p ng-show='calendar.events.length === 0'
                   style='font-size: 30px; display: flex; align-items: center; justify-content: center; color: white;'>
                    ~好好休息鸭~</p>
                <p ng-show='calendar.events.length === 0'
                   style='font-size: 30px; display: flex; align-items: center; justify-content: center; color: white;'>
                    ₍˄·͈༝·͈˄*₎◞ ̑̑ </p>

            </div>
            <form ng-submit='calendar.add()'>
                <input ng-model='calendar.description' placeholder='每日小记' type='text'>
                <select ng-model='calendar.type' placeholder='calendar.type'>
                    <option value='日常'>日常</option>
                    <option value='工作'>工作</option>
                </select>
                </input>
            </form>
        </div>
    </div>

</div>
<script>
    new Vue({
        el: '#tz',
        data: {
            username: '',
            name: '',
            moto: '',
        },
        methods: {
            getUserInfo() {
                // 获取用户信息
                self=this;
                axios.get('UserServlet?actionName=getUserInfo').then(res => {
                    console.log("获取用户信息");
                    console.log(res.data);
                    this.username = res.data.username;
                    this.name = res.data.name;
                    this.moto = res.data.moto;
                })
            },
            updateUserInfo() {
                // 更新用户信息
                self = this;
                axios.get('UserServlet', {
                    params: {
                        actionName: 'userCenter',
                        username: self.username,
                        name: self.name,
                        moto: self.moto
                    }
                })
                    .then(response => {
                        console.log(response.data);
                        if(response.data.code == 1) {
                            // 根据后端返回的数据，判断是否修改成功
                            alert('修改成功 Ｏ(≧▽≦)Ｏ');
                            // 修改成功后，重新获取用户信息
                            this.getUserInfo();

                        } else {
                            console.log(response.data);
                            alert('修改失败'+response.data.msg);
                        }
                    })
                    .catch(error => {
                        alert('修改失败'+response.data.msg)
                    });
            },
        },
        created() {
            this.getUserInfo();
        }
    });
</script>

<script>
    const calendarLeft = document.querySelector('.calendar_left');
    const calendarRight = document.querySelector('.calendar_right');

    calendarLeft.addEventListener('click', () => {
        calendarRight.classList.toggle('show');
    });
</script>
<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.2/angular.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://code.angularjs.org/1.8.2/angular-animate.js'></script>
<script src="static/js/calendar.js"></script>




</body>
<script src="static/live_2D_assets/waifu-tips.js"></script>
<script src="static/live_2D_assets/live2d.js"></script>
<script type="text/javascript">initModel("live_2D_assets/")</script>
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




    //修改文本框

    function change1() {
        var inputs = document.getElementsByClassName('item-data');
        var button = document.querySelector('.app-card-footer button');


        if (button.innerHTML === '确定信息修改') {
            // 将输入框设置为只读
            for (var i = 0; i < inputs.length; i++) {
                inputs[i].setAttribute('readonly', true);
            }
            button.innerHTML = '管理基础信息';
            button.setAttribute("type", "submit");
            // 构造要发送的数据对象
            var data = {};
            for (var i = 0; i < inputs.length; i++) {
                var input = inputs[i];
                var key = input.getAttribute('value');
                var value = input.value;
                data[key] = value;
            }


        } else {
            // 将输入框设置为可编辑
            for (var i = 0; i < inputs.length; i++) {
                inputs[i].removeAttribute('readonly');
            }
            button.setAttribute("type", "button");
            button.innerHTML = '确定信息修改';
        }
    }



</script>


<script>
    new Vue({
        el: '#app',
        data: {
            city: '南昌',
            forecasts: [],
            weekDay: '',
            temperature: '',
            weatherDesc: '',
            highestTmp: '',
            lowestTmp: ''
        },
        methods: {
            queryWeather(city) {
                axios.get('https://apis.tianapi.com/tianqi/index?key=63ee756cabfa346a479e7515c9273819&type=7&city= ' + city)
                    .then(response => {
                        console.log(response);
                        this.forecasts = response.data.result.list;
                        this.weekDay = this.forecasts[0].week;
                        this.temperature = this.forecasts[0].real;
                        this.weatherDesc = this.forecasts[0].desc;
                        this.highestTmp = this.forecasts[0].highest;
                        this.lowestTmp = this.forecasts[0].lowest;
                    })
                    .catch(error => {
                        console.log(error);
                        alert("请输入正确的城市名");
                    });
            },
            search() {
                this.queryWeather(this.city);
            }
        },
        mounted() {
            this.queryWeather(this.city);
        }
    });
</script>




</html>
