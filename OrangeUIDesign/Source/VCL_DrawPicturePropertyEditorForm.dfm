object frmDrawPicturePropertyEditor: TfrmDrawPicturePropertyEditor
  Left = 0
  Top = 0
  Caption = #37733#21095#22678#32514#26668#32235#37731'?'
  ClientHeight = 513
  ClientWidth = 933
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    933
    513)
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 4
    Top = 3
    Width = 822
    Height = 478
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = 0
      Top = 0
      Width = 105
      Height = 105
      OnPaint = PaintBox1Paint
    end
  end
  object Button1: TButton
    Left = 833
    Top = 23
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #37813#25779#32017'...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object btnSave: TButton
    Left = 833
    Top = 60
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #37721#65088#29928#28051'?..'
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnOk: TButton
    Left = 833
    Top = 94
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #32429#57788#30078
    TabOrder = 3
    OnClick = btnOkClick
  end
  object Button2: TButton
    Left = 833
    Top = 128
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #37721#26664#31223
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 833
    Top = 192
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #23059#21620#27342
    TabOrder = 5
    OnClick = Button4Click
  end
  object SaveDialog1: TSavePictureDialog
    Left = 317
    Top = 84
  end
end
