object frmSkinPictureListPropertyEditor: TfrmSkinPictureListPropertyEditor
  Left = 232
  Height = 710
  Top = 143
  Width = 854
  BorderIcons = [biSystemMenu]
  Caption = '图片列表编辑器'
  ClientHeight = 710
  ClientWidth = 854
  Color = clBtnFace
  DesignTimePPI = 120
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ParentFont = True
  Position = poScreenCenter
  LCLVersion = '3.2.0.0'
  object lblImageIndex: TLabel
    Left = 666
    Height = 20
    Top = 222
    Width = 124
    Anchors = [akTop, akRight]
    Caption = '当前选中图片下标:'
  end
  object lblImageName: TLabel
    Left = 664
    Height = 20
    Top = 272
    Width = 124
    Anchors = [akTop, akRight]
    Caption = '当前选中图片名称:'
  end
  object lblFileName: TLabel
    Left = 664
    Height = 20
    Top = 326
    Width = 124
    Anchors = [akTop, akRight]
    Caption = '当前选中图片路径:'
  end
  object lblResourceName: TLabel
    Left = 664
    Height = 20
    Top = 380
    Width = 154
    Anchors = [akTop, akRight]
    Caption = '当前选中图片资源名称:'
  end
  object lblUrl: TLabel
    Left = 664
    Height = 20
    Top = 432
    Width = 124
    Anchors = [akTop, akRight]
    Caption = '当前选中图片链接:'
  end
  object OKButton: TButton
    Left = 738
    Height = 31
    Top = 10
    Width = 94
    Anchors = [akTop, akRight]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 738
    Height = 31
    Top = 49
    Width = 94
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object GroupBox1: TGroupBox
    Left = 12
    Height = 690
    Top = 10
    Width = 628
    Anchors = [akTop, akLeft, akRight, akBottom]
    ClientHeight = 665
    ClientWidth = 624
    ParentBackground = False
    TabOrder = 2
    object Add: TButton
      Left = 21
      Height = 29
      Top = 626
      Width = 94
      Anchors = [akLeft, akBottom]
      Caption = '&Add...'
      TabOrder = 0
      OnClick = AddClick
    end
    object Delete: TButton
      Left = 224
      Height = 29
      Top = 626
      Width = 94
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 1
      OnClick = DeleteClick
    end
    object Clear: TButton
      Left = 325
      Height = 29
      Top = 626
      Width = 94
      Anchors = [akLeft, akBottom]
      Caption = '&Clear'
      TabOrder = 2
      OnClick = ClearClick
    end
    object Replace: TButton
      Left = 122
      Height = 29
      Top = 626
      Width = 94
      Anchors = [akLeft, akBottom]
      Caption = '&Replace...'
      Enabled = False
      TabOrder = 3
      OnClick = ReplaceClick
    end
    object ExportPicture: TButton
      Left = 426
      Height = 29
      Top = 626
      Width = 94
      Anchors = [akLeft, akBottom]
      Caption = '&Export...'
      Enabled = False
      TabOrder = 4
      OnClick = ExportPictureClick
    end
    object ListView1: TListView
      Left = 9
      Height = 613
      Top = 15
      Width = 607
      Align = alCustom
      Anchors = [akTop, akLeft, akRight, akBottom]
      Columns = <>
      IconOptions.AutoArrange = True
      LargeImages = ImageList1
      TabOrder = 5
      OnAdvancedCustomDrawItem = ListView1AdvancedCustomDrawItem
      OnClick = ListView1Click
    end
  end
  object edtImageIndex: TEdit
    Left = 670
    Height = 28
    Top = 246
    Width = 174
    Anchors = [akTop, akRight]
    TabOrder = 3
  end
  object edtImageName: TEdit
    Left = 669
    Height = 28
    Top = 298
    Width = 175
    Anchors = [akTop, akRight]
    TabOrder = 4
  end
  object edtFileName: TEdit
    Left = 669
    Height = 28
    Top = 351
    Width = 175
    Anchors = [akTop, akRight]
    TabOrder = 5
  end
  object edtResourceName: TEdit
    Left = 669
    Height = 28
    Top = 405
    Width = 175
    Anchors = [akTop, akRight]
    TabOrder = 6
  end
  object edtUrl: TEdit
    Left = 671
    Height = 28
    Top = 458
    Width = 175
    Anchors = [akTop, akRight]
    TabOrder = 7
  end
  object SaveSelected: TButton
    Left = 706
    Height = 31
    Top = 549
    Width = 100
    Anchors = [akTop, akRight]
    Caption = '保存'
    TabOrder = 8
    OnClick = SaveSelectedClick
  end
  object chkIsClipRound: TCheckBox
    Left = 736
    Height = 24
    Top = 492
    Width = 126
    Anchors = [akTop, akRight]
    Caption = '是否剪裁成圆形'
    TabOrder = 9
  end
  object SaveDialog: TSavePictureDialog
    Filter = 'All (*.bmp;*.ico;*.emf;*.wmf)|*.bmp;*.ico;*.emf;*.wmf|Bitmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf'
    Options = [ofOverwritePrompt, ofEnableSizing]
    Left = 295
    Top = 25
  end
  object OpenDialog: TOpenPictureDialog
    Left = 150
    Top = 20
  end
  object ImageList1: TImageList
    Height = 48
    Width = 48
    Left = 160
    Top = 110
  end
end
