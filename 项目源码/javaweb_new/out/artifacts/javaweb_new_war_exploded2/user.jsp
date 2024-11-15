<%--
  Created by IntelliJ IDEA.
  User: 12099
  Date: 2023/12/9
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html ng-app='calendarApp' ng-cloak='true'>

<head>
  <meta charset="utf-8">
  <title>用户中心</title>
  <!-- <link rel="stylesheet" href="css/dataVisonStyle.css"> -->
  <link rel="stylesheet" href="static/css/stars.css">

  <link rel="stylesheet" type="text/css" href="static/live_2D_assets/waifu.css" />
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="static/css/navigate.css">

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Montserrat:700,400' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="static/css/calendar.css">


  <link rel="stylesheet" href="static/css/weather.css">

  <link rel="stylesheet" href="static/css/buttons.css">



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
</head>
<style>
  body {
    background-image: url('static/background_img/1.jpg');
    /*background-image: ;*/
  }
  .shubiao {
    width: 50px;
    height: 50px;
    position: absolute;
    background-image: url('./1393817219.gif');
    background-size: cover;
  }
</style>

<body>


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
          <a href="#">
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
        <!-- <li class="nav-link">
        </li> -->
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


<div><!-- 天气 -->
  <div class="container">

    <!-- 左边部分 -->
    <div class="weather-side">

      <!-- 渐变 -->
      <!-- <div class="gradient"></div> -->
      <div class="date-container">
        <h2 class="date-dayname" id="date-dayname">周二</h2>
        <!-- location图标 -->
        <span class="iconfont" id="location">&#xe617;北京</span>
      </div>

      <div class="weather-conteiner">
        <!-- 天气图标 -->
        <span class="iconfont" id="weather-l">&#xe61f;</span>
        <div class="weather-temp" id="weather-temp">25℃</div>
        <div class="waeather-desc" id="weather-desc">晴天</div>
      </div>
    </div>

    <!-- 右边部分 -->
    <div class="info-side">

      <div class="week-container">
        <ul class="week-list">
          <li class="active" id="day1">
            <!-- 天气图标 -->
            <span class="iconfont">&#xe61f;</span>
            <span class="day-name">星期二</span>
            <span class="day-temp">25℃</span>
          </li>

          <li id="day2">
            <!-- 天气图标 -->
            <span class="iconfont">&#xe61f;</span>
            <span class="day-name">星期三</span>
            <span class="day-temp">25℃</span>
          </li>

          <li id="day3">
            <!-- 天气图标 -->
            <span class="iconfont">&#xe61f;</span>
            <span class="day-name">星期四</span>
            <span class="day-temp">25℃</span>
          </li>

          <li id="day4">
            <!-- 天气图标 -->
            <span class="iconfont">&#xe61f;</span>
            <span class="day-name">星期五</span>
            <span class="day-temp">25℃</span>
          </li>
        </ul>

        <div class="location-container">
          <input type="text" placeholder="位置" id="city">
          <button class="location-button" id="location-button">
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
</div>



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