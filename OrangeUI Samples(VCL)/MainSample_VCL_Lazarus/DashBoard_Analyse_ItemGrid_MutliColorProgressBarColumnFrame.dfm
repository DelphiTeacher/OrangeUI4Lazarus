object FrameItemGrid_MultiColorProgressBarColumn: TFrameItemGrid_MultiColorProgressBarColumn
  Left = 0
  Height = 288
  Top = 0
  Width = 707
  ClientHeight = 288
  ClientWidth = 707
  TabOrder = 0
  object pnlClient: TSkinWinPanel
    Left = 0
    Height = 288
    Top = 0
    Width = 707
    ParentMouseEvent = False
    DirectUIVisible = False
    AlignWithMagins = False
    ComponentTypeUseKind = ctukDefault
    MaterialUseKind = mukSelfOwn
    KeepSelfOwnMaterial = True
    SelfOwnMaterial.BackColor.Color = clWhite
    SelfOwnMaterial.BackColor.IsFill = True
    SelfOwnMaterial.BackColor.FillColor.Alpha = 255
    SelfOwnMaterial.BackColor.IsRound = True
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
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    object lblCaption: TLabel
      Left = 21
      Height = 23
      Top = 10
      Width = 38
      Caption = '渠道'
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      ParentColor = False
      ParentFont = False
    end
    object gridData: TSkinWinItemGrid
      Left = 32
      Height = 218
      Top = 48
      Width = 644
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
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.IsFill = True
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.PullDownRefreshPanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.IsTransparent = False
      SelfOwnMaterial.PullDownRefreshPanelMaterial.IndicatorColor = clBlack
      SelfOwnMaterial.PullDownRefreshPanelMaterial.LoadingPicture.IsClipRound = False
      SelfOwnMaterial.PullDownRefreshPanelMaterial.LoadingPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.FontSize = 8
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawFont.Height = -11
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.FontVertAlign = fvaTop
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.PullDownRefreshPanelMaterial.EnableAutoCenterPosition = False
      SelfOwnMaterial.PullDownRefreshPanelMaterial.EnableLoadingImageBiggerEffect = False
      SelfOwnMaterial.PullDownRefreshPanelMaterial.EnableLoadingImageRotateEffect = True
      SelfOwnMaterial.PullDownRefreshPanelMaterial.LoadingCaption = '正在刷新...'
      SelfOwnMaterial.PullDownRefreshPanelMaterial.DecidedLoadCaption = '松开刷新'
      SelfOwnMaterial.PullDownRefreshPanelMaterial.UnDecidedLoadCaption = '下拉刷新'
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.IsFill = True
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.IsTransparent = False
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.IndicatorColor = clBlack
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.LoadingPicture.IsClipRound = False
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.LoadingPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.FontSize = 8
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawFont.Height = -11
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.FontVertAlign = fvaTop
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DrawLoadingCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.EnableAutoCenterPosition = False
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.EnableLoadingImageBiggerEffect = False
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.EnableLoadingImageRotateEffect = True
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.LoadingCaption = '正在加载...'
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.DecidedLoadCaption = '松开加载更多'
      SelfOwnMaterial.PullUpLoadMorePanelMaterial.UnDecidedLoadCaption = '上拉加载更多'
      SelfOwnMaterial.DrawEmptyContentCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawEmptyContentCaptionParam.FontSize = 8
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawEmptyContentCaptionParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawEmptyContentCaptionParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.FontSize = 8
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentDescriptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawEmptyContentPictureParam.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawEmptyContentPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.Color = clWhite
      SelfOwnMaterial.DrawSpaceParam.IsFill = False
      SelfOwnMaterial.DrawSpaceParam.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawSpaceParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.IsSimpleDrawGroupRoundRect = False
      SelfOwnMaterial.IsSimpleDrawGroupBeginDevide = True
      SelfOwnMaterial.IsSimpleDrawGroupEndDevide = True
      SelfOwnMaterial.DrawGroupBeginDevideParam.Color = 15592941
      SelfOwnMaterial.DrawGroupBeginDevideParam.IsFill = False
      SelfOwnMaterial.DrawGroupBeginDevideParam.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupBeginDevideParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.Color = 15592941
      SelfOwnMaterial.DrawGroupBackColorParam.IsFill = False
      SelfOwnMaterial.DrawGroupBackColorParam.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupBackColorParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.GroupBackPicture.IsClipRound = False
      SelfOwnMaterial.GroupBackPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackPictureParam.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawGroupBackPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.Color = 15592941
      SelfOwnMaterial.DrawGroupEndDevideParam.IsFill = False
      SelfOwnMaterial.DrawGroupEndDevideParam.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawGroupEndDevideParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.IsFill = True
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.IsTransparent = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.IsAutoPosition = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.FontSize = 8
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawCheckBoxColorMaterial.NormalUnCheckedPicture.IsClipRound = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.NormalUnCheckedPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.NormalCheckedPicture.IsClipRound = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.NormalCheckedPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.HoverUnCheckedPicture.IsClipRound = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.HoverUnCheckedPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.HoverCheckedPicture.IsClipRound = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.HoverCheckedPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DisabledCheckedPicture.IsClipRound = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DisabledCheckedPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DisabledUnCheckedPicture.IsClipRound = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DisabledUnCheckedPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawPictureParam.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.CheckChar = '✔'
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.IsFill = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.PenColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.PathActions = <>
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.MouseDownEffect.PenColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.MouseOverEffect.PenColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.PushedEffect.PenWidth = 2
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.PushedEffect.PenColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.PushedEffect.EffectTypes = [dppetPenWidthChange]
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.DisabledEffect.PenColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckStateParam.DrawEffectSetting.FocusedEffect.PenColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.Color = clWhite
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.IsFill = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.BorderWidth = 2
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckRectParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.IsSimpleDrawCheckState = True
      SelfOwnMaterial.DrawCheckBoxColorMaterial.IsSimpleDrawCheckChar = False
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.FontSize = 8
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawCheckBoxColorMaterial.DrawCheckCharParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.ColumnHeaderColor = 16249582
      SelfOwnMaterial.FixedColumnHeaderColor = clWhite
      SelfOwnMaterial.IndicatorHeaderBackColor = clWhite
      SelfOwnMaterial.RowBackColor = clWhite
      SelfOwnMaterial.EvenRowBackColor = clWhite
      SelfOwnMaterial.OddRowBackColor = clWhite
      SelfOwnMaterial.SelectedRowBackColor = clBlack
      SelfOwnMaterial.SelectedEvenRowBackColor = clBlack
      SelfOwnMaterial.SelectedOddRowBackColor = clBlack
      SelfOwnMaterial.IsDiffOddAndEvenRowBackColor = False
      SelfOwnMaterial.FixedColsRowBackColor = clWhite
      SelfOwnMaterial.FixedColsEvenRowBackColor = clWhite
      SelfOwnMaterial.FixedColsOddRowBackColor = clWhite
      SelfOwnMaterial.IsDiffFixedColsRowBackColor = False
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.Color = clWhite
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.IsFill = False
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorHeaderBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.IsFill = False
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.Color = clWhite
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.IsFill = False
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.Color = clWhite
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.IsFill = False
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorFooterCellBackColorMaterial.IsDiffOddAndEven = False
      SelfOwnMaterial.IsDrawIndicatorNumber = True
      SelfOwnMaterial.DrawIndicatorNumberParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawIndicatorNumberParam.FontSize = 8
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorNumberParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawIndicatorNumberParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawIndicatorNumberParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorNumberParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.IsFill = False
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.Color = clWhite
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.IsFill = False
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.Color = clWhite
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.IsFill = False
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawIndicatorCellBackColorMaterial.IsDiffOddAndEven = False
      SelfOwnMaterial.DrawIndicatorDevideMaterial.IsDrawRowLine = False
      SelfOwnMaterial.DrawIndicatorDevideMaterial.IsDrawRowBeginLine = False
      SelfOwnMaterial.DrawIndicatorDevideMaterial.IsDrawRowEndLine = False
      SelfOwnMaterial.DrawIndicatorDevideMaterial.IsDrawColLine = False
      SelfOwnMaterial.DrawIndicatorDevideMaterial.IsDrawColBeginLine = False
      SelfOwnMaterial.DrawIndicatorDevideMaterial.IsDrawColEndLine = False
      SelfOwnMaterial.DrawIndicatorDevideMaterial.DrawRowLineParam.Color.Alpha = 255
      SelfOwnMaterial.DrawIndicatorDevideMaterial.DrawRowLineParam.Color.Color = -2830136
      SelfOwnMaterial.DrawIndicatorDevideMaterial.DrawRowLineParam.PenWidth = 1
      SelfOwnMaterial.DrawIndicatorDevideMaterial.DrawColLineParam.Color.Alpha = 255
      SelfOwnMaterial.DrawIndicatorDevideMaterial.DrawColLineParam.Color.Color = -2830136
      SelfOwnMaterial.DrawIndicatorDevideMaterial.DrawColLineParam.PenWidth = 1
      SelfOwnMaterial.ColumnHeaderBackColor.Color = 16249582
      SelfOwnMaterial.ColumnHeaderBackColor.IsFill = True
      SelfOwnMaterial.ColumnHeaderBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.FillColor.Color = 16249582
      SelfOwnMaterial.ColumnHeaderBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.ColumnHeaderBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.Color = clWhite
      SelfOwnMaterial.FixedColumnHeaderBackColor.IsFill = False
      SelfOwnMaterial.FixedColumnHeaderBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FixedColumnHeaderBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.DrawColumnMaterial.BackColor.IsFill = False
      SelfOwnMaterial.DrawColumnMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawColumnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.IsTransparent = False
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.FontColor = clBlack
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawFont.Height = -16
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.FontVertAlign = fvaCenter
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawRectSetting.Left = 10
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawRectSetting.Enabled = True
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawRectSetting.SizeType = dpstPixel
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCaptionParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.FontSize = 10
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.FontColor = clBlack
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawFont.Height = -13
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.FontVertAlign = fvaCenter
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawRectSetting.Left = 10
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawRectSetting.Enabled = True
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawRectSetting.SizeType = dpstPixel
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellPictureParam.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.FontName = 'Tahoma'
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.FontSize = 8
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.FontColor = clBlack
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawFont.Height = -11
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.FontTrimming = fttNone
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawFooterCellTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.FontName = 'Tahoma'
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.FontSize = 11
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.FontColor = clSilver
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawFont.Color = clSilver
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawFont.Height = -15
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawFont.Name = 'Tahoma'
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawFont.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawFont.FontColor.Color = clSilver
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.FontTrimming = fttNone
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.FontHorzAlign = fhaLeft
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.FontVertAlign = fvaTop
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawRectSetting.Left = 10
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawRectSetting.Top = 35
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawRectSetting.Enabled = True
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawRectSetting.SizeType = dpstPixel
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawEffectSetting.MouseDownEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawEffectSetting.MouseOverEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawEffectSetting.PushedEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawEffectSetting.DisabledEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
      SelfOwnMaterial.DrawColumnMaterial.DrawCellText1Param.DrawEffectSetting.FocusedEffect.FontSize = 12
      SelfOwnMaterial.DrawColumnDevideMaterial.IsDrawRowLine = False
      SelfOwnMaterial.DrawColumnDevideMaterial.IsDrawRowBeginLine = False
      SelfOwnMaterial.DrawColumnDevideMaterial.IsDrawRowEndLine = False
      SelfOwnMaterial.DrawColumnDevideMaterial.IsDrawColLine = False
      SelfOwnMaterial.DrawColumnDevideMaterial.IsDrawColBeginLine = False
      SelfOwnMaterial.DrawColumnDevideMaterial.IsDrawColEndLine = False
      SelfOwnMaterial.DrawColumnDevideMaterial.DrawRowLineParam.Color.Alpha = 255
      SelfOwnMaterial.DrawColumnDevideMaterial.DrawRowLineParam.Color.Color = -2830136
      SelfOwnMaterial.DrawColumnDevideMaterial.DrawRowLineParam.PenWidth = 1
      SelfOwnMaterial.DrawColumnDevideMaterial.DrawColLineParam.Color.Alpha = 255
      SelfOwnMaterial.DrawColumnDevideMaterial.DrawColLineParam.Color.Color = -2830136
      SelfOwnMaterial.DrawColumnDevideMaterial.DrawColLineParam.PenWidth = 1
      SelfOwnMaterial.DrawSelectedCellBackColorParam.Color = clWhite
      SelfOwnMaterial.DrawSelectedCellBackColorParam.IsFill = False
      SelfOwnMaterial.DrawSelectedCellBackColorParam.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.DrawSelectedCellBackColorParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.RowBackColorMaterial.BackColor.IsFill = False
      SelfOwnMaterial.RowBackColorMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.IsFill = True
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Color = 16446449
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.EffectTypes = [drpetFillColorChange, drpetIsFillChange]
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.Color = clWhite
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.IsFill = False
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.Color = clWhite
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.IsFill = False
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.IsDiffOddAndEven = False
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.Color = clWhite
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.IsFill = False
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.Color = clWhite
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.IsFill = False
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.Color = clWhite
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.IsFill = False
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.RowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.RowBackColorMaterial.IsDiffFixedCols = False
      SelfOwnMaterial.DrawGridCellDevideMaterial.IsDrawRowLine = True
      SelfOwnMaterial.DrawGridCellDevideMaterial.IsDrawRowBeginLine = False
      SelfOwnMaterial.DrawGridCellDevideMaterial.IsDrawRowEndLine = True
      SelfOwnMaterial.DrawGridCellDevideMaterial.IsDrawColLine = False
      SelfOwnMaterial.DrawGridCellDevideMaterial.IsDrawColBeginLine = False
      SelfOwnMaterial.DrawGridCellDevideMaterial.IsDrawColEndLine = False
      SelfOwnMaterial.DrawGridCellDevideMaterial.DrawRowLineParam.Color.Alpha = 255
      SelfOwnMaterial.DrawGridCellDevideMaterial.DrawRowLineParam.Color.Color = 15592941
      SelfOwnMaterial.DrawGridCellDevideMaterial.DrawRowLineParam.PenWidth = 1
      SelfOwnMaterial.DrawGridCellDevideMaterial.DrawColLineParam.Color.Alpha = 255
      SelfOwnMaterial.DrawGridCellDevideMaterial.DrawColLineParam.Color.Color = -2830136
      SelfOwnMaterial.DrawGridCellDevideMaterial.DrawColLineParam.PenWidth = 1
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.IsFill = False
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.Color = clWhite
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.IsFill = False
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.OddBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.Color = clWhite
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.IsFill = False
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.EvenBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.IsDiffOddAndEven = False
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.Color = clWhite
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.IsFill = False
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.Color = clWhite
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.IsFill = False
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsOddBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.Color = clWhite
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.IsFill = False
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      SelfOwnMaterial.FooterRowBackColorMaterial.FixedColsEvenBackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      SelfOwnMaterial.FooterRowBackColorMaterial.IsDiffFixedCols = False
      HitTest = False
      MouseDownFocus = False
      Anchors = [akTop, akLeft, akRight, akBottom]
      ParentBackground = False
      TabOrder = 0
      OnResize = gridDataResize
      VertScrollBar.Left = 632
      VertScrollBar.Height = 218
      VertScrollBar.Top = 0
      VertScrollBar.Width = 12
      VertScrollBar.ParentMouseEvent = False
      VertScrollBar.DirectUIVisible = False
      VertScrollBar.AlignWithMagins = False
      VertScrollBar.ComponentTypeUseKind = ctukDefault
      VertScrollBar.MaterialUseKind = mukSelfOwn
      VertScrollBar.KeepSelfOwnMaterial = True
      VertScrollBar.SelfOwnMaterial.BackColor.Color = clWhite
      VertScrollBar.SelfOwnMaterial.BackColor.IsFill = True
      VertScrollBar.SelfOwnMaterial.BackColor.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      VertScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.IsTransparent = False
      VertScrollBar.SelfOwnMaterial.ThumbBtnMinSize = 40
      VertScrollBar.SelfOwnMaterial.ThumbBtnDrawSize = 4
      VertScrollBar.SelfOwnMaterial.IsDefaultDrawThumbBtn = True
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.Color = 11513775
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.IsFill = False
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.FillColor.Color = 11513775
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      VertScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      VertScrollBar.HitTest = False
      VertScrollBar.MouseDownFocus = False
      VertScrollBar.ParentBackground = False
      VertScrollBar.Properties.AutoSize = False
      VertScrollBar.Properties.Kind = sbVertical
      VertScrollBar.Properties.SmallChange = 1
      VertScrollBar.Properties.LargeChange = 10
      VertScrollBar.Properties.CanOverRangeTypes = [cortMin, cortMax]
      HorzScrollBar.Left = 0
      HorzScrollBar.Height = 12
      HorzScrollBar.Top = 206
      HorzScrollBar.Width = 644
      HorzScrollBar.ParentMouseEvent = False
      HorzScrollBar.DirectUIVisible = False
      HorzScrollBar.AlignWithMagins = False
      HorzScrollBar.ComponentTypeUseKind = ctukDefault
      HorzScrollBar.MaterialUseKind = mukSelfOwn
      HorzScrollBar.KeepSelfOwnMaterial = True
      HorzScrollBar.SelfOwnMaterial.BackColor.Color = clWhite
      HorzScrollBar.SelfOwnMaterial.BackColor.IsFill = True
      HorzScrollBar.SelfOwnMaterial.BackColor.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      HorzScrollBar.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.IsTransparent = False
      HorzScrollBar.SelfOwnMaterial.ThumbBtnMinSize = 40
      HorzScrollBar.SelfOwnMaterial.ThumbBtnDrawSize = 4
      HorzScrollBar.SelfOwnMaterial.IsDefaultDrawThumbBtn = True
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.Color = 11513775
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.IsFill = False
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.FillColor.Color = 11513775
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      HorzScrollBar.SelfOwnMaterial.ThumbBtnRectParam.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      HorzScrollBar.HitTest = False
      HorzScrollBar.MouseDownFocus = False
      HorzScrollBar.ParentBackground = False
      HorzScrollBar.Properties.AutoSize = False
      HorzScrollBar.Properties.Kind = sbHorizontal
      HorzScrollBar.Properties.SmallChange = 1
      HorzScrollBar.Properties.LargeChange = 10
      HorzScrollBar.Properties.CanOverRangeTypes = []
      ScrollControlCorner.Left = 632
      ScrollControlCorner.Height = 12
      ScrollControlCorner.Top = 206
      ScrollControlCorner.Width = 12
      ScrollControlCorner.ParentMouseEvent = False
      ScrollControlCorner.DirectUIVisible = False
      ScrollControlCorner.AlignWithMagins = False
      ScrollControlCorner.ComponentTypeUseKind = ctukDefault
      ScrollControlCorner.MaterialUseKind = mukSelfOwn
      ScrollControlCorner.KeepSelfOwnMaterial = True
      ScrollControlCorner.SelfOwnMaterial.BackColor.Color = clWhite
      ScrollControlCorner.SelfOwnMaterial.BackColor.IsFill = True
      ScrollControlCorner.SelfOwnMaterial.BackColor.FillColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.BorderColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColorChangeType = cctNone
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseDownEffect.BorderColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColorChangeType = cctNone
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.MouseOverEffect.BorderColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.FillColorChangeType = cctNone
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.FillColorChangeType = cctNone
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.DisabledEffect.BorderColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.FillColorChangeType = cctNone
      ScrollControlCorner.SelfOwnMaterial.BackColor.DrawEffectSetting.FocusedEffect.BorderColor.Alpha = 255
      ScrollControlCorner.SelfOwnMaterial.IsTransparent = False
      ScrollControlCorner.HitTest = False
      ScrollControlCorner.MouseDownFocus = False
      ScrollControlCorner.ParentBackground = False
      Properties.ContentWidth = -1
      Properties.ContentHeight = -1
      Properties.EnableAutoPullDownRefreshPanel = False
      Properties.EnableAutoPullUpLoadMorePanel = False
      Properties.VertCanOverRangeTypes = [cortMin, cortMax]
      Properties.HorzCanOverRangeTypes = []
      Properties.VertScrollBarShowType = sbstHide
      Properties.HorzScrollBarShowType = sbstNone
      Properties.MultiSelect = False
      Properties.IsAutoSelected = True
      Properties.ItemHeight = 40
      Properties.ItemSpaceType = sistDefault
      Properties.SelectedItemHeight = -1
      Properties.ItemHeightCalcType = isctSeparate
      Properties.ItemPanDragGestureDirection = ipdgdtLeft
      Properties.IsEmptyContent = False
      Properties.EmptyContentPicture.IsClipRound = False
      Properties.EmptyContentPicture.FixedColor.Alpha = 255
      Properties.ReadOnly = True
      Properties.IsRowSelect = True
      Properties.Columns = <      
        item
          Caption = '渠道'
          Width = 0.4
          Visible = True
          ReadOnly = False
          AutoSize = False
          AutoSizeMinWidth = 100
          Footer.ValueType = fvtNone
          FooterValueType = fvtNone
          IsUseDefaultGridColumnMaterial = True
          IsUseDefaultGridColumnCaptionParam = True
          BindItemFieldName = 'ItemCaption'
        end      
        item
          Caption = '访问量'
          Width = 0.2
          Visible = True
          ReadOnly = False
          AutoSize = False
          AutoSizeMinWidth = 100
          Footer.ValueType = fvtNone
          FooterValueType = fvtNone
          IsUseDefaultGridColumnMaterial = True
          IsUseDefaultGridColumnCaptionParam = True
          BindItemFieldName = 'ItemDetail'
        end      
        item
          DefaultItemStyle = 'ProgressBar'
          Width = 0.4
          Visible = True
          ReadOnly = False
          AutoSize = False
          AutoSizeMinWidth = 100
          Footer.ValueType = fvtNone
          FooterValueType = fvtNone
          IsUseDefaultGridColumnMaterial = True
          IsUseDefaultGridColumnCaptionParam = True
          BindItemFieldName = 'ItemDetail1'
        end>
      Properties.FixedCols = 0
      Properties.ColumnsHeaderHeight = 40
      Properties.RowHeight = 40
      Properties.FooterRowCount = 0
      Properties.FooterRowHeight = 30
      Properties.Items.Data = {
        140000040000000400000000005C00000018160000001A000000000042696E61
        72794F626A65637400000000E9FD010000000000FFFF0E000000000E00080000
        004865696768740000E9FD01000000000000000000F0BF0E000000000C000800
        00005769647468000000E9FD0100000000000000F0BF15000000001000040000
        0056697369626C6500E9FD010000000000FFFFFFFF04000000000A0000000000
        4E616D6500000000E9FD07000000000800040000005461670000000000000000
        0007000000000A00040000005461673100000000E9FD00000000150000000010
        0004000000436865636B656400E9FD0100000000000000000007000000001200
        040000004974656D547970650000000000000000E9FD0000000018120000000A
        001A00000049636F6E00000000E9FD54447261775069637475726500000000E9
        FD010000000000FFFF0400000000140000000000496D6167654E616D65000000
        00000000E9FD0100170000000018000000000047494646696C65446174610000
        000000E9FD010000000000170000000018000000000053564746696C65446174
        610000000000E9FD01000000000004000000000A0E0A0000004E616D65000000
        00E9FDE5908DE7A7B00000E9FD0100000049636F6E00000000E9FD0400000000
        100E0E00000043617074696F6E00E9FD010000000000E6A087E9A2980000E9FD
        01000000E59BBEE6A0870000E9FD0100000004000000000C0E0000000047726F
        7570000000E9FD0100E58886E7BB840000E9FD010000000700000000120E0400
        0000526F77436F756E740000000000000000E9FDE8A18CE695B00000E9FD0100
        0000010000000700000000120E04000000436F6C436F756E7400000000000000
        00E9FDE58897E695B00000E9FD01000000010000000700000000121404000000
        526F77496E6465780000000000000000E9FDE8A18CE4B88BE6A0870000000000
        0000E9FD0100FFFFFFFF0700000000121404000000436F6C496E646578000000
        0000000000E9FDE58897E4B88BE6A08700000000000000E9FD0100FFFFFFFF07
        00000000201A0400000050696374757265447261775479706500E9FD01000000
        0000FFFFFFFFFFFFFFFFE7BB98E588B6E7B1BBE59E8B00000000E9FD01000000
        0000FFFF000000000700000000161A04000000496D616765496E646578000000
        000000E9FD01000000E59BBEE78987E4B88BE6A08700000000E9FD0100000000
        00FFFFFFFFFFFF0400000000141A00000000496D6167654E616D650000000000
        0000E9FD0100E59BBEE78987E5908DE7A7B000000000E9FD010000000000FFFF
        040000000012200000000046696C654E616D650000000000000000E9FDE59BBE
        E78987E69687E4BBB6E5908D00E9FD010000000000FFFFFFFFFFFFFFFF040000
        00001A26000000005265736F757263654E616D6500000000E9FD010000000000
        FFFFE59BBEE78987E8B584E6BA90E5908DE7A7B0000000000000E9FD01000000
        0000FFFFFFFFFFFF0400000000081A0000000055726C0000000000E59BBEE789
        87E993BEE68EA500000000E9FD010000000000FFFF1500000000182C04000000
        4973436C6970526F756E640000000000E9FD010000000000E698AFE590A6E589
        AAE8A381E68890E59C86E5BDA20000000F16544472617750696374757265436F
        6C6C6563000000001900000000161A050000004669786564436F6C6F72000000
        000000000001000000E8B083E695B4E9A29CE889B200000000E9FD0100000000
        00FFFF0000002000181200000008001A00000050696300000000005444726177
        5069637475726500000000E9FD010000000000FFFF0400000000140000000000
        496D6167654E616D6500000000000000E9FD0100170000000018000000000047
        494646696C65446174610000000000E9FD010000000000170000000018000000
        000053564746696C65446174610000000000E9FD01000000000004000000000A
        0E080000004E616D6500000000E9FDE5908DE7A7B00000E9FD01000000506963
        00000000000400000000100E0E00000043617074696F6E00E9FD010000000000
        E6A087E9A2980000E9FD01000000E59BBEE789870000E9FD0100000004000000
        000C0E0000000047726F7570000000E9FD0100E58886E7BB840000E9FD010000
        000700000000120E04000000526F77436F756E740000000000000000E9FDE8A1
        8CE695B00000E9FD01000000010000000700000000120E04000000436F6C436F
        756E740000000000000000E9FDE58897E695B00000E9FD010000000100000007
        00000000121404000000526F77496E6465780000000000000000E9FDE8A18CE4
        B88BE6A08700000000000000E9FD0100FFFFFFFF070000000012140400000043
        6F6C496E6465780000000000000000E9FDE58897E4B88BE6A087000000000000
        00E9FD0100FFFFFFFF0700000000201A04000000506963747572654472617754
        79706500E9FD010000000000FFFFFFFFFFFFFFFFE7BB98E588B6E7B1BBE59E8B
        00000000E9FD010000000000FFFF000000000700000000161A04000000496D61
        6765496E646578000000000000E9FD01000000E59BBEE78987E4B88BE6A08700
        000000E9FD010000000000FFFFFFFFFFFF0400000000141A00000000496D6167
        654E616D6500000000000000E9FD0100E59BBEE78987E5908DE7A7B000000000
        E9FD010000000000FFFF040000000012200000000046696C654E616D65000000
        0000000000E9FDE59BBEE78987E69687E4BBB6E5908D00E9FD010000000000FF
        FFFFFFFFFFFFFF04000000001A26000000005265736F757263654E616D650000
        0000E9FD010000000000FFFFE59BBEE78987E8B584E6BA90E5908DE7A7B00000
        00000000E9FD010000000000FFFFFFFFFFFF0400000000081A0000000055726C
        0000000000E59BBEE78987E993BEE68EA500000000E9FD010000000000FFFF15
        00000000182C040000004973436C6970526F756E640000000000E9FD01000000
        0000E698AFE590A6E589AAE8A381E68890E59C86E5BDA20000000F1654447261
        7750696374757265436F6C6C6563000000001900000000161A05000000466978
        6564436F6C6F72000000000000000001000000E8B083E695B4E9A29CE889B200
        000000E9FD010000000000FFFF00000020050700000000120004000000497465
        6D547970650000000000000000E9FD0000000015000000001C00040000004175
        746F53697A655769647468000000E9FD010000000000FFFFFFFF000000001500
        0000001E00040000004175746F53697A65486569676874000000000100000000
        00FFFFFFFFFFFF00000000040000000010000E00000043617074696F6E00E9FD
        010000000000E79BB4E99480006C6F720000000004000000000E000C00000044
        657461696C0000E9FD01000000322C3035300000000000000004000000001000
        0600000044657461696C3100E9FD010000000000363000000000040000000010
        000000000044657461696C3200E9FD0100000000000400000000100000000000
        44657461696C3300E9FD01000000000004000000001000000000004465746169
        6C3400E9FD010000000000040000000010000000000044657461696C3500E9FD
        010000000000040000000010000000000044657461696C3600E9FD0100000000
        0007000000001400040000004163636573736F727900000000000000E9FD0100
        0000000018160000001A000000000042696E6172794F626A65637400000000E9
        FD010000000000FFFF0E000000000E00080000004865696768740000E9FD0100
        0000000000000000F0BF0E000000000C00080000005769647468000000E9FD01
        00000000000000F0BF150000000010000400000056697369626C6500E9FD0100
        00000000FFFFFFFF04000000000A00000000004E616D6500000000E9FD070000
        000008000400000054616700000000000000000007000000000A000400000054
        61673100000000E9FD000000001500000000100004000000436865636B656400
        E9FD0100000000000000000007000000001200040000004974656D5479706500
        00000000000000E9FD0000000018120000000A001A00000049636F6E00000000
        E9FD54447261775069637475726500000000E9FD010000000000FFFF04000000
        00140000000000496D6167654E616D6500000000000000E9FD01001700000000
        18000000000047494646696C65446174610000000000E9FD0100000000001700
        00000018000000000053564746696C65446174610000000000E9FD0100000000
        0004000000000A0E0A0000004E616D6500000000E9FDE5908DE7A7B00000E9FD
        0100000049636F6E00000000E9FD0400000000100E0E00000043617074696F6E
        00E9FD010000000000E6A087E9A2980000E9FD01000000E59BBEE6A0870000E9
        FD0100000004000000000C0E0000000047726F7570000000E9FD0100E58886E7
        BB840000E9FD010000000700000000120E04000000526F77436F756E74000000
        0000000000E9FDE8A18CE695B00000E9FD01000000010000000700000000120E
        04000000436F6C436F756E740000000000000000E9FDE58897E695B00000E9FD
        01000000010000000700000000121404000000526F77496E6465780000000000
        000000E9FDE8A18CE4B88BE6A08700000000000000E9FD0100FFFFFFFF070000
        0000121404000000436F6C496E6465780000000000000000E9FDE58897E4B88B
        E6A08700000000000000E9FD0100FFFFFFFF0700000000201A04000000506963
        74757265447261775479706500E9FD010000000000FFFFFFFFFFFFFFFFE7BB98
        E588B6E7B1BBE59E8B00000000E9FD010000000000FFFF000000000700000000
        161A04000000496D616765496E646578000000000000E9FD01000000E59BBEE7
        8987E4B88BE6A08700000000E9FD010000000000FFFFFFFFFFFF040000000014
        1A00000000496D6167654E616D6500000000000000E9FD0100E59BBEE78987E5
        908DE7A7B000000000E9FD010000000000FFFF04000000001220000000004669
        6C654E616D650000000000000000E9FDE59BBEE78987E69687E4BBB6E5908D00
        E9FD010000000000FFFFFFFFFFFFFFFF04000000001A26000000005265736F75
        7263654E616D6500000000E9FD010000000000FFFFE59BBEE78987E8B584E6BA
        90E5908DE7A7B0000000000000E9FD010000000000FFFFFFFFFFFF0400000000
        081A0000000055726C0000000000E59BBEE78987E993BEE68EA500000000E9FD
        010000000000FFFF1500000000182C040000004973436C6970526F756E640000
        000000E9FD010000000000E698AFE590A6E589AAE8A381E68890E59C86E5BDA2
        0000000F16544472617750696374757265436F6C6C6563000000001900000000
        161A050000004669786564436F6C6F72000000000000000001000000E8B083E6
        95B4E9A29CE889B200000000E9FD010000000000FFFF00000020011812000000
        08001A000000506963000000000054447261775069637475726500000000E9FD
        010000000000FFFF0400000000140000000000496D6167654E616D6500000000
        000000E9FD0100170000000018000000000047494646696C6544617461000000
        0000E9FD010000000000170000000018000000000053564746696C6544617461
        0000000000E9FD01000000000004000000000A0E080000004E616D6500000000
        E9FDE5908DE7A7B00000E9FD0100000050696300000000000400000000100E0E
        00000043617074696F6E00E9FD010000000000E6A087E9A2980000E9FD010000
        00E59BBEE789870000E9FD0100000004000000000C0E0000000047726F757000
        0000E9FD0100E58886E7BB840000E9FD010000000700000000120E0400000052
        6F77436F756E740000000000000000E9FDE8A18CE695B00000E9FD0100000001
        0000000700000000120E04000000436F6C436F756E740000000000000000E9FD
        E58897E695B00000E9FD01000000010000000700000000121404000000526F77
        496E6465780000000000000000E9FDE8A18CE4B88BE6A08700000000000000E9
        FD0100FFFFFFFF0700000000121404000000436F6C496E646578000000000000
        0000E9FDE58897E4B88BE6A08700000000000000E9FD0100FFFFFFFF07000000
        00201A0400000050696374757265447261775479706500E9FD010000000000FF
        FFFFFFFFFFFFFFE7BB98E588B6E7B1BBE59E8B00000000E9FD010000000000FF
        FF000000000700000000161A04000000496D616765496E646578000000000000
        E9FD01000000E59BBEE78987E4B88BE6A08700000000E9FD010000000000FFFF
        FFFFFFFF0400000000141A00000000496D6167654E616D6500000000000000E9
        FD0100E59BBEE78987E5908DE7A7B000000000E9FD010000000000FFFF040000
        000012200000000046696C654E616D650000000000000000E9FDE59BBEE78987
        E69687E4BBB6E5908D00E9FD010000000000FFFFFFFFFFFFFFFF04000000001A
        26000000005265736F757263654E616D6500000000E9FD010000000000FFFFE5
        9BBEE78987E8B584E6BA90E5908DE7A7B0000000000000E9FD010000000000FF
        FFFFFFFFFF0400000000081A0000000055726C0000000000E59BBEE78987E993
        BEE68EA500000000E9FD010000000000FFFF1500000000182C04000000497343
        6C6970526F756E640000000000E9FD010000000000E698AFE590A6E589AAE8A3
        81E68890E59C86E5BDA20000000F16544472617750696374757265436F6C6C65
        63000000001900000000161A050000004669786564436F6C6F72000000000000
        000001000000E8B083E695B4E9A29CE889B200000000E9FD010000000000FFFF
        00000020DE07000000001200040000004974656D547970650000000000000000
        E9FD0000000015000000001C00040000004175746F53697A6557696474680000
        00E9FD010000000000FFFFFFFF0000000015000000001E00040000004175746F
        53697A6548656967687400000000010000000000FFFFFFFFFFFF000000000400
        00000010001A00000043617074696F6E00E9FD010000000000E6909CE7B4A2E5
        B9B3E58FB00000000060EDC11B00000000000004000000000E000C0000004465
        7461696C0000E9FD01000000312C343035000000000000000400000000100006
        00000044657461696C3100E9FD01000000000034300000000004000000001000
        0000000044657461696C3200E9FD010000000000040000000010000000000044
        657461696C3300E9FD010000000000040000000010000000000044657461696C
        3400E9FD010000000000040000000010000000000044657461696C3500E9FD01
        0000000000040000000010000000000044657461696C3600E9FD010000000000
        07000000001400040000004163636573736F727900000000000000E9FD010000
        00000018160000001A000000000042696E6172794F626A65637400000000E9FD
        010000000000FFFF0E000000000E00080000004865696768740000E9FD010000
        00000000000000F0BF0E000000000C00080000005769647468000000E9FD0100
        000000000000F0BF150000000010000400000056697369626C6500E9FD010000
        000000FFFFFFFF04000000000A00000000004E616D6500000000E9FD07000000
        0008000400000054616700000000000000000007000000000A00040000005461
        673100000000E9FD000000001500000000100004000000436865636B656400E9
        FD0100000000000000000007000000001200040000004974656D547970650000
        000000000000E9FD0000000018120000000A001A00000049636F6E00000000E9
        FD54447261775069637475726500000000E9FD010000000000FFFF0400000000
        140000000000496D6167654E616D6500000000000000E9FD0100170000000018
        000000000047494646696C65446174610000000000E9FD010000000000170000
        000018000000000053564746696C65446174610000000000E9FD010000000000
        04000000000A0E0A0000004E616D6500000000E9FDE5908DE7A7B00000E9FD01
        00000049636F6E00000000E9FD0400000000100E0E00000043617074696F6E00
        E9FD010000000000E6A087E9A2980000E9FD01000000E59BBEE6A0870000E9FD
        0100000004000000000C0E0000000047726F7570000000E9FD0100E58886E7BB
        840000E9FD010000000700000000120E04000000526F77436F756E7400000000
        00000000E9FDE8A18CE695B00000E9FD01000000010000000700000000120E04
        000000436F6C436F756E740000000000000000E9FDE58897E695B00000E9FD01
        000000010000000700000000121404000000526F77496E646578000000000000
        0000E9FDE8A18CE4B88BE6A08700000000000000E9FD0100FFFFFFFF07000000
        00121404000000436F6C496E6465780000000000000000E9FDE58897E4B88BE6
        A08700000000000000E9FD0100FFFFFFFF0700000000201A0400000050696374
        757265447261775479706500E9FD010000000000FFFFFFFFFFFFFFFFE7BB98E5
        88B6E7B1BBE59E8B00000000E9FD010000000000FFFF00000000070000000016
        1A04000000496D616765496E646578000000000000E9FD01000000E59BBEE789
        87E4B88BE6A08700000000E9FD010000000000FFFFFFFFFFFF0400000000141A
        00000000496D6167654E616D6500000000000000E9FD0100E59BBEE78987E590
        8DE7A7B000000000E9FD010000000000FFFF040000000012200000000046696C
        654E616D650000000000000000E9FDE59BBEE78987E69687E4BBB6E5908D00E9
        FD010000000000FFFFFFFFFFFFFFFF04000000001A26000000005265736F7572
        63654E616D6500000000E9FD010000000000FFFFE59BBEE78987E8B584E6BA90
        E5908DE7A7B0000000000000E9FD010000000000FFFFFFFFFFFF040000000008
        1A0000000055726C0000000000E59BBEE78987E993BEE68EA500000000E9FD01
        0000000000FFFF1500000000182C040000004973436C6970526F756E64000000
        0000E9FD010000000000E698AFE590A6E589AAE8A381E68890E59C86E5BDA200
        00000F16544472617750696374757265436F6C6C656300000000190000000016
        1A050000004669786564436F6C6F72000000000000000001000000E8B083E695
        B4E9A29CE889B200000000E9FD010000000000FFFF00000020C5181200000008
        001A000000506963000000000054447261775069637475726500000000E9FD01
        0000000000FFFF0400000000140000000000496D6167654E616D650000000000
        0000E9FD0100170000000018000000000047494646696C654461746100000000
        00E9FD010000000000170000000018000000000053564746696C654461746100
        00000000E9FD01000000000004000000000A0E080000004E616D6500000000E9
        FDE5908DE7A7B00000E9FD0100000050696300000000000400000000100E0E00
        000043617074696F6E00E9FD010000000000E6A087E9A2980000E9FD01000000
        E59BBEE789870000E9FD0100000004000000000C0E0000000047726F75700000
        00E9FD0100E58886E7BB840000E9FD010000000700000000120E04000000526F
        77436F756E740000000000000000E9FDE8A18CE695B00000E9FD010000000100
        00000700000000120E04000000436F6C436F756E740000000000000000E9FDE5
        8897E695B00000E9FD01000000010000000700000000121404000000526F7749
        6E6465780000000000000000E9FDE8A18CE4B88BE6A08700000000000000E9FD
        0100FFFFFFFF0700000000121404000000436F6C496E64657800000000000000
        00E9FDE58897E4B88BE6A08700000000000000E9FD0100FFFFFFFF0700000000
        201A0400000050696374757265447261775479706500E9FD010000000000FFFF
        FFFFFFFFFFFFE7BB98E588B6E7B1BBE59E8B00000000E9FD010000000000FFFF
        000000000700000000161A04000000496D616765496E646578000000000000E9
        FD01000000E59BBEE78987E4B88BE6A08700000000E9FD010000000000FFFFFF
        FFFFFF0400000000141A00000000496D6167654E616D6500000000000000E9FD
        0100E59BBEE78987E5908DE7A7B000000000E9FD010000000000FFFF04000000
        0012200000000046696C654E616D650000000000000000E9FDE59BBEE78987E6
        9687E4BBB6E5908D00E9FD010000000000FFFFFFFFFFFFFFFF04000000001A26
        000000005265736F757263654E616D6500000000E9FD010000000000FFFFE59B
        BEE78987E8B584E6BA90E5908DE7A7B0000000000000E9FD010000000000FFFF
        FFFFFFFF0400000000081A0000000055726C0000000000E59BBEE78987E993BE
        E68EA500000000E9FD010000000000FFFF1500000000182C040000004973436C
        6970526F756E640000000000E9FD010000000000E698AFE590A6E589AAE8A381
        E68890E59C86E5BDA20000000F16544472617750696374757265436F6C6C6563
        000000001900000000161A050000004669786564436F6C6F7200000000000000
        0001000000E8B083E695B4E9A29CE889B200000000E9FD010000000000FFFF00
        0000205D07000000001200040000004974656D547970650000000000000000E9
        FD0000000015000000001C00040000004175746F53697A655769647468000000
        E9FD010000000000FFFFFFFF0000000015000000001E00040000004175746F53
        697A6548656967687400000000010000000000FFFFFFFFFFFF00000000040000
        000010001A00000043617074696F6E00E9FD010000000000E69C8BE58F8BE68E
        A8E88D90000000000000000000000000000004000000000E0008000000446574
        61696C0000E9FD01000000373530000000000004000000001000060000004465
        7461696C3100E9FD010000000000323000000000040000000010000000000044
        657461696C3200E9FD010000000000040000000010000000000044657461696C
        3300E9FD010000000000040000000010000000000044657461696C3400E9FD01
        0000000000040000000010000000000044657461696C3500E9FD010000000000
        040000000010000000000044657461696C3600E9FD0100000000000700000000
        1400040000004163636573736F727900000000000000E9FD0100000000001816
        0000001A000000000042696E6172794F626A65637400000000E9FD0100000000
        00FFFF0E000000000E00080000004865696768740000E9FD0100000000000000
        0000F0BF0E000000000C00080000005769647468000000E9FD01000000000000
        00F0BF150000000010000400000056697369626C6500E9FD010000000000FFFF
        FFFF04000000000A00000000004E616D6500000000E9FD070000000008000400
        000054616700000000000000000007000000000A000400000054616731000000
        00E9FD000000001500000000100004000000436865636B656400E9FD01000000
        00000000000007000000001200040000004974656D5479706500000000000000
        00E9FD0000000018120000000A001A00000049636F6E00000000E9FD54447261
        775069637475726500000000E9FD010000000000FFFF04000000001400000000
        00496D6167654E616D6500000000000000E9FD01001700000000180000000000
        47494646696C65446174610000000000E9FD0100000000001700000000180000
        00000053564746696C65446174610000000000E9FD0100000000000400000000
        0A0E0A0000004E616D6500000000E9FDE5908DE7A7B00000E9FD010000004963
        6F6E00000000E9FD0400000000100E0E00000043617074696F6E00E9FD010000
        000000E6A087E9A2980000E9FD01000000E59BBEE6A0870000E9FD0100000004
        000000000C0E0000000047726F7570000000E9FD0100E58886E7BB840000E9FD
        010000000700000000120E04000000526F77436F756E740000000000000000E9
        FDE8A18CE695B00000E9FD01000000010000000700000000120E04000000436F
        6C436F756E740000000000000000E9FDE58897E695B00000E9FD010000000100
        00000700000000121404000000526F77496E6465780000000000000000E9FDE8
        A18CE4B88BE6A08700000000000000E9FD0100FFFFFFFF070000000012140400
        0000436F6C496E6465780000000000000000E9FDE58897E4B88BE6A087000000
        00000000E9FD0100FFFFFFFF0700000000201A04000000506963747572654472
        61775479706500E9FD010000000000FFFFFFFFFFFFFFFFE7BB98E588B6E7B1BB
        E59E8B00000000E9FD010000000000FFFF000000000700000000161A04000000
        496D616765496E646578000000000000E9FD01000000E59BBEE78987E4B88BE6
        A08700000000E9FD010000000000FFFFFFFFFFFF0400000000141A0000000049
        6D6167654E616D6500000000000000E9FD0100E59BBEE78987E5908DE7A7B000
        000000E9FD010000000000FFFF040000000012200000000046696C654E616D65
        0000000000000000E9FDE59BBEE78987E69687E4BBB6E5908D00E9FD01000000
        0000FFFFFFFFFFFFFFFF04000000001A26000000005265736F757263654E616D
        6500000000E9FD010000000000FFFFE59BBEE78987E8B584E6BA90E5908DE7A7
        B0000000000000E9FD010000000000FFFFFFFFFFFF0400000000081A00000000
        55726C0000000000E59BBEE78987E993BEE68EA500000000E9FD010000000000
        FFFF1500000000182C040000004973436C6970526F756E640000000000E9FD01
        0000000000E698AFE590A6E589AAE8A381E68890E59C86E5BDA20000000F1654
        4472617750696374757265436F6C6C6563000000001900000000161A05000000
        4669786564436F6C6F72000000000000000001000000E8B083E695B4E9A29CE8
        89B200000000E9FD010000000000FFFF00000020F7181200000008001A000000
        506963000000000054447261775069637475726500000000E9FD010000000000
        FFFF0400000000140000000000496D6167654E616D6500000000000000E9FD01
        00170000000018000000000047494646696C65446174610000000000E9FD0100
        00000000170000000018000000000053564746696C65446174610000000000E9
        FD01000000000004000000000A0E080000004E616D6500000000E9FDE5908DE7
        A7B00000E9FD0100000050696300000000000400000000100E0E000000436170
        74696F6E00E9FD010000000000E6A087E9A2980000E9FD01000000E59BBEE789
        870000E9FD0100000004000000000C0E0000000047726F7570000000E9FD0100
        E58886E7BB840000E9FD010000000700000000120E04000000526F77436F756E
        740000000000000000E9FDE8A18CE695B00000E9FD0100000001000000070000
        0000120E04000000436F6C436F756E740000000000000000E9FDE58897E695B0
        0000E9FD01000000010000000700000000121404000000526F77496E64657800
        00000000000000E9FDE8A18CE4B88BE6A08700000000000000E9FD0100FFFFFF
        FF0700000000121404000000436F6C496E6465780000000000000000E9FDE588
        97E4B88BE6A08700000000000000E9FD0100FFFFFFFF0700000000201A040000
        0050696374757265447261775479706500E9FD010000000000FFFFFFFFFFFFFF
        FFE7BB98E588B6E7B1BBE59E8B00000000E9FD010000000000FFFF0000000007
        00000000161A04000000496D616765496E646578000000000000E9FD01000000
        E59BBEE78987E4B88BE6A08700000000E9FD010000000000FFFFFFFFFFFF0400
        000000141A00000000496D6167654E616D6500000000000000E9FD0100E59BBE
        E78987E5908DE7A7B000000000E9FD010000000000FFFF040000000012200000
        000046696C654E616D650000000000000000E9FDE59BBEE78987E69687E4BBB6
        E5908D00E9FD010000000000FFFFFFFFFFFFFFFF04000000001A260000000052
        65736F757263654E616D6500000000E9FD010000000000FFFFE59BBEE78987E8
        B584E6BA90E5908DE7A7B0000000000000E9FD010000000000FFFFFFFFFFFF04
        00000000081A0000000055726C0000000000E59BBEE78987E993BEE68EA50000
        0000E9FD010000000000FFFF1500000000182C040000004973436C6970526F75
        6E640000000000E9FD010000000000E698AFE590A6E589AAE8A381E68890E59C
        86E5BDA20000000F16544472617750696374757265436F6C6C65630000000019
        00000000161A050000004669786564436F6C6F72000000000000000001000000
        E8B083E695B4E9A29CE889B200000000E9FD010000000000FFFF000000203007
        000000001200040000004974656D547970650000000000000000E9FD00000000
        15000000001C00040000004175746F53697A655769647468000000E9FD010000
        000000FFFFFFFF0000000015000000001E00040000004175746F53697A654865
        6967687400000000010000000000FFFFFFFFFFFF00000000040000000010001A
        00000043617074696F6E00E9FD010000000000E7A4BEE4BAA4E5B9B3E58FB000
        000000655549436F6E74726F6C04000000000E000800000044657461696C0000
        E9FD010000003534300000000000040000000010000600000044657461696C31
        00E9FD010000000000313000000000040000000010000000000044657461696C
        3200E9FD010000000000040000000010000000000044657461696C3300E9FD01
        0000000000040000000010000000000044657461696C3400E9FD010000000000
        040000000010000000000044657461696C3500E9FD0100000000000400000000
        10000000000044657461696C3600E9FD01000000000007000000001400040000
        004163636573736F727900000000000000E9FD010000000000
      }
      Properties.Items = <      
        item
          Selected = False
          Checked = False
          Height = -1
          Visible = True
          Color = clBlack
          Width = 644
          Icon.IsClipRound = False
          Icon.FixedColor.Alpha = 255
          Icon.FixedColor.Color = clDefault
          Pic.IsClipRound = False
          Pic.FixedColor.Alpha = 255
          Pic.FixedColor.Color = clDefault
          Tag = 0
          Tag1 = 0
          ItemType = sitDefault
          Caption = '直销'
          Detail = '2,050'
          Detail1 = '60'
          Accessory = satNone
          AutoSizeWidth = False
          AutoSizeHeight = False
        end      
        item
          Selected = False
          Checked = False
          Height = -1
          Visible = True
          Color = clBlack
          Width = 644
          Icon.IsClipRound = False
          Icon.FixedColor.Alpha = 255
          Icon.FixedColor.Color = clDefault
          Pic.IsClipRound = False
          Pic.FixedColor.Alpha = 255
          Pic.FixedColor.Color = clDefault
          Tag = 0
          Tag1 = 0
          ItemType = sitDefault
          Caption = '搜索平台'
          Detail = '1,405'
          Detail1 = '40'
          Accessory = satNone
          AutoSizeWidth = False
          AutoSizeHeight = False
        end      
        item
          Selected = False
          Checked = False
          Height = -1
          Visible = True
          Color = clBlack
          Width = 644
          Icon.IsClipRound = False
          Icon.FixedColor.Alpha = 255
          Icon.FixedColor.Color = clDefault
          Pic.IsClipRound = False
          Pic.FixedColor.Alpha = 255
          Pic.FixedColor.Color = clDefault
          Tag = 0
          Tag1 = 0
          ItemType = sitDefault
          Caption = '朋友推荐'
          Detail = '750'
          Detail1 = '20'
          Accessory = satNone
          AutoSizeWidth = False
          AutoSizeHeight = False
        end      
        item
          Selected = False
          Checked = False
          Height = -1
          Visible = True
          Color = clBlack
          Width = 644
          Icon.IsClipRound = False
          Icon.FixedColor.Alpha = 255
          Icon.FixedColor.Color = clDefault
          Pic.IsClipRound = False
          Pic.FixedColor.Alpha = 255
          Pic.FixedColor.Color = clDefault
          Tag = 0
          Tag1 = 0
          ItemType = sitDefault
          Caption = '社交平台'
          Detail = '540'
          Detail1 = '10'
          Accessory = satNone
          AutoSizeWidth = False
          AutoSizeHeight = False
        end>
      OnPrepareDrawItem = gridDataPrepareDrawItem
      OnCustomPaintCellBegin = gridDataCustomPaintCellBegin
    end
    object SkinWinButton1: TSkinWinButton
      Left = 587
      Height = 40
      Top = 3
      Width = 89
      ParentMouseEvent = False
      DirectUIVisible = False
      AlignWithMagins = False
      ComponentTypeUseKind = ctukDefault
      MaterialUseKind = mukRef
      KeepSelfOwnMaterial = False
      MaterialName = 'btnTransparentDropDownButtonMaterial'
      SelfOwnMaterial.BackColor.Color = clWhite
      SelfOwnMaterial.BackColor.IsFill = True
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
      SelfOwnMaterial.IsTransparent = False
      SelfOwnMaterial.ArrowPicture.IsClipRound = False
      SelfOwnMaterial.ArrowPicture.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
      SelfOwnMaterial.IsAutoCenterIconAndCaption = False
      SelfOwnMaterial.DrawDetailParam.FontName = 'default'
      SelfOwnMaterial.DrawDetailParam.FontSize = 12
      SelfOwnMaterial.DrawDetailParam.DrawFont.Height = -16
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
      SelfOwnMaterial.DrawDetail1Param.FontName = 'default'
      SelfOwnMaterial.DrawDetail1Param.FontSize = 12
      SelfOwnMaterial.DrawDetail1Param.DrawFont.Height = -16
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
      SelfOwnMaterial.DrawHelpTextParam.FontName = 'default'
      SelfOwnMaterial.DrawHelpTextParam.FontSize = 12
      SelfOwnMaterial.DrawHelpTextParam.FontColor = clGray
      SelfOwnMaterial.DrawHelpTextParam.DrawFont.Color = clGray
      SelfOwnMaterial.DrawHelpTextParam.DrawFont.Height = -16
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
      SelfOwnMaterial.DrawCaptionParam.FontName = 'default'
      SelfOwnMaterial.DrawCaptionParam.FontSize = 12
      SelfOwnMaterial.DrawCaptionParam.DrawFont.Height = -16
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
      RefMaterial = dmEasyServiceCommonMaterial.btnTransparentDropDownButtonMaterial
      HitTest = False
      MouseDownFocus = False
      Anchors = [akTop, akRight]
      Visible = False
      ParentBackground = False
      TabOrder = 1
      Caption = '导出'
      Text = '导出'
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
end
