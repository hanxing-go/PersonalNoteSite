// 1. 注册功能
function register() {
    var flag = true;
    // 1. 用户名不能为空
    var username = document.getElementById("register_username").value;
    if (username.trim() == "") {
        document.getElementById("username").innerHTML = "用户名不能为空";
        flag = false;
    }
    // 2. 密码不能为空
    var password = document.getElementById("register_password").value;
    if (password == "") {
        document.getElementById("password").innerHTML = "密码不能为空";
        flag = false;
    }
    // 3. 密码长度为6~20位
    if (password.length < 6 || password.length > 20) {
        document.getElementById("password").innerHTML = "密码长度为6~20位";
        flag = false;
    } else {
        document.getElementById("password").innerHTML = "";
    }
    // 4. 两次输入的密码必须一致
    var repassword = document.getElementById("repassword").value;
    if (repassword != password) {
        document.getElementById("repassword").innerHTML = "两次输入的密码不一致";
        flag = false;
    } else {
        document.getElementById("repassword").innerHTML = "";
    }
    // 5. 邮箱格式必须正确
    var email = document.getElementById("email").value;
    var reg_email = /^\w+@\w+(\.\w+)+$/;
    if (!reg_email.test(email)) {
        document.getElementById("email").innerHTML = "邮箱格式不正确";
        flag = false;
    } else {
        document.getElementById("email").innerHTML = "";
    }
    return flag;
}

// 2. 登录功能
function login() {
    var flag = true;
    // 1. 用户名不能为空
    var username = document.getElementById("login_email").value;
    // alert(username)
    if (username.trim() == "") {
        alert("用户名不能为空");
        flag = false;
    }
    // 2. 密码不能为空
    var password = document.getElementById("login_password").value;
    if (password == "") {
        alert("密码不能为空");
        flag = false;
    }
    // 3. 密码长度为6~20位
    if (password.length < 6 || password.length > 20) {
        alert("密码长度为6~20位");
        flag = false;
    }

    if (flag) {
        var form = document.getElementById("loginform");
        form.submit();
    }
    //如果第二个表单提交不满足要求，就阻止默认事件
    else {
        const secondForm = document.getElementById("loginform");
        secondForm.addEventListener("submit", (e) => e.preventDefault());

    }

    return flag;
}