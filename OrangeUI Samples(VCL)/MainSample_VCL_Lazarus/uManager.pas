//convert pas to utf8 by ¥

unit uManager;

interface

uses
  Classes,
  SysUtils,
  IniFiles,
  Types,
  UITypes,
  uConst,

  //会造成在VCL下Class Register之后用FindClass不存在
//  FMX.Types,

  uDrawPicture,

  Variants,
  IdURI,
  System.StrUtils,

//  uThumbCommon,
  uFuncCommon,
  uFileCommon,
  uBaseList,
  uDataSetToJson,
  uOpenClientCommon,
//  uOpenCommon,
  uOpenCommon,
//  uGPSUtils,

  XSuperObject,
  XSuperJson;


type


//  THotelList=class;

//  TClientManager=class;
//  {$IFDEF SHOP_APP}
//  TShopManager=class;
//  {$ENDIF}
//  TRiderManager=class;



  TManager=class(TBaseManager)
  public

//    //用户名
//    LastLoginUser:String;
//    //密码
//    LastLoginPass:String;
////    //验证码
////    LastLoginCapcha:String;
//    //登录类型
//    LastLoginType:String;
//    //登录key
//    LastLoginKey:String;
//    //登录状态
//    IsLogin:Boolean;
//
//    //服务器
//    ServerHost:String;
//    //服务器端口
//    ServerPort:Integer;

    //天气类型
    WeatherType:String;

    //店铺FID
    ShopFID:Integer;

    //蓝牙设备Identifier
    Identifier:String;

//    //用户信息
//    User:TUser;

  public
    //店铺搜索历史
    ShopSearchHistoryList:TStringList;
    //购物车商品列表
    UserCarShopList:TCarShopList;

//    //登录过的用户
//    LoginedUserList:TStringList;

    //员工权限
//    SettingAuthorityList:TStringList;

    //银行卡列表
    UserBankCardList:TStringList;

//    //上次登录的用户首页数据
//    UserHomePageDataJson:String;
//
//    //购物车商品搜索历史列表
//    BuyGoodsSearchHistoryList:TStringList;
//
    //商品搜索历史列表
    GoodsSearchHistoryList:TStringList;
//
//    //用户搜索列表
//    UserSearchHistoryList:TStringList;


//  public
//    function LoadFromINI(AINIFilePath: String): Boolean;
//    function SaveToINI(AINIFilePath: String): Boolean;
//  private
//    function LoadFromUserInfoINI(AINIFilePath: String): Boolean;
//    function SaveToUserInfoINI(AINIFilePath: String): Boolean;
  protected
    function CustomLoadFromINI(AIniFile:TIniFile): Boolean;override;
    function CustomSaveToINI(AIniFile:TIniFile): Boolean;override;

//    function LoadFromUserInfoINI(AINIFilePath: String): Boolean;
//    function SaveToUserInfoINI(AINIFilePath: String): Boolean;
  public
    constructor Create;override;
    destructor Destroy;override;
//  public
//    procedure Load;
//    procedure Save;
//    //保存上次登录的用户信息
//    procedure SaveLastLoginInfo;
  public
////    function UserHasAuthority(AAuthority:String):Boolean;
//    //存放搜索历史的目录
//    function GetUserLocalDir:String;
    //加载本地搜索历史
    procedure LoadUserConfig;override;
    //保存本地搜索历史
    procedure SaveUserConfig;override;
//  public
//    {$IFDEF SHOP_APP}
//    function AsShop:TShopManager;
//    {$ENDIF}
//    function AsClient:TClientManager;
//    function AsRider:TRiderManager;
  end;


//  //客户端的用户数据管理类
//  TClientManager=class(TManager)
//
////  public
////    constructor Create;override;
////    destructor Destroy;override;
//  end;


//  {$IFDEF SHOP_APP}
//  //商家端的用户数据管理类
//  TShopManager=class(TManager)
//  public
//    //开店状态
//    OpenShopState:TOpenShopState;
//
//    //入驻申请资料
//    ShopRequest:TShopRequest;
//    //店铺资料
//    Shop:TShop;
//    ShopGoodsCategoryList:TShopGoodsCategoryList;
//  public
//    constructor Create;override;
//    destructor Destroy;override;
//  public
//    function ParseShopInfo(ADataJson:ISuperObject):Boolean;
//  end;
//  {$ENDIF}


//  TRiderInfo=class(TBaseJsonObject)
//  public
//    fid:Int64;//2,
////    appid:Int64;//1002,
//    user_fid:Int64;//49,
//    is_work:Int64;//1,
//    work_longitude:Double;//100.1,
//    work_latitude:Double;//20.29,
//    work_country:String;//"中国",
//    work_province:String;//"浙江",
//    work_city:String;//"金华",
//    work_area:String;//"婺城区",
//    work_addr:String;//"龙腾创业大厦",
//    work_door_no:String;//"826",
//    current_longitude:Double;//49,
//    current_latitude:Double;//119.64934881141,
//    orderno:Int64;//0,
//    createtime:String;//"2018-05-16 17:06:13"
//    cert_audit_state:Int64; //实名认证状态
//  protected
//    procedure AssignTo(Dest: TPersistent); override;
//  public
//    procedure Clear;
//    function ParseFromJson(AJson: ISuperObject): Boolean;override;
//  end;
//
//
//
//  //骑手端的用户数据管理类
//  TRiderManager=class(TManager)
//  public
//    RiderInfo:TRiderInfo;
//  public
//    constructor Create;override;
//    destructor Destroy;override;
//  end;





var
  GlobalManager:TManager;




function GetAuditStateColor(AAuditState:TAuditState;AAuditRejectColor:TAlphaColor=TAlphaColorRec.Red):TAlphaColor;


function HideBankCardNumber( num:string ):String;

function GetDistance(ADistance:Integer):String;




implementation




function GetDistance(ADistance:Integer):String;
begin
  if ADistance<1000 then
  begin
    Result:=IntToStr(ADistance)+'m';
  end
  else
  begin
    Result:=Format('%.1f',[ADistance/1000])+'km';
  end;

end;

function HideBankCardNumber( num:string ):String;
var
  I: Integer;
begin
  Result:=num;
  for I := Low(num) to High(num)-4 do
  begin
    Result[I]:='*';
  end;
end;

function GetAuditStateColor(AAuditState:TAuditState;AAuditRejectColor:TAlphaColor):TAlphaColor;
begin
  Result:=TAlphaColorRec.Gray;

  //根据审核状态设置标题的颜色
  if AAuditState=asRequestAudit then
  begin
    Result:=TAlphaColorRec.Orange;
  end
  else if AAuditState=asAuditPass then
  begin
    Result:=$FF1296db;//#FF35B34A
  end
  else if AAuditState=asAuditReject then
  begin
    Result:=AAuditRejectColor;//TAlphaColorRec.Red;
  end
  else
  begin
    Result:=TAlphaColorRec.Gray;
  end;

end;


{ TManager }

//function TManager.AsClient: TClientManager;
//begin
//  Result:=TClientManager(Self);
//end;
//
//function TManager.AsRider: TRiderManager;
//begin
//  Result:=TRiderManager(Self);
//end;
//
  {$IFDEF SHOP_APP}
function TManager.AsShop: TShopManager;
begin
  Result:=TShopManager(Self);
end;
  {$ENDIF}

constructor TManager.Create;
begin
  Inherited;
//  User:=TUser.Create;
  ShopSearchHistoryList:=TStringList.Create;
  UserCarShopList:=TCarShopList.Create;
//  LoginedUserList:=TStringList.Create;
//  UserCartGoodsList:=TCarGoodList.Create;
//  BuyGoodsSearchHistoryList:=TStringList.Create;
  GoodsSearchHistoryList:=TStringList.Create;
//  UserSearchHistoryList:=TStringList.Create;
//  SettingAuthorityList:=TStringList.Create;
  UserBankCardList:=TStringList.Create;
end;

function TManager.CustomLoadFromINI(AIniFile: TIniFile): Boolean;
begin
//  Self.LastLoginCapcha:=AIniFile.ReadString('','LastLoginCapcha','');
//  //用户登录类型
//  Self.LastLoginType:=AIniFile.ReadString('','LastLoginType','');
  //蓝牙设备Identifier
  Self.Identifier:=AIniFile.ReadString('','Identifier','');
  
  Result:=True;
end;

function TManager.CustomSaveToINI(AIniFile: TIniFile): Boolean;
begin

  //蓝牙设备Identifier
  AIniFile.WriteString('','Identifier',Self.Identifier);
  AIniFile.WriteString('','AutoPlayVideoOnWiFi',Self.AutoPlayVideoOnWiFi);
  AIniFile.WriteString('','AutoPlayVideoWithoutWiFi',Self.AutoPlayVideoWithoutWiFi);
  Result:=True;
end;

destructor TManager.Destroy;
begin
//  FreeAndNil(User);
  FreeAndNil(ShopSearchHistoryList);
//  FreeAndNil(LoginedUserList);
  FreeAndNil(UserCarShopList);
//  FreeAndNil(BuyGoodsSearchHistoryList);
  FreeAndNil(GoodsSearchHistoryList);
//  FreeAndNil(UserSearchHistoryList);
//  FreeAndNil(SettingAuthorityList);
  FreeAndNil(UserBankCardList);

  inherited;
end;

//function TManager.GetUserLocalDir: String;
//begin
//  Result:=uFileCommon.GetApplicationPath+IntToStr(Self.User.fid)+PathDelim;
//end;
//
//procedure TManager.Load;
//begin
//  Self.LoadFromINI(uFileCommon.GetApplicationPath+'Config.ini');
//
//end;
//
//function TManager.LoadFromINI(AINIFilePath: String): Boolean;
//var
//  AIniFile:TIniFile;
//begin
//  Result:=False;
//
//  AIniFile:=TIniFile.Create(AINIFilePath{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});
//
//  //上次登录的用户FID
//  GlobalManager.User.fid:=AIniFile.ReadInteger('','LastLoginUserFid',0);
//  //上次登录的用户名密码验证码
//  Self.LastLoginUser:=AIniFile.ReadString('','LastLoginUser','');
//  Self.LastLoginPass:=AIniFile.ReadString('','LastLoginPass','');
//
//  //用户登录key
//  Self.LastLoginKey:=AIniFile.ReadString('','LastLoginKey','');
//
//  //用户的登录状态
//  Self.IsLogin:=AIniFile.ReadBool('','IsLogin',False);
//
////  Self.LoginedUserList.CommaText:=AIniFile.ReadString('','LoginedUser','');
//
//
//
//
//  Self.ServerHost:=AIniFile.ReadString('','ServerHost',ServerHost);
//  Self.ServerPort:=AIniFile.ReadInteger('','ServerPort',ServerPort);
//
//
//  //用户定位的经纬度
//  Self.Longitude:=AIniFile.ReadFloat('','Longitude',0);
//  Self.Latitude:=AIniFile.ReadFloat('','Latitude',0);
//  //地址
//  Self.Addr:=AIniFile.ReadString('','Addr',Self.Addr);
////  Self.LastLoginCapcha:=AIniFile.ReadString('','LastLoginCapcha','');
////  //用户登录类型
////  Self.LastLoginType:=AIniFile.ReadString('','LastLoginType','');
//  //蓝牙设备Identifier
//  Self.Identifier:=AIniFile.ReadString('','Identifier','');
//
//
//  FreeAndNil(AIniFile);
//
//  Result:=True;
//
//end;
//
//function TManager.LoadFromUserInfoINI(AINIFilePath: String): Boolean;
////var
////  AIniFile:TIniFile;
//begin
//  Result:=False;
//
//  Self.User.LoadJsonToFile(AINIFilePath);
//
////  AIniFile:=TIniFile.Create(AINIFilePath{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});
////
////  GlobalManager.User.key:=AIniFile.ReadString('','UserKey','');
////  GlobalManager.User.cert_audit_state:=AIniFile.ReadInteger('','CertAuditState',0);
////  GlobalManager.User.is_hotel_manager:=AIniFile.ReadInteger('','IsHotelManager',0);
////  GlobalManager.User.is_emp:=AIniFile.ReadInteger('','IsEmp',0);
////  GlobalManager.User.is_admin:=AIniFile.ReadInteger('','IsAdmin',0);
////
//////  GlobalManager.SettingAuthorityList.CommaText:=AIniFile.ReadString('','UserPowersList','');
////
////  FreeAndNil(AIniFile);
//
//  Result:=True;
//end;

procedure TManager.LoadUserConfig;
var
  AStringStream:TStringStream;
begin
  Inherited;

//  BuyGoodsSearchHistoryList.Clear;
//  if FileExists(GetUserLocalDir+'BuyGoodsSearchHistory.txt') then
//  begin
//    BuyGoodsSearchHistoryList.LoadFromFile(GetUserLocalDir+'BuyGoodsSearchHistory.txt',TEncoding.UTF8);
//  end;
//
  GoodsSearchHistoryList.Clear;
  if FileExists(GetUserLocalDir+'GoodsSearchHistory.txt') then
  begin
    GoodsSearchHistoryList.LoadFromFile(GetUserLocalDir+'GoodsSearchHistory.txt',TEncoding.UTF8);
  end;
//
//  UserSearchHistoryList.Clear;
//  if FileExists(GetUserLocalDir+'UserSearchHistory.txt') then
//  begin
//    UserSearchHistoryList.LoadFromFile(GetUserLocalDir+'UserSearchHistory.txt',TEncoding.UTF8);
//  end;

  ShopSearchHistoryList.Clear;
  if FileExists(GetUserLocalDir+'ShopSearchHistory.txt') then
  begin
    ShopSearchHistoryList.LoadFromFile(GetUserLocalDir+'ShopSearchHistory.txt',TEncoding.UTF8);
  end;
//
//  //最后一次登录的用户的首页数据
//  UserHomePageDataJson:='';
//  AStringStream:=TStringStream.Create('',TEncoding.utf8);
//  if FileExists(GetUserLocalDir+'LastLoginUserHomePage.txt') then
//  begin
//    AStringStream.LoadFromFile(GetUserLocalDir+'LastLoginUserHomePage.txt');
//    UserHomePageDataJson:=AStringStream.DataString;
//  end;
//  FreeAndNil(AStringStream);

//  //最后一次登录的用户的部分信息
//  if FileExists(GetUserLocalDir+'LastLoginInfo.json') then
//  begin
////    Self.LoadFromUserInfoINI(GetUserLocalDir+'LastLoginInfo.json');
//    Self.User.LoadJsonToFile(GetUserLocalDir+'LastLoginInfo.json');
//  end;

////  if FileExists(uFileCommon.GetApplicationPath+'Config.ini') then
////  begin
////    Self.LoadFromINI(uFileCommon.GetApplicationPath+'Config.ini');
////  end;
end;

//procedure TManager.Save;
//begin
//  Self.SaveToINI(uFileCommon.GetApplicationPath+'Config.ini');
//end;
//
//procedure TManager.SaveLastLoginInfo;
//begin
//  ForceDirectories(GetUserLocalDir);
////  Self.SaveToUserInfoINI(GetUserLocalDir+'LastLoginInfo.json');
//  Self.User.SaveJsonToFile(GetUserLocalDir+'LastLoginInfo.json');
//end;
//
//function TManager.SaveToINI(AINIFilePath: String): Boolean;
//var
//  AIniFile:TIniFile;
//begin
//  Result:=False;
//  AIniFile:=TIniFile.Create(AINIFilePath{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});
//
//  //上次登录的用户FID
//  AIniFile.WriteInteger('','LastLoginUserFid',GlobalManager.User.fid);
//  //上次登录的用户名密码验证码
//  AIniFile.WriteString('','LastLoginUser',Self.LastLoginUser);
//  AIniFile.WriteString('','LastLoginPass',Self.LastLoginPass);
////  AIniFile.WriteString('','LastLoginCapcha',Self.LastLoginCapcha);
////  //用户登录类型
////  AIniFile.WriteString('','LastLoginType',Self.LastLoginType);
//
//  //用户登录key
//  AIniFile.WriteString('','LastLoginKey',Self.LastLoginKey);
//
//  //用户的登录状态
//  AIniFile.WriteBool('','IsLogin',Self.IsLogin);
//
//
////  AIniFile.WriteString('','LoginedUser',Self.LoginedUserList.CommaText);
//
//  AIniFile.WriteString('','ServerHost',Self.ServerHost);
//  AIniFile.WriteInteger('','ServerPort',Self.ServerPort);
//
//
//
//  //用户选择的经纬度
//  AIniFile.WriteFloat('','Longitude',Self.Longitude);
//  AIniFile.WriteFloat('','Latitude',Self.Latitude);
//  //地址
//  AIniFile.WriteString('','Addr',Self.Addr);
//
//  //蓝牙设备Identifier
//  AIniFile.WriteString('','Identifier',Self.Identifier);
//
//
//  FreeAndNil(AIniFile);
//  Result:=True;
//
//end;
//
//
//function TManager.SaveToUserInfoINI(AINIFilePath: String): Boolean;
////var
////  AIniFile:TIniFile;
//begin
//  Result:=False;
//  Self.User.SaveJsonToFile(AINIFilePath);
//
////  AIniFile:=TIniFile.Create(AINIFilePath{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});
////
////  AIniFile.WriteInteger('','UserFid',GlobalManager.User.fid);
////
////  AIniFile.WriteString('','UserKey',GlobalManager.User.key);
////
////  AIniFile.WriteInteger('','CertAuditState',GlobalManager.User.cert_audit_state);
////
////  AIniFile.WriteInteger('','IsHotelManager',GlobalManager.User.is_hotel_manager);
////  AIniFile.WriteInteger('','IsEmp',GlobalManager.User.is_emp);
////  AIniFile.WriteInteger('','IsAdmin',GlobalManager.User.is_admin);
////
////  AIniFile.WriteString('','UserPowersList',GlobalManager.SettingAuthorityList.CommaText);
////
////  FreeAndNil(AIniFile);
//  Result:=True;
//
//end;

procedure TManager.SaveUserConfig;
//var
//  AStringStream:TStringStream;
begin
  Inherited;

  ForceDirectories(GetUserLocalDir);

  ShopSearchHistoryList.SaveToFile(GetUserLocalDir+'ShopSearchHistory.txt',TEncoding.UTF8);

//  BuyGoodsSearchHistoryList.SaveToFile(GetUserLocalDir+'BuyGoodsSearchHistory.txt',TEncoding.UTF8);
//
  GoodsSearchHistoryList.SaveToFile(GetUserLocalDir+'GoodsSearchHistory.txt',TEncoding.UTF8);
//
//  UserSearchHistoryList.SaveToFile(GetUserLocalDir+'UserSearchHistory.txt',TEncoding.UTF8);
//
//  AStringStream:=TStringStream.Create(UserHomePageDataJson,TEncoding.utf8);
//  AStringStream.SaveToFile(GetUserLocalDir+'LastLoginUserHomePage.txt');
//  FreeAndNil(AStringStream);
end;

//function TManager.UserHasAuthority(AAuthority: String): Boolean;
//begin
//  Result:=(GlobalManager.User.is_admin=1)
//          or (GlobalManager.SettingAuthorityList.IndexOf(AAuthority)<>-1);
//end;


//{ THotelList }
//
//function THotelList.GetItem(Index: Integer): THotel;
//begin
//  Result:=THotel(Inherited Items[Index]);
//end;
//
//{ THotel }
//
//constructor THotel.Create;
//begin
//  inherited;
//  RecvAddrList:=TUserRecvAddList.Create;
//
//end;
//
//destructor THotel.Destroy;
//begin
//  FreeAndNil(RecvAddrList);
//  inherited;
//end;
//
//function THotel.GetPic1Url: String;
//begin
//  Result:='';
//  if Self.pic1path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+IntToStr(appid)+'/Hotel_Pic/'+Self.pic1path;
//  end;
//
//end;
//
//function THotel.GetPic2Url: String;
//begin
//  Result:='';
//  if Self.pic2path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+IntToStr(appid)+'/Hotel_Pic/'+Self.pic2path;
//  end;
//end;
//
//function THotel.GetPic3Url: String;
//begin
//  Result:='';
//  if Self.pic3path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+IntToStr(appid)+'/Hotel_Pic/'+Self.pic3path;
//  end;
//end;
//
//function THotel.GetPic4Url: String;
//begin
//  Result:='';
//  if Self.pic4path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+IntToStr(appid)+'/Hotel_Pic/'+Self.pic4path;
//  end;
//end;
//
//function THotel.GetPic5Url: String;
//begin
//  Result:='';
//  if Self.pic5path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+IntToStr(appid)+'/Hotel_Pic/'+Self.pic5path;
//  end;
//end;
//
//function THotel.GetPic6Url: String;
//begin
//  Result:='';
//  if Self.pic6path<>'' then
//  begin
//    Result:=ImageHttpServerUrl+'/Upload/'+IntToStr(appid)+'/Hotel_Pic/'+Self.pic6path;
//  end;
//end;
//
//function THotel.GetArea: String;
//begin
//  Result:=Self.province+' '+Self.city+' '+Self.area;
//end;
//
//function THotel.ParseFromJson(AJson: ISuperObject): Boolean;
//begin
//  fid:=AJson.I['fid'];//2
//  Self.appid:=AJson.I['appid'];//1001,
//  name:=AJson.S['name'];//"国贸大酒店",
//  star:=AJson.I['star'];//5,
//  room_num:=AJson.I['room_num'];
//  classify_name:=AJson.S['classify_name'];
//  classify_fid:=AJson.I['classify_fid'];
//  addr:=AJson.S['addr'];//"浙江省金华市婺城区八一北街888号",
//  tel:=AJson.S['tel'];//"0579-82388888",
//  user_fid:=AJson.V['user_fid'];//12,
//  user_name:=AJson.S['user_name'];
//  createtime:=AJson.S['createtime'];//"2017-07-17 10:11:27",
//  pic1path:=AJson.S['pic1path'];//"",
//  pic2path:=AJson.S['pic2path'];//"",
//  pic3path:=AJson.S['pic3path'];//"",
//  pic4path:=AJson.S['pic4path'];//"",
//  pic5path:=AJson.S['pic5path'];//"",
//  pic6path:=AJson.S['pic6path'];//"",
//  province:=AJson.S['province'];//"浙江省",
//
//  city:=AJson.S['city'];//"金华市",
//  area:=AJson.S['area'];//"",
//  is_ordered:=AJson.I['is_ordered'];//0,
//  audit_user_fid:=AJson.I['audit_user_fid'];//0,
//  audit_state:=AJson.I['audit_state'];//0,
//  audit_remark:=AJson.S['audit_remark'];//"",
//  audit_time:=AJson.S['audit_time'];//"",
//  is_deleted:=AJson.I['is_deleted'];//0,
////  recv_addr_id:=AJson.I['recv_addr_id'];//0,
////  longitude:=GetJsonDoubleValue(AJson,'longitude');//0,
////  latitude:=GetJsonDoubleValue(AJson,'latitude');//0,
//
//  RecvAddrList.Clear(True);
//  Self.RecvAddrList.ParseFromJsonArray(TUserRecvAdd,AJson.A['UserRecvAddList']);
//end;
//
//
//
//{ TUserRecvAdd }
//
//procedure TUserRecvAdd.AssignTo(Dest: TPersistent);
//begin
//  if Dest is TUserRecvAdd then
//  begin
//
//    TUserRecvAdd(Dest).fid:=fid;//4,
//    TUserRecvAdd(Dest).appid:=Self.appid;//1001,
//    TUserRecvAdd(Dest).hotel_fid:=hotel_fid;//9,
//    TUserRecvAdd(Dest).name:=name;//"1",
//    TUserRecvAdd(Dest).phone:=phone;//"18957901025",
//    TUserRecvAdd(Dest).addr:=addr;//"rrrrrrrr",
//    TUserRecvAdd(Dest).createtime:=createtime;//"2017-07-18 17:04:31",
//    TUserRecvAdd(Dest).is_default:=is_default;//1,
//    TUserRecvAdd(Dest).province:=province;//"",
//    TUserRecvAdd(Dest).city:=city;//""
//    TUserRecvAdd(Dest).area:=area;//""
//
//  end;
//
//end;
//
//procedure TUserRecvAdd.Clear;
//begin
//
//  fid:=0;//4,
//  Self.appid:=0;//1001,
//  hotel_fid:=0;//9,
//  name:='';//"1",
//  phone:='';//"18957901025",
//  addr:='';//"rrrrrrrr",
//  createtime:='';//"2017-07-18 17:04:31",
//  is_default:=0;//1,
//  province:='';//"",
//  city:='';//""
//  area:='';//""
//
//end;
//
//function TUserRecvAdd.GetArea: String;
//begin
//  Result:=Self.province+' '+Self.city+' '+Self.area;
//end;
//
//function TUserRecvAdd.GetLongAddr: String;
//begin
//  Result:=Self.province+Self.city+Self.area+Self.addr;
//end;
//
//function TUserRecvAdd.ParseFromJson(AJson: ISuperObject): Boolean;
//begin
//  fid:=AJson.I['fid'];//4,
//  Self.appid:=AJson.I['appid'];//1001,
//  hotel_fid:=AJson.I['hotel_fid'];//9,
//  name:=AJson.S['name'];//"1",
//  phone:=AJson.S['phone'];//"18957901025",
//  addr:=AJson.S['addr'];//"rrrrrrrr",
//  createtime:=AJson.S['createtime'];//"2017-07-18 17:04:31",
//  is_default:=AJson.I['is_default'];//1,
//  province:=AJson.S['province'];//"",
//  city:=AJson.S['city'];//""
//  area:=AJson.S['area'];//""
//end;
//
//{ TUserRecvAddList }
//
//function TUserRecvAddList.GetDefaultRecvAddr: TUserRecvAdd;
//var
//  I: Integer;
//begin
//  Result:=nil;
//  for I := 0 to Self.Count-1 do
//  begin
//    if Items[I].is_default=1 then
//    begin
//      Result:=Items[I];
//      Break;
//    end;
//  end;
//end;
//
//function TUserRecvAddList.GetItem(Index: Integer): TUserRecvAdd;
//begin
//  Result:=TUserRecvAdd(Inherited Items[Index]);
//end;


  {$IFDEF SHOP_APP}
{ TShopManager }

constructor TShopManager.Create;
begin
  inherited;
  //入驻申请资料
  ShopRequest:=TShopRequest.Create;
  //店铺资料
  Shop:=TShop.Create;
  ShopGoodsCategoryList:=TShopGoodsCategoryList.Create;

end;

destructor TShopManager.Destroy;
begin
  FreeAndNil(ShopRequest);
  FreeAndNil(Shop);
  FreeAndNil(ShopGoodsCategoryList);
  inherited;
end;

function TShopManager.ParseShopInfo(ADataJson: ISuperObject): Boolean;
begin
  OpenShopState:=ossNone;

  //清空一下
  Shop.Clear;
  ShopRequest.Clear;

  OpenShopState:=TOpenShopState(ADataJson.I['OpenShopState']);

//  if OpenShopState=ossOnline then
//  begin
    //有店铺信息
    Shop.ParseFromJson(ADataJson.A['ShopInfo'].O[0]);
//  end
//  else
//  if OpenShopState=ossRequest then
//  begin

  //不一定有
  if ADataJson.A['ShopRequestInfo'].Length>0 then
  begin
    //有申请信息
    ShopRequest.ParseFromJson(ADataJson.A['ShopRequestInfo'].O[0]);
  end;

//  end;

end;
  {$ENDIF}

//{ TRiderInfo }
//
//procedure TRiderInfo.AssignTo(Dest: TPersistent);
//var
//  DestObject:TRiderInfo;
//begin
//  DestObject:=TRiderInfo(Dest);
//  DestObject.fid:=fid;
////  DestObject.appid:=Self.appid;
//  DestObject.user_fid:=user_fid;
//  DestObject.is_work:=is_work;
//  DestObject.work_longitude:=work_longitude;
//  DestObject.work_latitude:=work_latitude;
//  DestObject.work_country:=work_country;
//  DestObject.work_province:=work_province;
//  DestObject.work_city:=work_city;
//  DestObject.work_area:=work_area;
//  DestObject.work_addr:=work_addr;
//  DestObject.work_door_no:=work_door_no;
//  DestObject.current_longitude:=current_longitude;
//  DestObject.current_latitude:=current_latitude;
//  DestObject.orderno:=orderno;
//  DestObject.createtime:=createtime;
//  DestObject.cert_audit_state:=cert_audit_state;
//end;
//
//procedure TRiderInfo.Clear;
//begin
//  fid:=0;
////  Self.appid:=0;
//  user_fid:=0;
//  is_work:=0;
//  work_longitude:=0.0;
//  work_latitude:=0.0;
//  work_country:='';
//  work_province:='';
//  work_city:='';
//  work_area:='';
//  work_addr:='';
//  work_door_no:='';
//  current_longitude:=0;
//  current_latitude:=0.0;
//  orderno:=0;
//  createtime:='';
//  cert_audit_state:=-1;
//end;
//
//function TRiderInfo.ParseFromJson(AJson: ISuperObject): Boolean;
//begin
//  fid:=AJson.I['fid'];//2,
////  Self.appid:=AJson.I['appid'];//1002,
//  user_fid:=AJson.V['user_fid'];//49,
//  is_work:=AJson.I['is_work'];//1,
//  work_longitude:=GetJsonDoubleValue(AJson,'work_longitude');//100.1,
//  work_latitude:=GetJsonDoubleValue(AJson,'work_latitude');//20.29,
//  work_country:=AJson.S['work_country'];//"中国",
//  work_province:=AJson.S['work_province'];//"浙江",
//  work_city:=AJson.S['work_city'];//"金华",
//  work_area:=AJson.S['work_area'];//"婺城区",
//  work_addr:=AJson.S['work_addr'];//"龙腾创业大厦",
//  work_door_no:=AJson.S['work_door_no'];//"826",
//  current_longitude:=GetJsonDoubleValue(AJson,'current_longitude');//49,
//  current_latitude:=GetJsonDoubleValue(AJson,'current_latitude');//119.64934881141,
//  orderno:=AJson.I['orderno'];//0,
//  createtime:=AJson.S['createtime'];//"2018-05-16 17:06:13"
//  cert_audit_state:=AJson.I['cert_audit_state'];//实名认证状态
//end;
//
//{ TRiderManager }
//
//constructor TRiderManager.Create;
//begin
//  inherited;
//
//  RiderInfo:=TRiderInfo.Create;
//
//end;
//
//destructor TRiderManager.Destroy;
//begin
//  FreeAndNil(RiderInfo);
//  inherited;
//end;




initialization
//  {$IFDEF CLIENT_APP}
//  GlobalManager:=TManager.Create;
//  {$ENDIF}
//  {$IFDEF SHOP_APP}
//  GlobalManager:=TShopManager.Create;
//  {$ENDIF}
//  {$IFDEF RIDER_APP}
//  GlobalManager:=TRiderManager.Create;
//  {$ENDIF}
//  if GlobalManager=nil then
//  begin
    GlobalManager:=TManager.Create;
//  end;



  //默认的服务器(包括接口服务器和Web服务器)
  //之后是从配置文件中修改
//  {$IFDEF IOS}
  GlobalManager.ServerHost:=Const_Server_Host;
//  {$ELSE}
//  GlobalManager.ServerHost:=Const_Server_Host_Other;
//  {$ENDIF}
  //端口
  GlobalManager.ServerPort:=Const_Server_Port;


  //应用ID
  AppID:=Const_APPID;
  //用户类型
  APPUserType:=Const_APPUserType;
//  APPUserTypeName:=Const_GetuiPush_AppType;




finalization
  FreeAndNil(GlobalManager);



end.


