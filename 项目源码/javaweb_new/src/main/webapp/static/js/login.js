

// 2. 登录功能
function login() {
    var flag = true;
    // 1. 用户名不能为空
    var username = document.getElementById("login_email").value;
    // alert(username)
    if (username.trim() == "") {
        alert("你忘记添加用户名了吧 (￣y▽￣)~*捂嘴偷笑");
        flag = false;
    }
    // 2. 密码不能为空
    var password = document.getElementById("login_password").value;
    if (password == "") {
        alert("你忘记填写密码了吧 (￣y▽￣)~*捂嘴偷笑");
        flag = false;
    }
    // 3. 密码长度为6~20位
    if (password.length < 6 || password.length > 20) {
        alert("密码长度是6~20位的捏qwq");
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