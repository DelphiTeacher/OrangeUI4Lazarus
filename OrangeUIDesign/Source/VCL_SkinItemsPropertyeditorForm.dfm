object frmSkinItemsPropertyEditor: TfrmSkinItemsPropertyEditor
  Left = 0
  Top = 0
  Caption = 'frmSkinItemsPropertyEditor'
  ClientHeight = 415
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ControlsLayout: TPanel
    Left = 295
    Top = 0
    Width = 185
    Height = 415
    Align = alRight
    Padding.Top = 9
    Padding.Right = 9
    Padding.Bottom = 9
    TabOrder = 0
    object ItemsClasses: TComboBox
      Left = 1
      Top = 10
      Width = 174
      Height = 21
      Margins.Bottom = 9
      Align = alTop
      TabOrder = 0
    end
    object btnAdd: TButton
      Left = 1
      Top = 31
      Width = 174
      Height = 25
      Margins.Bottom = 9
      Align = alTop
      Caption = #28155#21152#39033#30446
      TabOrder = 3
      OnClick = btnAddClick
    end
    object btnAddChild: TButton
      Left = 1
      Top = 81
      Width = 174
      Height = 25
      Margins.Bottom = 9
      Align = alTop
      Caption = #28155#21152#23376#39033#30446
      TabOrder = 4
      Visible = False
      OnClick = btnAddChildClick
    end
    object Layout2: TPanel
      Left = 1
      Top = 106
      Width = 174
      Height = 41
      Align = alTop
      TabOrder = 5
      object btnUp: TButton
        Left = 1
        Top = 1
        Width = 64
        Height = 39
        Margins.Right = 8
        Align = alLeft
        Caption = #19978#31227
        TabOrder = 0
        OnClick = btnUpClick
      end
      object btnDown: TButton
        Left = 65
        Top = 1
        Width = 53
        Height = 39
        Margins.Right = 8
        Align = alLeft
        Caption = #19979#31227
        TabOrder = 1
        OnClick = btnDownClick
      end
      object btnDelete: TButton
        Left = 118
        Top = 1
        Width = 55
        Height = 39
        Align = alClient
        Caption = #21024#38500
        TabOrder = 2
        OnClick = btnDeleteClick
      end
    end
    object btnInsert: TButton
      Left = 1
      Top = 56
      Width = 174
      Height = 25
      Margins.Bottom = 9
      Align = alTop
      Caption = #25554#20837#39033#30446
      TabOrder = 2
      OnClick = btnInsertClick
    end
    object btnClear: TButton
      Left = 1
      Top = 380
      Width = 174
      Height = 25
      Margins.Bottom = 9
      Align = alBottom
      Caption = #28165#38500#25152#26377#39033#30446
      TabOrder = 1
      OnClick = btnClearClick
    end
  end
  object ItemsTree: TTreeView
    Left = 0
    Top = 0
    Width = 295
    Height = 415
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alClient
    Indent = 19
    TabOrder = 1
    OnClick = ItemsTreeClick
  end
end
