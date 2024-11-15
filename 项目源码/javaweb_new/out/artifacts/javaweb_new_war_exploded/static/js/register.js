// 1. 注册功能
function register() {
    var flag = true;

    // 1. 用户名不能为空
    var username = document.getElementById("register_username").value;
    // 2. 密码不能为空
    var password1 = document.getElementById("register_password1").value;
    var password2 = document.getElementById("register_password2").value;
    // alert("是的，你按下了按钮");
    if (username.trim() == "") {
        alert("你忘记添加用户名了吧 (￣y▽￣)~*捂嘴偷笑")
        flag = false;
        const Form = document.getElementById("registerform");
        Form.addEventListener("submit", (e) => e.preventDefault());
    }

    if (password1 == ""||password2=="") {
        // document.getElementById("password").innerHTML = "密码不能为空";
        alert("你忘记填写密码了吧 (￣y▽￣)~*捂嘴偷笑")
        flag = false;
        const Form = document.getElementById("registerform");
        Form.addEventListener("submit", (e) => e.preventDefault());
        // alert(flag);
    }
    // 3. 密码长度为6~20位
    if (password1.length < 6 || password1.length > 20 ||password2.length < 6||password2.length > 20) {
        // document.getElementById("password").innerHTML = "密码长度为6~20位";
        alert("密码长度是6~20位的捏qwq")
        flag = false;
        const Form = document.getElementById("registerform");
        Form.addEventListener("submit", (e) => e.preventDefault());
        // alert(flag);
    }
    // 4. 两次输入的密码必须一致
    // var repassword = document.getElementById("repassword").value;
    if (password1 != password2) {
        // document.getElementById("repassword").innerHTML = "两次输入的密码不一致";
        alert("qwq 两次输入的密码不一致 qwq")
        flag = false;
        const Form = document.getElementById("registerform");
        Form.addEventListener("submit", (e) => e.preventDefault());
        // alert(flag);
    }

    if (flag) {
        var form = document.getElementById("loginform");
        form.submit();
    }

    return flag;
}