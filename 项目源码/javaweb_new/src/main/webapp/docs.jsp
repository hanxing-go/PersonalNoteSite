<%@ page import="note.po.User" %><%--
  Created by IntelliJ IDEA.
  User: 12099
  Date: 2023/12/14
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Docs</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="description" content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">

    <!-- FontAwesome JS-->
    <script defer src="static/js/all.min.js"></script>

    <!-- App CSS -->
    <link id="theme-style" rel="stylesheet" href="static/css/portal.css">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">

    <script src="static/js/axios.min.js"></script>
    <script src="static/js/vue.js"></script>
    <link rel="stylesheet" href="static/css/buttons.css">




    <!-- 植入模板 -->
    <!-- <script type="text/javascript" src="js/lizi.js"></script> -->
    <link rel="stylesheet" href="static/css/dataVisonStyle.css">
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

    <%--    新手引导栏--%>
    <link href="https://cdn.bootcdn.net/ajax/libs/driver.js/0.9.8/driver.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/driver.js/0.9.8/driver.min.js"></script>

    <link rel="stylesheet" href="static/css/dataVisonStyle.css">
    <meting-js server="netease" type="playlist" id="2091761965" fixed="true" autoplay="false" loop="all" order="list"
               preload="auto" list-folded="true" list-max-height="500px" lrc-type="1">

    </meting-js>
    <!-- 植入模板 -->
    <style>
        /* 植入模板 */
        .shubiao {
            width: 50px;
            height: 50px;
            position: absolute;
            background-image: url('./1393817219.gif');
            background-size: cover;
        }

        /* 植入模板 */
        .app {
            background: url("static/background_img/1.jpg");
        }

        .custom-btn {
            width: 130px;
            height: 40px;
            color: #fff;
            border-radius: 5px;
            padding: 10px 25px;
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            background: #ce5fe2cf;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
            7px 7px 20px 0px rgba(0, 0, 0, .1),
            4px 4px 5px 0px rgba(0, 0, 0, .1);
            outline: none;
        }

        .btn-9 {
            border: none;
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .btn-9:after {
            position: absolute;
            content: " ";
            z-index: -1;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #1fd1f9;
            background-image: linear-gradient(315deg, #1fd1f9 0%, #b621fe 74%);
            transition: all 0.3s ease;
        }

        .btn-9:hover {
            background: transparent;
            box-shadow: 4px 4px 6px 0 rgba(255, 255, 255, .5),
            -4px -4px 6px 0 rgba(116, 125, 136, .2),
            inset -4px -4px 6px 0 rgba(255, 255, 255, .5),
            inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
            color: #fff;
        }

        .btn-9:hover:after {
            -webkit-transform: scale(2) rotate(180deg);
            transform: scale(2) rotate(180deg);
            box-shadow: 4px 4px 6px 0 rgba(255, 255, 255, .5),
            -4px -4px 6px 0 rgba(116, 125, 136, .2),
            inset -4px -4px 6px 0 rgba(255, 255, 255, .5),
            inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
        }

        .app-page-title {
            color: #5b99ea;
        }


        .g-4,
        .gy-4 {
            --bs-gutter-y: 1.0rem;
        }

        .g-4,
        .gx-4 {
            --bs-gutter-x: 1.0rem;
        }

        .app-wrapper {
            margin-left: 10px;
            margin-right: 300px;
        }

        .app {
            padding-top: 0px;
        }
    </style>

</head>

<body class="app">




<!-- 星空 -->
<div class="main">
    <div class="star"></div>
    <div class="medium-star"></div>
    <div class="big-star"></div>
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
                <!-- <li class="nav-link">
                </li> -->
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

<!-- 右下大片区域 -->
<ul class="nav1">
    <li style="width: 5%;">
        &nbsp;</li>
    <li style="width: 97%;">
        <!-- <div class="app-wrapper"> -->

        <div class="app-content pt-3 p-md-3 p-lg-4">
            <div class="container-xl">
                <div class="row g-3 mb-4 align-items-center justify-content-between">

                    <!-- 左上文字 -->
                    <div class="col-auto">
                        <h1 class="app-page-title mb-0">虚空终端文件助手</h1>
                    </div>
                    <!-- 左上文字 -->

                    <!-- 右上筛选框 -->
                    <div class="col-auto">
                        <div class="page-utilities">
                            <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
                                <div class="col-auto" id="search">
                                    <form class="d-flex" role="search" @submit.prevent="search" >
                                        <input  class="form-control me-2" style="width: 300px;" type="search" id="search_introuduce" v-model="searchTitle" placeholder="Search" aria-label="Search">
                                        <button class="custom-btn btn-9" type="button" @click="search">搜索</button>
                                    </form>


                                </div><!--//col-->

                                <div class="col-auto" id="app">
                                    <select class="form-select w-auto" v-model="selectedTypeId" @change="getNotesByType(selectedTypeId)">
                                        <option selected value="">全部</option>
<%--                                        默认选择全部--%>
                                        <option v-for="noteType in noteTypes" :value="noteType.typeId">
                                            {{ noteType.typeName }}
                                        </option>
                                    </select>
                                </div>



                                <div class="col-auto">
                                    <button type="button" class="custom-btn btn-9" data-bs-toggle="modal" data-bs-target="#exampleModal" >修改</button >
<%--                                    <button class="custom-btn btn-9">添加</button>--%>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header" id="edit_introuduce">
                                                    <h1 class="modal-title fs-5"  style="color: #7a7a82;" id="exampleModalLabel">修改类型</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body" style="color: #7a7a82;">
                                                    <div style="display: flex; align-items: center;" v-for="type in types">
                                                        <input class="form-control me-2" style="width: 300px;" v-model="type.typeName" value="">
                                                        <input type="hidden" name="" value="">

                                                        <button class="btn btn-outline-danger" @click="deleteType(type)">删除</button>
                                                        <button class="btn btn-outline-primary" @click="editType(type)">保存</button>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="custom-btn btn-9" data-bs-dismiss="modal">关闭</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div><!--//row-->
                        </div><!--//table-utilities-->
                    </div><!--//col-auto-->
                </div><!--//row-->
                <!-- 右上筛选框 -->



                <%-- 设置分页导航 --%>


                <div class="row row-cols-1 row-cols-md-3 g-4" id="hehe">
                    <div class="col" v-for="note in notes">
                        <div class="card h-100">
                            <img :src="getRandomImgPath()" class="card-img-top" alt="..." height="190">
                            <div class="card-body">
                                <h5 class="card-title" style="color: #000000;">{{ note.title }}</h5>
                                <p class="card-text" style="color: #7a7a82;">类型：{{ note.typeName }}</p>
                                <p class="card-text" style="color: #7a7a82;">笔记编号：{{ note.noteId }}</p>

                                <div style="display: flex; justify-content: flex-end;">
                                    <button type="button" class="btn btn-outline-danger" @click="deleteNote(note.noteId)">删除</button>
                                    <button type="button" class="btn btn-outline-info"  @click="getNoteDetails(note.noteId)">查看</button>
                                </div>
                            </div>
                            <div class="card-footer">
                                <small class="text-body-secondary" style="color: #000eff80">发布时间：{{ note.pubTime }}</small>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- 下方跳转栏 -->
                <div id="app2">
                    <nav class="app-pagination mt-5">
                        <ul class="pagination justify-content-center">
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" v-bind:href="'IndexServlet?pageNum=' + page.prePage">Previous</a>--%>
<%--                            </li>--%>
<%--                            <li class="page-item" v-for="i in totalPages" v-bind:class="{ 'active': i == pageNum }">--%>
<%--                                <a class="page-link" v-bind:href="'IndexServlet?pageNum=' + i">{{ i }}</a>--%>
<%--                            </li>--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" v-bind:href="'IndexServlet?pageNum=' + page.nextPage">Next</a>--%>
<%--                            </li>--%>
                                <li class="page-item">
                                    <a class="page-link" v-bind:href="'javascript:void(0);'" @click="changePage(page.prePage)">Previous</a>
                                </li>
                                <li class="page-item" v-for="i in totalPages" v-bind:class="{ 'active': i == pageNum }">
                                    <a class="page-link" v-bind:href="'javascript:void(0);'" @click="changePage(i)">{{ i }}</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" v-bind:href="'javascript:void(0);'" @click="changePage(page.nextPage)">Next</a>
                                </li>

                        </ul>
                    </nav>
                </div>
            </div><!--//container-fluid-->
        </div><!--//app-content-->
        <!-- 下方跳转栏 -->


        <!-- </div>//app-wrapper -->
    </li>
</ul>

<script>
    // const driver = new Driver({
    //     allowClose: true,
    // });
    //
    // driver.defineSteps([
    //     {
    //         element: '#search_introuduce',
    //         popover: {
    //             title: '搜索框',
    //             description: '在这里可以搜索你想要的笔记,同时支持模糊查询与精准查询',
    //             position: 'bottom'
    //         }
    //     },
    //     {
    //         element: '#app',
    //         popover: {
    //             title: '类型筛选框',
    //             description: '在这里可以筛选你想要的笔记类型',
    //             position: 'bottom'
    //         }
    //     },
    //     {
    //         element: '#edit_introuduce',
    //         popover: {
    //             title: '修改类型',
    //             description: '在这里可以修改你的笔记类型',
    //             position: 'bottom'
    //         }
    //     },
    //     {
    //         //分页
    //         element: '#app2',
    //         popover: {
    //             title: '分页',
    //             description: '在这里可以进行翻页',
    //             position: 'bottom'
    //         }
    //     }
    // ]);
    // driver.start();
</script>



<!-- Javascript -->
<script src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>


<!-- Page Specific JS -->
<script src="static/js/app.js"></script>



<!-- 植入模板 -->

<div class="shubiao"></div>


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
<!-- 植入模板 -->

</body>






<!-- 植入模板 -->
<script src="static/live_2D_assets/waifu-tips.js"></script>
<script src="static/live_2D_assets/live2d.js"></script>
<script type="text/javascript">initModel("static/live_2D_assets/")</script>
<script>

    function updateNoteTypes(noteTypes) {
        var select = document.querySelector(".form-select");
        select.innerHTML = "";  // 清空下拉框
        for (var i = 0; i < noteTypes.length; i++) {
            var option = document.createElement("option");
            option.value = noteTypes[i].typeId;
            option.text = noteTypes[i].typeName;
            select.appendChild(option);
        }
    }




    var vm1 = new Vue({
        el: '#exampleModal',
        data: {
            types: [],  // 存储类型数据
            currentType: {}  // 存储当前正在编辑的类型
        },
        mounted() {
            this.getTypes();
        },
        methods: {
            getTypes() {
                axios.get('NoteTypeServlet?actionName=findNoteType').then(response => {
                    this.types = response.data;
                });
            },
            editType(type) {
                axios.get('NoteTypeServlet', {
                    params: {
                        actionName: 'updateNoteType',
                        typeId: type.typeId,
                        typeName: type.typeName
                    }
                })
                    .then(response => {
                        if(response.data.code == 1) {
                            // 更新前端的类型数据
                            this.types = this.types.map(t => t.typeId === type.typeId ? response.data : t);
                            this.getTypes();
                            vm.getNoteTypes();
                            alert("更新成功 （ｖ＾＿＾）ｖ");
                        } else {
                            // console.log(response.data)
                            alert("更新失败:"+response.data.msg+" (⋟﹏⋞)");
                            //重新刷新模态框，避免错误类型名字仍然在前端
                            this.getTypes();
                        }
                    });
            },
            deleteType(type) {
                // 添加确认对话框
                if (!confirm('你确定要删除这个类型吗？')) {
                    return;
                }
                axios.get('NoteTypeServlet', {
                    params: {
                        actionName: 'deleteNoteType',
                        typeName: type.typeName
                    }
                })
                    .then(response => {
                        if(response.data.code == 1) {
                            // 从前端的类型数据中删除该类型
                            this.types = this.types.filter(t => t.typeId !== type.typeId);
                            vm.getNoteTypes();
                            alert("删除成功 （ｖ＾＿＾）ｖ");
                        } else {
                            // console.log(response.data);
                            alert('删除失败: '+response.data.msg+' (⋟﹏⋞)');
                        }
                    });
            }
        }
    });

    var notelist = new Vue({
        el: '#hehe',
        data: {
            notes: []
        },
        created() {
            this.getNotes();
        },
        methods: {
            getNotes() {
                var self = this;
                axios.get('IndexServlet')
                    .then(response => {
                        self.notes = response.data.dataList;
                    });
            },
            getRandomImgPath() {
                var randomNum = Math.floor(Math.random() * 9);
                return 'static/history_img/0' + randomNum + '.jpg';
            },
            changenote(change_note) {
                this.notes= change_note;
            },
            getNoteDetails(noteId) {
                //ajax请求后端
                axios.get('NoteServlet',{
                    params:{
                        actionName:'view',
                        noteId:noteId
                    }

                }).then(response=>{
                    //在后端已经跳转了页面
                    // alert("查看成功 （ｖ＾＿＾）ｖ");
                    // 跳转到笔记详情页面
                    window.location.href = "view.jsp";
                })
            },
            deleteNote(noteId) {

                if (!confirm('辛辛苦苦写的笔记就要被删除了(⋟﹏⋞)')) {
                    return;
                }
                axios.get('NoteServlet', {
                    params: {
                        actionName: 'Deletenote',
                        noteId: noteId
                    }
                })
                    .then(response => {
                        // 删除成功后，重新获取笔记列表
                        //提示删除成功
                        alert("删除成功 （ｖ＾＿＾）ｖ");
                        // console.log("删除成功");
                        // console.log(response.data);
                        this.getNotes();
                    });
            }
        }
    });

    var titlevm = new Vue({
        el: '#search',
        data: {
            noteTypes: [],
            notes: [],
            selectedTypeId: '',  // 存储当前选择的类型ID
            searchTitle: ''  // 存储搜索的标题
        },
        mounted() {
            this.getNoteTypes();
        },
        methods: {
            search() {

                axios.get('IndexServlet', {
                    params: {
                        actionName: 'findaNoteListByTitle',
                        title: this.searchTitle
                    }
                })
                    .then(response => {
                        console.log(response.data)
                        notelist.changenote(response.data.dataList);  // 更新笔记列表
                        pagevm.page = response.data;  // 更新分页信息
                    });
            }
        }
    });


    var pagevm = new Vue({
        el: '#app2',
        data: {
            page: {},
            totalPages: 0,
            pageNum: 1
        },
        created() {
            this.changePage(1);
        },
        methods: {
            changePage(pageNum) {
                axios.get('IndexServlet', {
                    params: {
                        pageNum: pageNum
                    }
                })
                    .then(response => {
                        this.page = response.data;
                        this.totalPages = this.page.totalPages;
                        this.pageNum = this.page.pageNum;
                        console.log(response.data);
                        notelist.changenote(response.data.dataList);  // 更新笔记列表
                    });
            }
        }
    });


    var vm = new Vue({
        el: '#app',
        data: {
            noteTypes: [],
            notes: [],
            selectedTypeId: ''  // 存储当前选择的类型ID

        },
        mounted() {
            this.getNoteTypes();
        },
        methods: {
            getNoteTypes() {
                axios.get('NoteTypeServlet?actionName=findNoteType')
                    .then(response => {
                        this.noteTypes = response.data;
                    });
            },
            getNotesByType(typeId) {
                if (typeId === '') {
                    // 如果选择的是"全部"，则获取所有笔记
                    // 这里需要替换为获取所有笔记的请求
                    pagevm.changePage(1);//先这么写吧
                } else {
                    axios.get('IndexServlet', {
                        params: {
                            actionName: 'findaNoteListByTypeId',
                            typeId: typeId
                        }
                    })
                        .then(response => {
                            // console.log("查询结果为：")
                            // console.log(response.data);
                            // this.notes = response.data;
                            notelist.changenote(response.data.dataList);  // 更新笔记列表

                        })
                        .catch(error => {
                            console.error(error);
                            alert('你还没有添加笔记，快去书写新的笔记吧！ o((*^▽^*))o');
                            notelist.changenote(null);  // 更新笔记列表
                        });

                }
            }
        }
    });


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
<!-- 植入模板 -->





</html>
