//convert pas to utf8 by ¥
  //素材属性声明



  public
    //控件类型
    property SkinControlType:TSkinControlType read GetSkinControlType;
    //当前使用的素材
    property CurrentUseMaterial:TSkinControlMaterial read GetCurrentUseMaterial;
    property StaticRefMaterial:TSkinControlMaterial read GetRefMaterial write SetStaticRefMaterial;
  published
    //保持这个读取顺序

//{$IFDEF DELPHI}
published
  //保持这个读取顺序
//{$ENDIF}
//{$IFDEF FPC}
//public
//  //保持这个读取顺序
//{$ENDIF}
    //控件类型使用类型,不再使用
//    property ComponentTypeUseKind:TComponentTypeUseKind read GetComponentTypeUseKind write SetComponentTypeUseKind;
    property ComponentTypeUseKind:TComponentTypeUseKind read FComponentTypeUseKind write FComponentTypeUseKind;// {$IFDEF FPC}stored False{$ENDIF};
    //素材使用类型
    property MaterialUseKind:TMaterialUseKind read GetMaterialUseKind write SetMaterialUseKind;// {$IFDEF FPC}stored False{$ENDIF};
    //保持自身的素材
    property KeepSelfOwnMaterial:Boolean read GetKeepSelfOwnMaterial write SetKeepSelfOwnMaterial;// {$IFDEF FPC}stored False{$ENDIF};
    //控件类型名称
    property ComponentTypeName:String read GetComponentTypeName write SetComponentTypeName;// {$IFDEF FPC}stored False{$ENDIF};
published
  //保持这个读取顺序

    //皮肤包里指定的素材名称
    property MaterialName:String read GetMaterialName write SetMaterialName;



    //皮肤素材
    property SelfOwnMaterial:TSkinControlMaterial read GetSelfOwnMaterial;
    //引用的皮肤素材
    property RefMaterial:TSkinControlMaterial read GetRefMaterial write SetRefMaterial;




