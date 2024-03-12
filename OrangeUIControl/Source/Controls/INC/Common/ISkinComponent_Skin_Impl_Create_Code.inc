//convert pas to utf8 by ¥
//控件素材所需要的属性初始代码

  {$IFDEF FPC}
  FMargins:=TLazControlMargins.Create;
  FMargins.FControl:=Self;
  FPadding:=TLazControlMargins.Create;
  {$ENDIF}



  //创建的时候,使用默认设置
//  Self.FComponentTypeUseKind:=ctukDefault;
  Self.FMaterialUseKind:=mukSelfOwn;
  //保留SelfOwnMaterial
  Self.FKeepSelfOwnMaterial:=True;


  {$IFNDEF WinForm}//不需要FCanvas
  {$IFNDEF WinEdit}//不需要FCanvas
  {$IFNDEF WinComboBox}//不需要FCanvas
  {$IFNDEF WinDateEdit}//不需要FCanvas
  FDrawCanvas:=CreateDrawCanvas(ClassName+'.Create '+Name);
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}


  //创建控件属性
  FProperties:=Self.GetPropertiesClassType.Create(TControl(Self));


  //创建素材更改通知链接
  FMaterialChangeLink:=TSkinObjectChangeLink.Create;
  FMaterialChangeLink.OnChange:=OnSkinMaterialChange;
  FMaterialChangeLink.OnDestroy:=OnSkinMaterialDestroy;



  //默认值
//  FBindItemFieldType:=ftString;


  CreateSkinControlType;
  GetSelfOwnMaterial;


