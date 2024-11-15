<%--
  Created by IntelliJ IDEA.
  User: 12099
  Date: 2023/12/9
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
  <meta charset="utf-8">
  <title>index</title>
  <script type="text/javascript" src="static/js/jquery.js"></script>
  <script type="text/javascript" src="static/js/echarts.min.js"></script>
  <script type="text/javascript" src="static/js/china.js"></script>
  <script type="text/javascript" src="static/js/map.js"></script>
  <script type="text/javascript" src="static/js/dataVisonjs.js"></script>
  <!-- <script type="text/javascript" src="js/lizi.js"></script> -->
  <link rel="stylesheet" href="static/css/dataVisonStyle.css">
  <link rel="stylesheet" href="static/css/stars.css">

  <link rel="stylesheet" type="text/css" href="static/live_2D_assets/waifu.css" />
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="static/css/navigate.css">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">



  <!-- 音乐播放器 -->
  <link rel="stylesheet" href="static/node_modules/aplayer/dist/APlayer.min.css">
  <script src="static/node_modules/aplayer/dist/APlayer.min.js">
  </script>
  <script src="static/node_modules/meting/dist/Meting.min.js">
  </script>
  <meting-js
          server="netease"
          type="playlist"
          id="2091761965"
          fixed="true"
          autoplay="false"
          loop="all"
          mutex="false"
          order="list"
          preload="auto"
          list-folded="true"
          list-max-height="500px"
          lrc-type="1">

  </meting-js>
  <!-- 11111111111111111111111111 -->
</head>
<style>
  .shubiao{
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
          <a href="index.jsp">
            <i class="iconfont icon-shouye icon"><img src="static/icon/主页.png" style="max-width: 30px;"></i>

            <span class="text nac-text">主页</span>
          </a>
        </li>

        <li class="nav-link">
          <a href="#">
            <i class="iconfont icon-shoucangxiao icon"><img src="static/icon/星星.png" style="max-width: 30px;"></i>
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
            <i class="iconfont icon-chuangzuo icon"><img src="static/icon/设备-AI求助.png" style="max-width: 26px;"></i>
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
            <i class="iconfont icon-zhuxiaoyuan icon"><img src="static/icon/注销登录.png" style="max-width: 30px;"></i>
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
  <canvas id="live2d"  width="270" height="270" class="live2d"></canvas>
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


<div class="head clearfix">
  <h1 class="text-center">用户数据报告</h1>
  <!-- <div class="menu menu2 pulll_left">
      <ul>
          <li><a href="#">导航标题</a></li>
          <li><a href="#">导航标题样式</a></li>
          <li><a href="#">导航标题</a></li>
          <li><a href="#">导航标题</a></li>
          <li><a href="#">导航标题</a></li>
          <li><a href="#">导航标题</a></li>
      </ul>
  </div> -->
  <!-- <div class="time" id="showTime"></div> -->

</div>
<div class="mainbox">

  <ul class="clearfix nav1">
    <li style="width: 4%">
      <div class="null_box"></div>
    </li>
    <li style="width: 21%">
      <div class="box">
        <div class="tit">核心数据概览</div>
        <div class="boxnav" style="height: 330px;">
          <div class="yqlist">

            <ul class="clearfix">
              <li>
                <div class="yq" id="yq">666</div>
                <img src="static/dataVison_img/订阅.svg" alt="" width="15" height="15">
                <span>总订阅数</span>
              </li>
              <li>
                <div class="yq">114514</div>
                <img src="static/dataVison_img/赞.svg" alt="" width="15" height="15">
                <span>总获赞数</span>
              </li>
              <li>
                <div class="yq">56345</div>
                <img src="static/dataVison_img/收藏.svg" alt="" width="15" height="15">
                <span>总星标数</span>
              </li>
              <li>
                <div class="yq">7202341</div>
                <img src="static/dataVison_img/彩友多_浏览量.svg" alt="" width="15" height="15">
                <span>总浏览量</span>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="box">
        <div class="tit">访客来源</div>
        <div class="boxnav" style="height: 406px;">
          <div class="" style="height: 406px" id="echart2"></div>
        </div>
      </div>
    </li>
    <li style="width: 54%">

      <div class="box">
        <div class="boxnav mapc" style="height: 550px; position: relative">
          <div class="map" id="map"></div>
        </div>
      </div>
      <div class="box">
        <div class="tit">最近访客数据</div>
        <div class="boxnav" style="height: 300px;" id="echart3">


        </div>
      </div>
    </li>
    <li style="width: 21%">
      <div class="box">
        <div class="tit">每日订阅数</div>
        <div class="boxnav" id="echart4" style="height: 266px;">

        </div>
      </div>
      <div class="box">
        <div class="tit">内容分块</div>
        <div class="boxnav" style="height: 266px;" id="echart5">



        </div>
      </div>



      <!-- 这里尽量做到可以切换为下一句 -->
      <div class="box">
        <div class="tit">每日警句</div>
        <div class="boxnav" style="height: 150px;">
          <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;力量，真正的力量，永远不会属于天生就强壮过人、敏捷过人、聪明过人的家伙，绝不。它只会属于愿意不惜一切，达成目的的人。
          </p>
          <p style="text-align: right;">——杨培宁</p>
        </div>
      </div>
    </li>
  </ul>



  <script>
    var t = null;
    t = setTimeout(time, 1000);//开始运行
    function time() {
      clearTimeout(t);//清除定时器
      dt = new Date();
      var y = dt.getFullYear();
      var mt = dt.getMonth() + 1;
      var day = dt.getDate();
      var h = dt.getHours();//获取时
      var m = dt.getMinutes();//获取分
      var s = dt.getSeconds();//获取秒
      document.getElementById("showTime").innerHTML = y + "/" + mt + "/" + day + " " + h + ":" + m + ":" + s + "";
      t = setTimeout(time, 1000); //设定定时器，循环运行
    }


  </script>
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

  window.addEventListener('mousemove',function(xyz){
    // 获取网页左侧距离的图片位置
    imgx = xyz.x - img.offsetLeft - img.clientWidth /2
    // 多去网页顶部距离图片的位置
    imgy = xyz.y - img.offsetTop - img.clientHeight /2
    // 套入公式，定义图片的旋转角度
    deg = 360*Math.atan(imgy/imgx)/(2*Math.PI)
    // 每当鼠标移动的时候重置index
    index= 0
    // 定义当前鼠标的位置
    let x = event.clientX
    // 当鼠标的x轴大于图片的时候，提普安就要对着鼠标，所以需要将图片翻转过来
    // 否则就不用翻转
    if(img.offsetLeft<x){
      y=-180
    }else{
      y=0
    }
  })
  setInterval(()=>{
    // 设置小图片的旋转和翻转
    img.style.transform = "rotateZ("+deg+"deg) rotateY("+y+"deg)"
    index++
    // 在这里设置小图片的位置和速度，并判断小图片到达鼠标位置时停止移动
    if(index<100){
      imgl+=imgx/100
      imgt+=imgy/100
    }
    img.style.left = imgl+"px"
    img.style.top = imgt+"px"
  },10)
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