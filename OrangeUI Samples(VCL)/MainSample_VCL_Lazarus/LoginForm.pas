unit LoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSkinWindowsControl, uSkinPanelType, uSkinImageType, StdCtrls,


  uConst,
  uManager,
  uOpenClientCommon,
  uRestInterfaceCall,
  uSkinSuperObject,


  uSkinLabelType, uSkinButtonType, uSkinMaterial, ExtCtrls, uSkinCheckBoxType,
  uDrawCanvas, uSkinItems, uTimerTaskEvent, uSkinScrollControlType,
  uSkinCustomListType, uSkinVirtualGridType, uSkinItemGridType, uTimerTask;

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
    procedure edtUserChange(Sender: TObject);
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
  uOpenClientCommon.CommonSyncServerSetting(GlobalManager.ServerHost,GlobalManager.ServerPort);


  //���õ�¼�ӿ�
  tteLogin.Run;
  //Self.ModalResult:=mrOK;
end;

procedure TfrmLogin.edtUserChange(Sender: TObject);
begin

end;

procedure TfrmLogin.btnMinClick(Sender: TObject);
begin
  Self.WindowState:=wsMinimized;
end;

//procedure TfrmLogin.CreateParams(var Params: TCreateParams);
//begin
//  inherited;
//  //�ޱ߿�,��Ҳ��������
//  Params.Style:=Params.Style and not WS_THICKFRAME;// or WS_MINIMIZEBOX or WS_MAXIMIZEBOX;
//  //����������ʾ
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

end;

procedure TfrmLogin.tteLoginExecute(ATimerTask: TTimerTask);
begin
  //����
  TTimerTask(ATimerTask).TaskTag:=1;
  try

  //�ȿ���ƽ̨���е�¼
  TTimerTask(ATimerTask).TaskDesc:=
    SimpleCallAPI('login',
                  nil,
                  UserCenterInterfaceUrl,
                  ['appid',
                  'user_type',
                  'login_type',
                  'username',
                  'password',
                  //�Ƿ���Ҫ�����û�Ȩ��
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
        //�쳣
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

          //��¼�ɹ�
          uManager.GlobalManager.LastLoginUser:=Self.edtUser.Text;
          uManager.GlobalManager.LastLoginPass:=Self.edtPassWord.Text;


          GlobalManager.User.ParseFromJson(ASuperObject.O['Data'].A['User'].O[0]);


          //��¼����,����ȷ���û��Ѿ���¼
          GlobalManager.User.key:=ASuperObject.O['Data'].S['Key'];

          //�����û���¼key,�����´��Զ���½
          GlobalManager.LastLoginKey:=ASuperObject.O['Data'].S['login_key'];


          //DoLoginSucc(Self);
          ModalResult:=mrOK;


      end
      else
      begin
        //��¼ʧ��
        //ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //�����쳣
      //ShowMessageBoxFrame(Self,'�����쳣,����������������!',
      //                      UserCenterInterfaceUrl+#13#10
      //                      +TTimerTask(ATimerTask).TaskDesc,
      //                      TMsgDlgType.mtInformation,
      //                      ['ȷ��'],nil);
    end;
  finally
    //HideWaitingFrame;
  end;


end;

end.
