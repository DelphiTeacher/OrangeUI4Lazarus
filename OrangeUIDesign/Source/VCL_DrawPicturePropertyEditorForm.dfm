object frmDrawPicturePropertyEditor: TfrmDrawPicturePropertyEditor
  Left = 0
  Top = 0
  Caption = 'Draw Picture Editor'
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
  object btnOpen: TButton
    Left = 833
    Top = 23
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Open...'
    TabOrder = 1
    OnClick = btnOpenClick
  end
  object btnSave: TButton
    Left = 833
    Top = 60
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Save as...'
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnOk: TButton
    Left = 833
    Top = 94
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 833
    Top = 128
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object btnClear: TButton
    Left = 833
    Top = 192
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Clear'
    TabOrder = 5
    OnClick = btnClearClick
  end
  object SaveDialog1: TSavePictureDialog
    Left = 317
    Top = 84
  end
end
