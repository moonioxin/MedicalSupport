/*注册*/
$(function(){
  //跳转到登录页面
  alert("33");
  $(".existing_account span").click(function(){
	window.location.href="/index/index/index.html";
  });
var flag,flag2,flag3,flag4,flag5,flag6,flag7,flag8,flag9,flag10,flag11,flag12,a,repassword_flag,geren_yzm = false;
    // 用户名
   alert("11");
   var user = $.regexp_sxh.regster_username;
   alert("22");
   $(".geren .ipt1 input").blur(function(){
        if($(this).val() == '') {
            $(".b_01").show();
			$("#username").css("border","1px solid #b60001");
            flag= false;
			return false;
        }
        peg = $.regexp_sxh.regster_username;
        if(!peg.test($(this).val())){
           $(".b_02").html('会员名格式不正确').css('color','#d60616').show();
		   $("#username").css("border","1px solid #b60001");
           flag = false;
        }else if($(".geren .ipt1 input").val()==""){
            $(".b_01").show();
            $(".geren .ipt1 input").css("border","1px solid #b60001");
			flag = false;
        }
		if(user.test($(this).val())){
            if($(this).val() != '') {
                $.Main.checkUsername($(this).val() , function(data){
                    if(data.errorCode == 201) {
                        $(".b_02").html('会员名已经被注册').css('color','#d60616').show();
                    } else if(data.errorCode == 0){
						$(".b_02").html("<img src='/static/index/images/true_1.png'>").css('color','#d60616').show();
                         return flag = true;
                    }
                });
            }
        }else {
            $(".b_02").show()
            $(".geren .ipt1 input").css("border","1px solid #b60001");
        }

   });
   
   $(".geren .ipt1 input").focus(function(){
        $(".b_01,.b_02").hide()
        $(".geren .ipt1 input").css("border","1px solid #a9a9a9")
    })

   // 密码
    var pasd = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
    $(".geren .ipt2 input").blur(function(){
        if($("#password").val()!='' && $("#username").val()==$("#password").val()){
            $(".b_03").html("密码不能与帐号一致！").css('color','#d60616').show();
            return false;
        }
        if($(".geren .ipt2 input").val()==""){
            $(".b_03").html("密码不能为空").show();
            $(".geren .ipt2 input").css("border","1px solid #b60001");
			flag2 = false;
        }else if(pasd.test($(".geren .ipt2 input").val())){
			 $(".b_03").html("<img src='./images/true.png'>").css('color','#d60616').show();
             flag2 = true;
        }else{
            $(".b_04").show()
        }
    });
    $(".geren .ipt2 input").focus(function(){
        $(".b_04,.b_03").hide()
        $(".geren .ipt2 input").css("border","1px solid #a9a9a9")
    });
    
    // 确认密码
    $('#repassword').blur(function() {   
        if($('#repassword').val() == '') {
            $('#repassword_icon').html("确认密码不能为空").css('color','#d60616').show();
			$("#repassword").css("border","1px solid #b60001");
			repassword_flag=false;
        }else if($('#password').val() != $('#repassword').val()) {
            $(".repassword_success_img").hide();
            $('#repassword_icon').html("两次密码不一致").css('color','#d60616').show();
			repassword_flag = false;
        } else {
            repassword_flag = true;
            $(".repassword_success_img").show();
            $('#repassword_icon').hide();
        }
    });
    $("#repassword").focus(function(){
        $(".repassword_success_img").hide();
        $('#repassword_icon').hide();
        $("#repassword").css("border","1px solid #a9a9a9")
    })

    // 姓名
    var nam = /^[^&^=^%^$^@^\)^\)^\~^\+^\[^\]^\}^\{^\<^\>^\*^\d]{2,80}$/i; 
     $(".geren .ipt3 input").blur(function(){
        if($(".geren .ipt3 input").val()==""){
           $(".b_05").html("<b class='b_05' style='display: inline;'>身份证号不能为空</b>").show();
           $(".geren .ipt3 input").css("border","1px solid #b60001");
		   flag3 =false;
        }else if(nam.test($(".geren .ipt3 input").val())){
			$(".b_05").html("<img src='./images/true.png'>").css('color','#d60616').show()
           return flag3 = true;
        }else{
            $(".b_05").html("<img src='./images/true.png'>").css('color','#d60616').show()
		   return flag3 = true;
        }
        $(".geren .ipt3 input").focus(function(){
			$(".b_05,.b_06").hide()
			$(".geren .ipt3 input").css("border","1px solid #a9a9a9")
        })
   })

     // 手机号码
    var pho = /^1[345678]\d{9}$/;
    //var pho = /0?(13|14|15|18)[0-9]{9}/手机号码
    $(".geren .ipt4 input").blur(function(){
        if($(".geren .ipt4 input").val()==""){
            $(".b_07").html("<b class='b_07' style='display: inline;'>手机号码不能为空</b>").show();
            $(".geren .ipt4 input").css("border","1px solid #b60001");
        }else if(pho.test($(".geren .ipt4 input").val())){
            $.Main.checkPhone($(this).val(),function(data) {
                if(data.errorCode==201) {
                    $(".b_08").html('手机号已经被使用').css('color','#d60616').show();
                } else {
					$(".b_07").html("<img src='./images/true.png'>").css('color','#d60616').show()
                    return flag4 = true;
                }
            });
        }else{
            $(".b_08").show();
        }
    });
    $(".geren .ipt4 input").focus(function(){
	//关闭弹出框
        flag4 = false;
        $(".patterning_code").hide();
    });
    
    
    function get_code(){
            $("#p").imgcode({
		canvas:document.getElementById("mycanvas"),
		url:'/index/index/savecode',
		cb:function(s){
				var encrypt = new JSEncrypt();
				var public_key = '-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvLSDII/m0La8yRolTzMZyoXRQ4CHgEZOhzpsfnWBlzF5eDXHiHlCQ8GgdJ6AMb0STFUQYU08XglexyZh0IlUSpCbQJ7IFb7SRk7JoKSDw6gKb/xxOiHx2bcfpLHjLRcNcWiLeV6bevoQlD/eLRmbybhlLeDtKLfpizQsftAjXaQIDAQAB-----END PUBLIC KEY-----';
				encrypt.setPublicKey(public_key);
                                //$('#verify_code').val(s);
				return encrypt.encrypt(s);
				 
			}
            });
        }
    //弹出验证码框
	$("#get_verify_code").click(function(){
		if(flag!=true || flag2!=true || repassword_flag!=true || flag3!=true) {
			layer.msg("请完善以上资料");console.log(1);
            return false;
        }
		if(flag4 != true) {
			layer.msg("请正确填写手机号");
			return false;
		}
		if(verify_code_f){
			$(".patterning_modal input").val("");
			get_code();
			$(".patterning_code").show();
			$(".error > img").show();
		}
	});
	//关闭弹出框
	$(".error > img").click(function(){
		$(".patterning_code").hide();
	});
        
	//短信倒计时
	function times(){
		var i = 299;
        var set = setInterval(function(){
            if(i==1){
                clearInterval(set)
                verify_code_f = true;
				 $("#get_verify_code").attr('disabled','true');
                //$(".geren_shadow").hide();
                $(".geren_iptyz p").html("重新获取验证码");
            }else{
                i--
                $(".geren_iptyz p").html(i+"秒后重新发送");
            }
        },1000);
	}

    //点击 获取验证码短信
    var verify_code_f = true;
    $('.queue_click').click(function() {
		if($(".patterning_modal input").val()==""||$(".patterning_modal input").val()==undefined){
			layer.msg("验证码不能空");
			return false;
		}
        if(flag4 != true || verify_code_f!=true) {
            layer.msg("手机号不能留空");
            return false;
        }
        
        
        $("#get_verify_code").attr('disabled','true');
        //$(".geren_shadow").show();
		
        var phone = $(".geren .ipt4 input").val();
        $.ajax({
            url:'/user/Smsverify/getSmsVerify',
            type:"POST",
            data:{
                phone:phone,
                length:6,
                msg:"注册",
                mold:1,
                type:0,
				verify_luo:$(".patterning_modal input").val(),
                validTime:60
            },
            success:function(data){
                if(data.errorCode==0){
					$(".patterning_code").fadeOut(600);
					layer.msg(data.errorMsg);
					verify_code_f  =  false;
					times();
                } else {
                    layer.msg(data.errorMsg);
                    $(".patterning_modal input").val('');
                    $('#p').trigger('click');
                }
            }
        });
    });


    $(".geren .ipt4 input").focus(function(){
        $(".b_07,.b_08").hide()
        $(".geren .ipt4 input").css("border","1px solid #a9a9a9")
    })
    // 验证码
    $(".geren_yz input").blur(function(){
        if($(".geren_yz input").val()==''){
			//$(".geren_yzm").html("请输入验证码");
            $(this).css("border","1px solid #b60001")
        }else{
            return geren_yzm = true;
        }
    })
    $(".geren_yz input").focus(function(){
        $(".geren_yzm").html("");
        $(this).css("border","1px solid #a9a9a9")
    })
    // 推荐人账号
   $(".geren .ipt5 input").blur(function(){
    if($(".geren .ipt5 input").val()==""){
        $(".b_09").html("<b class='b_09' style='display: inline;'>推荐人不能为空</b>").show()
        $(".geren .ipt5 input").css("border","1px solid #b60001")
    }else {//if(true){//user.test($(".geren .ipt5 input").val()) || 
            $.Main.checkUsername($(this).val() , function(data){
                if(data.errorCode==201) {
                    $(".b_09").html("<img src='/static/index/images/true_1.png'>").css('color','#d60616').show();
                    return a = true;     
                    $(".b_10").hide();
                } else{
                    $(".b_10").html('推荐人信息有误').css('color','#d60616').show();
                }
            });
        }
//        else{
//            $(".b_10").show()
//            $(".geren .ipt5 input").css("border","1px solid #b60001")
//        }
   })
   $(".geren .ipt5 input").focus(function(){
        $(".b_09,.b_10").hide()
        $(".geren .ipt5 input").css("border","1px solid #a9a9a9")
    })

// 企业注册
    // 企业账号
    $(".qiye .ipt1 input").blur(function(){
    if($(".qiye .ipt1 input").val()==""){
        $(".b_11").show()
        $(".qiye .ipt1 input").css("border","1px solid #b60001")
    }else if(user.test($(".qiye .ipt1 input").val())){
            return flag6 = true;
        }else{
            $(".b_12").show()
            $(".qiye .ipt1 input").css("border","1px solid #b60001")
        }
   }) 
   $(".qiye .ipt1 input").focus(function(){
        $(".b_11,.b_12").hide()
        $(".qiye .ipt1 input").css("border","1px solid #a9a9a9")
    })

   // 企业登录密码
   $(".qiye .ipt2 input").blur(function(){
        if($(".qiye .ipt2 input").val()==""){
            $(".b_13").show()
            $(".qiye .ipt2 input").css("border","1px solid #b60001")
        }else if(pasd.test($(".qiye .ipt2 input").val())){
            return flag7 = true;
        }else{
            $(".b_14").show()
        }
    })
    $(".qiye .ipt2 input").focus(function(){
        $(".b_13,.b_14").hide()
        $(".qiye .ipt2 input").css("border","1px solid #a9a9a9")
    })

    // 企业验证密码
    $(".qiye .ipt3 input").blur(function(){
        if($(".qiye .ipt3 input").val()==""){
           $(".b_15").show()
           $(".qiye .ipt3 input").css("border","1px solid #b60001") 
        }else if($(".qiye .ipt3 input").val()==$(".qiye .ipt2 input").val()){
            return flag8 = true;
        }else{
             $(".b_16").show()
             $(".qiye .ipt3 input").css("border","1px solid #b60001") 
        }
     })
     $(".qiye .ipt3 input").focus(function(){
        $(".b_15,.b_16").hide()
        $(".qiye .ipt3 input").css("border","1px solid #a9a9a9")
    })
    
    // 企业手机号码
     $(".qiye .ipt5 input").blur(function(){
        if($(".qiye .ipt5 input").val()==""){
            $(".b_19").show()
            $(".qiye .ipt5 input").css("border","1px solid #b60001")
        }else if(pho.test($(".qiye .ipt5 input").val())){
                    $(".qiye_iptyz").click(function(){
                    $(".qiye_shadow").show();
                    var i = 60;
                    var set = setInterval(function(){
                        if(i==1){
                            clearInterval(set)
                            $(".qiye_shadow").hide()
                            $(".qiye_iptyz p").html("重新获取验证码")
                        }else{
                            i--
                            $(".qiye_iptyz p").html(i+"秒后重新发送")
                        }
                    },1000)
                })
            return flag9 = true;
        }else{
            $(".b_20").show()
            $(".qiye .ipt5 input").css("border","1px solid #b60001")
        }
    })
    $(".qiye .ipt5 input").focus(function(){
        $(".b_19,.b_20").hide()
        $(".qiye .ipt5 input").css("border","1px solid #a9a9a9")
    })

    // 法人姓名
    $(".qiye .ipt4 input").blur(function(){
        if($(".qiye .ipt4 input").val()==""){
           $(".b_17").show()
           $(".qiye .ipt4 input").css("border","1px solid #b60001")
        }else if(nam.test($(".qiye .ipt4 input").val())){
           return flag10 = true;
        }else{
            $(".b_18").show();
            $(".qiye .ipt4 input").css("border","1px solid #b60001")
        }
        $(".qiye .ipt4 input").focus(function(){
        $(".b_17,.b_18").hide()
        $(".qiye .ipt4 input").css("border","1px solid #a9a9a9")
        })
   })
    // 公司名称
    $(".qiye .ipt6 input").blur(function(){
    if($(".qiye .ipt6 input").val()==""){
        $(".b_21").show()
        $(".qiye .ipt6 input").css("border","1px solid #b60001")
    }else{
        return flag11 = true;
    }
})
$(".qiye .ipt6 input").focus(function(){
    $(".b_21").hide()
    $(".qiye .ipt6 input").css("border","1px solid #a9a9a9")
})

    // 企业推荐人账号
   $(".qiye .ipt7 input").blur(function(){
    if($(".qiye .ipt7 input").val()==""){
        $(".b_22").show()
        $(".qiye .ipt7 input").css("border","1px solid #b60001")
    }else if(user.test($(".qiye .ipt7 input").val())){
            return flag12 = true;
        }else{
            $(".b_23").show()
            $(".qiye .ipt7 input").css("border","1px solid #b60001")
        }
   })
   $(".qiye .ipt7 input").focus(function(){
        $(".b_22,.b_23").hide()
        $(".qiye .ipt7 input").css("border","1px solid #a9a9a9")
    })

	/*协议*/
	$(".xieyi_p").attr("data","0").click(function(){
		var data=$(this).attr("data");
		if(data==1){
			$(".xieyi_p img").hide();
			$(this).attr("data","0");
		}else{
			$(".xieyi_p img").show();
			$(this).attr("data","1");
		}
	});
	$(".show_a").click(function(){
		$(".modal_bg").show();
	});
	$(".close").click(function(){
		$(".modal_bg").hide();
	});
   /** 个人注册提交
    * */
   $._register_action_flag = true;
   $(".sub").click(function(){
	   alert("ff");
       var username = $("#username").val();
       var encrypt = new JSEncrypt();
       var public_key = '-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvLSDII/m0La8yRolTzMZyoXRQ4CHgEZOhzpsfnWBlzF5eDXHiHlCQ8GgdJ6AMb0STFUQYU08XglexyZh0IlUSpCbQJ7IFb7SRk7JoKSDw6gKb/xxOiHx2bcfpLHjLRcNcWiLeV6bevoQlD/eLRmbybhlLeDtKLfpizQsftAjXaQIDAQAB-----END PUBLIC KEY-----';
       encrypt.setPublicKey(public_key);
       var password = encrypt.encrypt($('#password').val());
       var repassword = encrypt.encrypt($('#repassword').val());
       var name = $("#name").val();
       var phone = $("#phone").val();
       var referee_name = $("#referee_name").val();
       var code = $(".geren_yz input").val();
       
//       alert(flag);//帐户==true
//       alert(repassword_flag);//确认密码==true
//       alert(flag2);//密码==true
//       alert(flag3);//姓名==true
//       alert(flag4);//手机号码==true
//       alert(a);//推荐人==true
//       alert(geren_yzm);//验证码==true

        if(referee_name != '') {
            a = true;
        }
        if(flag && repassword_flag && flag2 && flag3 && flag4 && a && geren_yzm){
            if($(".xieyi_p").attr("data")==0){
				layer.msg("请勾选用户协议");
				return false;
		   }
            if($._register_action_flag != true) {
                return false;
            }
            $._register_action_flag = false;
            $.common.ajaxPost('/user/index/register' , {
                company:'person',  //个人注册
                verify:code,   //短信验证码
                username:username,
                password:password,
                repassword:repassword,
                name:name,
                phone:phone,
                referee_name:referee_name
            } , function(data) {
                if(data.errorCode==0){
                    layer.msg("注册成功，即将为你跳转到登录页面");
                    setTimeout(function() {
                        window.location.href="/index/index/index.html"
                    },2000);
                } else {
                    layer.msg(data.errorMsg);
                    $._register_action_flag = true;
                }
            });
       }else{
           layer.msg('请填写好注册信息');
       }
   })
})