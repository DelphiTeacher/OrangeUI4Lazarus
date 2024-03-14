object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 411
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDragOver = FormDragOver
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Button1: TButton
      Left = 208
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnDragOver = Button1DragOver
      OnMouseDown = Button1MouseDown
      OnStartDrag = Button1StartDrag
    end
    object Button2: TButton
      Left = 416
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnDragDrop = Button2DragDrop
      OnDragOver = Button2DragOver
    end
    object Button3: TButton
      Left = 32
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 584
    Top = 136
  end
end
