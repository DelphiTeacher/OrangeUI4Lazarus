  //convert pas to utf8 by ¥

/// <summary>
///   <para>
///     图形公共单元
///   </para>
///   <para>
///    Graphic public unit
///   </para>
/// </summary>
unit uGraphicCommon;


interface
{$I FrameWork.inc}



uses
  Classes,
  SysUtils,
  Math,
  Graphics,
  Types,//定义了TRectF

  //{$IFDEF DELPHIXE4}
  //System.Types,//定义了TRectF
  //{$ENDIF}
  //
  //{$IFDEF FPC}
  //{$ENDIF}

  {$IFDEF VCL}
  {$IFDEF MSWINDOWS}
  Windows,
  {$ENDIF}
  Messages,
  Controls,
  {$ENDIF}
  {$IFDEF FMX}
  UITypes,
  FMX.Styles.Objects,
  //FMX.Graphics,
  FMX.Types,
  FMX.Objects,
  {$ENDIF}

  uBaseLog,
  uFuncCommon;


const
  //颜色常量
  NullColor = {$IFNDEF FMX}0{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Null{$ENDIF};

  {$IFDEF DELPHI}
  //Delphi下才有这种颜色
  AliceblueColor = {$IFNDEF FMX}clWebAliceblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Aliceblue{$ENDIF};
  AntiquewhiteColor = {$IFNDEF FMX}clWebAntiquewhite{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Antiquewhite{$ENDIF};
  AquaColor = {$IFNDEF FMX}clAqua{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Aqua{$ENDIF};
  AquamarineColor = {$IFNDEF FMX}clWebAquamarine{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Aquamarine{$ENDIF};
  AzureColor = {$IFNDEF FMX}clWebAzure{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Azure{$ENDIF};
  BeigeColor = {$IFNDEF FMX}clWebBeige{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Beige{$ENDIF};
  BisqueColor = {$IFNDEF FMX}clWebBisque{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Bisque{$ENDIF};
  BlanchedalmondColor = {$IFNDEF FMX}clWebBlanchedalmond{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Blanchedalmond{$ENDIF};
  BluevioletColor = {$IFNDEF FMX}clWebBlueviolet{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Blueviolet{$ENDIF};
  BrownColor = {$IFNDEF FMX}clWebBrown{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Brown{$ENDIF};
  BurlywoodColor = {$IFNDEF FMX}clWebBurlywood{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Burlywood{$ENDIF};
  CadetblueColor = {$IFNDEF FMX}clWebCadetblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Cadetblue{$ENDIF};
  ChartreuseColor = {$IFNDEF FMX}clWebChartreuse{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Chartreuse{$ENDIF};
  ChocolateColor = {$IFNDEF FMX}clWebChocolate{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Chocolate{$ENDIF};
  CoralColor = {$IFNDEF FMX}clWebCoral{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Coral{$ENDIF};
  CornflowerblueColor = {$IFNDEF FMX}clWebCornflowerblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Cornflowerblue{$ENDIF};
  CornsilkColor = {$IFNDEF FMX}clWebCornsilk{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Cornsilk{$ENDIF};
  CrimsonColor = {$IFNDEF FMX}clWebCrimson{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Crimson{$ENDIF};
  CyanColor = {$IFNDEF FMX}clWebCyan{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Cyan{$ENDIF};
  DarkblueColor = {$IFNDEF FMX}clWebDarkblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkblue{$ENDIF};
  DarkcyanColor = {$IFNDEF FMX}clWebDarkcyan{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkcyan{$ENDIF};
  DarkgoldenrodColor = {$IFNDEF FMX}clWebDarkgoldenrod{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkgoldenrod{$ENDIF};
  DarkgrayColor = {$IFNDEF FMX}clWebDarkgray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkgray{$ENDIF};

  DarkgreenColor = {$IFNDEF FMX}clWebDarkgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkgreen{$ENDIF};
//  DarkgreyColor = {$IFNDEF FMX}clWebDarkgrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkgrey{$ENDIF};
  DarkkhakiColor = {$IFNDEF FMX}clWebDarkkhaki{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkkhaki{$ENDIF};
  DarkmagentaColor = {$IFNDEF FMX}clWebDarkmagenta{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkmagenta{$ENDIF};
  DarkolivegreenColor = {$IFNDEF FMX}clWebDarkolivegreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkolivegreen{$ENDIF};
  DarkorangeColor = {$IFNDEF FMX}clWebDarkorange{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkorange{$ENDIF};
  DarkorchidColor = {$IFNDEF FMX}clWebDarkorchid{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkorchid{$ENDIF};
  DarkredColor = {$IFNDEF FMX}clWebDarkred{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkred{$ENDIF};
  DarksalmonColor = {$IFNDEF FMX}clWebDarksalmon{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darksalmon{$ENDIF};
  DarkseagreenColor = {$IFNDEF FMX}clWebDarkseagreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkseagreen{$ENDIF};
  DarkslateblueColor = {$IFNDEF FMX}clWebDarkslateblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkslateblue{$ENDIF};
  DarkslategrayColor = {$IFNDEF FMX}clWebDarkslategray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkslategray{$ENDIF};
//  DarkslategreyColor = {$IFNDEF FMX}clWebDarkslategrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkslategrey{$ENDIF};
  DarkturquoiseColor = {$IFNDEF FMX}clWebDarkturquoise{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkturquoise{$ENDIF};
  DarkvioletColor = {$IFNDEF FMX}clWebDarkviolet{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkviolet{$ENDIF};
  DeeppinkColor = {$IFNDEF FMX}clWebDeeppink{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Deeppink{$ENDIF};
  DeepskyblueColor = {$IFNDEF FMX}clWebDeepskyblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Deepskyblue{$ENDIF};
  DimgrayColor = {$IFNDEF FMX}clWebDimgray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Dimgray{$ENDIF};
//  DimgreyColor = {$IFNDEF FMX}clWebDimgrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Dimgrey{$ENDIF};
  DodgerblueColor = {$IFNDEF FMX}clWebDodgerblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Dodgerblue{$ENDIF};
  FirebrickColor = {$IFNDEF FMX}clWebFirebrick{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Firebrick{$ENDIF};
  FloralwhiteColor = {$IFNDEF FMX}clWebFloralwhite{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Floralwhite{$ENDIF};
  ForestgreenColor = {$IFNDEF FMX}clWebForestgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Forestgreen{$ENDIF};
  FuchsiaColor = {$IFNDEF FMX}clWebFuchsia{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Fuchsia{$ENDIF};
  GainsboroColor = {$IFNDEF FMX}clWebGainsboro{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Gainsboro{$ENDIF};
  GhostwhiteColor = {$IFNDEF FMX}clWebGhostwhite{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Ghostwhite{$ENDIF};
  GoldColor = {$IFNDEF FMX}clWebGold{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Gold{$ENDIF};
  GoldenrodColor = {$IFNDEF FMX}clWebGoldenrod{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Goldenrod{$ENDIF};
  GreenyellowColor = {$IFNDEF FMX}clWebGreenyellow{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Greenyellow{$ENDIF};
//  GreyColor = {$IFNDEF FMX}clWebGrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Grey{$ENDIF};
  HoneydewColor = {$IFNDEF FMX}clWebHoneydew{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Honeydew{$ENDIF};
  HotpinkColor = {$IFNDEF FMX}clWebHotpink{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Hotpink{$ENDIF};
  IndianredColor = {$IFNDEF FMX}clWebIndianred{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Indianred{$ENDIF};
  IndigoColor = {$IFNDEF FMX}clWebIndigo{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Indigo{$ENDIF};
  IvoryColor = {$IFNDEF FMX}clWebIvory{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Ivory{$ENDIF};
  KhakiColor = {$IFNDEF FMX}clWebKhaki{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Khaki{$ENDIF};
  LavenderColor = {$IFNDEF FMX}clWebLavender{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lavender{$ENDIF};
  LavenderblushColor = {$IFNDEF FMX}clWebLavenderblush{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lavenderblush{$ENDIF};
  LawngreenColor = {$IFNDEF FMX}clWebLawngreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lawngreen{$ENDIF};
  LemonchiffonColor = {$IFNDEF FMX}clWebLemonchiffon{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lemonchiffon{$ENDIF};
  LightblueColor = {$IFNDEF FMX}clWebLightblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightblue{$ENDIF};
  LightcoralColor = {$IFNDEF FMX}clWebLightcoral{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightcoral{$ENDIF};
  LightcyanColor = {$IFNDEF FMX}clWebLightcyan{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightcyan{$ENDIF};
  LightgoldenrodyellowColor = {$IFNDEF FMX}clWebLightgoldenrodyellow{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightgoldenrodyellow{$ENDIF};

  //  LightgrayColor = {$IFNDEF FMX}clWebLightgray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightgray{$ENDIF};
    LightgreenColor = {$IFNDEF FMX}clWebLightgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightgreen{$ENDIF};
    LightgreyColor = {$IFNDEF FMX}clWebLightgrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightgrey{$ENDIF};
    LightpinkColor = {$IFNDEF FMX}clWebLightpink{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightpink{$ENDIF};
    LightsalmonColor = {$IFNDEF FMX}clWebLightsalmon{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightsalmon{$ENDIF};
    LightseagreenColor = {$IFNDEF FMX}clWebLightseagreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightseagreen{$ENDIF};
    LightskyblueColor = {$IFNDEF FMX}clWebLightskyblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightskyblue{$ENDIF};
    LightslategrayColor = {$IFNDEF FMX}clWebLightslategray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightslategray{$ENDIF};
  //  LightslategreyColor = {$IFNDEF FMX}clWebLightslategrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightslategrey{$ENDIF};
    LightsteelblueColor = {$IFNDEF FMX}clWebLightsteelblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightsteelblue{$ENDIF};
    LightyellowColor = {$IFNDEF FMX}clWebLightyellow{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightyellow{$ENDIF};
    LimegreenColor = {$IFNDEF FMX}clWebLimegreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Limegreen{$ENDIF};
    LinenColor = {$IFNDEF FMX}clWebLinen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Linen{$ENDIF};
    MagentaColor = {$IFNDEF FMX}clWebMagenta{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Magenta{$ENDIF};
    MediumaquamarineColor = {$IFNDEF FMX}clWebMediumaquamarine{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumaquamarine{$ENDIF};
    MediumblueColor = {$IFNDEF FMX}clWebMediumblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumblue{$ENDIF};
    MediumorchidColor = {$IFNDEF FMX}clWebMediumorchid{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumorchid{$ENDIF};
    MediumpurpleColor = {$IFNDEF FMX}clWebMediumpurple{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumpurple{$ENDIF};
    MediumseagreenColor = {$IFNDEF FMX}clWebMediumseagreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumseagreen{$ENDIF};
    MediumslateblueColor = {$IFNDEF FMX}clWebMediumslateblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumslateblue{$ENDIF};
    MediumspringgreenColor = {$IFNDEF FMX}clWebMediumspringgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumspringgreen{$ENDIF};
    MediumturquoiseColor = {$IFNDEF FMX}clWebMediumturquoise{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumturquoise{$ENDIF};
    MediumvioletredColor = {$IFNDEF FMX}clWebMediumvioletred{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumvioletred{$ENDIF};
    MidnightblueColor = {$IFNDEF FMX}clWebMidnightblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Midnightblue{$ENDIF};
    MintcreamColor = {$IFNDEF FMX}clWebMintcream{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mintcream{$ENDIF};
    MistyroseColor = {$IFNDEF FMX}clWebMistyrose{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mistyrose{$ENDIF};
    MoccasinColor = {$IFNDEF FMX}clWebMoccasin{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Moccasin{$ENDIF};
    NavajowhiteColor = {$IFNDEF FMX}clWebNavajowhite{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Navajowhite{$ENDIF};
    OldlaceColor = {$IFNDEF FMX}clWebOldlace{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Oldlace{$ENDIF};

    OlivedrabColor = {$IFNDEF FMX}clWebOlivedrab{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Olivedrab{$ENDIF};
    OrangeColor = {$IFNDEF FMX}clWebOrange{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Orange{$ENDIF};
    OrangeredColor = {$IFNDEF FMX}clWebOrangered{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Orangered{$ENDIF};
    OrchidColor = {$IFNDEF FMX}clWebOrchid{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Orchid{$ENDIF};
    PalegoldenrodColor = {$IFNDEF FMX}clWebPalegoldenrod{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Palegoldenrod{$ENDIF};
    PalegreenColor = {$IFNDEF FMX}clWebPalegreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Palegreen{$ENDIF};
    PaleturquoiseColor = {$IFNDEF FMX}clWebPaleturquoise{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Paleturquoise{$ENDIF};
    PalevioletredColor = {$IFNDEF FMX}clWebPalevioletred{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Palevioletred{$ENDIF};
    PapayawhipColor = {$IFNDEF FMX}clWebPapayawhip{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Papayawhip{$ENDIF};
    PeachpuffColor = {$IFNDEF FMX}clWebPeachpuff{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Peachpuff{$ENDIF};
    PeruColor = {$IFNDEF FMX}clWebPeru{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Peru{$ENDIF};
    PinkColor = {$IFNDEF FMX}clWebPink{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Pink{$ENDIF};
    PlumColor = {$IFNDEF FMX}clWebPlum{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Plum{$ENDIF};
    PowderblueColor = {$IFNDEF FMX}clWebPowderblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Powderblue{$ENDIF};
    RosybrownColor = {$IFNDEF FMX}clWebRosybrown{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Rosybrown{$ENDIF};
    RoyalblueColor = {$IFNDEF FMX}clWebRoyalblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Royalblue{$ENDIF};
    SaddlebrownColor = {$IFNDEF FMX}clWebSaddlebrown{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Saddlebrown{$ENDIF};
    SalmonColor = {$IFNDEF FMX}clWebSalmon{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Salmon{$ENDIF};
    SandybrownColor = {$IFNDEF FMX}clWebSandybrown{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Sandybrown{$ENDIF};
    SeagreenColor = {$IFNDEF FMX}clWebSeagreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Seagreen{$ENDIF};
    SeashellColor = {$IFNDEF FMX}clWebSeashell{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Seashell{$ENDIF};
    SiennaColor = {$IFNDEF FMX}clWebSienna{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Sienna{$ENDIF};
    SilverColor = {$IFNDEF FMX}clSilver{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Silver{$ENDIF};
    SkyblueColor = {$IFNDEF FMX}clSkyblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Skyblue{$ENDIF};
    SlateblueColor = {$IFNDEF FMX}clWebSlateblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Slateblue{$ENDIF};
    SlategrayColor = {$IFNDEF FMX}clWebSlategray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Slategray{$ENDIF};
  //  SlategreyColor = {$IFNDEF FMX}clWebSlategrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Slategrey{$ENDIF};
    SnowColor = {$IFNDEF FMX}clWebSnow{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Snow{$ENDIF};
    SpringgreenColor = {$IFNDEF FMX}clWebSpringgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Springgreen{$ENDIF};
    SteelblueColor = {$IFNDEF FMX}clWebSteelblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Steelblue{$ENDIF};
    TanColor = {$IFNDEF FMX}clWebTan{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Tan{$ENDIF};
  ThistleColor = {$IFNDEF FMX}clWebThistle{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Thistle{$ENDIF};
  TomatoColor = {$IFNDEF FMX}clWebTomato{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Tomato{$ENDIF};
  TurquoiseColor = {$IFNDEF FMX}clWebTurquoise{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Turquoise{$ENDIF};
  VioletColor = {$IFNDEF FMX}clWebViolet{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Violet{$ENDIF};
  WheatColor = {$IFNDEF FMX}clWebWheat{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Wheat{$ENDIF};
  WhitesmokeColor = {$IFNDEF FMX}clWebWhitesmoke{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Whitesmoke{$ENDIF};
  YellowgreenColor = {$IFNDEF FMX}clWebYellowgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Yellowgreen{$ENDIF};
  {$ENDIF}


  BlueColor = {$IFNDEF FMX}clBlue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Blue{$ENDIF};
  LightgrayColor = {$IFNDEF FMX}clgray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightgray{$ENDIF};
  LtGrayColor = {$IFNDEF FMX}clLtGray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.LtGray{$ENDIF};
  MedGrayColor = {$IFNDEF FMX}clMedGray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.MedGray{$ENDIF};
  DkGrayColor = {$IFNDEF FMX}clDkGray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.DkGray{$ENDIF};
  MoneyGreenColor = {$IFNDEF FMX}clMoneyGreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.MoneyGreen{$ENDIF};
//  LegacySkyBlueColor = {$IFNDEF FMX}clWebLegacySkyBlue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.LegacySkyBlue{$ENDIF};
  CreamColor = {$IFNDEF FMX}clCream{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Cream{$ENDIF};
  LimeColor = {$IFNDEF FMX}clLime{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lime{$ENDIF};
  MaroonColor = {$IFNDEF FMX}clMaroon{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Maroon{$ENDIF};
  NavyColor = {$IFNDEF FMX}clNavy{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Navy{$ENDIF};
  OliveColor = {$IFNDEF FMX}clOlive{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Olive{$ENDIF};
  PurpleColor = {$IFNDEF FMX}clPurple{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Purple{$ENDIF};
  RedColor = {$IFNDEF FMX}clRed{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Red{$ENDIF};
  TealColor = {$IFNDEF FMX}clTeal{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Teal{$ENDIF};
  YellowColor = {$IFNDEF FMX}clYellow{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Yellow{$ENDIF};



  BlackColor = {$IFNDEF FMX}clBlack{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Black{$ENDIF};
  WhiteColor = {$IFNDEF FMX}clWhite{$ENDIF}{$IFDEF FMX}TAlphaColorRec.White{$ENDIF};
  GrayColor = {$IFNDEF FMX}clGray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Gray{$ENDIF};
  GreenColor = {$IFNDEF FMX}clGreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Green{$ENDIF};













  {$IFDEF VCL}
  const TColor_RedShift   = 0;
  const TColor_GreenShift = 8;
  const TColor_BlueShift  = 16;
  const TColor_AlphaShift = 24;
  {$ENDIF}






const
  //Item使用列表框所设置的Item高度
  Const_Tag_UseListItemHeight=-1;
  //Item使用列表框所设置的Item宽度
  Const_Tag_UseListItemWidth=-1;

  //Item使用列表框的宽度
  Const_Tag_UseListViewItemIsControlWidth=-2;


  //ItemHeight为-1时,使用列表框的高度(如果Properties.ItemHeight=-1)
  Const_Tag_UseControlHeight=-1;
  //ItemWidth为-1时,使用列表框的宽度(如果Properties.ItemWidth=-1)
  Const_Tag_UseControlWidth=-1;

  Const_CanCallClickEventDistance=5;


const
  //默认列表项高度
  Const_DefaultItemHeight=60;
  //默认列表项宽度
  Const_DefaultItemWidth=60;


const
  DefaultMargin=8;




const
  //默认颜色
  Const_DefaultColor=BlackColor;

  {$IFDEF FMX}
  //默认边框颜色
  Const_DefaultBorderColor = $FFEDEDED;
  {$ELSE}
  //默认边框颜色
  Const_DefaultBorderColor = $00EDEDED;
  {$ENDIF}


  //默认填充颜色
  Const_DefaultFillColor = WhiteColor;




type

  /// <summary>
  ///   <para>
  ///     列表项颜色类型
  ///   </para>
  ///   <para>
  ///     ListItem color type
  ///   </para>
  /// </summary>
  TSkinItemColorType=(
                      sictNone,
                      //背景颜色
                      sictBackColor,
                      //标题字体颜色
                      sictCaptionFontColor,
                      //明细字体颜色
                      sictDetailFontColor,
                      sictDetail1FontColor,
                      sictDetail2FontColor,
                      sictDetail3FontColor,
                      sictDetail4FontColor,
                      sictDetail5FontColor,
                      sictDetail6FontColor,

                      //标题背景颜色
                      sictCaptionBackColor,
                      //明细背景颜色
                      sictDetailBackColor,
                      sictDetail1BackColor,
                      sictDetail2BackColor,
                      sictDetail3BackColor,
                      sictDetail4BackColor,
                      sictDetail5BackColor,
                      sictDetail6BackColor,
                      //图标背景颜色
                      sictIconBackColor,
                      sictPicBackColor
                      );


  TSkinItemColorSetType=(
                      sicstNone,
                      //背景颜色
                      sicstBackColor,
                      //标题字体颜色
                      sicstFontColor
                      );




  /// <summary>
  ///   <para>
  ///     滚动条类型
  ///   </para>
  ///   <para>
  ///     ScrollBar Type
  ///   </para>
  /// </summary>
  TScrollBarKind=(
                  /// <summary>
                  ///   水平滚动条
                  ///   <para>
                  ///    Horizontal ScrollBar
                  ///   </para>
                  /// </summary>
                  sbHorizontal,
                  /// <summary>
                  ///   垂直滚动条
                  ///   <para>
                  ///    Vertical ScrollBar
                  ///   </para>
                  /// </summary>
                  sbVertical
                  );




  /// <summary>
  ///   <para>
  ///     列表项尺寸计算类型
  ///   </para>
  ///   <para>
  ///     Caiculate type of ListItem size
  ///   </para>
  /// </summary>
  TItemSizeCalcType=(
                      /// <summary>
                      ///   固定的
                      ///   <para>
                      ///     Fixed
                      ///   </para>
                      /// </summary>
                      isctFixed,
                      /// <summary>
                      ///   单独的
                      ///   <para>
                      ///     Separate
                      ///   </para>
                      /// </summary>
                      isctSeparate
                      );

  //列表项间隔类型
  TSkinItemSpaceType=(//全部都有
                      sistDefault,
                      //中间才有
                      sistMiddle
                      );



  /// <summary>
  ///   <para>
  ///     列表项排列类型
  ///   </para>
  ///   <para>
  ///     Layout type of ListItems
  ///   </para>
  /// </summary>
  TItemLayoutType=(
                  /// <summary>
                  ///   垂直排列
                  ///   <para>
                  ///     Array vertically
                  ///   </para>
                  /// </summary>
                  iltVertical,
                  /// <summary>
                  ///   水平排列
                  ///   <para>
                  ///     Array horizontally
                  ///   </para>
                  /// </summary>
                  iltHorizontal
                  );






{ Useful alias types }
type
  //控件尺寸类型
  TControlSize={$IFDEF FMX}Double{$ELSE}Integer{$ENDIF};
  //颜色类型
  TDelphiColor={$IFDEF FMX}TAlphaColor{$ELSE}TColor{$ENDIF};


  //获取控件尺寸的事件,在ListLayout中使用
  TOnGetControlSizeEvent=function(Sender:TObject):Double of object;



//  TClipRoundSetting=record
//    //是否剪载成圆形
//    IsClipRound:Boolean;
//    ClipRoundXRadis:Double;
//    ClipRoundYRadis:Double;
//    {$IFDEF FMX}
//    ClipRoundCorners: TCorners;
//    {$ENDIF FMX}
//  end;



  {$IFDEF VCL}
    {$IFDEF DELPHIXE4}
    {$ELSE}
    //没有定义TRectF
    TSizeF = record
      cx: Single;
      cy: Single;
    end;


    {$IFDEF DELPHI}
    TPointFType = array [0..1] of Single;

    TPointF = record
      case Integer of
        0: (V: TPointFType;);
        1: (X: Single;
            Y: Single;);
    end;


    TRectF = record
     private
      function GetWidth: Single;
      procedure SetWidth(const Value: Single);
      function GetHeight: Single;
      procedure SetHeight(const Value: Single);
     public
      //returns true if left = right or top = bottom
      function IsEmpty: Boolean;

      // changing the width is always relative to Left;
      property Width: Single read GetWidth write SetWidth;
      // changing the Height is always relative to Top
      property Height: Single read GetHeight write SetHeight;
      case Integer of
        0: (Left, Top, Right, Bottom: Single);
        1: (TopLeft, BottomRight: TPointF);
    end;
    {$ENDIF}

  {$ENDIF}
  {$ENDIF}


  {$IFDEF VCL}
    TAlignLayout=TAlign;
    PRectF=^TRectF;
  {$ENDIF}





  TUseThemeColorType=(ctNone,
                      ctThemeColor,
                      ctThemeColor1,
                      //导入栏颜色
                      ctNavigationBarColor,
                      ctNavigationBarFontColor,
                      ctThemeColor2,
                      ctThemeColor3
                      );
  //颜色
  TDrawColor=class(TPersistent)
  private
  protected
    FName:String;
    FCaption:String;
    FUseThemeColor: TUseThemeColorType;
    FOnChange:TNotifyEvent;
    procedure DoChange;


    procedure SetColor(const Value: TDelphiColor);
    function GetAlpha: Byte;
    procedure SetAlpha(const Value: Byte);
    function GetColor: TDelphiColor;
    procedure SetUseThemeColor(const Value: TUseThemeColorType);
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(const AName: String;const ACaption:String);
    destructor Destroy;override;
  public
    FAlpha:Byte;
    FColor:TDelphiColor;

    //默认的颜色,如果与FColor不一样,那么需要存储FColor到fmx
    StoredDefaultColor:TDelphiColor;

    function IsAlphaStored:Boolean;
    function IsColorStored:Boolean; virtual;
    function IsUseThemeColorStored: Boolean;

    procedure InitDefaultColor(AColor:TDelphiColor);

    property Name:String read FName write FName;
    property Caption:String read FCaption write FCaption;
    property OnChange:TNotifyEvent read FOnChange write FOnChange;
  published
    //是否使用主题色
    property UseThemeColor:TUseThemeColorType read FUseThemeColor write SetUseThemeColor stored IsUseThemeColorStored;
    //透明度
    property Alpha:Byte read GetAlpha write SetAlpha stored IsAlphaStored;
    //颜色
    property Color:TDelphiColor read GetColor write SetColor stored IsColorStored;
  end;

  //颜色更改类型
  TColorChangeType=(cctNone,
                    cctBrightness,
                    cctDarkness);


  TBorderMarginSize = 0..MaxInt;


  //边距
  TBorderMargins = class(TPersistent)
  private
    FLeft, FTop, FRight, FBottom: TBorderMarginSize;
    FOnChange: TNotifyEvent;
    procedure SetBorderMargin(Index: Integer; Value: TBorderMarginSize);
  private
    function IsBottomStored(const Index: Integer): Boolean;
    function IsLeftStored(const Index: Integer): Boolean;
    function IsRightStored(const Index: Integer): Boolean;
    function IsTopStored(const Index: Integer): Boolean;
  protected
    procedure DoChange;virtual;
    procedure AssignTo(Dest: TPersistent); override;
    class procedure InitDefaults(Margins: TBorderMargins); virtual;
  public
    constructor Create; virtual;
    function SaveToString:String;
    procedure LoadFromString(const AMarginsStr:String);
    procedure SetBounds(ALeft, ATop, ARight, ABottom: Integer);
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property Left: TBorderMarginSize index 0 read FLeft write SetBorderMargin stored IsLeftStored;//default DefaultMargin;
    property Top: TBorderMarginSize index 1 read FTop write SetBorderMargin stored IsTopStored;//default DefaultMargin;
    property Right: TBorderMarginSize index 2 read FRight write SetBorderMargin stored IsRightStored;//default DefaultMargin;
    property Bottom: TBorderMarginSize index 3 read FBottom write SetBorderMargin stored IsBottomStored;//default DefaultMargin;
  end;



  {$I ComponentPlatformsAttribute.inc}
  TSkinTheme=class(TComponent)
  private
    FSkinPictureThemeColor:TDelphiColor;
    FSkinThemeColor:TDelphiColor;
    FSkinThemeColor1:TDelphiColor;
    FSkinThemeColor2:TDelphiColor;
    FSkinThemeColor3:TDelphiColor;
    FNavigationBarColor: TDelphiColor;
    FNavigationBarFontColor:TDelphiColor;
    FFilePictureSearchPaths:TStringList;
    function GetSkinThemeColor: TDelphiColor;
    function GetSkinThemeColor1: TDelphiColor;
    function GetSkinThemeColor2: TDelphiColor;
    function GetSkinThemeColor3: TDelphiColor;
    procedure SetSkinThemeColor(const Value: TDelphiColor);
    procedure SetSkinThemeColor1(const Value: TDelphiColor);
    procedure SetSkinThemeColor2(const Value: TDelphiColor);
    procedure SetSkinThemeColor3(const Value: TDelphiColor);
    procedure SetNavigationBarColor(const Value: TDelphiColor);
    function GetNavigationBarColor: TDelphiColor;
    function GetNavigationBarFontColor: TDelphiColor;
    procedure SetNavigationBarFontColor(const Value: TDelphiColor);
    function GetSkinPictureThemeColor: TDelphiColor;
    procedure SetSkinPictureThemeColor(const Value: TDelphiColor);
    function GetFilePictureSearchPaths: TStringList;
    procedure SetFilePictureSearchPaths(const Value: TStringList);

    procedure DoFilePictureSearchPathsChange(Sender:TObject);
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    procedure Loaded;override;
  published
    //主题色
    property SkinPictureThemeColor:TDelphiColor read GetSkinPictureThemeColor write SetSkinPictureThemeColor;

    //导航栏字体颜色
    property NavigationBarFontColor:TDelphiColor read GetNavigationBarFontColor write SetNavigationBarFontColor;
    //导航栏背景色
    property NavigationBarColor:TDelphiColor read GetNavigationBarColor write SetNavigationBarColor;
    //主题色
    property SkinThemeColor:TDelphiColor read GetSkinThemeColor write SetSkinThemeColor;
    //主题色1
    property SkinThemeColor1:TDelphiColor read GetSkinThemeColor1 write SetSkinThemeColor1;
    property SkinThemeColor2:TDelphiColor read GetSkinThemeColor2 write SetSkinThemeColor2;
    property SkinThemeColor3:TDelphiColor read GetSkinThemeColor3 write SetSkinThemeColor3;
    //图片搜索路径
    property FilePictureSearchPaths:TStringList read GetFilePictureSearchPaths write SetFilePictureSearchPaths;
  end;






/// <summary>
///   锁定所有控件,不让重绘
/// </summary>
procedure LockSkinControlInvalidate;
/// <summary>
///   解除锁定所有控件,允许绘制
/// </summary>
procedure UnLockSkinControlInvalidate;





{$IFDEF FMX}
//清除Style的背景,保持背景透明
procedure ClearStyleObjectVisiualElement(AStyleObject:TFmxObject;AControlClassify:String);
procedure CopyBitmap(ASrcBitmap:TBitmap;ADestBitmap:TBitmap);
{$ENDIF}






function ControlSize(const ASize:Double):TControlSize;
function FloorControlSize(const ASize:Double):TControlSize;

function MakeColor(const R,G,B:Byte;const A:Byte=255):TDelphiColor;

function RectWidth(const Rect: TRect): Integer;
function RectHeight(const Rect: TRect): Integer;

function RectWidthF(const Rect: TRectF): Single;
function RectHeightF(const Rect: TRectF): Single;
function RectIsEmptyF(const Rect: TRectF): Boolean;

function RectF2Rect(const Rect: TRectF): TRect;
function Rect2RectF(const Rect: TRect): TRectF;



{$IFDEF VCL}
  {$IFNDEF DELPHIXE4}
function PointF(X, Y: Single): TPointF;
function RectF(Left, Top, Right, Bottom: Single): TRectF;

procedure InflateRect(var R: TRectF; const DX, DY: Single);

function UnionRectF(out Rect: TRectF; const R1, R2: TRectF): Boolean;

  {$ENDIF}
{$ENDIF}

function IntersectRectF(const Rect1, Rect2: TRectF): Boolean;overload;
function IntersectRectF(out Rect: TRectF; const R1, R2: TRectF): Boolean;overload;
function PtInRectF(const Rect: TRectF; const P: TPointF): Boolean;
function OffsetRectF(var R: TRectF; DX, DY: Single): Boolean;




//求两点的角度(用于确定手势方向)
function GetAngle(X1:Double;Y1:Double;X2:Double;Y2:Double):Double;
function GetAbsAngle(X1:Double;Y1:Double;X2:Double;Y2:Double;IsHorz:Boolean):Double;
//两点间的距离
function GetDis(APoint,BPoint:TPointF):Double;


//调整画线的位置,加上0.5线条会细一点
function AdjustDrawLinePos(A:Double;Offset:Double=0.5):Double;


//将颜色转换为html标记所支持的颜色
function ColorToWebHex(AColor:TDelphiColor):String;
function WebHexToColor(AColorStr:String):TDelphiColor;
//

//str转color    11467157  16进制
function VCLColorToTAlphaColor(AVCLColor:Integer):TDelphiColor;


//让颜色变亮
function BrightnessColor(AColor:TDelphiColor;ValueChange:Integer):TDelphiColor;
//让颜色变深
function DarknessColor(AColor:TDelphiColor;ValueChange:Integer):TDelphiColor;

function ScreenScaleSize(ASize:Single):Single;
//function ScreenScaleRectF(ARect:TRectF):TRectF;
function ScreenScaleSizeInt(ASize:Single):Integer;
function GetScreenScaleRate:Double;

function ColorNameToColor(AColorName:String):TDelphiColor;




var
  NullRect:TRect;
  //设计时矩形的默认边框颜色
  GlobalNormalDesignRectBorderColor:TDelphiColor;
  //PageControl设计时当前页的边框颜色
  GlobalActivePageDesignRectBorderColor:TDelphiColor;
  //ItemDesignerPanel设计时的边框颜色
  GlobalItemDesignerPanelDesignRectBorderColor:TDelphiColor;
  //ScollBox设计时的边框颜色
  GlobalScrollBoxContentDesignRectBorderColor:TDelphiColor;
  //PullLoadPanel设计时的边框颜色
  GlobalPullLoadPanelDesignRectBorderColor:TDelphiColor;


  //默认的边框宽度
  DefaultBorderWidth:Double;
  //默认的画笔尺寸
  DefaultPenWidth:Double;


  //主题色
  SkinThemeColor:TDelphiColor;
  SkinPictureThemeColor:TDelphiColor;
  //主题色1
  SkinThemeColor1:TDelphiColor;
  //主题色2
  SkinThemeColor2:TDelphiColor;
  //主题色3
  SkinThemeColor3:TDelphiColor;



  //导航栏颜色
  SkinNavigationBarColor:TDelphiColor;
  //导航栏字体颜色
  SkinNavigationBarFontColor:TDelphiColor;



var
  SkinControlInvalidateLocked:Integer;
  //是否调整画线的位置,加上0.5可以将线画细
  IsAdjustDrawLinePos:Boolean;

  ScreenLogPixels:Integer;

  GlobalFilePictureSearchPaths:TStringList;

var
  //是否允许缓存,总开关
  GlobalIsEnableBuffer:Boolean;
  //是否所有的控件都启用缓存，一般用于页面切换的时候，加速切换效果
  GlobalIsAllControlEnableBuffer:Boolean;


function GetAlignStr(AAlign:TAlignLayout):String;
function GetAlign(AAlignStr:String):TAlignLayout;
function GetAnchors(AAnchorsStr:String):TAnchors;
function GetAnchorsStr(AAnchors:TAnchors):String;

{$IFDEF FMX}
function GetMarginsStr(AMargins:TBounds): String;
procedure SetMargins(AMargins:TBounds;AMarginsStr:String);
{$ENDIF}
{$IFDEF VCL}
  {$IFDEF DELPHI}
  function GetMarginsStr(AMargins:TMargins): String;
  procedure SetMargins(AMargins:TMargins;AMarginsStr:String);
  {$ENDIF}
{$ENDIF}

function GetBindItemFieldNameByItemColorType(AItemColorType: TSkinItemColorType):String;
function GetBindItemColorSetTypeByItemColorType(AItemColorType: TSkinItemColorType):TSkinItemColorSetType;


implementation


//uses
//  uSkinPicture;


function GetScreenLogPixels:Integer;
{$IFDEF VCL}
{$IFDEF MSWINDOWS}
var
  DC: HDC;
{$ENDIF}
{$ENDIF VCL}
begin
  Result:=96;
{$IFDEF VCL}
{$IFDEF MSWINDOWS}
if ScreenLogPixels=0 then
  begin
    DC := GetDC(0);
    try
      ScreenLogPixels := GetDeviceCaps(DC, LOGPIXELSY);
    finally
      ReleaseDC(0,DC);
    end;
    uBaseLog.HandleException(nil,'GetScreenLogPixels ScreenLogPixels:'+IntToStr(ScreenLogPixels));
  end;
  Result:=ScreenLogPixels;
{$ENDIF}
{$ENDIF VCL}
end;


function GetScreenScaleRate:Double;
begin
  {$IFDEF VCL}
  Result:=GetScreenLogPixels/96;
  {$ENDIF}
  {$IFDEF FMX}
  Result:=1;
  {$ENDIF}
end;

function ScreenScaleSize(ASize:Single):Single;
begin
  Result:=ASize*GetScreenScaleRate;
end;

function ScreenScaleSizeInt(ASize:Single):Integer;
begin
  Result:=Ceil(ScreenScaleSize(ASize));
end;

//function ScreenScaleRectF(ARect:TRectF):TRectF;
//begin
//  Result:=RectF(ScreenScaleSize(ARect.Left),
//                ScreenScaleSize(ARect.Top),
//                ScreenScaleSize(ARect.Right),
//                ScreenScaleSize(ARect.Bottom)
//                );
//end;

{$IFDEF FMX}
function GetMarginsStr(AMargins:TBounds): String;
begin
  Result:=IntToStr(Ceil(AMargins.Left))+','
          +IntToStr(Ceil(AMargins.Top))+','
          +IntToStr(Ceil(AMargins.Right))+','
          +IntToStr(Ceil(AMargins.Bottom));
end;

procedure SetMargins(AMargins:TBounds;AMarginsStr:String);
var
  AMarginsList:TStringList;
begin
  AMarginsList:=TStringList.Create;
  AMarginsList.CommaText:=AMarginsStr;
  if AMarginsList.Count>=4 then
  begin
    AMargins.Left:=StrToInt(AMarginsList[0]);
    AMargins.Top:=StrToInt(AMarginsList[1]);
    AMargins.Right:=StrToInt(AMarginsList[2]);
    AMargins.Bottom:=StrToInt(AMarginsList[3]);
  end;
  FreeAndNil(AMarginsList);

end;
{$ENDIF}

{$IFDEF VCL}
{$IFDEF DELPHI}
function GetMarginsStr(AMargins:TMargins): String;
begin
  Result:=IntToStr(Ceil(AMargins.Left))+','
          +IntToStr(Ceil(AMargins.Top))+','
          +IntToStr(Ceil(AMargins.Right))+','
          +IntToStr(Ceil(AMargins.Bottom));
end;

procedure SetMargins(AMargins:TMargins;AMarginsStr:String);
var
  AMarginsList:TStringList;
begin
  AMarginsList:=TStringList.Create;
  AMarginsList.CommaText:=AMarginsStr;
  if AMarginsList.Count>=4 then
  begin
    AMargins.Left:=StrToInt(AMarginsList[0]);
    AMargins.Top:=StrToInt(AMarginsList[1]);
    AMargins.Right:=StrToInt(AMarginsList[2]);
    AMargins.Bottom:=StrToInt(AMarginsList[3]);
  end;
  FreeAndNil(AMarginsList);

end;
{$ENDIF}
{$ENDIF}

function VCLColorToTAlphaColor(AVCLColor:Integer):TDelphiColor;
begin
  {$IFDEF FMX}
  Result:=$FF000000
        or (Byte(AVCLColor) shl 16)
        or (AVCLColor and $0000FF00)
        or ((AVCLColor and $00FF0000) shr 16);
  {$ENDIF}

end;


{$IFDEF FMX}
function GetAValue(color : integer) : byte;
begin
  result := byte(color shr 24);
end;
function GetRValue(color : integer) : byte;
begin
  result := byte(color shr 16);
end;
function GetGValue(color : integer) : byte;
begin
  result := byte(color shr 8);
end;
function GetBValue(color : integer): byte;
begin
  result := byte(color);
end;

function argb(a,r,g,b:byte):integer;
begin
  result := (integer(a) shl 24) + (integer(r) shl 16) + (integer(g) shl 8) + integer(b);
end;
{$ENDIF}


{$IFDEF VCL}
function GetBValue(color : integer) : byte;
begin
  result := byte(color shr 16);
end;
function GetGValue(color : integer) : byte;
begin
  result := byte(color shr 8);
end;
function GetRValue(color : integer): byte;
begin
  result := byte(color);
end;

function rgb(r,g,b:byte):integer;
begin
  result := (integer(b) shl 16) + (integer(g) shl 8) + integer(r);
end;
{$ENDIF}

//让颜色变亮
function BrightnessColor(AColor:TDelphiColor;ValueChange:Integer):TDelphiColor;
var
  A,R,G,B:Byte;
begin


  {$IFDEF FMX}
//  Result:=AColor;
//        $FF000000
//        or (Byte(AVCLColor) shl 16)
//        or (AVCLColor and $0000FF00)
//        or ((AVCLColor and $00FF0000) shr 16);
  A:=GetAValue(AColor);//Min(GetAValue(AColor)+ValueChange,255);
  R:=Min(GetRValue(AColor)+ValueChange,255);
  G:=Min(GetGValue(AColor)+ValueChange,255);
  B:=Min(GetBValue(AColor)+ValueChange,255);
  Result:=argb(A,R,G,B);
  {$ENDIF}
  {$IFDEF VCL}
  //(+ValueChangeMin,255)
  R:=Min(GetRValue(AColor)+ValueChange,255);
  G:=Min(GetGValue(AColor)+ValueChange,255);
  B:=Min(GetBValue(AColor)+ValueChange,255);
  Result:=rgb(R,G,B);
//  Result:=
//        $FF000000
//        or (Byte(AColor) shl 16)
//        or Min((AColor and $0000FF00)+ValueChange,255)
//        or Min(((AColor and $00FF0000) shr 16)+ValueChange,255);
  {$ENDIF}

end;

//让颜色变深
function DarknessColor(AColor:TDelphiColor;ValueChange:Integer):TDelphiColor;
var
  A,R,G,B:Byte;
begin
  {$IFDEF FMX}
//  Result:=AColor;//$FF000000
//        or (Byte(AVCLColor) shl 16)
//        or (AVCLColor and $0000FF00)
//        or ((AVCLColor and $00FF0000) shr 16);
  A:=GetAValue(AColor);//Max(GetAValue(AColor)-ValueChange,0);
  R:=Max(GetRValue(AColor)-ValueChange,0);
  G:=Max(GetGValue(AColor)-ValueChange,0);
  B:=Max(GetBValue(AColor)-ValueChange,0);
  Result:=argb(A,R,G,B);
  {$ENDIF}
  {$IFDEF VCL}
//  Result:=
//        $FF000000
//        or Min((Byte(AColor) shl 16)-ValueChange,255)
//        or Min((AColor and $0000FF00)-ValueChange,255)
//        or Min(((AColor and $00FF0000) shr 16)-ValueChange,255);
  R:=Max(GetRValue(AColor)-ValueChange,0);
  G:=Max(GetGValue(AColor)-ValueChange,0);
  B:=Max(GetBValue(AColor)-ValueChange,0);
  Result:=rgb(R,G,B);
  {$ENDIF}

end;

function ColorNameToColor(AColorName:String):TDelphiColor;
begin
  //颜色常量
  {$IFDEF VCL}
  if Pos('$',AColorName)>0 then
  begin
    //VCL中是BGR,转成RGB
    //$FF FF FF FF
    //012 34 56 78
    AColorName:='$'+AColorName.Substring(7,2)
              +AColorName.Substring(5,2)
              +AColorName.Substring(3,2);
    Result:=StrToInt(AColorName);
    Exit;
  end;
  {$ENDIF}
  {$IFDEF FMX}
  if Pos('$',AColorName)>0 then
  begin
    //VCL中是BGR,转成RGB
    //$FF FF FF FF
    //012 34 56 78
//    AColorName:='$'+AColorName.Substring(7,2)
//              +AColorName.Substring(5,2)
//              +AColorName.Substring(3,2);
    Result:=StrToInt(AColorName);
    Exit;
  end;
  {$ENDIF}

  Result:=NullColor;// = {$IFDEF VCL}0{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Null{$ENDIF};

  {$IFDEF DELPHI}

  if SameText(AColorName,'Aliceblue') then Result:=AliceblueColor;// = AliceblueColor = {$IFDEF VCL}clWebAliceblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Aliceblue{$ENDIF};
  if SameText(AColorName,'Antiquewhite') then Result:=AntiquewhiteColor;//={$IFDEF_VCL}clWebAntiquewhite{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Antiquewhite{$ENDIF};
  if SameText(AColorName,'Aqua') then Result:=AquaColor;//={$IFDEF_VCL}clAqua{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Aqua{$ENDIF};
  if SameText(AColorName,'Aquamarine') then Result:=AquamarineColor;//={$IFDEF_VCL}clWebAquamarine{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Aquamarine{$ENDIF};
  if SameText(AColorName,'Azure') then Result:=AzureColor;//={$IFDEF_VCL}clWebAzure{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Azure{$ENDIF};
  if SameText(AColorName,'Beige') then Result:=BeigeColor;//={$IFDEF_VCL}clWebBeige{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Beige{$ENDIF};
  if SameText(AColorName,'Bisque') then Result:=BisqueColor;//={$IFDEF_VCL}clWebBisque{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Bisque{$ENDIF};
  if SameText(AColorName,'Blanchedalmond') then Result:=BlanchedalmondColor;//={$IFDEF_VCL}clWebBlanchedalmond{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Blanchedalmond{$ENDIF};
  if SameText(AColorName,'Blueviolet') then Result:=BluevioletColor;//={$IFDEF_VCL}clWebBlueviolet{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Blueviolet{$ENDIF};
  if SameText(AColorName,'Brown') then Result:=BrownColor;//={$IFDEF_VCL}clWebBrown{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Brown{$ENDIF};
  if SameText(AColorName,'Burlywood') then Result:=BurlywoodColor;//={$IFDEF_VCL}clWebBurlywood{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Burlywood{$ENDIF};
  if SameText(AColorName,'Cadetblue') then Result:=CadetblueColor;//={$IFDEF_VCL}clWebCadetblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Cadetblue{$ENDIF};
  if SameText(AColorName,'Chartreuse') then Result:=ChartreuseColor;//={$IFDEF_VCL}clWebChartreuse{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Chartreuse{$ENDIF};
  if SameText(AColorName,'Chocolate') then Result:=ChocolateColor;//={$IFDEF_VCL}clWebChocolate{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Chocolate{$ENDIF};
  if SameText(AColorName,'Coral') then Result:=CoralColor;//={$IFDEF_VCL}clWebCoral{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Coral{$ENDIF};
  if SameText(AColorName,'Cornflowerblue') then Result:=CornflowerblueColor;//={$IFDEF_VCL}clWebCornflowerblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Cornflowerblue{$ENDIF};
  if SameText(AColorName,'Cornsilk') then Result:=CornsilkColor;//={$IFDEF_VCL}clWebCornsilk{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Cornsilk{$ENDIF};
  if SameText(AColorName,'Crimson') then Result:=CrimsonColor;//={$IFDEF_VCL}clWebCrimson{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Crimson{$ENDIF};
  if SameText(AColorName,'Cyan') then Result:=CyanColor;//={$IFDEF_VCL}clWebCyan{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Cyan{$ENDIF};
  if SameText(AColorName,'Darkblue') then Result:=DarkblueColor;//={$IFDEF_VCL}clWebDarkblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkblue{$ENDIF};
  if SameText(AColorName,'Darkcyan') then Result:=DarkcyanColor;//={$IFDEF_VCL}clWebDarkcyan{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkcyan{$ENDIF};
  if SameText(AColorName,'Darkgoldenrod') then Result:=DarkgoldenrodColor;//={$IFDEF_VCL}clWebDarkgoldenrod{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkgoldenrod{$ENDIF};
  if SameText(AColorName,'Darkgray') then Result:=DarkgrayColor;//={$IFDEF_VCL}clWebDarkgray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkgray{$ENDIF};
  if SameText(AColorName,'Darkgreen') then Result:=DarkgreenColor;//={$IFDEF_VCL}clWebDarkgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkgreen{$ENDIF};
//  if SameText(AColorName,'Aliceblue') then Result:=DarkgreyColor={$IFDEF_VCL}clWebDarkgrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkgrey{$ENDIF};
  if SameText(AColorName,'Darkkhaki') then Result:=DarkkhakiColor;//={$IFDEF_VCL}clWebDarkkhaki{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkkhaki{$ENDIF};
  if SameText(AColorName,'Darkmagenta') then Result:=DarkmagentaColor;//={$IFDEF_VCL}clWebDarkmagenta{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkmagenta{$ENDIF};
  if SameText(AColorName,'Darkolivegreen') then Result:=DarkolivegreenColor;//={$IFDEF_VCL}clWebDarkolivegreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkolivegreen{$ENDIF};
  if SameText(AColorName,'Darkorange') then Result:=DarkorangeColor;//={$IFDEF_VCL}clWebDarkorange{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkorange{$ENDIF};
  if SameText(AColorName,'Darkorchid') then Result:=DarkorchidColor;//={$IFDEF_VCL}clWebDarkorchid{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkorchid{$ENDIF};
  if SameText(AColorName,'Darkred') then Result:=DarkredColor;//={$IFDEF_VCL}clWebDarkred{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkred{$ENDIF};
  if SameText(AColorName,'Darksalmon') then Result:=DarksalmonColor;//{$IFDEF_VCL}clWebDarksalmon{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darksalmon{$ENDIF};
  if SameText(AColorName,'Darkseagreen') then Result:=DarkseagreenColor;//{$IFDEF_VCL}clWebDarkseagreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkseagreen{$ENDIF};
  if SameText(AColorName,'Darkslateblue') then Result:=DarkslateblueColor;//{$IFDEF_VCL}clWebDarkslateblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkslateblue{$ENDIF};
  if SameText(AColorName,'Darkslategray') then Result:=DarkslategrayColor;//{$IFDEF_VCL}clWebDarkslategray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkslategray{$ENDIF};
//  if SameText(AColorName,'Aliceblue') then Result:=DarkslategreyColor;//{$IFDEF_VCL}clWebDarkslategrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkslategrey{$ENDIF};
  if SameText(AColorName,'Darkturquoise') then Result:=DarkturquoiseColor;//{$IFDEF_VCL}clWebDarkturquoise{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkturquoise{$ENDIF};
  if SameText(AColorName,'Darkviolet') then Result:=DarkvioletColor;//{$IFDEF_VCL}clWebDarkviolet{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Darkviolet{$ENDIF};
  if SameText(AColorName,'Deeppink') then Result:=DeeppinkColor;//{$IFDEF_VCL}clWebDeeppink{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Deeppink{$ENDIF};
  if SameText(AColorName,'Deepskyblue') then Result:=DeepskyblueColor;//{$IFDEF_VCL}clWebDeepskyblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Deepskyblue{$ENDIF};
  if SameText(AColorName,'Dimgray') then Result:=DimgrayColor;//{$IFDEF_VCL}clWebDimgray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Dimgray{$ENDIF};
//  if SameText(AColorName,'Aliceblue') then Result:=DimgreyColor;//{$IFDEF_VCL}clWebDimgrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Dimgrey{$ENDIF};
  if SameText(AColorName,'Dodgerblue') then Result:=DodgerblueColor;//{$IFDEF_VCL}clWebDodgerblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Dodgerblue{$ENDIF};
  if SameText(AColorName,'Firebrick') then Result:=FirebrickColor;//{$IFDEF_VCL}clWebFirebrick{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Firebrick{$ENDIF};
  if SameText(AColorName,'Floralwhite') then Result:=FloralwhiteColor;//{$IFDEF_VCL}clWebFloralwhite{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Floralwhite{$ENDIF};
  if SameText(AColorName,'Forestgreen') then Result:=ForestgreenColor;//{$IFDEF_VCL}clWebForestgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Forestgreen{$ENDIF};
  if SameText(AColorName,'Fuchsia') then Result:=FuchsiaColor;//{$IFDEF_VCL}clWebFuchsia{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Fuchsia{$ENDIF};
  if SameText(AColorName,'Gainsboro') then Result:=GainsboroColor;//{$IFDEF_VCL}clWebGainsboro{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Gainsboro{$ENDIF};
  if SameText(AColorName,'Ghostwhite') then Result:=GhostwhiteColor;//{$IFDEF_VCL}clWebGhostwhite{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Ghostwhite{$ENDIF};
  if SameText(AColorName,'Gold') then Result:=GoldColor;//{$IFDEF_VCL}clWebGold{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Gold{$ENDIF};
  if SameText(AColorName,'Goldenrod') then Result:=GoldenrodColor;//{$IFDEF_VCL}clWebGoldenrod{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Goldenrod{$ENDIF};
  if SameText(AColorName,'Greenyellow') then Result:=GreenyellowColor;//{$IFDEF_VCL}clWebGreenyellow{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Greenyellow{$ENDIF};
//  if SameText(AColorName,'Aliceblue') then Result:=GreyColor;//{$IFDEF_VCL}clWebGrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Grey{$ENDIF};
  if SameText(AColorName,'Honeydew') then Result:=HoneydewColor;//{$IFDEF_VCL}clWebHoneydew{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Honeydew{$ENDIF};
  if SameText(AColorName,'Hotpink') then Result:=HotpinkColor;//{$IFDEF_VCL}clWebHotpink{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Hotpink{$ENDIF};
  if SameText(AColorName,'Indianred') then Result:=IndianredColor;//{$IFDEF_VCL}clWebIndianred{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Indianred{$ENDIF};
  if SameText(AColorName,'Indigo') then Result:=IndigoColor;//{$IFDEF_VCL}clWebIndigo{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Indigo{$ENDIF};
  if SameText(AColorName,'Ivory') then Result:=IvoryColor;//{$IFDEF_VCL}clWebIvory{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Ivory{$ENDIF};
  if SameText(AColorName,'Khaki') then Result:=KhakiColor;//{$IFDEF_VCL}clWebKhaki{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Khaki{$ENDIF};
  if SameText(AColorName,'Lavender') then Result:=LavenderColor;//{$IFDEF_VCL}clWebLavender{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lavender{$ENDIF};
  if SameText(AColorName,'Lavenderblush') then Result:=LavenderblushColor;//{$IFDEF_VCL}clWebLavenderblush{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lavenderblush{$ENDIF};
  if SameText(AColorName,'Lawngreen') then Result:=LawngreenColor;//{$IFDEF_VCL}clWebLawngreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lawngreen{$ENDIF};
  if SameText(AColorName,'Lemonchiffon') then Result:=LemonchiffonColor;//{$IFDEF_VCL}clWebLemonchiffon{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lemonchiffon{$ENDIF};
  if SameText(AColorName,'Lightblue') then Result:=LightblueColor;//{$IFDEF_VCL}clWebLightblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightblue{$ENDIF};
  if SameText(AColorName,'Lightcoral') then Result:=LightcoralColor;//{$IFDEF_VCL}clWebLightcoral{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightcoral{$ENDIF};
  if SameText(AColorName,'Lightcyan') then Result:=LightcyanColor;//{$IFDEF_VCL}clWebLightcyan{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightcyan{$ENDIF};
  if SameText(AColorName,'Lightgoldenrodyellow') then Result:=LightgoldenrodyellowColor;//{$IFDEF_VCL}clWebLightgoldenrodyellow{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightgoldenrodyellow{$ENDIF};
  if SameText(AColorName,'Lightgreen') then Result:=LightgreenColor;//{$IFDEF_VCL}clWebLightgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightgreen{$ENDIF};
  if SameText(AColorName,'Lightgrey') then Result:=LightgreyColor;//{$IFDEF_VCL}clWebLightgrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightgrey{$ENDIF};
  if SameText(AColorName,'Lightpink') then Result:=LightpinkColor;//{$IFDEF_VCL}clWebLightpink{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightpink{$ENDIF};
  if SameText(AColorName,'Lightsalmon') then Result:=LightsalmonColor;//{$IFDEF_VCL}clWebLightsalmon{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightsalmon{$ENDIF};
  if SameText(AColorName,'Lightseagreen') then Result:=LightseagreenColor;//{$IFDEF_VCL}clWebLightseagreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightseagreen{$ENDIF};
  if SameText(AColorName,'Lightskyblue') then Result:=LightskyblueColor;//{$IFDEF_VCL}clWebLightskyblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightskyblue{$ENDIF};
  if SameText(AColorName,'Lightslategray') then Result:=LightslategrayColor;//{$IFDEF_VCL}clWebLightslategray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightslategray{$ENDIF};
//  if SameText(AColorName,'Aliceblue') then Result:=LightslategreyColor;//{$IFDEF_VCL}clWebLightslategrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightslategrey{$ENDIF};
  if SameText(AColorName,'Lightsteelblue') then Result:=LightsteelblueColor;//{$IFDEF_VCL}clWebLightsteelblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightsteelblue{$ENDIF};
  if SameText(AColorName,'Lightyellow') then Result:=LightyellowColor;//{$IFDEF_VCL}clWebLightyellow{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightyellow{$ENDIF};
  if SameText(AColorName,'Limegreen') then Result:=LimegreenColor;//{$IFDEF_VCL}clWebLimegreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Limegreen{$ENDIF};
  if SameText(AColorName,'Linen') then Result:=LinenColor;//{$IFDEF_VCL}clWebLinen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Linen{$ENDIF};
  if SameText(AColorName,'Magenta') then Result:=MagentaColor;//{$IFDEF_VCL}clWebMagenta{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Magenta{$ENDIF};
  if SameText(AColorName,'Mediumaquamarine') then Result:=MediumaquamarineColor;//{$IFDEF_VCL}clWebMediumaquamarine{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumaquamarine{$ENDIF};
  if SameText(AColorName,'Mediumblue') then Result:=MediumblueColor;//{$IFDEF_VCL}clWebMediumblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumblue{$ENDIF};
  if SameText(AColorName,'Mediumorchid') then Result:=MediumorchidColor;//{$IFDEF_VCL}clWebMediumorchid{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumorchid{$ENDIF};
  if SameText(AColorName,'Mediumpurple') then Result:=MediumpurpleColor;//{$IFDEF_VCL}clWebMediumpurple{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumpurple{$ENDIF};
  if SameText(AColorName,'Mediumseagreen') then Result:=MediumseagreenColor;//{$IFDEF_VCL}clWebMediumseagreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumseagreen{$ENDIF};
  if SameText(AColorName,'Mediumslateblue') then Result:=MediumslateblueColor;//{$IFDEF_VCL}clWebMediumslateblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumslateblue{$ENDIF};
  if SameText(AColorName,'Mediumspringgreen') then Result:=MediumspringgreenColor;//{$IFDEF_VCL}clWebMediumspringgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumspringgreen{$ENDIF};
  if SameText(AColorName,'Mediumturquoise') then Result:=MediumturquoiseColor;//{$IFDEF_VCL}clWebMediumturquoise{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumturquoise{$ENDIF};
  if SameText(AColorName,'Mediumvioletred') then Result:=MediumvioletredColor;//{$IFDEF_VCL}clWebMediumvioletred{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mediumvioletred{$ENDIF};
  if SameText(AColorName,'Midnightblue') then Result:=MidnightblueColor;//{$IFDEF_VCL}clWebMidnightblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Midnightblue{$ENDIF};
  if SameText(AColorName,'Mintcream') then Result:=MintcreamColor;//{$IFDEF_VCL}clWebMintcream{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mintcream{$ENDIF};
  if SameText(AColorName,'Mistyrose') then Result:=MistyroseColor;//{$IFDEF_VCL}clWebMistyrose{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Mistyrose{$ENDIF};
  if SameText(AColorName,'Moccasin') then Result:=MoccasinColor;//{$IFDEF_VCL}clWebMoccasin{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Moccasin{$ENDIF};
  if SameText(AColorName,'Navajowhite') then Result:=NavajowhiteColor;//{$IFDEF_VCL}clWebNavajowhite{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Navajowhite{$ENDIF};
  if SameText(AColorName,'Oldlace') then Result:=OldlaceColor;//{$IFDEF_VCL}clWebOldlace{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Oldlace{$ENDIF};
  if SameText(AColorName,'Olivedrab') then Result:=OlivedrabColor;//{$IFDEF_VCL}clWebOlivedrab{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Olivedrab{$ENDIF};
  if SameText(AColorName,'Orange') then Result:=OrangeColor;//{$IFDEF_VCL}clWebOrange{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Orange{$ENDIF};
  if SameText(AColorName,'Orangered') then Result:=OrangeredColor;//{$IFDEF_VCL}clWebOrangered{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Orangered{$ENDIF};
  if SameText(AColorName,'Orchid') then Result:=OrchidColor;//{$IFDEF_VCL}clWebOrchid{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Orchid{$ENDIF};
  if SameText(AColorName,'Palegoldenrod') then Result:=PalegoldenrodColor;//{$IFDEF_VCL}clWebPalegoldenrod{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Palegoldenrod{$ENDIF};
  if SameText(AColorName,'Palegreen') then Result:=PalegreenColor;//{$IFDEF_VCL}clWebPalegreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Palegreen{$ENDIF};
  if SameText(AColorName,'Paleturquoise') then Result:=PaleturquoiseColor;//{$IFDEF_VCL}clWebPaleturquoise{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Paleturquoise{$ENDIF};
  if SameText(AColorName,'Palevioletred') then Result:=PalevioletredColor;//{$IFDEF_VCL}clWebPalevioletred{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Palevioletred{$ENDIF};
  if SameText(AColorName,'Papayawhip') then Result:=PapayawhipColor;//{$IFDEF_VCL}clWebPapayawhip{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Papayawhip{$ENDIF};
  if SameText(AColorName,'Peachpuff') then Result:=PeachpuffColor;//{$IFDEF_VCL}clWebPeachpuff{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Peachpuff{$ENDIF};
  if SameText(AColorName,'Peru') then Result:=PeruColor;//{$IFDEF_VCL}clWebPeru{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Peru{$ENDIF};
  if SameText(AColorName,'Pink') then Result:=PinkColor;//{$IFDEF_VCL}clWebPink{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Pink{$ENDIF};
  if SameText(AColorName,'Plum') then Result:=PlumColor;//{$IFDEF_VCL}clWebPlum{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Plum{$ENDIF};
  if SameText(AColorName,'Powderblue') then Result:=PowderblueColor;//{$IFDEF_VCL}clWebPowderblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Powderblue{$ENDIF};
  if SameText(AColorName,'Rosybrown') then Result:=RosybrownColor;//{$IFDEF_VCL}clWebRosybrown{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Rosybrown{$ENDIF};
  if SameText(AColorName,'Royalblue') then Result:=RoyalblueColor;//{$IFDEF_VCL}clWebRoyalblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Royalblue{$ENDIF};
  if SameText(AColorName,'Saddlebrown') then Result:=SaddlebrownColor;//{$IFDEF_VCL}clWebSaddlebrown{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Saddlebrown{$ENDIF};
  if SameText(AColorName,'Salmon') then Result:=SalmonColor;//{$IFDEF_VCL}clWebSalmon{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Salmon{$ENDIF};
  if SameText(AColorName,'Sandybrown') then Result:=SandybrownColor;//{$IFDEF_VCL}clWebSandybrown{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Sandybrown{$ENDIF};
  if SameText(AColorName,'Seagreen') then Result:=SeagreenColor;//{$IFDEF_VCL}clWebSeagreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Seagreen{$ENDIF};
  if SameText(AColorName,'Seashell') then Result:=SeashellColor;//{$IFDEF_VCL}clWebSeashell{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Seashell{$ENDIF};
  if SameText(AColorName,'Sienna') then Result:=SiennaColor;//{$IFDEF_VCL}clWebSienna{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Sienna{$ENDIF};
  if SameText(AColorName,'Silver') then Result:=SilverColor;//{$IFDEF_VCL}clSilver{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Silver{$ENDIF};
  if SameText(AColorName,'Skyblue') then Result:=SkyblueColor;//{$IFDEF_VCL}clSkyblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Skyblue{$ENDIF};
  if SameText(AColorName,'Slateblue') then Result:=SlateblueColor;//{$IFDEF_VCL}clWebSlateblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Slateblue{$ENDIF};
  if SameText(AColorName,'Slategray') then Result:=SlategrayColor;//{$IFDEF_VCL}clWebSlategray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Slategray{$ENDIF};
//  if SameText(AColorName,'Aliceblue') then Result:=SlategreyColor;//{$IFDEF_VCL}clWebSlategrey{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Slategrey{$ENDIF};
  if SameText(AColorName,'Snow') then Result:=SnowColor;//{$IFDEF_VCL}clWebSnow{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Snow{$ENDIF};
  if SameText(AColorName,'Springgreen') then Result:=SpringgreenColor;//{$IFDEF_VCL}clWebSpringgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Springgreen{$ENDIF};
  if SameText(AColorName,'Steelblue') then Result:=SteelblueColor;//{$IFDEF_VCL}clWebSteelblue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Steelblue{$ENDIF};
  if SameText(AColorName,'Tan') then Result:=TanColor;//{$IFDEF_VCL}clWebTan{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Tan{$ENDIF};
  if SameText(AColorName,'Thistle') then Result:=ThistleColor;//{$IFDEF_VCL}clWebThistle{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Thistle{$ENDIF};
  if SameText(AColorName,'Tomato') then Result:=TomatoColor;//{$IFDEF_VCL}clWebTomato{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Tomato{$ENDIF};
  if SameText(AColorName,'Turquoise') then Result:=TurquoiseColor;//{$IFDEF_VCL}clWebTurquoise{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Turquoise{$ENDIF};
  if SameText(AColorName,'Violet') then Result:=VioletColor;//{$IFDEF_VCL}clWebViolet{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Violet{$ENDIF};
  if SameText(AColorName,'Wheat') then Result:=WheatColor;//{$IFDEF_VCL}clWebWheat{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Wheat{$ENDIF};
  if SameText(AColorName,'Whitesmoke') then Result:=WhitesmokeColor;//{$IFDEF_VCL}clWebWhitesmoke{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Whitesmoke{$ENDIF};
  if SameText(AColorName,'Yellowgreen') then Result:=YellowgreenColor;//{$IFDEF_VCL}clWebYellowgreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Yellowgreen{$ENDIF};
  {$ENDIF}

  if SameText(AColorName,'Blue') then Result:=BlueColor;//={$IFDEF_VCL}clBlue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Blue{$ENDIF};

  if SameText(AColorName,'Gray') then Result:=GrayColor;//{$IFDEF_VCL}clGray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Gray{$ENDIF};
  if SameText(AColorName,'Green') then Result:=GreenColor;//{$IFDEF_VCL}clGreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Green{$ENDIF};
  if SameText(AColorName,'Lightgray') then Result:=LightgrayColor;//{$IFDEF_VCL}clgray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightgray{$ENDIF};
//  if SameText(AColorName,'Aliceblue') then Result:=LightgrayColor;//{$IFDEF_VCL}clWebLightgray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lightgray{$ENDIF};
  if SameText(AColorName,'LtGray') then Result:=LtGrayColor;//{$IFDEF_VCL}clLtGray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.LtGray{$ENDIF};
  if SameText(AColorName,'MedGray') then Result:=MedGrayColor;//{$IFDEF_VCL}clMedGray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.MedGray{$ENDIF};
  if SameText(AColorName,'DkGray') then Result:=DkGrayColor;//{$IFDEF_VCL}clDkGray{$ENDIF}{$IFDEF FMX}TAlphaColorRec.DkGray{$ENDIF};
  if SameText(AColorName,'MoneyGreen') then Result:=MoneyGreenColor;//{$IFDEF_VCL}clMoneyGreen{$ENDIF}{$IFDEF FMX}TAlphaColorRec.MoneyGreen{$ENDIF};
//  if SameText(AColorName,'Aliceblue') then Result:=LegacySkyBlueColor;//{$IFDEF_VCL}clWebLegacySkyBlue{$ENDIF}{$IFDEF FMX}TAlphaColorRec.LegacySkyBlue{$ENDIF};
  if SameText(AColorName,'Cream') then Result:=CreamColor;//{$IFDEF_VCL}clCream{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Cream{$ENDIF};
  if SameText(AColorName,'Lime') then Result:=LimeColor;//{$IFDEF_VCL}clLime{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Lime{$ENDIF};
  if SameText(AColorName,'Maroon') then Result:=MaroonColor;//{$IFDEF_VCL}clMaroon{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Maroon{$ENDIF};
  if SameText(AColorName,'Navy') then Result:=NavyColor;//{$IFDEF_VCL}clNavy{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Navy{$ENDIF};
  if SameText(AColorName,'Olive') then Result:=OliveColor;//{$IFDEF_VCL}clOlive{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Olive{$ENDIF};
  if SameText(AColorName,'Purple') then Result:=PurpleColor;//{$IFDEF_VCL}clPurple{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Purple{$ENDIF};
  if SameText(AColorName,'Red') then Result:=RedColor;//{$IFDEF_VCL}clRed{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Red{$ENDIF};
  if SameText(AColorName,'Teal') then Result:=TealColor;//{$IFDEF_VCL}clTeal{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Teal{$ENDIF};


  if SameText(AColorName,'Black') then Result:=BlackColor;//={$IFDEF_VCL}clBlack{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Black{$ENDIF};

  if SameText(AColorName,'White') then Result:=WhiteColor;//{$IFDEF_VCL}clWhite{$ENDIF}{$IFDEF FMX}TAlphaColorRec.White{$ENDIF};
  if SameText(AColorName,'Yellow') then Result:=YellowColor;//{$IFDEF_VCL}clYellow{$ENDIF}{$IFDEF FMX}TAlphaColorRec.Yellow{$ENDIF};

end;

{$IFDEF FMX}
procedure CopyBitmap(ASrcBitmap:TBitmap;ADestBitmap:TBitmap);
begin
  ADestBitmap.SetSize(ASrcBitmap.Width,ASrcBitmap.Height);
  ADestBitmap.Canvas.BeginScene();
  try
    ADestBitmap.Canvas.Clear(0);
    ADestBitmap.Canvas.DrawBitmap(
            ASrcBitmap,
            RectF(0,0,ASrcBitmap.Width,ASrcBitmap.Height),
            RectF(0,0,ADestBitmap.Width,ADestBitmap.Height),
            1
            );
  finally
    ADestBitmap.Canvas.EndScene;
  end;
end;
{$ENDIF}

function ColorToWebHex(AColor:TDelphiColor):String;
  {$IFDEF FMX}
var
  AAlphaColorRec:TAlphaColorRec;
  {$ENDIF}
begin
  {$IFDEF FMX}
  //TDelphiColor是TAlphaColorRec
  AAlphaColorRec:=TAlphaColorRec(AColor);
  Result:=IntToHex(AAlphaColorRec.A,2)
          +IntToHex(AAlphaColorRec.R,2)
          +IntToHex(AAlphaColorRec.G,2)
          +IntToHex(AAlphaColorRec.B,2);
  {$ENDIF}
  {$IFDEF VCL}
  //TDelphiColor是TColor,0BGR
//  Result:=$FF000000
//        or (Byte(AVCLColor) shl 16)
//        or (AVCLColor and $0000FF00)
//        or ((AVCLColor and $00FF0000) shr 16);
  Result:='$FF'
          +IntToHex(Byte(AColor),2)
          +IntToHex((AColor and $0000FF00) shr 8,2)
          +IntToHex((AColor and $00FF0000) shr 16,2);
  {$ENDIF}
end;

function WebHexToColor(AColorStr:String):TDelphiColor;
  {$IFDEF FMX}
var
  AAlphaColorRec:TAlphaColorRec;
  {$ENDIF}
begin
  {$IFDEF FMX}
  if AColorStr<>'' then
  begin
    AAlphaColorRec.A:=StrToInt('$'+Copy(AColorStr,Low(AColorStr),2));
    AAlphaColorRec.R:=StrToInt('$'+Copy(AColorStr,Low(AColorStr)+2,2));
    AAlphaColorRec.G:=StrToInt('$'+Copy(AColorStr,Low(AColorStr)+4,2));
    AAlphaColorRec.B:=StrToInt('$'+Copy(AColorStr,Low(AColorStr)+6,2));
    Result:=TDelphiColor(AAlphaColorRec);
  end
  else
  begin
    Result:=BlackColor;
  end;
  {$ENDIF}
  {$IFDEF VCL}
  //TDelphiColor是TColor,0BGR
//  Result:=$FF000000
//  Result:=$FF0199FF:ARGB  ->  00FF9901
//        or (Byte(AVCLColor) shl 16)
//        or (AVCLColor and $0000FF00)
//        or ((AVCLColor and $00FF0000) shr 16);
//  Result:=StrToInt('$'+Copy(AColorStr,1+2,2))
//              +StrToInt('$'+Copy(AColorStr,1+4,2)) shl 8
//              +StrToInt('$'+Copy(AColorStr,1+6,2)) shl 16;
  Result:=StrToInt('$'+Copy(AColorStr,2+2,2))
              +StrToInt('$'+Copy(AColorStr,2+4,2)) shl 8
              +StrToInt('$'+Copy(AColorStr,2+6,2)) shl 16;
  {$ENDIF}
end;



//function GetAlign(AAlignStr:String):TAlignLayout;
//begin
//
//  if AAlignStr='Top' then Result:=TAlignLayout.Top
//  else if AAlignStr='Top' then Result:=TAlignLayout.None
//  else if AAlignStr='Top' then Result:=TAlignLayout.Top
//  else if AAlignStr='Top' then Result:=TAlignLayout.Left
//  else if AAlignStr='Top' then Result:=TAlignLayout.Right
//  else if AAlignStr='Top' then Result:=TAlignLayout.Bottom
//  else if AAlignStr='Top' then Result:=TAlignLayout.MostTop
//  else if AAlignStr='Top' then Result:=TAlignLayout.MostBottom
//  else if AAlignStr='Top' then Result:=TAlignLayout.MostLeft
//  else if AAlignStr='Top' then Result:=TAlignLayout.MostRight
//  else if AAlignStr='Top' then Result:=TAlignLayout.Client
//  else if AAlignStr='Top' then Result:=TAlignLayout.Contents
//  else if AAlignStr='Top' then Result:=TAlignLayout.Center
//  else if AAlignStr='Top' then Result:=TAlignLayout.VertCenter
//  else if AAlignStr='Top' then Result:=TAlignLayout.HorzCenter
//  else if AAlignStr='Top' then Result:=TAlignLayout.Horizontal
//  else if AAlignStr='Top' then Result:=TAlignLayout.Vertical
//  else if AAlignStr='Top' then Result:=TAlignLayout.Scale
//  else if AAlignStr='Top' then Result:=TAlignLayout.Fit
//  else if AAlignStr='Top' then Result:=TAlignLayout.FitLeft
//  else if AAlignStr='Top' then Result:=TAlignLayout.FitRight;
//
//end;

function GetAlignStr(AAlign:TAlignLayout):String;
begin

  {$IFDEF FMX}
  case AAlign of
    TAlignLayout.None: Result:='None';
    TAlignLayout.Top: Result:='Top';
    TAlignLayout.Left: Result:='Left';
    TAlignLayout.Right: Result:='Right';
    TAlignLayout.Bottom: Result:='Bottom';
    TAlignLayout.MostTop: Result:='MostTop';
    TAlignLayout.MostBottom: Result:='MostBottom';
    TAlignLayout.MostLeft: Result:='MostLeft';
    TAlignLayout.MostRight: Result:='MostRight';
    TAlignLayout.Client: Result:='Client';
    TAlignLayout.Contents: Result:='Contents';
    TAlignLayout.Center: Result:='Center';
    TAlignLayout.VertCenter: Result:='VertCenter';
    TAlignLayout.HorzCenter: Result:='HorzCenter';
    TAlignLayout.Horizontal: Result:='Horizontal';
    TAlignLayout.Vertical: Result:='Vertical';
    TAlignLayout.Scale: Result:='Scale';
    TAlignLayout.Fit: Result:='Fit';
    TAlignLayout.FitLeft: Result:='FitLeft';
    TAlignLayout.FitRight: Result:='FitRight';
  end;
  {$ELSE}
  //VCL
  case AAlign of
    TAlign.alNone: Result:='None';
    TAlign.alTop: Result:='Top';
    TAlign.alLeft: Result:='Left';
    TAlign.alRight: Result:='Right';
    TAlign.alBottom: Result:='Bottom';
//    TAlign.alMostTop: Result:='MostTop';
//    TAlign.alMostBottom: Result:='MostBottom';
//    TAlign.alMostLeft: Result:='MostLeft';
//    TAlign.alMostRight: Result:='MostRight';
    TAlign.alClient: Result:='Client';
//    TAlign.alContents: Result:='Contents';
//    TAlign.alCenter: Result:='Center';
//    TAlign.alVertCenter: Result:='VertCenter';
//    TAlign.alHorzCenter: Result:='HorzCenter';
//    TAlign.alHorizontal: Result:='Horizontal';
//    TAlign.alVertical: Result:='Vertical';
//    TAlign.alScale: Result:='Scale';
//    TAlign.alFit: Result:='Fit';
//    TAlign.alFitLeft: Result:='FitLeft';
//    TAlign.alFitRight: Result:='FitRight';
  end;
  {$ENDIF VCL}
end;


function GetAlign(AAlignStr:String):TAlignLayout;
begin
  {$IFDEF FMX}
  Result:=TAlignLayout.None;
  //  TAlignLayout = (None, Top, Left, Right, Bottom,
  //MostTop, MostBottom,MostLeft, MostRight,
  //Client, Contents, Center, VertCenter,HorzCenter,
  //Horizontal, Vertical, Scale,
  //Fit, FitLeft, FitRight);
  if SameText(AAlignStr,'Top') or SameText(AAlignStr,'alTop') then Result:=TAlignLayout.Top;
  if SameText(AAlignStr,'Left') or SameText(AAlignStr,'alLeft') then Result:=TAlignLayout.Left;
  if SameText(AAlignStr,'Right') or SameText(AAlignStr,'alRight') then Result:=TAlignLayout.Right;
  if SameText(AAlignStr,'Bottom') or SameText(AAlignStr,'alBottom') then Result:=TAlignLayout.Bottom;

  if SameText(AAlignStr,'MostTop') or SameText(AAlignStr,'alMostTop') then Result:=TAlignLayout.MostTop;
  if SameText(AAlignStr,'MostBottom') or SameText(AAlignStr,'alMostBottom') then Result:=TAlignLayout.MostBottom;
  if SameText(AAlignStr,'MostLeft') or SameText(AAlignStr,'alMostLeft') then Result:=TAlignLayout.MostLeft;
  if SameText(AAlignStr,'MostRight') or SameText(AAlignStr,'alMostRight') then Result:=TAlignLayout.MostRight;

  if SameText(AAlignStr,'Client') or SameText(AAlignStr,'alClient') then Result:=TAlignLayout.Client;
  if SameText(AAlignStr,'Contents') or SameText(AAlignStr,'alContents') then Result:=TAlignLayout.Contents;
  if SameText(AAlignStr,'Center') or SameText(AAlignStr,'alCenter') then Result:=TAlignLayout.Center;
  if SameText(AAlignStr,'VertCenter') or SameText(AAlignStr,'alVertCenter') then Result:=TAlignLayout.VertCenter;

  if SameText(AAlignStr,'Horizontal') or SameText(AAlignStr,'alHorizontal') then Result:=TAlignLayout.Horizontal;
  if SameText(AAlignStr,'Vertical') or SameText(AAlignStr,'alVertical') then Result:=TAlignLayout.Vertical;
  if SameText(AAlignStr,'Scale') or SameText(AAlignStr,'alScale') then Result:=TAlignLayout.Scale;

  if SameText(AAlignStr,'Fit') or SameText(AAlignStr,'alFit') then Result:=TAlignLayout.Fit;
  if SameText(AAlignStr,'FitLeft') or SameText(AAlignStr,'alFitLeft') then Result:=TAlignLayout.FitLeft;
  if SameText(AAlignStr,'FitRight') or SameText(AAlignStr,'alFitRight') then Result:=TAlignLayout.FitRight;
  {$ELSE}
  Result:=TAlign.alNone;
  //  TAlign = (None, Top, Left, Right, Bottom,
  //MostTop, MostBottom,MostLeft, MostRight,
  //Client, Contents, Center, VertCenter,HorzCenter,
  //Horizontal, Vertical, Scale,
  //Fit, FitLeft, FitRight);
  if SameText(AAlignStr,'Top') or SameText(AAlignStr,'alTop') then Result:=TAlign.alTop;
  if SameText(AAlignStr,'Left') or SameText(AAlignStr,'alLeft') then Result:=TAlign.alLeft;
  if SameText(AAlignStr,'Right') or SameText(AAlignStr,'alRight') then Result:=TAlign.alRight;
  if SameText(AAlignStr,'Bottom') or SameText(AAlignStr,'alBottom') then Result:=TAlign.alBottom;

//  if SameText(AAlignStr,'MostTop') then Result:=TAlign.alMostTop;
//  if SameText(AAlignStr,'MostBottom') then Result:=TAlign.alMostBottom;
//  if SameText(AAlignStr,'MostLeft') then Result:=TAlign.alMostLeft;
//  if SameText(AAlignStr,'MostRight') then Result:=TAlign.alMostRight;

  if SameText(AAlignStr,'Client') or SameText(AAlignStr,'alClient') then Result:=TAlign.alClient;
//  if SameText(AAlignStr,'Contents') then Result:=TAlign.alContents;
//  if SameText(AAlignStr,'Center') then Result:=TAlign.alCenter;
//  if SameText(AAlignStr,'VertCenter') then Result:=TAlign.alVertCenter;
//
//  if SameText(AAlignStr,'Horizontal') then Result:=TAlign.alHorizontal;
//  if SameText(AAlignStr,'Vertical') then Result:=TAlign.alVertical;
//  if SameText(AAlignStr,'Scale') then Result:=TAlign.alScale;
//
//  if SameText(AAlignStr,'Fit') then Result:=TAlign.alFit;
//  if SameText(AAlignStr,'FitLeft') then Result:=TAlign.alFitLeft;
//  if SameText(AAlignStr,'FitRight') then Result:=TAlign.alFitRight;

  {$ENDIF}
end;

function GetBindItemFieldNameByItemColorType(AItemColorType: TSkinItemColorType):String;
begin
  Result:='';
  case AItemColorType of
    sictNone: ;
    sictBackColor:
    begin
//      //背景颜色
//      AOldColor:=Self.FSkinControlIntf.GetCurrentUseMaterial.BackColor.FillDrawColor.FColor;
//      Self.FSkinControlIntf.GetCurrentUseMaterial.BackColor.FillDrawColor.FColor:=AItemColor;
    end;
    sictCaptionFontColor,sictCaptionBackColor:
    begin
      //标题字体颜色
      Result:='ItemCaption';
    end;
    sictDetailFontColor,sictDetailBackColor:
    begin
      Result:='ItemDetail';
    end;
    sictDetail1FontColor,sictDetail1BackColor:
    begin
      Result:='ItemDetail1';
    end;
    sictDetail2FontColor,sictDetail2BackColor:
    begin
      Result:='ItemDetail2';
    end;
    sictDetail3FontColor,sictDetail3BackColor:
    begin
      Result:='ItemDetail3';
    end;
    sictDetail4FontColor,sictDetail4BackColor:
    begin
      Result:='ItemDetail4';
    end;
    sictDetail5FontColor,sictDetail5BackColor:
    begin
      Result:='ItemDetail5';
    end;
    sictDetail6FontColor,sictDetail6BackColor:
    begin
      Result:='ItemDetail6';
    end;
    sictIconBackColor:
    begin
      Result:='ItemIcon';
    end;
    sictPicBackColor:
    begin
      Result:='ItemPic';
    end;
  end;

end;

function GetBindItemColorSetTypeByItemColorType(AItemColorType: TSkinItemColorType):TSkinItemColorSetType;
begin
  Result:=sicstNone;
  case AItemColorType of
    sictNone: ;
    sictBackColor:
    begin
//      //背景颜色
//      AOldColor:=Self.FSkinControlIntf.GetCurrentUseMaterial.BackColor.FillDrawColor.FColor;
//      Self.FSkinControlIntf.GetCurrentUseMaterial.BackColor.FillDrawColor.FColor:=AItemColor;
    end;
    sictCaptionFontColor,sictDetailFontColor,sictDetail1FontColor,sictDetail2FontColor,sictDetail3FontColor,sictDetail4FontColor,
    sictDetail5FontColor,sictDetail6FontColor:
    begin
      Result:=sicstFontColor;
    end;
    sictCaptionBackColor,sictDetailBackColor,sictDetail1BackColor,sictDetail2BackColor,sictDetail3BackColor,sictDetail4BackColor,
    sictDetail5BackColor,sictDetail6BackColor,
    sictIconBackColor,sictPicBackColor:
    begin
      //背景颜色
      Result:=sicstBackColor;
    end;
  end;

end;


function GetAnchorsStr(AAnchors:TAnchors):String;
begin
  Result:='';
  if TAnchorKind.akLeft in AAnchors then
  begin
    Result:=Result+'Left'+',';
  end;
  if TAnchorKind.akTop in AAnchors then
  begin
    Result:=Result+'Top'+',';
  end;
  if TAnchorKind.akRight in AAnchors then
  begin
    Result:=Result+'Right'+',';
  end;
  if TAnchorKind.akBottom in AAnchors then
  begin
    Result:=Result+'Bottom'+',';
  end;
end;

function GetAnchors(AAnchorsStr:String):TAnchors;
var
  AStringList:TStringList;
  I: Integer;
begin
  if AAnchorsStr='' then
  begin
    {$IFDEF FMX}
    Result:=[TAnchorKind.akLeft,TAnchorKind.akTop];
    {$ENDIF}
    {$IFDEF VCL}
    Result:=[akLeft,akTop];
    {$ENDIF}
    Exit;
  end;

  Result:=[];
  AStringList:=TStringList.Create;
  try
      AStringList.CommaText:=AAnchorsStr;

//  TAnchorKind = (akLeft, akTop, akRight, );
//  TAnchors = set of TAnchorKind;

      for I := 0 to AStringList.Count-1 do
      begin
        if SameText(AStringList[I],'Left') then
        begin
          Result:=Result+[TAnchorKind.akLeft];
        end;
        if SameText(AStringList[I],'Top') then
        begin
          Result:=Result+[TAnchorKind.akTop];
        end;
        if SameText(AStringList[I],'Right') then
        begin
          Result:=Result+[TAnchorKind.akRight];
        end;
        if SameText(AStringList[I],'Bottom') then
        begin
          Result:=Result+[TAnchorKind.akBottom];
        end;
      end;

  finally
    FreeAndNil(AStringList);
  end;
end;






function AdjustDrawLinePos(A:Double;Offset:Double):Double;
begin
  //如果不加偏移,在移动平台上绘制的时候一个像素的线会画成两个像素

  if IsAdjustDrawLinePos then
  begin
    Result:=Floor(A)+Offset;
  end
  else
  begin
    Result:=A;
  end;

end;

function GetDis(APoint,BPoint:TPointF):Double;
begin
  Result:=Sqrt(Power(APoint.X-BPoint.X,2)+Power(APoint.Y-BPoint.Y,2));
end;


{$IFDEF VCL}
  {$IFNDEF DELPHIXE4}

function UnionRectF(out Rect: TRectF; const R1, R2: TRectF): Boolean;
var
  tmpRect: TRectF;
begin
  tmpRect := R1;
  if not RectIsEmptyF(R2) then
  begin
    if R2.Left < R1.Left then tmpRect.Left := R2.Left;
    if R2.Top < R1.Top then tmpRect.Top := R2.Top;
    if R2.Right > R1.Right then tmpRect.Right := R2.Right;
    if R2.Bottom > R1.Bottom then tmpRect.Bottom := R2.Bottom;
  end;
  Result := not RectIsEmptyF(tmpRect);
  if not Result then
  begin
    tmpRect.Top :=0.0;
    tmpRect.Bottom := 0.0;
    tmpRect.Left := 0.0;
    tmpRect.Right := 0.0;
  end;
  Rect := tmpRect;
end;


function RectF(Left, Top, Right, Bottom: Single): TRectF;
begin
  Result.Left := Left;
  Result.Top := Top;
  Result.Bottom := Bottom;
  Result.Right := Right;
end;


procedure InflateRect(var R: TRectF; const DX, DY: Single);
begin
  R.Left := R.Left - DX;
  R.Right := R.Right + DX;
  R.Top := R.Top - DY;
  R.Bottom := R.Bottom + DY;
end;

function PointF(X, Y: Single): TPointF;
begin
  Result.X := X;
  Result.Y := Y;
end;
  {$ENDIF}
{$ENDIF}


function IntersectRectF(const Rect1, Rect2: TRectF): Boolean;
begin
  Result := (Rect1.Left < Rect2.Right)
        and (Rect1.Right > Rect2.Left)
        and (Rect1.Top < Rect2.Bottom)
        and (Rect1.Bottom > Rect2.Top);
end;

function IntersectRectF(out Rect: TRectF; const R1, R2: TRectF): Boolean;
var
  tmpRect: TRectF;
begin
  tmpRect := R1;
  if R2.Left > R1.Left then tmpRect.Left := R2.Left;
  if R2.Top > R1.Top then tmpRect.Top := R2.Top;
  if R2.Right < R1.Right then tmpRect.Right := R2.Right;
  if R2.Bottom < R1.Bottom then tmpRect.Bottom := R2.Bottom;
  Result := not RectIsEmptyF(tmpRect);
  if not Result then
  begin
    tmpRect.Top := 0.0;
    tmpRect.Bottom := 0.0;
    tmpRect.Left := 0.0;
    tmpRect.Right := 0.0;
  end;
  Rect := tmpRect;
end;


function PtInRectF(const Rect: TRectF; const P: TPointF): Boolean;
begin
  Result := (P.X >= Rect.Left) and (P.X < Rect.Right) and (P.Y >= Rect.Top)
    and (P.Y < Rect.Bottom);
end;

function OffsetRectF(var R: TRectF; DX, DY: Single): Boolean;
begin
//{$EXCESSPRECISION OFF}
  if @R <> nil then // Test to increase compatiblity with Windows
  begin
    R.Left := R.Left + DX;
    R.Right := R.Right + DX;
    R.Top := R.Top + DY;
    R.Bottom := R.Bottom + DY;
    Result := True;
  end
  else
    Result := False;
//{$EXCESSPRECISION ON}
end;


function GetAngle(X1:Double;Y1:Double;X2:Double;Y2:Double):Double;
var
  X,Y,H:Double;
  Cos:Double;
  Rad:Double;
begin
  X:=X2-X1;
  Y:=Y2-Y1;
  H:=Sqrt(Math.Power(X,2)+Math.Power(Y,2));
  Cos:=X/H;
  Rad:=Math.ArcCos(Cos);
//  Result:=180/(P/Rad);
  Result:=180/PI*Rad;
  if (Y<0) then
  begin
    Result:=-(Result);
  end
  else if ((Y=0) and (X<0)) then
  begin
    Result:=-(Result);
  end;

//function getAngle(px1, py1, px2, py2) {
//        //两点的x、y值
//        x = px2-px1;
//        y = py2-py1;
//        hypotenuse = Math.sqrt(Math.pow(x, 2)+Math.pow(y, 2));
//        //斜边长度
//        cos = x/hypotenuse;
//        radian = Math.acos(cos);
//        //求出弧度
//        angle = 180/(Math.PI/radian);
//        //用弧度算出角度
//        if (y<0) {
//                angle = -angle;
//        } else if ((y == 0) && (x<0)) {
//                angle = 180;
//        }
//        return angle;
//}

end;

function GetAbsAngle(X1:Double;Y1:Double;X2:Double;Y2:Double;IsHorz:Boolean):Double;
begin
  Result:=GetAngle(X1,Y1,X2,Y2);
  if IsHorz then
  begin
      //水平线
      if (Result>=0) and (Result<=90) then
      begin

      end
      else if (Result>=90) and (Result<=180) then
      begin
        Result:=180-Result;
      end
      else if (Result<=0) and (Result>=-90) then
      begin
        Result:=-Result;
      end
      else if (Result<=-90) and (Result>=-180) then
      begin
        Result:=180+Result;
      end;
  end
  else
  begin
      //垂直线
      if (Result>=0) and (Result<=90) then
      begin
        Result:=90-Result;
      end
      else if (Result>=90) and (Result<=180) then
      begin
        Result:=Result-90;
      end
      else if (Result<=0) and (Result>=-90) then
      begin
        Result:=90+Result;
      end
      else if (Result<=-90) and (Result>=-180) then
      begin
        Result:=-(90+Result);
      end;
  end;

end;


{$IFDEF FMX}
procedure ClearStyleObjectVisiualElement(AStyleObject:TFmxObject;AControlClassify:String);
var
  I: Integer;
  ATempObject:TFmxObject;
  ANullBitmapLinks:TBitmapLinks;
begin
//  uBaseLog.HandleException(nil,'ClearStyleObjectVisiualElement AStyleObject.Class is '+AStyleObject.ClassName);
//  Exit;
  if AStyleObject is TStyleObject then
  begin
    ANullBitmapLinks:=TBitmapLinks.Create();
    TStyleObject(AStyleObject).SourceLink:=ANullBitmapLinks;
    FreeAndNil(ANullBitmapLinks);
  end;
  if AStyleObject is TActiveStyleObject then
  begin
    ANullBitmapLinks:=TBitmapLinks.Create();
    TActiveStyleObject(AStyleObject).SourceLink:=ANullBitmapLinks;
    TActiveStyleObject(AStyleObject).ActiveLink:=ANullBitmapLinks;
    FreeAndNil(ANullBitmapLinks);
  end;
  if AStyleObject is TRectangle then
  begin
    TRectangle(AStyleObject).Fill.Kind:=TBrushKind.Solid;
    TRectangle(AStyleObject).Fill.Color:=TAlphaColorRec.Null;
  end;
  if AStyleObject is TButtonStyleObject then
  begin
    ANullBitmapLinks:=TBitmapLinks.Create();
    TButtonStyleObject(AStyleObject).HotLink:=ANullBitmapLinks;
    TButtonStyleObject(AStyleObject).FocusedLink:=ANullBitmapLinks;
    TButtonStyleObject(AStyleObject).NormalLink:=ANullBitmapLinks;
    TButtonStyleObject(AStyleObject).PressedLink:=ANullBitmapLinks;
    FreeAndNil(ANullBitmapLinks);


  end;

  for I := AStyleObject.ChildrenCount-1 downto 0 do
  begin
//    uBaseLog.HandleException(nil,'ClearStyleObjectVisiualElement AStyleObject.Children['+IntToStr(I)+'].Class is '+AStyleObject.Children[I].ClassName);
    //ComboBox
    if (AStyleObject.Children[I].ClassName='TLayout')
      and (AStyleObject.Children[I].ChildrenCount>0)
      then
    begin
      ATempObject:=AStyleObject.Children[I];

      if (AControlClassify='ComboBox')
        and (AStyleObject.Children[I].Children[0].ClassName='TStyleObject') then
      begin
        ANullBitmapLinks:=TBitmapLinks.Create();
        TStyleObject(AStyleObject.Children[I].Children[0]).SourceLink:=ANullBitmapLinks;
        FreeAndNil(ANullBitmapLinks);
      end;

      if (AControlClassify='ComboBox')
        and (AStyleObject.Children[I].Children[0].ClassName='TButtonStyleObject') then
      begin
        ANullBitmapLinks:=TBitmapLinks.Create();
        TButtonStyleObject(AStyleObject.Children[I].Children[0]).HotLink:=ANullBitmapLinks;
        TButtonStyleObject(AStyleObject.Children[I].Children[0]).FocusedLink:=ANullBitmapLinks;
        TButtonStyleObject(AStyleObject.Children[I].Children[0]).NormalLink:=ANullBitmapLinks;
        TButtonStyleObject(AStyleObject.Children[I].Children[0]).PressedLink:=ANullBitmapLinks;
        FreeAndNil(ANullBitmapLinks);
      end;

      if (AStyleObject.Children[I].Children[0].ClassName='TPath') then
      begin
        FreeAndNil(ATempObject);
      end;


      Continue;
    end;
    if (AControlClassify='ComboEdit') then
    begin
      ClearStyleObjectVisiualElement(AStyleObject.Children[I],'ComboEdit');
    end;
  end;

end;
{$ENDIF}




procedure LockSkinControlInvalidate;
begin
  SkinControlInvalidateLocked:=SkinControlInvalidateLocked+1;
end;

procedure UnLockSkinControlInvalidate;
begin
  SkinControlInvalidateLocked:=SkinControlInvalidateLocked-1;
end;

function ControlSize(const ASize:Double):TControlSize;
begin
  {$IFDEF FMX}
  Result:=ASize;
  {$ENDIF}
  {$IFDEF VCL}
  Result:=Ceil(ASize);
  {$ENDIF}
end;

function FloorControlSize(const ASize:Double):TControlSize;
begin
  {$IFDEF FMX}
  Result:=ASize;
  {$ENDIF}
  {$IFDEF VCL}
  Result:=Floor(ASize);
  {$ENDIF}
end;

function MakeColor(const R,G,B:Byte;const A:Byte=255):TDelphiColor;
begin
  {$IFDEF VCL}
  Result := (UInt32(B) shl TColor_BlueShift) or
            (UInt32(G) shl TColor_GreenShift) or
            (UInt32(R) shl TColor_RedShift) or
            (A mod 255 shl TColor_AlphaShift);
  {$ENDIF}
  {$IFDEF FMX}
  TAlphaColorRec(Result).A:=A;
  TAlphaColorRec(Result).R:=R;
  TAlphaColorRec(Result).G:=G;
  TAlphaColorRec(Result).B:=B;
  {$ENDIF}
end;

function RectWidthF(const Rect: TRectF): Single;
begin
  Result := Rect.Right - Rect.Left;
end;

function RectHeightF(const Rect: TRectF): Single;
begin
  Result := Rect.Bottom - Rect.Top;
end;

function RectWidth(const Rect: TRect): Integer;
begin
  Result := Rect.Right - Rect.Left;
end;

function RectHeight(const Rect: TRect): Integer;
begin
  Result := Rect.Bottom - Rect.Top;
end;

function RectIsEmptyF(const Rect: TRectF): Boolean;
begin
  Result := (Rect.Right <= Rect.Left) or (Rect.Bottom <= Rect.Top);
end;

function RectF2Rect(const Rect: TRectF): TRect;
begin
  Result.Left:=Ceil(Rect.Left);
  Result.Top:=Ceil(Rect.Top);
  Result.Right:=Ceil(Rect.Right);
  Result.Bottom:=Ceil(Rect.Bottom);
end;

function Rect2RectF(const Rect: TRect): TRectF;
begin
  Result.Left:=Rect.Left;
  Result.Top:=Rect.Top;
  Result.Right:=Rect.Right;
  Result.Bottom:=Rect.Bottom;
end;





{$IFDEF DELPHI}
{$IFDEF VCL}
    {$IFNDEF DELPHIXE4}
    //没有定义TRectF

function TRectF.GetHeight: Single;
begin
//{$EXCESSPRECISION OFF}
  Result := Self.Bottom - Self.Top;
//{$EXCESSPRECISION ON}
end;

function TRectF.GetWidth: Single;
begin
//{$EXCESSPRECISION OFF}
  Result := Self.Right - Self.Left;
//{$EXCESSPRECISION ON}
end;

procedure TRectF.SetHeight(const Value: Single);
begin
//{$EXCESSPRECISION OFF}
  Self.Bottom := Self.Top + Value;
//{$EXCESSPRECISION ON}
end;

procedure TRectF.SetWidth(const Value: Single);
begin
//{$EXCESSPRECISION OFF}
  Self.Right := Self.Left + Value;
//{$EXCESSPRECISION ON}
end;

function TRectF.IsEmpty: Boolean;
begin
  Result := (Right <= Left) or (Bottom <= Top);
end;
    {$ENDIF}

{$ENDIF}
{$ENDIF}





{ TDrawColor }

procedure TDrawColor.DoChange;
begin
  if Assigned(Self.FOnChange) then
  begin
    FOnChange(Self);
  end;
end;

procedure TDrawColor.AssignTo(Dest: TPersistent);
var
  DestObject:TDrawColor;
begin
  if Dest is TDrawColor then
  begin
    DestObject:=TDrawColor(Dest);

    DestObject.FColor:=FColor;

    DestObject.FUseThemeColor:=FUseThemeColor;

    {$IFDEF VCL}
    DestObject.FAlpha:=FAlpha;
    {$ENDIF}

    DestObject.DoChange;
  end
  else
  begin
    Inherited;
  end;
end;

constructor TDrawColor.Create(const AName: String;const ACaption:String);
begin
  FName:=AName;
  FCaption:=ACaption;
  {$IFDEF VCL}
  FAlpha:=255;
  {$ENDIF}
  FColor:=BlackColor;

  StoredDefaultColor:=BlackColor;
end;

destructor TDrawColor.Destroy;
begin
  FOnChange:=nil;
  inherited;
end;

function TDrawColor.GetAlpha: Byte;
begin
  {$IFDEF VCL}
  Result:=FAlpha;
  {$ENDIF}
  {$IFDEF FMX}
  Result:=TAlphaColorRec(FColor).A;
  {$ENDIF}
end;

function TDrawColor.GetColor: TDelphiColor;
begin
  case FUseThemeColor of
    ctNone: Result:=FColor;
    ctThemeColor: Result:=SkinThemeColor;
    ctThemeColor1: Result:=SkinThemeColor1;
    ctThemeColor2: Result:=SkinThemeColor2;
    ctThemeColor3: Result:=SkinThemeColor3;
    ctNavigationBarColor: Result:=SkinNavigationBarColor;
    ctNavigationBarFontColor: Result:=SkinNavigationBarFontColor;
  end;
end;

procedure TDrawColor.InitDefaultColor(AColor: TDelphiColor);
begin
  Color:=AColor;
  StoredDefaultColor:=AColor;
end;

function TDrawColor.IsAlphaStored: Boolean;
begin
  {$IFDEF FMX}
  Result:=False;
  {$ENDIF}
  {$IFDEF VCL}
  Result:=True;
  {$ENDIF}
end;

function TDrawColor.IsColorStored: Boolean;
begin
  Result:=(FColor<>StoredDefaultColor);
end;

function TDrawColor.IsUseThemeColorStored: Boolean;
begin
  Result:=(FUseThemeColor<>ctNone);
end;

procedure TDrawColor.SetAlpha(const Value: Byte);
begin
  {$IFDEF VCL}
  FAlpha:=Value;
  {$ENDIF}

  {$IFDEF FMX}
  TAlphaColorRec(FColor).A:=Value;
  {$ENDIF}

  DoChange;
end;

procedure TDrawColor.SetColor(const Value: TDelphiColor);
begin
  if FColor<>Value then
  begin
    {$IFDEF VCL}
    FColor:=Value;
    {$ENDIF}


    {$IFDEF FMX}
  //  if TAlphaColorRec(Value).A=0 then
  //  begin
  //    TAlphaColorRec(FColor).R:=TAlphaColorRec(Value).R;
  //    TAlphaColorRec(FColor).G:=TAlphaColorRec(Value).G;
  //    TAlphaColorRec(FColor).B:=TAlphaColorRec(Value).B;
  //  end
  //  else
  //  begin
      FColor:=Value;
  //  end;
    {$ENDIF}


    DoChange;
  end;
end;

procedure TDrawColor.SetUseThemeColor(const Value: TUseThemeColorType);
begin
  if FUseThemeColor<>Value then
  begin
    FUseThemeColor := Value;
    Self.DoChange;
  end;
end;

{ TBorderMargins }

constructor TBorderMargins.Create;
begin
  inherited Create;
  InitDefaults(Self);
end;

procedure TBorderMargins.AssignTo(Dest: TPersistent);
begin
  if Dest is TBorderMargins then
  begin
    with TBorderMargins(Dest) do
    begin
      FLeft := Self.FLeft;
      FTop := Self.FTop;
      FRight := Self.FRight;
      FBottom := Self.FBottom;
      DoChange;
    end;
  end
  else
  begin
    inherited;
  end;
end;

procedure TBorderMargins.DoChange;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

function TBorderMargins.SaveToString: String;
begin
  Result:=IntToStr(Self.Left)+','
          +IntToStr(Self.Top)+','
          +IntToStr(Self.Right)+','
          +IntToStr(Self.Bottom);
end;

procedure TBorderMargins.SetBorderMargin(Index: Integer; Value: TBorderMarginSize);
begin
  case Index of
    0:
      if Value <> FLeft then
      begin
        FLeft := Value;
        DoChange;
      end;
    1:
      if Value <> FTop then
      begin
        FTop := Value;
        DoChange;
      end;
    2:
      if Value <> FRight then
      begin
        FRight := Value;
        DoChange;
      end;
    3:
      if Value <> FBottom then
      begin
        FBottom := Value;
        DoChange;
      end;
  end;
end;

procedure TBorderMargins.SetBounds(ALeft, ATop, ARight, ABottom: Integer);
begin
  if (FLeft <> ALeft) or (FTop <> ATop) or (FRight <> ARight) or (FBottom <> ABottom) then
  begin
    FLeft := ALeft;
    FTop := ATop;
    FRight := ARight;
    FBottom := ABottom;
    DoChange;
  end;
end;

class procedure TBorderMargins.InitDefaults(Margins: TBorderMargins);
begin
  with Margins do
  begin
    FLeft := DefaultMargin;
    FRight := DefaultMargin;
    FTop := DefaultMargin;
    FBottom := DefaultMargin;
  end;
end;

function TBorderMargins.IsBottomStored(const Index: Integer): Boolean;
begin
  Result:=(Self.FBottom<>DefaultMargin);
end;

function TBorderMargins.IsLeftStored(const Index: Integer): Boolean;
begin
  Result:=(Self.FLeft<>DefaultMargin);
end;

function TBorderMargins.IsRightStored(const Index: Integer): Boolean;
begin
  Result:=(Self.FRight<>DefaultMargin);
end;

function TBorderMargins.IsTopStored(const Index: Integer): Boolean;
begin
  Result:=(Self.FTop<>DefaultMargin);
end;

procedure TBorderMargins.LoadFromString(const AMarginsStr: String);
var
  AMargins:TStringList;
begin
  AMargins:=TStringList.Create;
  AMargins.CommaText:=AMarginsStr;
  if AMargins.Count>=4 then
  begin
    Self.SetBounds(StrToInt(AMargins[0]),StrToInt(AMargins[1]),StrToInt(AMargins[2]),StrToInt(AMargins[3])   );
  end;
  FreeAndNil(AMargins);
end;


{ TSkinTheme }

constructor TSkinTheme.Create(AOwner: TComponent);
begin
  inherited;

  FSkinThemeColor:=uGraphicCommon.SkinThemeColor;

  FSkinThemeColor1:=uGraphicCommon.SkinThemeColor1;

  FSkinThemeColor2:=uGraphicCommon.SkinThemeColor2;

  FSkinThemeColor3:=uGraphicCommon.SkinThemeColor3;

  FNavigationBarColor:=uGraphicCommon.SkinNavigationBarColor;
  FNavigationBarFontColor:=uGraphicCommon.SkinNavigationBarFontColor;

  FFilePictureSearchPaths:=TStringList.Create;
  FFilePictureSearchPaths.OnChange:=DoFilePictureSearchPathsChange;
end;

destructor TSkinTheme.Destroy;
begin
  FreeAndNil(FFilePictureSearchPaths);

  inherited;
end;

procedure TSkinTheme.DoFilePictureSearchPathsChange(Sender: TObject);
begin
  GlobalFilePictureSearchPaths.Assign(FFilePictureSearchPaths);
end;

function TSkinTheme.GetFilePictureSearchPaths: TStringList;
begin
  Result:=FFilePictureSearchPaths;
end;

function TSkinTheme.GetNavigationBarColor: TDelphiColor;
begin
  if FNavigationBarColor=NullColor then
  begin
    Result:=FSkinThemeColor;
  end
  else
  begin
    Result:=FNavigationBarColor;
  end;
end;

function TSkinTheme.GetNavigationBarFontColor: TDelphiColor;
begin
  Result:=FNavigationBarFontColor;
end;

function TSkinTheme.GetSkinPictureThemeColor: TDelphiColor;
begin
  Result:=FSkinPictureThemeColor;//uGraphicCommon.SkinPictureThemeColor1;
end;

function TSkinTheme.GetSkinThemeColor: TDelphiColor;
begin
  Result:=FSkinThemeColor;//uGraphicCommon.SkinThemeColor;
end;

function TSkinTheme.GetSkinThemeColor1: TDelphiColor;
begin
  Result:=FSkinThemeColor1;//uGraphicCommon.SkinThemeColor1;
end;

function TSkinTheme.GetSkinThemeColor2: TDelphiColor;
begin
  Result:=FSkinThemeColor2;//uGraphicCommon.SkinThemeColor1;
end;

function TSkinTheme.GetSkinThemeColor3: TDelphiColor;
begin
  Result:=FSkinThemeColor3;//uGraphicCommon.SkinThemeColor1;
end;

procedure TSkinTheme.Loaded;
begin
  inherited;
  GlobalFilePictureSearchPaths.Assign(FFilePictureSearchPaths);

end;

procedure TSkinTheme.SetFilePictureSearchPaths(const Value: TStringList);
begin
  FFilePictureSearchPaths.Assign(Value);
  GlobalFilePictureSearchPaths.Assign(Value);
end;

procedure TSkinTheme.SetNavigationBarColor(const Value: TDelphiColor);
begin
  FNavigationBarColor := Value;
  uGraphicCommon.SkinNavigationBarColor:=Value;
end;

procedure TSkinTheme.SetNavigationBarFontColor(const Value: TDelphiColor);
begin
  FNavigationBarFontColor := Value;
  uGraphicCommon.SkinNavigationBarFontColor:=Value;
end;

procedure TSkinTheme.SetSkinPictureThemeColor(const Value: TDelphiColor);
begin
  FSkinPictureThemeColor:=Value;
  uGraphicCommon.SkinPictureThemeColor:=Value;
end;

procedure TSkinTheme.SetSkinThemeColor(const Value: TDelphiColor);
begin

  if FSkinThemeColor<>Value then
  begin

//    ChangeSkinPictureListColor(GlobalChangedColorBySkinThemePictureList,FSkinThemeColor,Value);

    FSkinThemeColor:=Value;
    uGraphicCommon.SkinThemeColor:=Value;


  end;

end;

procedure TSkinTheme.SetSkinThemeColor1(const Value: TDelphiColor);
begin
  FSkinThemeColor1:=Value;
  uGraphicCommon.SkinThemeColor1:=Value;
end;

procedure TSkinTheme.SetSkinThemeColor2(const Value: TDelphiColor);
begin
  FSkinThemeColor2:=Value;
  uGraphicCommon.SkinThemeColor2:=Value;
end;

procedure TSkinTheme.SetSkinThemeColor3(const Value: TDelphiColor);
begin
  FSkinThemeColor3:=Value;
  uGraphicCommon.SkinThemeColor3:=Value;
end;




initialization
  SkinControlInvalidateLocked:=0;


  {$IFDEF MSWINDOWS}
  {$ELSE}
  //线的粗细设置
  IsAdjustDrawLinePos:=True;
  {$ENDIF}


  //默认边框宽度
  DefaultBorderWidth:=1;
  //默认线条宽度
  DefaultPenWidth:=1;


  //NullRect:=Rect(0,0,0,0);
  NullRect:=TRect.Create(0,0,0,0);
  GlobalNormalDesignRectBorderColor:=$A0909090;
  GlobalActivePageDesignRectBorderColor:=RedColor;
  GlobalItemDesignerPanelDesignRectBorderColor:=GreenColor;
  GlobalScrollBoxContentDesignRectBorderColor:=BlueColor;
  GlobalPullLoadPanelDesignRectBorderColor:=YellowColor;

  SkinPictureThemeColor:=NullColor;

  {$IFDEF FMX}
  SkinNavigationBarColor:=$FF0199FF;//
  //默认主题色
  SkinThemeColor:=$FF0199FF;//TAlphaColorRec.Orange;
  //默认主题色1
  SkinThemeColor1:=$FF4DC060;//TAlphaColorRec.Orange;
  //主题色2
  SkinThemeColor2:=$FF4DC060;
  //主题色3
  SkinThemeColor3:=$FF4DC060;
  {$ENDIF}

  {$IFDEF VCL}
  //默认主题色
  SkinThemeColor:=$00A4BF00;//TAlphaColorRec.Orange;
  //默认主题色1
  SkinThemeColor1:=$00A79A0E;//TAlphaColorRec.Orange;
  //默认主题色2
  SkinThemeColor2:=$004DA3FF;//TAlphaColorRec.Orange;
  //默认主题色3
  SkinThemeColor3:=$007575F6;//TAlphaColorRec.Orange;
  {$ENDIF}


  //
  SkinNavigationBarFontColor:=WhiteColor;

  GlobalFilePictureSearchPaths:=TStringList.Create;

//  uBaseLog.HandleException(nil,'GetScreenScaleRate:'+FloatToStr(GetScreenScaleRate));


finalization
  FreeAndNil(GlobalFilePictureSearchPaths);

end.


