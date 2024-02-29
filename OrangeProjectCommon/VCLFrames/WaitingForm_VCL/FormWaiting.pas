unit FormWaiting;

interface

uses
  {$IFDEF FPC}
  LCLType,
  {$ELSE}
  Windows,
  {$ENDIF}
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Types,
  //GIFImg,
  Dialogs,
  StdCtrls,
  ExtCtrls,
//  pngimage,
  DateUtils,
  Math,
  uSkinBufferBitmap,
  uSkinWindowsControl, uSkinLabelType;

type
  TfrmWaiting = class(TForm)
    imgWaiting: TImage;
    tmrWaiting: TTimer;
    tmrTiming: TTimer;
    tmrCheckWindowValid: TTimer;
    lblWaiting: TSkinWinLabel;
    procedure tmrCheckWindowValidTimer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    //��ʾ����
    FHintStr:String;
    //��ʾ���������֮��
    FWindowParent:THandle;
//    //���Ĵ�����
//    FCheckWindowHandle:HWND;
    //����Ĵ�����
    FFollowWindowHandle:HWND;

  private
    FParentForm:TForm;
    //���洰��
    FFollowForm:TForm;
    //�ȴ�����Ŀ��
    FWaitingFormWidth:Integer;
    //�ȴ�����ĸ߶�
    FWaitingFormHeight:Integer;
    //�ȴ�����ľ��
    FWaitingFormHandle:Integer;


    { Private declarations }
  protected
    procedure CreateParams(var AParams:TCreateParams);override;
  public
    constructor Create(AOwner:TComponent;AWindowParent:THandle);
    procedure SetHintStr(AHintStr: PWideChar);
//    procedure SetCheckWindow(ACheckWindowHandle:HWND);
    procedure SetFollowWindow(AFollowWindowHandle:HWND);
    procedure AdjustFormSize(out AWidth, AHeight: Integer);
    { Public declarations }
  end;

var
  frmWaiting:TfrmWaiting;
//var
  ////�Ƿ�ע��
  //IsRegWaitingCom:Boolean;
//  //�ȴ�����
//  frmWaitingList:TList;
  ////ȫ��WaitingForm
  //frmWaiting:TfrmWaiting;

//��ʾ���ݼ���ҳ��
procedure OpenWaitingForm(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
procedure ShowWaitingFrame(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
//�ر����ݼ���ҳ��
procedure CloseWaitingForm;//(AParentForm:TForm);
procedure HideWaitingFrame;//(AParentForm:TForm);


implementation

{$R *.dfm}

procedure WaitSomeTime;
var
  BeginTime:DWORD;
begin
  BeginTime:=GetTickCount;
  while GetTickCount-BeginTime<100 do
  begin
    Application.ProcessMessages;
  end;
end;

procedure ShowWaitingFrame(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
begin
  OpenWaitingForm(AParentForm,AHintStr,IsEnableTiming);
end;

procedure OpenWaitingForm(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
var
//  AWaitingForm:TWaitingFormClass;
  AWindowParentHandle: Integer;
begin
  //Try
    //if DisableWaitingForm then Exit;


    IsEnableTiming:=False;
    //if Not IsRegWaitingCom then Exit;

//    //�ȹرյȴ�����
//    CloseWaitingForm(AParentForm);

    if AParentForm=nil then
    begin
      AParentForm:=Application.MainForm;
    end;
    AWindowParentHandle:=0;
    if AParentForm<>nil then
    begin
      AWindowParentHandle:=AParentForm.Handle;
    end;

    //��ȡ���еĵȴ�����
    if frmWaiting=nil then
    begin
      //frmWaiting:=TfrmWaiting.Create;
      ////�����ȴ�����
      //frmWaiting.CreateWaitingForm;
      frmWaiting:=TfrmWaiting.Create(nil,AWindowParentHandle);
  //    frmWaiting.WaitingForm:=Self;
      frmWaiting.SetBounds(0,0,0,0);
      frmWaiting.Show;
      frmWaiting.Hide;
    end;

    //�����ȴ�����
    if frmWaiting<>nil then
    begin
      //���ø�����(�����ж�Ψһ)
      frmWaiting.FParentForm:=AParentForm;
      //���ø��洰��
      frmWaiting.FFollowForm:=AParentForm;


      ////�����ȴ�����
      //frmWaiting.FWaiting.CreateWindow(AWindowParentHandle);

      //��ȡ�ȴ�����ľ��
      //frmWaiting.GetWaitingFormHandle(frmWaiting.FWaitingFormHandle);
      //���ü�ⴰ��,�����ⴰ��ر���,��ô�ȴ������Զ��ر�
//      frmWaiting.FWaiting.SetCheckWindow(AParentForm.Handle);
      //���õȴ��������ʾ����
      frmWaiting.SetHintStr(PWideChar(AHintStr));
      //��ȡ�ȴ�����Ĵ����С�������ȴ������С��λ��
      frmWaiting.AdjustFormSize(frmWaiting.FWaitingFormWidth,frmWaiting.FWaitingFormHeight);




//      //�Ƿ�������ʱ
//      if IsEnableTiming then
//      begin
//        frmWaiting.FWaiting.StartTiming;
//      end;


      ////�������д���λ��
      //frmWaiting.ResetWindowPosition;


      //��ʾ�ȴ�����
      frmWaiting.Show;

      //WaitSomeTime;
    end;

  //Except
  //  On E:Exception do
  //  begin
  //    OutputDebugString(PWideChar(E.Message));
  //  end;
  //End;
end;

procedure HideWaitingFrame;//(AParentForm:TForm);
begin
  CloseWaitingForm;//(AParentForm);
end;

procedure CloseWaitingForm;//(AParentForm:TForm);
//var
//  I: Integer;
//  AWaitingForm:TWaitingFormClass;
begin


  if frmWaiting<>nil then
  begin
    frmWaiting.Hide;
//    frmWaiting.FWaiting.SetCheckWindow(0);
//    frmWaiting.FWaiting.StopTiming;
    frmWaiting.FParentForm:=nil;
    frmWaiting.FFollowForm:=nil;
  end;


//  for I := frmWaitingList.Count - 1 Downto 0 do
//  begin
//    AWaitingForm:=TWaitingFormClass(frmWaitingList.Items[I]);
//    if (AWaitingForm.FParentForm=AParentForm) then
//    begin
//      frmWaitingList.Delete(I);
//      AWaitingForm.FWaiting.Hide;
//      AWaitingForm.FWaiting.StopTiming;
//      AWaitingForm.FParentForm:=nil;
//      AWaitingForm.FFollowForm:=nil;
//      AWaitingForm.Free;
//    end;
//  end;
end;

constructor TfrmWaiting.Create(AOwner: TComponent; AWindowParent: THandle);
begin
  //��ʾ�ڸ�����֮��
  FWindowParent:=AWindowParent;
  Inherited Create(AOwner);
end;

procedure TfrmWaiting.CreateParams(var AParams: TCreateParams);
begin
  inherited CreateParams(AParams);
  //ָ����ʾ���������֮��
  //AParams.WndParent:=FWindowParent;
  //������������ʾ
  AParams.ExStyle:=AParams.ExStyle and Not WS_EX_APPWINDOW;
end;

procedure TfrmWaiting.FormPaint(Sender: TObject);
var
  AWindowRgn:HRGN;
begin
  {$IFDEF FPC}
  {$ELSE}
  AWindowRgn:=Windows.CreateRoundRectRgn(0,0,Width,Height,4,4);
  Try
    SetWindowRgn(Handle,AWindowRgn,False);
    Self.Canvas.Pen.Color:=$00E0E0E0;
    Self.Canvas.Pen.Width:=4;
    Self.Canvas.RoundRect(0,0,Width,Height,4,4);
  Finally
    DeleteObject(AWindowRgn);
  End;
  {$ENDIF}
end;

procedure TfrmWaiting.FormShow(Sender: TObject);
begin
  {$IFDEF FPC}
  {$ELSE}
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
              SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
  {$ENDIF}
end;

//procedure TfrmWaiting.SetCheckWindow(ACheckWindowHandle: HWND);
//begin
//  //���ü�鴰�壬��ʾ����ʱ��
//  FCheckWindowHandle:=ACheckWindowHandle;
////  Self.tmrCheckWindowValid.Enabled:=ACheckWindowHandle<>0;
//end;

procedure TfrmWaiting.SetFollowWindow(AFollowWindowHandle: HWND);
begin
  //���ø��洰��
  FFollowWindowHandle:=AFollowWindowHandle;
end;

procedure TfrmWaiting.SetHintStr(AHintStr: PWideChar);
begin
  //������ʾ�ı�
  FHintStr:=AHintStr;
  lblWaiting.Caption:=AHintStr;
  lblWaiting.Invalidate;
end;

procedure TfrmWaiting.AdjustFormSize(out AWidth, AHeight: Integer);
//var
//  DC:HDC;
//  Graphics:IGPGraphics;
//  Gap:Integer;
//  DigitWidth,DigitHeight:Integer;
//  ColonWidth,ColonHeight:Integer;
begin
//  DC:=GetDC(0);
//  Try
//    Graphics:=TSkinHelper.CreateGraphicsByDC(DC);

    //�����ַ���������Ҫ��ʾ�Ĵ����С
    AHeight:=70;
    AWidth:=190;

    //����Label�Ŀ���
//    lblWaiting.Width:=uBufferBitmap.CalcFontWidth(Graphics,FHintStr+'......',lblWaiting.Font)+10;
    lblWaiting.Width:=Ceil(uSkinBufferBitmap.GetStringWidth(FHintStr+'......',
                        lblWaiting.SelfOwnMaterialToDefault.DrawCaptionParam.FontSize))+10;

    //������ʾ��������Label
    AWidth:=10
            +imgWaiting.Width
            +10
            +lblWaiting.Width
            +10;
    SetBounds(0,0,AWidth,AHeight);

    imgWaiting.Top:=(AHeight-imgWaiting.Height) div 2 -2;
    imgWaiting.Left:=10;


    //����������
    //TGIFImage(imgWaiting.Picture.Graphic).Animate:=True;

    lblWaiting.Top:=(AHeight-lblWaiting.Height) div 2;// -2;
    lblWaiting.Left:=imgWaiting.Left+imgWaiting.Width+6;


//  Finally
//    ReleaseDC(0,DC);
//  End;
end;

procedure TfrmWaiting.tmrCheckWindowValidTimer(Sender: TObject);
begin
//  if Not Windows.IsWindow(FCheckWindowHandle) then
//  begin
//    Self.tmrCheckWindowValid.Enabled:=False;
//    SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0,
//              SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
////    Hide;
////    WaitingForm.Free;
//  end;
end;

initialization
//  //ע��WaitingForm
//  frmWaitingList:=TList.Create;
  //DisableWaitingForm:=False;
  //IsRegWaitingCom:=True;
  frmWaiting:=nil;
  //RegisterWaitingCom;

finalization
  //UnRegisterWaitingCom;
  FreeAndNil(frmWaiting);
//  FreefrmWaitingList;
//  frmWaitingList.Free;

end.

end.
