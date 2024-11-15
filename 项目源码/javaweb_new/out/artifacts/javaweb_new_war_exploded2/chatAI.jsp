<%--
  Created by IntelliJ IDEA.
  User: 12099
  Date: 2023/12/9
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
  <meta charset="utf-8">
  <title>index</title>
  <!-- <script type="text/javascript" src="js/lizi.js"></script> -->
  <link rel="stylesheet" href="static/css/dataVisonStyle.css">
  <link rel="stylesheet" href="static/css/stars.css">

  <link rel="stylesheet" type="text/css" href="static/live_2D_assets/waifu.css" />
  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="static/css/navigate.css">
  <link rel="stylesheet" href="static/css/chatai.css">
  <!-- <link rel="stylesheet" href="css/ghost.css"> -->
  <!-- <link rel="stylesheet" href="css/buttons.css"> -->




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
          <a href="#">
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
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<h1 style="text-align: center; color: rgb(249, 249, 249); font-size: 40px;">小 虚 AI 助 手</h1>
<p>&nbsp;</p>
<p>&nbsp;</p>

<div id="chat-container">
  <!-- 这里发送信息 -->
</div>
<div id="input-container">
  <input type="text" id="user-input" placeholder="输入问题...">
  <button id="submit-btn">提交</button>
</div>








</body>
<script src="static/live_2D_assets/waifu-tips.js"></script>
<script src="static/live_2D_assets/live2d.js"></script>
<script type="text/javascript">initModel("static/live_2D_assets/")</script>
<script src="static/js/ghost.js"></script>
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
<script>
  // Get the necessary DOM elements
  const userInput = document.getElementById('user-input');
  const submitBtn = document.getElementById('submit-btn');
  const chatContainer = document.getElementById('chat-container');

  // Function to handle user input submission
  function handleSubmit() {
    // Get the user input value
    const question = userInput.value;

    // Create a new user message element
    const userMessage = document.createElement('div');
    userMessage.classList.add('user-message');
    userMessage.textContent = question;

    // Append the user message to the chat container
    chatContainer.appendChild(userMessage);

    // Clear the user input
    userInput.value = '';

    // Call the function to handle AI response
    handleAIResponse(question);
  }

  // Function to handle AI response
  function handleAIResponse(question) {
    // TODO: Implement your logic to get AI response based on the user question
    // For now, let's assume the AI response is a hardcoded value
    const aiResponse = '当管理一个果园时，以下是一些建议：土壤和水分管理：确保果园土壤富含养分，并适时施肥。监测土壤湿度，并确保提供适量的水分，避免干旱或过度灌溉。病虫害控制：定期巡视果园，及时发现并处理病虫害问题。采取预防措施，如合理使用农药、引入天敌等，以减少化学农药的使用。修剪和整形：定期修剪树木，使其保持良好的形状和健康状态。清除杂草和废弃物，确保果园整洁。收获和储存：了解不同果树的成熟时间，并在适当时机进行收获。储存水果时，控制温度和湿度，以延长保鲜期。市场调研和销售：了解市场需求和趋势，选择适合种植的水果品种。建立与当地市场商家的联系，寻找销售渠道，如批发商、零售商或农贸市场。进行持续学习：关注果树种植的新技术和最佳实践，参加相关培训或研讨会。与其他果农和专家交流经验，以不断提升管理水平。请注意，在果园管理过程中，合法使用农药，遵守环境保护和食品安全相关法规是非常重要的。';

    // Create a new AI message element
    const aiMessage = document.createElement('div');
    aiMessage.classList.add('ai-message');

    // Use a helper function to display the AI response character by character
    function displayResponse(index) {
      if (index < aiResponse.length) {
        aiMessage.textContent += aiResponse.charAt(index);
        setTimeout(() => displayResponse(index + 1), 100); // Delay between each character (adjust as needed)
      } else {
        // Scroll to the bottom of the chat container once the response is fully displayed
        chatContainer.scrollTop = chatContainer.scrollHeight;
      }
    }

    // Start displaying the AI response
    displayResponse(0);

    // Append the AI message to the chat container
    chatContainer.appendChild(aiMessage);
  }

  // Add event listener to the submit button
  submitBtn.addEventListener('click', handleSubmit);
</script>

</html>