object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 645
  ClientWidth = 852
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
  object DBGrid1: TDBGrid
    Left = 176
    Top = 144
    Width = 345
    Height = 177
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDragDrop = DBGrid1DragDrop
    OnDragOver = DBGrid1DragOver
    OnEndDrag = DBGrid1EndDrag
    OnStartDrag = DBGrid1StartDrag
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Count'
        Width = 80
        Visible = True
      end>
  end
  object StringGrid1: TStringGrid
    Left = 176
    Top = 368
    Width = 513
    Height = 201
    DragKind = dkDock
    TabOrder = 1
  end
end
