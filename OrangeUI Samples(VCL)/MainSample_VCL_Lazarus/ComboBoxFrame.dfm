object FrameComboBox: TFrameComboBox
  Left = 0
  Top = 0
  Width = 603
  Height = 431
  TabOrder = 0
  object Label1: TLabel
    Left = 98
    Top = 32
    Width = 162
    Height = 13
    Caption = 'Text view mode and single select:'
  end
  object Label2: TLabel
    Left = 98
    Top = 125
    Width = 157
    Height = 13
    Caption = 'Text view mode and multi select:'
  end
  object Label3: TLabel
    Left = 98
    Top = 213
    Width = 156
    Height = 13
    Caption = 'List view mode and single select:'
  end
  object Label4: TLabel
    Left = 98
    Top = 301
    Width = 151
    Height = 13
    Caption = 'List view mode and multi select:'
  end
  object cmbTextAndMultiSelect: TSkinComboBox
    Left = 98
    Top = 144
    Width = 231
    Height = 41
    ParentMouseEvent = True
    DirectUIVisible = False
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
    SelfOwnMaterial.IsTransparent = True
    SelfOwnMaterial.ArrowPicture.IsClipRound = False
    SelfOwnMaterial.ArrowPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.ArrowPicture.FileName = 'arrow_down.svg'
    SelfOwnMaterial.ArrowPicture.SVGFileData = {
      3C3F786D6C2076657273696F6E3D22312E3022207374616E64616C6F6E653D22
      6E6F223F3E3C21444F435459504520737667205055424C494320222D2F2F5733
      432F2F4454442053564720312E312F2F454E222022687474703A2F2F7777772E
      77332E6F72672F47726170686963732F5356472F312E312F4454442F73766731
      312E647464223E3C73766720743D22313638333535303130373335352220636C
      6173733D2269636F6E222076696577426F783D22302030203130323420313032
      34222076657273696F6E3D22312E312220786D6C6E733D22687474703A2F2F77
      77772E77332E6F72672F323030302F7376672220702D69643D22363434372220
      77696474683D22363422206865696768743D2236342220786D6C6E733A786C69
      6E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B
      223E3C7061746820643D224D3531332E373238393638203830312E3534383238
      354C31332E3633393432353939203330312E323534313531632D31382E323432
      3733322D31382E3234323733322D31382E3130363333382D34372E3733373939
      20302E33303638383730312D36352E3834343332376134372E32323635313120
      34372E3232363531312030203020312036362E33383939303420302E32373237
      38386C3433332E313534303631203433332E3335383635324C3934332E363433
      363635203233352E3738343930384134372E3139323431332034372E31393234
      313320302030203120313031302E303333353639203233352E33303735323820
      34362E33303538352034362E333035383520302030203120313031302E353435
      303438203330312E3135313835366C2D3439362E3831363038203530302E3339
      363432397A222066696C6C3D22233743383738452220702D69643D2236343438
      223E3C2F706174683E3C2F7376673E}
    SelfOwnMaterial.DrawArrowPictureParam.IsAutoFit = True
    SelfOwnMaterial.DrawArrowPictureParam.PictureHorzAlign = phaCenter
    SelfOwnMaterial.DrawArrowPictureParam.PictureVertAlign = pvaCenter
    SelfOwnMaterial.DrawArrowPictureParam.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Right = 4.000000000000000000
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Width = 12.000000000000000000
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Enabled = True
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.PositionHorzType = dpphtRight
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.NormalPicture.IsClipRound = False
    SelfOwnMaterial.NormalPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.HoverPicture.IsClipRound = False
    SelfOwnMaterial.HoverPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.FocusedPicture.IsClipRound = False
    SelfOwnMaterial.FocusedPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.DisabledPicture.IsClipRound = False
    SelfOwnMaterial.DisabledPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawHelpTextParam.FontName = 'Tahoma'
    SelfOwnMaterial.DrawHelpTextParam.FontSize = 10
    SelfOwnMaterial.DrawHelpTextParam.FontColor = clGray
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Charset = DEFAULT_CHARSET
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Color = clGray
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Height = -13
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Name = 'Tahoma'
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Style = []
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Alpha = 255
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Color = clGray
    SelfOwnMaterial.DrawHelpTextParam.FontTrimming = fttNone
    SelfOwnMaterial.DrawHelpTextParam.FontHorzAlign = fhaLeft
    SelfOwnMaterial.DrawHelpTextParam.FontVertAlign = fvaCenter
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
    SelfOwnMaterial.DrawTextParam.FontName = 'Tahoma'
    SelfOwnMaterial.DrawTextParam.FontSize = 10
    SelfOwnMaterial.DrawTextParam.DrawFont.Charset = DEFAULT_CHARSET
    SelfOwnMaterial.DrawTextParam.DrawFont.Height = -13
    SelfOwnMaterial.DrawTextParam.DrawFont.Name = 'Tahoma'
    SelfOwnMaterial.DrawTextParam.DrawFont.Style = []
    SelfOwnMaterial.DrawTextParam.DrawFont.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.FontTrimming = fttNone
    SelfOwnMaterial.DrawTextParam.FontHorzAlign = fhaLeft
    SelfOwnMaterial.DrawTextParam.FontVertAlign = fvaCenter
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
    HitTest = True
    MouseDownFocus = False
    ParentBackground = False
    TabOrder = 0
    TabStop = True
    MultiSelect = True
    ViewType = scbvtText
    AutoDropDown = True
    Items.Strings = (
      'Administrator'
      'System'
      'Anoymous'
      'User')
    ItemIndex = -1
    OnlvMultiSelectedItemsNewListItemStyleFrameCacheInit = cmbTextAndMultiSelectlvMultiSelectedItemsNewListItemStyleFrameCacheInit
  end
  object cmbTextAndSingleSelect: TSkinComboBox
    Left = 98
    Top = 64
    Width = 231
    Height = 41
    ParentMouseEvent = True
    DirectUIVisible = False
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
    SelfOwnMaterial.IsTransparent = True
    SelfOwnMaterial.ArrowPicture.IsClipRound = False
    SelfOwnMaterial.ArrowPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.ArrowPicture.FileName = 'arrow_down.svg'
    SelfOwnMaterial.ArrowPicture.SVGFileData = {
      3C3F786D6C2076657273696F6E3D22312E3022207374616E64616C6F6E653D22
      6E6F223F3E3C21444F435459504520737667205055424C494320222D2F2F5733
      432F2F4454442053564720312E312F2F454E222022687474703A2F2F7777772E
      77332E6F72672F47726170686963732F5356472F312E312F4454442F73766731
      312E647464223E3C73766720743D22313638333535303130373335352220636C
      6173733D2269636F6E222076696577426F783D22302030203130323420313032
      34222076657273696F6E3D22312E312220786D6C6E733D22687474703A2F2F77
      77772E77332E6F72672F323030302F7376672220702D69643D22363434372220
      77696474683D22363422206865696768743D2236342220786D6C6E733A786C69
      6E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B
      223E3C7061746820643D224D3531332E373238393638203830312E3534383238
      354C31332E3633393432353939203330312E323534313531632D31382E323432
      3733322D31382E3234323733322D31382E3130363333382D34372E3733373939
      20302E33303638383730312D36352E3834343332376134372E32323635313120
      34372E3232363531312030203020312036362E33383939303420302E32373237
      38386C3433332E313534303631203433332E3335383635324C3934332E363433
      363635203233352E3738343930384134372E3139323431332034372E31393234
      313320302030203120313031302E303333353639203233352E33303735323820
      34362E33303538352034362E333035383520302030203120313031302E353435
      303438203330312E3135313835366C2D3439362E3831363038203530302E3339
      363432397A222066696C6C3D22233743383738452220702D69643D2236343438
      223E3C2F706174683E3C2F7376673E}
    SelfOwnMaterial.DrawArrowPictureParam.IsAutoFit = True
    SelfOwnMaterial.DrawArrowPictureParam.PictureHorzAlign = phaCenter
    SelfOwnMaterial.DrawArrowPictureParam.PictureVertAlign = pvaCenter
    SelfOwnMaterial.DrawArrowPictureParam.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Right = 4.000000000000000000
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Width = 12.000000000000000000
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Enabled = True
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.PositionHorzType = dpphtRight
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.NormalPicture.IsClipRound = False
    SelfOwnMaterial.NormalPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.HoverPicture.IsClipRound = False
    SelfOwnMaterial.HoverPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.FocusedPicture.IsClipRound = False
    SelfOwnMaterial.FocusedPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.DisabledPicture.IsClipRound = False
    SelfOwnMaterial.DisabledPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawHelpTextParam.FontName = 'Tahoma'
    SelfOwnMaterial.DrawHelpTextParam.FontSize = 10
    SelfOwnMaterial.DrawHelpTextParam.FontColor = clGray
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Charset = DEFAULT_CHARSET
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Color = clGray
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Height = -13
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Name = 'Tahoma'
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Style = []
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Alpha = 255
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Color = clGray
    SelfOwnMaterial.DrawHelpTextParam.FontTrimming = fttNone
    SelfOwnMaterial.DrawHelpTextParam.FontHorzAlign = fhaLeft
    SelfOwnMaterial.DrawHelpTextParam.FontVertAlign = fvaCenter
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
    SelfOwnMaterial.DrawTextParam.FontName = 'Tahoma'
    SelfOwnMaterial.DrawTextParam.FontSize = 10
    SelfOwnMaterial.DrawTextParam.DrawFont.Charset = DEFAULT_CHARSET
    SelfOwnMaterial.DrawTextParam.DrawFont.Height = -13
    SelfOwnMaterial.DrawTextParam.DrawFont.Name = 'Tahoma'
    SelfOwnMaterial.DrawTextParam.DrawFont.Style = []
    SelfOwnMaterial.DrawTextParam.DrawFont.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.FontTrimming = fttNone
    SelfOwnMaterial.DrawTextParam.FontHorzAlign = fhaLeft
    SelfOwnMaterial.DrawTextParam.FontVertAlign = fvaCenter
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
    HitTest = True
    MouseDownFocus = False
    ParentBackground = False
    TabOrder = 1
    TabStop = True
    MultiSelect = False
    ViewType = scbvtText
    AutoDropDown = True
    Items.Strings = (
      'Administrator'
      'System'
      'Anoymous'
      'User')
    ItemIndex = -1
    OnlvMultiSelectedItemsNewListItemStyleFrameCacheInit = cmbTextAndMultiSelectlvMultiSelectedItemsNewListItemStyleFrameCacheInit
  end
  object cmbListAndSingleSelect: TSkinComboBox
    Left = 98
    Top = 232
    Width = 231
    Height = 41
    ParentMouseEvent = True
    DirectUIVisible = False
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
    SelfOwnMaterial.IsTransparent = True
    SelfOwnMaterial.ArrowPicture.IsClipRound = False
    SelfOwnMaterial.ArrowPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.ArrowPicture.FileName = 'arrow_down.svg'
    SelfOwnMaterial.ArrowPicture.SVGFileData = {
      3C3F786D6C2076657273696F6E3D22312E3022207374616E64616C6F6E653D22
      6E6F223F3E3C21444F435459504520737667205055424C494320222D2F2F5733
      432F2F4454442053564720312E312F2F454E222022687474703A2F2F7777772E
      77332E6F72672F47726170686963732F5356472F312E312F4454442F73766731
      312E647464223E3C73766720743D22313638333535303130373335352220636C
      6173733D2269636F6E222076696577426F783D22302030203130323420313032
      34222076657273696F6E3D22312E312220786D6C6E733D22687474703A2F2F77
      77772E77332E6F72672F323030302F7376672220702D69643D22363434372220
      77696474683D22363422206865696768743D2236342220786D6C6E733A786C69
      6E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B
      223E3C7061746820643D224D3531332E373238393638203830312E3534383238
      354C31332E3633393432353939203330312E323534313531632D31382E323432
      3733322D31382E3234323733322D31382E3130363333382D34372E3733373939
      20302E33303638383730312D36352E3834343332376134372E32323635313120
      34372E3232363531312030203020312036362E33383939303420302E32373237
      38386C3433332E313534303631203433332E3335383635324C3934332E363433
      363635203233352E3738343930384134372E3139323431332034372E31393234
      313320302030203120313031302E303333353639203233352E33303735323820
      34362E33303538352034362E333035383520302030203120313031302E353435
      303438203330312E3135313835366C2D3439362E3831363038203530302E3339
      363432397A222066696C6C3D22233743383738452220702D69643D2236343438
      223E3C2F706174683E3C2F7376673E}
    SelfOwnMaterial.DrawArrowPictureParam.IsAutoFit = True
    SelfOwnMaterial.DrawArrowPictureParam.PictureHorzAlign = phaCenter
    SelfOwnMaterial.DrawArrowPictureParam.PictureVertAlign = pvaCenter
    SelfOwnMaterial.DrawArrowPictureParam.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Right = 4.000000000000000000
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Width = 12.000000000000000000
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Enabled = True
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.PositionHorzType = dpphtRight
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.NormalPicture.IsClipRound = False
    SelfOwnMaterial.NormalPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.HoverPicture.IsClipRound = False
    SelfOwnMaterial.HoverPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.FocusedPicture.IsClipRound = False
    SelfOwnMaterial.FocusedPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.DisabledPicture.IsClipRound = False
    SelfOwnMaterial.DisabledPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawHelpTextParam.FontName = 'Tahoma'
    SelfOwnMaterial.DrawHelpTextParam.FontSize = 10
    SelfOwnMaterial.DrawHelpTextParam.FontColor = clGray
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Charset = DEFAULT_CHARSET
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Color = clGray
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Height = -13
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Name = 'Tahoma'
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Style = []
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Alpha = 255
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Color = clGray
    SelfOwnMaterial.DrawHelpTextParam.FontTrimming = fttNone
    SelfOwnMaterial.DrawHelpTextParam.FontHorzAlign = fhaLeft
    SelfOwnMaterial.DrawHelpTextParam.FontVertAlign = fvaCenter
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
    SelfOwnMaterial.DrawTextParam.FontName = 'Tahoma'
    SelfOwnMaterial.DrawTextParam.FontSize = 10
    SelfOwnMaterial.DrawTextParam.DrawFont.Charset = DEFAULT_CHARSET
    SelfOwnMaterial.DrawTextParam.DrawFont.Height = -13
    SelfOwnMaterial.DrawTextParam.DrawFont.Name = 'Tahoma'
    SelfOwnMaterial.DrawTextParam.DrawFont.Style = []
    SelfOwnMaterial.DrawTextParam.DrawFont.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.FontTrimming = fttNone
    SelfOwnMaterial.DrawTextParam.FontHorzAlign = fhaLeft
    SelfOwnMaterial.DrawTextParam.FontVertAlign = fvaCenter
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
    HitTest = True
    MouseDownFocus = False
    ParentBackground = False
    TabOrder = 2
    TabStop = True
    MultiSelect = False
    ViewType = scbvtListView
    AutoDropDown = True
    Items.Strings = (
      'Administrator'
      'System'
      'Anoymous'
      'User')
    ItemIndex = -1
    OnlvMultiSelectedItemsNewListItemStyleFrameCacheInit = cmbTextAndMultiSelectlvMultiSelectedItemsNewListItemStyleFrameCacheInit
  end
  object cmbListAndMultiSelect: TSkinComboBox
    Left = 98
    Top = 320
    Width = 231
    Height = 41
    ParentMouseEvent = True
    DirectUIVisible = False
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
    SelfOwnMaterial.IsTransparent = True
    SelfOwnMaterial.ArrowPicture.IsClipRound = False
    SelfOwnMaterial.ArrowPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.ArrowPicture.FileName = 'arrow_down.svg'
    SelfOwnMaterial.ArrowPicture.SVGFileData = {
      3C3F786D6C2076657273696F6E3D22312E3022207374616E64616C6F6E653D22
      6E6F223F3E3C21444F435459504520737667205055424C494320222D2F2F5733
      432F2F4454442053564720312E312F2F454E222022687474703A2F2F7777772E
      77332E6F72672F47726170686963732F5356472F312E312F4454442F73766731
      312E647464223E3C73766720743D22313638333535303130373335352220636C
      6173733D2269636F6E222076696577426F783D22302030203130323420313032
      34222076657273696F6E3D22312E312220786D6C6E733D22687474703A2F2F77
      77772E77332E6F72672F323030302F7376672220702D69643D22363434372220
      77696474683D22363422206865696768743D2236342220786D6C6E733A786C69
      6E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B
      223E3C7061746820643D224D3531332E373238393638203830312E3534383238
      354C31332E3633393432353939203330312E323534313531632D31382E323432
      3733322D31382E3234323733322D31382E3130363333382D34372E3733373939
      20302E33303638383730312D36352E3834343332376134372E32323635313120
      34372E3232363531312030203020312036362E33383939303420302E32373237
      38386C3433332E313534303631203433332E3335383635324C3934332E363433
      363635203233352E3738343930384134372E3139323431332034372E31393234
      313320302030203120313031302E303333353639203233352E33303735323820
      34362E33303538352034362E333035383520302030203120313031302E353435
      303438203330312E3135313835366C2D3439362E3831363038203530302E3339
      363432397A222066696C6C3D22233743383738452220702D69643D2236343438
      223E3C2F706174683E3C2F7376673E}
    SelfOwnMaterial.DrawArrowPictureParam.IsAutoFit = True
    SelfOwnMaterial.DrawArrowPictureParam.PictureHorzAlign = phaCenter
    SelfOwnMaterial.DrawArrowPictureParam.PictureVertAlign = pvaCenter
    SelfOwnMaterial.DrawArrowPictureParam.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Right = 4.000000000000000000
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Width = 12.000000000000000000
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.Enabled = True
    SelfOwnMaterial.DrawArrowPictureParam.DrawRectSetting.PositionHorzType = dpphtRight
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawArrowPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.NormalPicture.IsClipRound = False
    SelfOwnMaterial.NormalPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.HoverPicture.IsClipRound = False
    SelfOwnMaterial.HoverPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.FocusedPicture.IsClipRound = False
    SelfOwnMaterial.FocusedPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.DisabledPicture.IsClipRound = False
    SelfOwnMaterial.DisabledPicture.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.MouseDownEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.MouseOverEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.PushedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.DisabledEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawPictureParam.DrawEffectSetting.FocusedEffect.FixedColor.Alpha = 255
    SelfOwnMaterial.DrawHelpTextParam.FontName = 'Tahoma'
    SelfOwnMaterial.DrawHelpTextParam.FontSize = 10
    SelfOwnMaterial.DrawHelpTextParam.FontColor = clGray
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Charset = DEFAULT_CHARSET
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Color = clGray
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Height = -13
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Name = 'Tahoma'
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.Style = []
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Alpha = 255
    SelfOwnMaterial.DrawHelpTextParam.DrawFont.FontColor.Color = clGray
    SelfOwnMaterial.DrawHelpTextParam.FontTrimming = fttNone
    SelfOwnMaterial.DrawHelpTextParam.FontHorzAlign = fhaLeft
    SelfOwnMaterial.DrawHelpTextParam.FontVertAlign = fvaCenter
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
    SelfOwnMaterial.DrawTextParam.FontName = 'Tahoma'
    SelfOwnMaterial.DrawTextParam.FontSize = 10
    SelfOwnMaterial.DrawTextParam.DrawFont.Charset = DEFAULT_CHARSET
    SelfOwnMaterial.DrawTextParam.DrawFont.Height = -13
    SelfOwnMaterial.DrawTextParam.DrawFont.Name = 'Tahoma'
    SelfOwnMaterial.DrawTextParam.DrawFont.Style = []
    SelfOwnMaterial.DrawTextParam.DrawFont.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.FontTrimming = fttNone
    SelfOwnMaterial.DrawTextParam.FontHorzAlign = fhaLeft
    SelfOwnMaterial.DrawTextParam.FontVertAlign = fvaCenter
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseDownEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseDownEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseOverEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.MouseOverEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.PushedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.PushedEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.DisabledEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.DisabledEffect.FontSize = 12
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.FocusedEffect.FontColor.Alpha = 255
    SelfOwnMaterial.DrawTextParam.DrawEffectSetting.FocusedEffect.FontSize = 12
    HitTest = True
    MouseDownFocus = False
    ParentBackground = False
    TabOrder = 3
    TabStop = True
    MultiSelect = True
    ViewType = scbvtListView
    AutoDropDown = True
    Items.Strings = (
      'Administrator'
      'System'
      'Anoymous'
      'User')
    ItemIndex = -1
    OnlvMultiSelectedItemsNewListItemStyleFrameCacheInit = cmbTextAndMultiSelectlvMultiSelectedItemsNewListItemStyleFrameCacheInit
  end
end
