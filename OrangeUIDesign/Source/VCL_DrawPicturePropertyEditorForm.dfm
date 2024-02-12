object frmDrawPicturePropertyEditor: TfrmDrawPicturePropertyEditor
  Left = 0
  Height = 513
  Top = 0
  Width = 933
  Caption = '图片编辑器'
  ClientHeight = 513
  ClientWidth = 933
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  LCLVersion = '2.2.6.0'
  object ScrollBox1: TScrollBox
    Left = 4
    Height = 478
    Top = 3
    Width = 822
    HorzScrollBar.Page = 105
    VertScrollBar.Page = 105
    Anchors = [akTop, akLeft, akRight, akBottom]
    ClientHeight = 474
    ClientWidth = 818
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = 0
      Height = 105
      Top = 0
      Width = 105
      OnPaint = PaintBox1Paint
    end
  end
  object Button1: TButton
    Left = 833
    Height = 25
    Top = 23
    Width = 100
    Anchors = [akTop, akRight]
    Caption = '打开...'
    OnClick = Button1Click
    TabOrder = 1
  end
  object btnSave: TButton
    Left = 833
    Height = 25
    Top = 60
    Width = 100
    Anchors = [akTop, akRight]
    Caption = '另存为...'
    OnClick = btnSaveClick
    TabOrder = 2
  end
  object btnOk: TButton
    Left = 833
    Height = 25
    Top = 94
    Width = 100
    Anchors = [akTop, akRight]
    Caption = '确定'
    OnClick = btnOkClick
    TabOrder = 3
  end
  object Button2: TButton
    Left = 833
    Height = 25
    Top = 128
    Width = 100
    Anchors = [akTop, akRight]
    Caption = '取消'
    OnClick = Button2Click
    TabOrder = 4
  end
  object Button4: TButton
    Left = 833
    Height = 25
    Top = 192
    Width = 100
    Anchors = [akTop, akRight]
    Caption = '清除'
    OnClick = Button4Click
    TabOrder = 5
  end
  object SaveDialog1: TSavePictureDialog
    Left = 317
    Top = 84
  end
end
