unit BaseEditForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,

  //¹«¹²ËØ²ÄÄ£¿é
  EasyServiceCommonMaterialDataMoudle_VCL,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, uSkinWindowsForm,
  uSkinWindowsControl, uSkinPanelType, Vcl.StdCtrls, uSkinWindowsEdit,
  uSkinLabelType, uSkinButtonType, uSkinWindowsComboBox, Vcl.ComCtrls,
  uSkinMaterial, uSkinComboBoxType, uSkinWindowsDateEdit, uSkinDateEditType;

type
  TfrmBaseEdit = class(TfrmBase)
    pnlToolbar: TSkinWinPanel;
    btnNew: TSkinWinButton;
    SkinWinButton1: TSkinWinButton;
    SkinWinButton2: TSkinWinButton;
    btnSearch: TSkinWinButton;
    pnlEdit: TSkinWinPanel;
    SkinWinLabel1: TSkinWinLabel;
    edtBillNO: TSkinWinEdit;
    SkinWinLabel2: TSkinWinLabel;
    SkinWinLabel3: TSkinWinLabel;
    SkinWinDateEdit1: TSkinWinDateEdit;
    SkinWinLabel4: TSkinWinLabel;
    SkinWinEdit2: TSkinWinEdit;
    SkinWinLabel5: TSkinWinLabel;
    SkinWinEdit1: TSkinWinEdit;
    SkinWinEdit3: TSkinWinEdit;
    SkinWinLabel6: TSkinWinLabel;
    SkinWinLabel7: TSkinWinLabel;
    SkinWinEdit4: TSkinWinEdit;
    SkinWinLabel8: TSkinWinLabel;
    SkinWinEdit5: TSkinWinEdit;
    SkinWinComboBox1: TSkinWinComboBox;
    SkinWinPanel1: TSkinWinPanel;
    SkinWinButton3: TSkinWinButton;
    SkinWinButton4: TSkinWinButton;
    SkinWinButton6: TSkinWinButton;
    procedure SkinWinButton4Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseEdit: TfrmBaseEdit;

implementation

{$R *.dfm}

procedure TfrmBaseEdit.btnNewClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmBaseEdit.SkinWinButton4Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
