object frmLogin: TfrmLogin
  Left = 843
  Height = 401
  Top = 503
  Width = 457
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = '登录'
  ClientHeight = 401
  ClientWidth = 457
  Color = 4602417
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '2.2.6.0'
  object pnlBottom: TSkinWinPanel
    Left = 0
    Height = 230
    Top = 171
    Width = 457
    ParentMouseEvent = False
    DirectUIVisible = False
    AlignWithMagins = False
    ComponentTypeUseKind = ctukDefault
    MaterialUseKind = mukSelfOwn
    KeepSelfOwnMaterial = True
    SelfOwnMaterial.BackColor.Color = 16251639
    SelfOwnMaterial.BackColor.IsFill = True
    SelfOwnMaterial.BackColor.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.FillColor.Color = 16251639
    SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.IsTransparent = False
    SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
    SelfOwnMaterial.DrawCaptionParam.FontSize = 8
    SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
    SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
    SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
    SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
    SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaTop
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
    HitTest = False
    MouseDownFocus = False
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object pnlUser: TSkinWinPanel
      Left = 130
      Height = 33
      Top = 32
      Width = 200
      ParentMouseEvent = False
      DirectUIVisible = False
      AlignWithMagins = False
      ComponentTypeUseKind = ctukDefault
      MaterialUseKind = mukSelfOwn
      KeepSelfOwnMaterial = True
      SelfOwnMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.BackColor.IsFill = True
      SelfOwnMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.BorderColor.Color = clSilver
      SelfOwnMaterial.BackColor.BorderWidth = 1
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.IsTransparent = False
      SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.FontSize = 8
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      HitTest = False
      MouseDownFocus = False
      ParentBackground = False
      TabOrder = 0
      object edtUser: TEdit
        Left = 0
        Height = 33
        Top = 0
        Width = 200
        Align = alClient
        TabOrder = 0
      end
    end
    object pnlPassword: TSkinWinPanel
      Left = 130
      Height = 33
      Top = 64
      Width = 200
      ParentMouseEvent = False
      DirectUIVisible = False
      AlignWithMagins = False
      ComponentTypeUseKind = ctukDefault
      MaterialUseKind = mukSelfOwn
      KeepSelfOwnMaterial = True
      SelfOwnMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.BackColor.IsFill = True
      SelfOwnMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.BorderColor.Color = clSilver
      SelfOwnMaterial.BackColor.BorderWidth = 1
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.IsTransparent = False
      SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.FontSize = 8
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      HitTest = False
      MouseDownFocus = False
      ParentBackground = False
      TabOrder = 1
      object edtPassword: TEdit
        Left = 0
        Height = 33
        Top = 0
        Width = 200
        Align = alClient
        TabOrder = 0
      end
    end
    object chkRememberPassword: TCheckBox
      Left = 130
      Height = 21
      Top = 103
      Width = 70
      Caption = '记住密码'
      TabOrder = 2
    end
    object lblForget: TSkinWinLabel
      Left = 233
      Height = 22
      Top = 103
      Width = 94
      ParentMouseEvent = False
      DirectUIVisible = False
      AlignWithMagins = False
      ComponentTypeUseKind = ctukDefault
      MaterialUseKind = mukSelfOwn
      KeepSelfOwnMaterial = True
      SelfOwnMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.BackColor.IsFill = False
      SelfOwnMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.IsTransparent = True
      SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.FontSize = 8
      SelfOwnMaterial.DrawCaptionParam.FontColor = 10796800
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Color = 10796800
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Color = 10796800
      SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaRight
      SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      HitTest = False
      MouseDownFocus = False
      ParentBackground = False
      TabOrder = 3
      Caption = '忘记密码'
      Text = '忘记密码'
      Properties.AutoSize = False
    end
    object btnLogin: TSkinWinButton
      Left = 133
      Height = 40
      Top = 144
      Width = 194
      ParentMouseEvent = False
      DirectUIVisible = False
      AlignWithMagins = False
      ComponentTypeUseKind = ctukDefault
      MaterialUseKind = mukSelfOwn
      KeepSelfOwnMaterial = True
      SelfOwnMaterial.BackColor.Color = 10796800
      SelfOwnMaterial.BackColor.IsFill = True
      SelfOwnMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.FillColor.Color = 10796800
      SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.IsTransparent = True
      SelfOwnMaterial.ArrowPicture.IsClipRound = False
      SelfOwnMaterial.ArrowPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.IsAutoCenterIconAndCaption = False
      SelfOwnMaterial.DrawDetailParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawDetailParam.FontSize = 8
      SelfOwnMaterial.DrawDetailParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawDetailParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawDetailParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetailParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawDetailParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawDetailParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetailParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawDetail1Param.FontName = 'Tahoma'
      SelfOwnMaterial.DrawDetail1Param.FontSize = 8
      SelfOwnMaterial.DrawDetail1Param.DrawFont.Height = -11
      SelfOwnMaterial.DrawDetail1Param.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawDetail1Param.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetail1Param.FontTrimming = fttNone
      SelfOwnMaterial.DrawDetail1Param.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawDetail1Param.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawDetail1Param.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawHelpTextParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawHelpTextParam.FontSize = 8
      SelfOwnMaterial.DrawHelpTextParam.FontColor = clGray
      SelfOwnMaterial.DrawHelpTextParam.DrawFont.Color = clGray
      SelfOwnMaterial.DrawHelpTextParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawHelpTextParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Color = clGray
      SelfOwnMaterial.DrawHelpTextParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawHelpTextParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawHelpTextParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawHelpTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawIconParam.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawIconParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawIconParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawIconParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawIconParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawIconParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.FontColor = clWhite
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Color = clWhite
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -16
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Color = clWhite
      SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaCenter
      SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaCenter
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.NormalPicture.IsClipRound = False
      SelfOwnMaterial.NormalPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.HoverPicture.IsClipRound = False
      SelfOwnMaterial.HoverPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DownPicture.IsClipRound = False
      SelfOwnMaterial.DownPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DisabledPicture.IsClipRound = False
      SelfOwnMaterial.DisabledPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.FocusedPicture.IsClipRound = False
      SelfOwnMaterial.FocusedPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.PushedPicture.IsClipRound = False
      SelfOwnMaterial.PushedPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawPictureParam.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
      HitTest = False
      MouseDownFocus = False
      ParentBackground = False
      TabOrder = 4
      OnClick = btnLoginClick
      Caption = '登录'
      Text = '登录'
      Properties.AutoSize = False
      Properties.IsAutoPush = False
      Properties.IsPushed = False
      Properties.Icon.IsClipRound = False
      Properties.Icon.FixedColor.Alpha = 255
      Properties.PushedIcon.IsClipRound = False
      Properties.PushedIcon.FixedColor.Alpha = 255
      Properties.ButtonIndex = -1
      Properties.PushedGroupIndex = 0
    end
  end
  object lblForget1: TSkinWinLabel
    Left = 0
    Height = 171
    Top = 0
    Width = 457
    ParentMouseEvent = False
    DirectUIVisible = False
    AlignWithMagins = False
    ComponentTypeUseKind = ctukDefault
    MaterialUseKind = mukSelfOwn
    KeepSelfOwnMaterial = True
    SelfOwnMaterial.BackColor.Color = clWhite
    SelfOwnMaterial.BackColor.IsFill = False
    SelfOwnMaterial.BackColor.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
    SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
    SelfOwnMaterial.IsTransparent = True
    SelfOwnMaterial.DrawCaptionParam.FontName = 'Tahoma'
    SelfOwnMaterial.DrawCaptionParam.FontStyle = [fsBold]
    SelfOwnMaterial.DrawCaptionParam.FontSize = 28
    SelfOwnMaterial.DrawCaptionParam.FontColor = clWhite
    SelfOwnMaterial.DrawCaptionParam.DrawFont.Color = clWhite
    SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -37
    SelfOwnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
    SelfOwnMaterial.DrawCaptionParam.DrawFont.Style = [fsBold]
    SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawFont.FontColor.Color = clWhite
    SelfOwnMaterial.DrawCaptionParam.FontTrimming = fttNone
    SelfOwnMaterial.DrawCaptionParam.FontHorzAlign = fhaCenter
    SelfOwnMaterial.DrawCaptionParam.FontVertAlign = fvaCenter
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
    HitTest = False
    MouseDownFocus = False
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    Caption = '系统登录'
    Text = '系统登录'
    Properties.AutoSize = False
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 208
    Top = 72
  end
end
