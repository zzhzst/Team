<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/bootstrap.js"></script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>登录界面</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            width: 100%;
            height: 100%;
        }

        .main {
            width: 100%;
            height: 100%;
            background: url("${path}/images/beijing.jpg") 100% 100% no-repeat;
        }

        .loginFrame {
            width: 550px;
            height: 450px;
            background: rgba(0, 0, 0, 0.3);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto;

            border-radius: 10px;
            padding: 50px 0;
            box-sizing: border-box;
            box-shadow: 0 0 5px 5px rgba(0, 0, 0, 0.4);
        }

        .loginFrame > div {
            width: 350px;
            height: 50px;
            margin: 40px auto;

            color: white;
        }

        .loginFrame > p {
            text-align: center;
            color: white;
            font-size: 25px;
        }

        .loginFrame > div span {
            display: inline-block;
            cursor: pointer;
            font-size: 20px;
        }

        .loginFrame > div input {
            width: 100%;
            height: 30px;

            background: transparent;
            border: none;
            border-bottom: 1px solid white;
            outline: none;
            color: white;
        }

        .loginFrame .enterBut {

            width: 150px;
            height: 50px;

            border-radius: 50px;
            background-image: linear-gradient(to right, #c979d4, #fa719d);
            text-align: center;
            padding-top: 8px;

            box-sizing: border-box;
            font-size: 24px;
            cursor: pointer;
        }

        .loginFrame .enterBut:hover {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5) inset;
        }


        input::-webkit-input-placeholder {
            color: #BDCADA;
        }

        svg {
            vertical-align: bottom;
        }


    </style>

    <script type="text/javascript">
        function CheckForm() {
            var loginName = document.getElementById("loginName").value;
            var loginPwd = document.getElementById("loginPwd").value;
            if (loginName.length == 0) {
                alert("请输入用户名");
                return false;
            } else {
                var pattern = /^[0-9a-zA-Z]+$/;
                if (!pattern.test(document.getElementById("loginName").value)) {
                    alert('\n用户名只可输入数字或者字母!');
                    return false;
                }
            }
            if (loginPwd.length == 0) {
                alert("请输入密码");
                return false;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/user/accessLogin",
                data: {
                    loginName: loginName,
                    loginPwd: loginPwd
                },//给服务器的参数
                type: "POST",
                dataType: "json",
                success: function (data) {
                    if ("success" == data.str) {
                        alert("登录成功");
                        var url = "${pageContext.request.contextPath}/main/index";
                        window.location.href = url;
                    } else {
                        alert("登录失败,请输入正确的用户名和密码");
                        var url = "${pageContext.request.contextPath}/main/userLogin";
                        window.location.href = url;
                    }
                }
            });
        }
    </script>

</head>

<body>
<div class="main">
    <div class="loginFrame">

        <p clss="loginTitle">登 录 界 面</p>

        <div class="user">
            <label>
    					<span>
    						<svg t="1657447739738" class="icon" viewBox="0 0 1024 1024" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" p-id="4272" width="20" height="20"><path
                                    d="M703.400215 995.074204c-3.51915 0-7.078209-0.991584-10.240225-3.066849-30.28884-19.875676-80.136132-25.263383-97.079012-25.678846l-22.119787 0-35.287691 0.271176c-0.048095 0-0.095167 0-0.143263 0L92.740194 966.599685c-10.326183 0-18.696828-8.370645-18.696828-18.696828l0-22.467711c-0.318248-6.266727-0.910743-40.603767 21.004383-78.307484 13.716396-23.598464 33.431414-43.86095 58.598606-60.225663 30.493501-19.828604 69.116147-33.909297 114.796536-41.84913 0.233314-0.039909 0.466628-0.075725 0.700965-0.107447 0.346901-0.047072 35.499515-4.858658 71.208808-14.273075 61.894675-16.317641 67.307965-30.743188 67.345828-30.884404 0.364297-1.430582 0.89437-2.803859 1.572822-4.095271 0.50756-2.699482 1.76418-12.858866-0.63752-40.079834-6.100952-69.136613-42.120306-109.995183-71.061452-142.825916-9.127891-10.354835-17.749246-20.133549-24.387433-29.722952-28.640294-41.37227-31.296797-88.416725-31.396057-90.39887-0.01535-0.311085-0.022513-0.62217-0.022513-0.933255 0-18.779715 9.363252-27.418466 17.624403-35.041074l0.433882-0.401136c0.271176-0.25071 0.442068-0.436952 0.542352-0.556679 0.093121-1.340531-0.566912-4.743024-1.013073-7.04137-0.169869-0.873903-0.339738-1.750877-0.50142-2.632967-7.179516-38.981826-7.670703-99.19214-1.175779-137.837298 2.409886-50.813293 46.224788-89.711208 48.105624-91.356684 0.071631-0.062422 0.143263-0.12382 0.214894-0.185218 6.290263-5.338588 12.671601-11.169387 16.727986-17.636682 0.487094-0.775666 0.827855-1.37737 1.066285-1.836835-0.304945-0.786922-0.741897-1.793856-1.094938-2.608407-2.436492-5.618974-6.118348-14.109346-4.02364-25.02393 1.263783-6.589069 6.078439-18.362206 24.118304-23.173792 7.261381-1.937119 15.022135-2.333138 20.689205-2.62171l1.122567-0.058328c22.38994-1.178849 46.272883-2.176572 70.435189-0.324388 174.730557 13.396101 234.920404 78.686107 237.396805 81.459267 0.140193 0.155543 0.276293 0.314155 0.409322 0.474814 13.986549 16.756639 24.347524 37.635155 30.7964 62.055334 2.01489 7.619538 3.309372 14.016225 4.062526 20.072151 6.102998 35.464723 5.084808 71.904657 3.78214 96.269577-0.732687 13.675464-2.257413 28.030403-4.800329 45.175899-0.691755 4.656043 0.068562 5.564739 0.355087 5.906523 0.75827 0.906649 1.686409 1.892093 2.667759 2.934842 3.862981 4.099365 9.152451 9.713222 11.964496 18.721387 1.410116 4.502547 2.069125 9.360182 2.069125 15.267728 0 0.311085-0.008186 0.62217-0.022513 0.933255-0.099261 1.982144-2.755764 49.0266-31.395034 90.397846-6.639211 9.590426-15.259542 19.36914-24.387433 29.722952-28.942169 32.829709-64.960501 73.689303-71.061452 142.827963-2.4017 27.220968-1.14508 37.379329-0.63752 40.079834 0.678452 1.291412 1.208525 2.664689 1.572822 4.094248 0.036839 0.141216 5.471618 14.613836 67.648726 30.964222 35.7052 9.388834 70.557986 14.146185 70.90591 14.193257 0.303922 0.040932 0.606821 0.090051 0.908696 0.145309 46.095851 8.549723 84.956927 22.991644 115.505687 42.923602 25.252127 16.476253 44.930305 36.7019 58.489112 60.114123 21.50171 37.128619 20.626783 70.714552 20.195971 77.443813l0 22.332634c0 10.326183-8.370645 18.696828-18.696828 18.696828L775.884063 966.602755c-10.326183 0-18.696828-8.370645-18.696828-18.696828s8.370645-18.696828 18.696828-18.696828l158.188812 0L934.072875 924.897911c0-0.686638 0.00921-1.106194 0.081864-1.769296 0.104377-1.508353 1.627057-28.332279-16.349363-58.130955-10.82044-17.937534-26.589588-33.609469-46.870494-46.580898-26.100448-16.693194-59.762105-28.967752-100.05274-36.482913-4.63967-0.642636-39.012526-5.564739-75.080999-15.059997-70.761624-18.629289-87.964424-39.353286-93.189426-54.395888-4.004197-7.765871-6.245238-23.195282-2.984984-60.153008 7.18054-81.369216 49.41955-129.282458 80.260975-164.268274 8.747221-9.921977 16.301268-18.491143 21.693068-26.279526 21.120017-30.510898 24.437575-66.300009 24.765033-70.606081-0.032746-2.252297-0.260943-3.223415-0.36225-3.549849-0.248663-0.798179-1.89721-2.547009-3.490497-4.238534-1.25048-1.327228-2.667759-2.832512-4.136204-4.587482-7.950066-9.504468-10.782577-21.079084-8.66024-35.384905 2.367931-15.960507 3.781116-29.206182 4.449335-41.684378 1.951445-36.502355 0.913812-63.747883-3.363607-88.341001-0.057305-0.326435-0.105401-0.654916-0.145309-0.983397-0.531096-4.438079-1.530866-9.354042-3.14769-15.46932-4.986571-18.884093-12.726859-34.770921-23.006993-47.232744-1.714038-1.747807-15.385409-15.125489-45.883003-29.67588-54.882981-26.183336-120.791064-35.849486-166.417217-39.34817-21.934568-1.681292-44.442188-0.732687-65.614393 0.382717l-1.178849 0.060375c-1.766226 0.090051-4.735861 0.2415-7.55814 0.525979 2.447748 5.841032 5.453199 14.632255 2.296299 25.136493-1.184989 3.939729-3.003404 7.792477-5.723352 12.129248-6.732331 10.733459-15.923668 19.23611-24.054859 26.145473-1.597381 1.441838-34.223452 31.356149-35.351136 65.738213-0.028653 0.86981-0.11768 1.736551-0.267083 2.594081-5.972015 34.304294-5.568832 90.780563 0.898463 125.894292 0.140193 0.765433 0.288572 1.52575 0.435928 2.282996 1.980097 10.205433 5.294586 27.284413-10.879792 42.202171l-0.434905 0.402159c-2.086521 1.924839-4.943592 4.560876-5.41636 5.468548l0 0c0.00307 0-0.13303 0.426719-0.164752 1.584078 0.328481 4.295839 3.654226 40.060391 24.76401 70.554916 5.3918 7.788383 12.945847 16.356526 21.693068 26.279526 30.841426 34.984792 73.079412 82.899058 80.259952 164.266227 3.260254 36.95875 1.019213 52.388161-2.984984 60.154032-5.226025 15.042601-22.427802 35.766598-93.189426 54.395888-36.365232 9.574053-71.006194 14.497179-75.18947 15.074324-39.83424 6.958482-73.196069 18.883069-99.160417 35.44528-20.185738 12.876262-35.971259 28.599362-46.919613 46.732347-18.282389 30.281677-17.133216 57.860802-17.055444 59.33641 0.050142 0.543376 0.054235 0.867764 0.054235 1.433652l0 4.309142 427.01135 0 35.287691-0.271176c0.047072 0 0.095167 0 0.143263 0l22.423709 0c0.141216 0 0.280386 0.001023 0.421602 0.005117 2.895957 0.064468 71.446215 1.943258 116.949572 31.803333 8.633634 5.665023 11.039427 17.254989 5.374404 25.888624C715.458855 992.104569 709.488887 995.074204 703.400215 995.074204zM631.466905 689.8762c0.454348 0.36839 0.890276 0.757247 1.305739 1.164522C632.378671 690.653913 631.943766 690.26301 631.466905 689.8762zM414.041968 689.8762c-0.471744 0.382717-0.901533 0.768503-1.292436 1.152243C413.160901 690.626283 413.592736 690.24152 414.041968 689.8762z"
                                    p-id="4273" fill="#ffffff"></path></svg>
    					</span>
                <span>用户名</span>
                <input type="text" id="loginName" name="loginName" placeholder="   输入用户名">
            </label>
        </div>

        <div class="password">
            <div class="user">
                <label>
                    <span><svg t="1657447538960" class="icon" viewBox="0 0 1024 1024" version="1.1"
                               xmlns="http://www.w3.org/2000/svg" p-id="3256" width="20" height="20"><path
                            d="M288 384v-74.666667c0-123.722667 100.266667-224 224-224s224 100.224 224 224v74.666667h10.677333C811.445333 384 864 436.597333 864 501.333333v320c0 64.821333-52.469333 117.333333-117.322667 117.333334H277.333333C212.554667 938.666667 160 886.069333 160 821.333333V501.333333c0-64.821333 52.469333-117.333333 117.322667-117.333333H288z m64 0h320v-74.666667c0-88.426667-71.605333-160-160-160-88.384 0-160 71.626667-160 160v74.666667zM224 501.333333v320c0 29.397333 23.914667 53.333333 53.322667 53.333334H746.666667A53.269333 53.269333 0 0 0 800 821.333333V501.333333c0-29.397333-23.914667-53.333333-53.322667-53.333333H277.333333A53.269333 53.269333 0 0 0 224 501.333333z"
                            p-id="3257" fill="#ffffff"></path></svg></span>
                    <span>密码</span>
                    <input type="password" id="loginPwd" name="loginPwd" placeholder="   输入密码">
                </label>
            </div>
            <br><br>
            <center>

                <div class="enterBut">
                    <span id="submitBtn" onclick="CheckForm()">登录</span>
                </div>

            </center>
            <br>
            <center>
                <p class="rigist">没有账号？ <a href="${path}/main/registUser" style="color: deepskyblue;">点击注册</a></p>
            </center>
        </div>
    </div>
</div>
</body>
</html>