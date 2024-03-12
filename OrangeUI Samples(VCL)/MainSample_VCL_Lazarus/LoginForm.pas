//convert pas to utf8 by ¥
//convert pas to utf8 by ¥
unit LoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,


  uConst,
  uManager,
  //uWaitingForm,
  WaitingForm,
  uOpenClientCommon,
  uRestInterfaceCall,

  {$IFDEF FPC}
  uSkinSuperObject,
  {$ELSE}
  {$IF CompilerVersion <= 21.0} // XE or older
  SuperObject,
  superobjecthelper,
  {$ELSE}
    {$IFDEF SKIN_SUPEROBJECT}
    uSkinSuperObject,
    {$ELSE}
    XSuperObject,
    XSuperJson,
    {$ENDIF}
  {$IFEND}
  {$ENDIF}


  uSkinLabelType, uTimerTaskEvent, uSkinButtonType, StdCtrls,
  uSkinWindowsControl, uSkinPanelType,uTimerTask;

type

  { TfrmLogin }

  TfrmLogin = class(TForm)
    pnlBottom: TSkinWinPanel;
    pnlUser: TSkinWinPanel;
    pnlPassword: TSkinWinPanel;
    edtUser: TEdit;
    edtPassword: TEdit;
    chkRememberPassword: TCheckBox;
    lblForget: TSkinWinLabel;
    btnLogin: TSkinWinButton;
    tteLogin: TTimerTaskEvent;
    procedure btnCloseClick(Sender: TObject);
    procedure btnMinClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tteLoginBegin(ATimerTask: TTimerTask);
    procedure tteLoginExecute(ATimerTask: TTimerTask);
    procedure tteLoginExecuteEnd(ATimerTask: TTimerTask);
  private
    { Private declarations }
  public
    //procedure CreateParams(var Params: TCreateParams); override;
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  //set server url
  uOpenClientCommon.CommonSyncServerSetting(GlobalManager.ServerHost,GlobalManager.ServerPort);


  //调用登录接口
  tteLogin.Run;
  //Self.ModalResult:=mrOK;
end;

procedure TfrmLogin.btnMinClick(Sender: TObject);
begin
  Self.WindowState:=wsMinimized;
end;

//procedure TfrmLogin.CreateParams(var Params: TCreateParams);
//begin
//  inherited;
//  //无边框,但也不能拉伸
//  Params.Style:=Params.Style and not WS_THICKFRAME;// or WS_MINIMIZEBOX or WS_MAXIMIZEBOX;
//  //在任务栏显示
//  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
//
//
//end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  //
//  SkinWinCheckBox1.ComponentTypeName:='Color';
//  TSkinCheckBoxColorMaterial(SkinWinCheckBox1.SelfOwnMaterial).IsSimpleDrawCheckState:=True;
end;

procedure TfrmLogin.tteLoginBegin(ATimerTask: TTimerTask);
begin
  ShowWaitingFrame(nil,'Login...');
end;

procedure TfrmLogin.tteLoginExecute(ATimerTask: TTimerTask);
begin
  //出错
  TTimerTask(ATimerTask).TaskTag:=1;
  try

  //先开放平台进行登录
  TTimerTask(ATimerTask).TaskDesc:=
    SimpleCallAPI('login',
                  nil,
                  UserCenterInterfaceUrl,
                  ['appid',
                  'user_type',
                  'login_type',
                  'username',
                  'password',
                  //是否需要返回用户权限
                  'is_need_user_power'
                  ],
                  [AppID,
                  APPUserType,
                  0,
                  Self.edtUser.Text,
                  Self.edtPassword.Text,
                  '1'
                  ],
                  GlobalRestAPISignType,
                  GlobalRestAPIAppSecret,
                  False,
                  nil,
                  '',
                  []
                  );


      if TTimerTask(ATimerTask).TaskDesc<>'' then
      begin
        TTimerTask(ATimerTask).TaskTag:=TASK_SUCC;
      end;


    except
      on E:Exception do
      begin
        //异常
        TTimerTask(ATimerTask).TaskDesc:=E.Message;
      end;
    end;
end;

procedure TfrmLogin.tteLoginExecuteEnd(ATimerTask: TTimerTask);
var
  ASuperObject:ISuperObject;
  I: Integer;
begin


  try

    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=SO(TTimerTask(ATimerTask).TaskDesc);
      if ASuperObject.I['Code']=200 then
      begin

          //登录成功
          uManager.GlobalManager.LastLoginUser:=Self.edtUser.Text;
          uManager.GlobalManager.LastLoginPass:=Self.edtPassWord.Text;


          GlobalManager.User.ParseFromJson(ASuperObject.O['Data'].A['User'].O[0]);


          //登录令牌,用于确认用户已经登录
          GlobalManager.User.key:=ASuperObject.O['Data'].S['Key'];

          //保存用户登录key,用于下次自动登陆
          GlobalManager.LastLoginKey:=ASuperObject.O['Data'].S['login_key'];


          //DoLoginSucc(Self);
          ModalResult:=mrOK;


      end
      else
      begin
        //登录失败
        //ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      //ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',
      //                      UserCenterInterfaceUrl+#13#10
      //                      +TTimerTask(ATimerTask).TaskDesc,
      //                      TMsgDlgType.mtInformation,
      //                      ['确定'],nil);
    end;
  finally
    HideWaitingFrame;
  end;


end;

end.
