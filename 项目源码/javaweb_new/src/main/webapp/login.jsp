<%-- Created by IntelliJ IDEA. User: 12099 Date: 2023/12/9 Time: 19:48 To change this template use File | Settings |
  File Templates. --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="static/css/stars.css">
      <link rel="stylesheet" type="text/css" href="static/live_2D_assets/waifu.css" />
<%--      <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>--%>
        <script src="static/js/jquery.js"></script>
      <link rel="stylesheet" href="static/css/ghost.css">
      <link rel="stylesheet" href="static/css/buttons.css">
      <script src="static/js/login.js"></script>
      <script src="static/js/register.js"></script>
      <script src="static/js/vue.js"></script>

      <title>Login</title>
      <style>
        .shubiao {
          width: 50px;
          height: 50px;
          position: absolute;
          background-image: url('./1393817219.gif');
          background-size: cover;
        }

        :root {
          /* COLORS */
          --white: #efefef;
          /*--gray: #rgb(215, 71, 71);*/
          --blue: rgba(190, 109, 241, 0.85);
          --lightblue: rgba(142, 75, 224, 0.91);

          /* RADII */
          --button-radius: 0.7rem;

          /* SIZES */
          --max-width: 758px;
          --max-height: 420px;

          font-size: 16px;
          font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
            Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
        }

        body {
          align-items: center;
          background-color: var(--white);
          background: url("static/background_img/1.jpg");
          background-attachment: fixed;
          background-position: center;
          background-repeat: no-repeat;
          background-size: cover;
          display: grid;
          height: 100vh;
          place-items: center;
        }

        .form__title {
          font-weight: 300;
          margin: 0;
          margin-bottom: 1.25rem;
        }

        .link {
          /*color: var(--gray);*/
          font-size: 0.9rem;
          margin: 1.5rem 0;
          text-decoration: none;
        }

        .container {
          background-color: var(--white);
          border-radius: var(--button-radius);
          box-shadow: 0 0.9rem 1.7rem rgba(0, 0, 0, 0.25),
            0 0.7rem 0.7rem rgba(0, 0, 0, 0.44);
          height: var(--max-height);
          max-width: var(--max-width);
          overflow: hidden;
          position: relative;
          width: 100%;
        }

        .container__form {
          height: 100%;
          position: absolute;
          top: 0;
          transition: all 0.6s ease-in-out;
        }

        .container--signin {
          left: 0;
          width: 50%;
          z-index: 2;
        }

        .container.right-panel-active .container--signin {
          transform: translateX(100%);
        }

        .container--signup {
          left: 0;
          opacity: 0;
          width: 50%;
          z-index: 1;
        }

        .container.right-panel-active .container--signup {
          animation: show 0.6s;
          opacity: 1;
          transform: translateX(100%);
          z-index: 5;
        }

        .container__overlay {
          height: 100%;
          left: 50%;
          overflow: hidden;
          position: absolute;
          top: 0;
          transition: transform 0.6s ease-in-out;
          width: 50%;
          z-index: 100;
        }

        .container.right-panel-active .container__overlay {
          transform: translateX(-100%);
        }

        .overlay {
          background-color: var(--lightblue);
          background: url("static/background_img/1.jpg");
          background-attachment: fixed;
          background-position: center;
          background-repeat: no-repeat;
          background-size: cover;
          height: 100%;
          left: -100%;
          position: relative;
          transform: translateX(0);
          transition: transform 0.6s ease-in-out;
          width: 200%;
        }

        .container.right-panel-active .overlay {
          transform: translateX(50%);
        }

        .overlay__panel {
          align-items: center;
          display: flex;
          flex-direction: column;
          height: 100%;
          justify-content: center;
          position: absolute;
          text-align: center;
          top: 0;
          transform: translateX(0);
          transition: transform 0.6s ease-in-out;
          width: 50%;
        }

        .overlay--left {
          transform: translateX(-20%);
        }

        .container.right-panel-active .overlay--left {
          transform: translateX(0);
        }

        .overlay--right {
          right: 0;
          transform: translateX(0);
        }

        .container.right-panel-active .overlay--right {
          transform: translateX(20%);
        }

        .btn {
          background-color: #1b14408f;
          background-image: linear-gradient(90deg, rgb(190 109 241 / 0%) 0%, rgb(142 75 224 / 0%) 74%);
          border: 1px solid rgb(190 109 241 / 0%);
          border-radius: 15px;
          /*border: 1px solid var(--blue);*/
          color: var(--white);
          cursor: pointer;
          font-size: 0.8rem;
          font-weight: bold;
          letter-spacing: 0.1rem;
          padding: 0.9rem 4rem;
          text-transform: uppercase;
          transition: transform 80ms ease-in;
        }

        .form>.btn {
          margin-top: 1.5rem;
        }

        .btn:active {
          transform: scale(0.95);
        }

        .btn:focus {
          outline: none;
        }

        .form {
          background-color: var(--white);
          display: flex;
          align-items: center;
          justify-content: center;
          flex-direction: column;
          padding: 0 3rem;
          height: 100%;
          text-align: center;
        }


        .input {
          background-color: #fff;
          border: none;
          padding: 0.9rem 0.9rem;
          margin: 0.5rem 0;
          width: 100%;
        }

        @keyframes show {

          0%,
          49.99% {
            opacity: 0;
            z-index: 1;
          }

          50%,
          100% {
            opacity: 1;
            z-index: 5;
          }
        }


        .title {
          font-weight: 1800;

          color: #1788e6a3;
          /* 修改为蓝色 */
          font-size: 24px;
          /* 修改字体大小为24px */


          padding: 0px 0px 0px;
          font-size: 53px;
          text-align: center;
          text-transform: capitalize;
          text-shadow: 2px 3px rgba(0, 0, 0, 0.42);
          letter-spacing: 5px;

        }
      </style>
    </head>

    <body>




      <!-- 星空 -->
      <div class="main">
        <div class="star"></div>
        <div class="medium-star"></div>
        <div class="big-star"></div>
      </div>

      <style>
        .waifu {
          position: fixed;
          bottom: 20px;
          right: 20px;
        }
      </style>

      <!-- 看板娘 -->
      <div class="waifu">
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



      <!-- <h1 class="title" style="margin-bottom: 0px;">虚空终端文件管理系统</h1> -->
      <div class="container right-panel-active"
        style="margin-top: 0px; display: flex; justify-content: center; align-items: center; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
        <!-- 注册 -->
        <div class="container__form container--signup">
          <form action=UserServlet class="form" method="get" id="registerform">
            <h2 class="form__title">注册</h2>
            <input type="hidden" name="actionName" value="register" />
            <input type="text" placeholder="UserName" class="input" id="register_username" name="resgister_username"/>
            <input type="password" placeholder="password" class="input" id="register_password1" name="resgister_password1"/>
            <input type="password" placeholder="Password_confirm" class="input" id="register_password2" name="resgister_password"/>
            <!-- <button class="btn">注册</button> -->

            <button class="custom-btn btn-8" type="submit" onclick="register()"><span>注册</span></button>
            <span id="msg1" style="color: red">${resultInfo.msg_register}</span>

          </form>
        </div>

        <!-- 登录 -->
        <div class="container__form container--signin">
          <form action=UserServlet autocomplete="off" class="form" method="get" id="loginform">
            <h2 class="form__title">登录</h2>
            <input type="hidden" name="actionName" value="login" />
            <input type="text" placeholder="Username" class="input" id="login_email" name="login_username" />
            <input type="password" placeholder="Password" class="input" id="login_password" name="login_password"/>
            <!-- 记住密码 -->
            <div style="display: flex; justify-content: space-between;">
              <div style="float: left;">
                <input type="checkbox" id="remember" name="rem"/>
                <label for="remember" class="link">记住密码</label>
              </div>
              <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </div>
              <div style="float: right;">
                <a href="#" class="link">忘记密码？</a>
              </div>
            </div>
            <div style="clear: both;"></div>

            <button class="custom-btn btn-8" type="submit" onclick="login()"><span>登录</span></button>
            <span id="msg2" style="color: red">${resultInfo.msg_login}</span>
            <!-- <button class="btn-8">登录</button> -->
          </form>
        </div>

        <!-- Overlay -->
        <div class="container__overlay">
          <div class="overlay">
            <div class="overlay__panel overlay--left">
              <button class="btn" id="signIn">登录</button>
            </div>
            <div class="overlay__panel overlay--right">
              <button class="btn" id="signUp">注册</button>
            </div>
          </div>
        </div>
      </div>
      <div class="shubiao"></div>




      <!-- 小鬼魂 -->
      <div class="scene-container stars-out" tabindex="1">
        <div class="ghost-container">
          <div class="ghost">
            <!-- 鬼魂的头部、眼睛、嘴、腮红 -->
            <div class="ghost-head">
              <div class="ghost-face">
                <div class="eyes-row">
                  <div class="eye left"></div>
                  <div class="eye right"></div>
                </div>
                <div class="mouth-row">
                  <div class="cheek left"></div>
                  <div class="mouth">
                    <div class="mouth-top"></div>
                    <div class="mouth-bottom"></div>
                  </div>
                  <div class="cheek right"></div>
                </div>
              </div>
            </div>

            <!-- 鬼魂的身体 -->
            <div class="ghost-body">
              <div class="ghost-hand hand-left"></div>
              <div class="ghost-hand hand-right"></div>
              <div class="ghost-skirt">
                <div class="pleat down"></div>
                <div class="pleat up"></div>
                <div class="pleat down"></div>
                <div class="pleat up"></div>
                <div class="pleat down"></div>
              </div>
            </div>
          </div>

          <!-- 装饰部分 -->
          <div class="stars">
            <div class="star orange pointy star-1">
              <div class="star-element"></div>
            </div>
            <div class="star orange pointy star-2">
              <div class="star-element"></div>
            </div>
            <div class="star yellow pointy star-3">
              <div class="star-element"></div>
            </div>
            <div class="star yellow pointy star-4">
              <div class="star-element"></div>
            </div>
            <div class="star blue round star-5">
              <div class="star-element"></div>
            </div>
            <div class="star blue round star-6">
              <div class="star-element"></div>
            </div>
          </div>
        </div>

        <!-- 阴影 -->
        <div class="shadow-container">
          <div class="shadow"></div>
          <div class="shadow-bottom"></div>
        </div>
      </div>
      <!-- partial -->
      <script src="static/js/ghost.js"></script>

    </body>

    <script>

    </script>


    <script src="static/live_2D_assets/waifu-tips.js"></script>
    <script src="static/live_2D_assets/live2d.js"></script>
    <script type="text/javascript">initModel("static/live_2D_assets/")</script>

    <script>
      const signInBtn = document.getElementById("signIn");
      const signUpBtn = document.getElementById("signUp");
      const fistForm = document.getElementById("registerform");
      const secondForm = document.getElementById("loginform");
      const container = document.querySelector(".container");

      signInBtn.addEventListener("click", () => {
        container.classList.remove("right-panel-active");
      });

      signUpBtn.addEventListener("click", () => {
        container.classList.add("right-panel-active");
      });

      window.onload = function() {
        <%-- 获取后端传递的参数 --%>
        var registerFailed = ${resultInfo.msg_login!= null};
        if (registerFailed) {
          document.getElementById('signIn').click(); // 默认点击注册页面的标签
        }
      }




    </script>
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
        // 当鼠标的x轴大于图片的时候，33娘就要对着鼠标，所以需要将图片翻转过来
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