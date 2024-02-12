//convert pas to utf8 by ¥
/// <summary>
///   <para>
///     绘制引擎管理,用于管理多个绘制引擎
///   </para>
///   <para>
///     Drawing engine manager,used for manage several drawing engines
///   </para>
/// </summary>
unit uDrawEngine;





interface
{$I FrameWork.inc}

uses
  Classes,
  SysUtils,
  uBaseLog,
  uBaseList,
  uBasePathData,
  uDrawCanvas,
  uFuncCommon,
  uDrawPicture,
  uSkinPicture;




//type




/// <summary>
///   <para>
///     创建图片引擎
///   </para>
///   <para>
///     Create picture engine
///   </para>
/// </summary>
//function CreateCurrentEngineSkinPictureEngine(
//                                              ASkinPicture:TSkinPicture;
//                                              GIFSupport:Boolean=False
//                                              ):TSkinPictureEngine;
/// <summary>
///   <para>
///     创建图片
///   </para>
///   <para>
///     Create picture
///   </para>
/// </summary>
//function CreateCurrentEngineDrawPicture(
//                              const AName:String;
//                              const ACaption:String;
//                              const AGroup:String=''
//                              ):TDrawPicture;








//var





implementation


//  {$IFDEF VCL}
//uses
//  uGDIPlusSkinPictureEngine,
//  uGDIPlusDrawCanvas;
//  {$ENDIF}
//  {$IFDEF FMX}
//uses
//  uFireMonkeySkinPictureEngine,
//  uFireMonkeyDrawCanvas;
//  {$ENDIF}
//
//
//
//
//function CreateCurrentEngineDrawPicture(
//                                        const AName:String;
//                                        const ACaption:String;
//                                        const AGroup:String
//                                        ):TDrawPicture;
//begin
//  Result:=TDrawPicture.Create(
//        AName,
//        ACaption,
//        AGroup
//        );
//end;



initialization


//  {$IFDEF VCL}
//  GlobalDrawCanvasClass:=TGDIPlusDrawCanvas;
//  GlobalSkinPictureClass:=TSkinPicture;
//  GlobalSkinPictureEngineClass:=TGDIPlusSkinPictureEngine;
//  GlobalSkinGIFPictureEngineClass:=TGDIPlusSkinGIFPictureEngine;
//  GlobalDrawPathDataClass:=TGDIPlusDrawPathData;
//  {$ENDIF}

//  {$IFDEF FMX}
//  GlobalDrawCanvasClass:=TFireMonkeyDrawCanvas;
//  GlobalSkinPictureClass:=TSkinPicture;
//  GlobalSkinPictureEngineClass:=TFireMonkeySkinPictureEngine;
//  GlobalSkinGIFPictureEngineClass:=TFireMonkeySkinGIFPictureEngine;
//  GlobalDrawPathDataClass:=TFireMonkeyDrawPathData;
//  {$ENDIF}



end.

