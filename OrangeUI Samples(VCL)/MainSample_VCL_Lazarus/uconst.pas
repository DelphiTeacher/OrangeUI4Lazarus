//convert pas to utf8 by ¥
//D区客户端
unit uConst;

interface

{$DEFINE CLIENT_APP}

uses
  SysUtils,
  uOpenUISetting,
  uOpenCommon;





const
  //默认服务器地址
  //AppStore上架需要域名,暂时分离开,因为域名还没备案,先用我服务器
  Const_Server_Host='www.orangeui.cn';

//  Const_Server_Host_IM='www.orangeui.cn';
//  //开放平台网页的根链接
//  Const_OpenWebRoot='http://www.orangeui.cn/open';//
////  Const_OpenWebRoot='http://127.0.0.1/open';//




//  //默认服务器地址
//  //AppStore上架需要域名,暂时分离开,因为域名还没备案,先用我服务器
//  Const_Server_Host_IOS='127.0.0.1';
//  //Android,Windows可以IP直连
//  Const_Server_Host_Other=Const_Server_Host_IOS;//'www.orangeui.cn';
//  Const_Server_Host_IM='www.orangeui.cn';
//  //开放平台网页的根链接
//  Const_OpenWebRoot='http://127.0.0.1/open';




  //默认端口
  Const_Server_Port=10030;




  //授权中心的服务器,默认都是www.orangeui.cn:10020
  Const_CenterServerHost='www.orangeui.cn';
//  Const_CenterServerHost='127.0.0.1';//'www.orangeui.cn';
  Const_CenterServerPort=10020;
  //Const_CenterAppName='门业';



const
  //D区的APPID,就是开放平台的AppID
  Const_APPID='1000';
  //App名称,主窗体标题
  Const_APPName='D区';
  Const_FilterAPPName='';
  //用户类型,客户
  Const_APPUserType:TUserType=utClient;
  //登录方式,手机号
  Const_APPLoginType=Const_RegisterLoginType_PhoneNum;
  //注册协议
  Const_RegisterProtocolUrl='http://www.orangeui.cn/open/apps/1000/ClientRegisterProtocol.html';
  //关于页面的版权信息
  Const_CopyrightCompany='DelphiTeacher';//'金华劲界信息技术有限公司';
  Const_CopyrightTime='Copyright @2015-2020';




//const
//  //个推推送的参数
//  Const_GetuiPush_AppId='JBLqfmeZFuA9yF9o3rUW8A';
//  Const_GetuiPush_AppSecret='2AbBKctwy99YwWGDjpLUz2';
//  Const_GetuiPush_AppKey='Akqo1ZNY5M7KqX7mcaTwLA';
//  Const_GetuiPush_MasterSecret='2YMyiHBxKH9cBqwcPpDou3';
//  Const_GetuiPush_AppType='client';
//
//
//
//const
//  //小米推送的参数
//  Const_XiaomiPush_AppId='2882303761518366237';
//  Const_XiaomiPush_AppKey='5321836643237';



//  {$IFDEF USE_FCM_PUSH}
//const
//  //r4uclient的谷歌FCM推送配置   还未修改
//  Const_FcmPush_ProjectId='r4uclient';
//  Const_FcmPush_ApiKey='AIzaSyBjvNtVunmlAF67vF-tGTCx83HJCFEncS0';
//  Const_FcmPush_ApplicationId='1:438377136143:android:d00bc15d44d46c01';
//  Const_FcmPush_DatabaseUrl='https://r4uclient.firebaseio.com';
//  Const_FcmPush_GcmSenderId='438377136143';
//  {$ENDIF USE_FCM_PUSH}


//
//const
//  //Facebook的应用ID     还未修改
//  Const_Facebook_AppId='939560546592635';
//
//
//
//const
//  //微信的应用ID    客户端
//  Const_WeiXin_AppId='wxcd924148d13bdb8e';
//  Const_WeiXin_AppSecret='90ac476a3d8d3ad5d47d078002bc1260';
//  Const_WeiXin_PartnerID='';//'1519118881';
//  Const_WeiXin_PartnerKey='';//'13857563773wangnengdelphiteacher';
//  Const_WeiXin_IOSUniversalLink='https://www.orangeui.cn/delphi/';
//
//
//
//const
//  //支付宝的IOSSchema  付完钱跳回App用  每个App唯一
//  Const_AliPay_AppId='2021001143607090';


//
//const
//  //暂时写死的客服电话
//  Const_ServiceEmp_Phone='18957901025';
//
//
//const
//  Const_ServiceEmp_IMUserId=0;


implementation





initialization
  //LoginFrame
  //uOpenUISetting
  ////是否启用微信登录
  //GlobalIsEnabledWeichatLogin:=True;
  ////是否启用支付宝登录
  //GlobalIsEnabledAlipayLogin:=False;//True;//True
  ////是否启用Apple登录
  //GlobalIsEnabledAppleLogin:=False;
  //{$IFDEF IOS}
  //  if TOSVersion.Check(13) then
  //  begin
  //    //IOS13才支持
  //    GlobalIsEnabledAppleLogin:=False;
  //  end;
  //{$ENDIF IOS}
  //{$IFDEF MSWINDOWS}
  //  //Windows下测试用
  //  GlobalIsEnabledAppleLogin:=False;//True;
  //{$ENDIF}
  ////是否启用QQ登录
  //GlobalIsEnabledQQLogin:=False;
  ////是否启用Facebook登录
  //GlobalIsEnabledFacebookLogin:=False;
  ////是否启用Twitter登录
  //GlobalIsEnabledTwitterLogin:=False;
  //
  //
  ////三方登录需要完善手机号等
  //GlobalIsThirdPartyNeedPhone:=False;//True;True;//
  //
  //
  ////是否需要平台商城分页
  //GlobalIsNeedPlatformShopPage:=True;



  CurrentVersion:='1.0.0';


end.
