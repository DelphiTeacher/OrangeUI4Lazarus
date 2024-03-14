object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Form8'
  ClientHeight = 411
  ClientWidth = 1138
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 187
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object ComboBox1: TComboBox
    Left = 78
    Top = 184
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = '1000'
    Items.Strings = (
      '1000'
      '10000'
      '20'
      '50')
  end
  object Button1: TButton
    Left = 256
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
