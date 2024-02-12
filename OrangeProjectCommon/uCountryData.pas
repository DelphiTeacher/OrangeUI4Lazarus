unit uCountryData;

interface

uses
//  Winapi.Windows,
  System.Types,
  System.SysUtils, System.Variants, System.Classes,

  XSuperObject;


//https://www.guojiadaima.com/
//https://baike.baidu.com/item/%E4%B8%96%E7%95%8C%E5%90%84%E5%9B%BD%E5%92%8C%E5%9C%B0%E5%8C%BA%E5%90%8D%E7%A7%B0%E4%BB%A3%E7%A0%81/6560023?fr=aladdin


//��ȡ�������б�
function GetContinentList:TStringList;
//��ȡ���Ҵ���͹���Ӣ�����ƶ�Ӧ���б�
function GetCountryCodeEnNameMapList:TStringList;
function GetCountryCNNameByCode(ACode:String):String;
function GetCountryEnNameByCode(ACode:String):String;
function GetCountryCodeByName(AName:String):String;
function GetCountryCodeByNumber(ANumber:String):String;
function GetContinentByCountry(AENNameOrCode:String):String;
function GetContinentByCountryCode(ACode:String):String;
function GetContinentByCountryENName(AENName:String):String;

function GetCountryListJsonArray:ISuperArray;

function ReadResDataString(const AResName: string): string;
function ReadResDataToFilePath(const AResName: string;AFilePath:String):Boolean;
function VarToStr(AValue:Variant):String;


var
  GlobalCountryListJsonArray:ISuperArray;


implementation


//{$R mxdatas.res}
//{$R country_icons.res}
{$R country_data_hkb.RES}

function ReadResDataString(const AResName: string): string;
var
  cRes: TResourceStream;
  cStr: TStringStream;
begin
  Result := '';
  if System.findResource(HInstance, PChar(AResName), RT_RCDATA) = 0 then
    Exit;

  cRes := TResourceStream.Create(HInstance, AResName, RT_RCDATA);
  try
    cStr := TStringStream.Create('', TEncoding.UTF8);
    try
      cStr.LoadFromStream(cRes);
      Result := cStr.DataString;
    finally
      cStr.Free;
    end;
  finally
    cRes.Free;
  end;
end;

function ReadResDataToFilePath(const AResName: string;AFilePath:String):Boolean;
var
  cRes: TResourceStream;
begin
  Result:=False;

//  Result := '';
  if System.findResource(HInstance, PChar(AResName), RT_RCDATA) = 0 then
    Exit;

  cRes := TResourceStream.Create(HInstance, AResName, RT_RCDATA);
  try
//    cStr := TMemoryStream.Create;
//    try
//      cStr.LoadFromStream(cRes);
      ForceDirectories(ExtractFilePath(AFilePath));
      cRes.SaveToFile(AFilePath);

      Result:=True;
//    finally
//      cStr.Free;
//    end;
  finally
    cRes.Free;
  end;
end;

function VarToStr(AValue:Variant):String;
begin
  if VarIsNull(AValue) then
  begin
    Result:='';
  end
  else
  begin
    Result:=AValue;
  end;

end;

//function ReadResDataString(const AResName: string): string;
//var
//  cRes: TResourceStream;
//  cStr: TStringStream;
//begin
//  Result := '';
//  if findResource(HInstance, PChar(AResName), RT_RCDATA) = 0 then
//    Exit;
//
//  cRes := TResourceStream.Create(HInstance, AResName, RT_RCDATA);
//  try
//    cStr := TStringStream.Create('', TEncoding.UTF8);
//    try
//      cStr.LoadFromStream(cRes);
//      Result := cStr.DataString;
//    finally
//      cStr.Free;
//    end;
//  finally
//    cRes.Free;
//  end;
//end;
//
//function VarToStr(AValue:Variant):String;
//begin
//  if VarIsNull(AValue) then
//  begin
//    Result:='';
//  end
//  else
//  begin
//    Result:=AValue;
//  end;
//
//end;

function GetCountryListJsonArray:ISuperArray;
var
  ACountryJson:ISuperObject;
begin
  Result:=GlobalCountryListJsonArray;
  if Result=nil then
  begin
    ACountryJson:=SO(ReadResDataString('CFGJson_countrydata'));
    GlobalCountryListJsonArray:=ACountryJson.A['values'];
    Result:=GlobalCountryListJsonArray;
  end;
end;

function GetContinentList:TStringList;
var
  I:Integer;
  AValuesArray:ISuperArray;
//  AValue:Variant;
  ACaption:String;
//  ACode:String;
//  AItem:TSkinItem;
begin
  //����������
  Result:=TStringList.Create;

//  ACountryJson:=SO(ReadResDataString('CFGJson_countrydata'));
//  AValuesArray:=ACountryJson.A['values'];
  AValuesArray:=GetCountryListJsonArray;
  for I := 0 to AValuesArray.Length - 1 do
  begin
//    ShowMessage(AValuesArray.A[I].S[0] + ' + ' + AValuesArray.A[I].S[3]);
    //["674", "NR", "Nauru", "�³", "+674", "����", "4:00 AM", "12:00 PM"]
//      APhoneCaption:= VarToStr(AValuesArray.A[I].V[3]) + '(' + VarToStr(AValuesArray.A[I].V[1]) + ')' + '+' + VarToStr(AValuesArray.A[I].V[0]) + ',';
//      APhoneValue:= VarToStr(AValuesArray.A[I].V[0]) + ',';
//      ACaption:= VarToStr(AValuesArray.A[I].V[3]);//+',';
//      ACode:= VarToStr(AValuesArray.A[I].V[1]);//+',';
//      AItem:=lvData.Prop.Items.Add;
//      AItem.Caption:=ACaption;
//      AItem.Name:=ACode;
    ACaption:=VarToStr(AValuesArray.A[I].V[5]);
    if Result.IndexOf(ACaption)=-1 then
    begin
      Result.Add(ACaption);
    end;
  end;

end;

function GetCountryCodeEnNameMapList:TStringList;
var
  I:Integer;
//  ACountryJson:ISuperObject;
  AValuesArray:ISuperArray;
//  AValue:Variant;
  AEnCaption:String;
  ACode:String;
//  AItem:TSkinItem;
begin
  //����������
  Result:=TStringList.Create;

//  ACountryJson:=SO(ReadResDataString('CFGJson_countrydata'));
//  AValuesArray:=ACountryJson.A['values'];
  AValuesArray:=GetCountryListJsonArray;//ACountryJson.A['values'];
  for I := 0 to AValuesArray.Length - 1 do
  begin
//    ShowMessage(AValuesArray.A[I].S[0] + ' + ' + AValuesArray.A[I].S[3]);
    //["674", "NR", "Nauru", "�³", "+674", "����", "4:00 AM", "12:00 PM"]
//      APhoneCaption:= VarToStr(AValuesArray.A[I].V[3]) + '(' + VarToStr(AValuesArray.A[I].V[1]) + ')' + '+' + VarToStr(AValuesArray.A[I].V[0]) + ',';
//      APhoneValue:= VarToStr(AValuesArray.A[I].V[0]) + ',';
//      ACaption:= VarToStr(AValuesArray.A[I].V[3]);//+',';
//      ACode:= VarToStr(AValuesArray.A[I].V[1]);//+',';
//      AItem:=lvData.Prop.Items.Add;
//      AItem.Caption:=ACaption;
//      AItem.Name:=ACode;
    ACode:=VarToStr(AValuesArray.A[I].V[1]);
    AEnCaption:=VarToStr(AValuesArray.A[I].V[2]);
//    if Result.IndexOf(ACaption)=-1 then
//    begin
//      Result.Add(ACaption);
//    end;
    Result.Values[ACode]:=AEnCaption;

  end;

end;


function GetCountryCNNameByCode(ACode:String):String;
var
  I:Integer;
//  ACountryJson:ISuperObject;
  AValuesArray:ISuperArray;
//  AValue:Variant;
//  ACnCaption:String;
//  ACode:String;
//  AItem:TSkinItem;
begin
  Result:='';

//  ACountryJson:=SO(ReadResDataString('CFGJson_countrydata'));
//  AValuesArray:=ACountryJson.A['values'];
  AValuesArray:=GetCountryListJsonArray;//ACountryJson.A['values'];
  for I := 0 to AValuesArray.Length - 1 do
  begin
//    ShowMessage(AValuesArray.A[I].S[0] + ' + ' + AValuesArray.A[I].S[3]);
    //["674", "NR", "Nauru", "�³", "+674", "����", "4:00 AM", "12:00 PM"]
//      APhoneCaption:= VarToStr(AValuesArray.A[I].V[3]) + '(' + VarToStr(AValuesArray.A[I].V[1]) + ')' + '+' + VarToStr(AValuesArray.A[I].V[0]) + ',';
//      APhoneValue:= VarToStr(AValuesArray.A[I].V[0]) + ',';
//      ACaption:= VarToStr(AValuesArray.A[I].V[3]);//+',';
//      ACode:= VarToStr(AValuesArray.A[I].V[1]);//+',';
//      AItem:=lvData.Prop.Items.Add;
//      AItem.Caption:=ACaption;
//      AItem.Name:=ACode;
//    ACode:=VarToStr(AValuesArray.A[I].V[1]);
    if SameText(VarToStr(AValuesArray.A[I].V[1]),ACode) then
    begin
      Result:=VarToStr(AValuesArray.A[I].V[3]);
      Exit;
    end;
//    if Result.IndexOf(ACaption)=-1 then
//    begin
//      Result.Add(ACaption);
//    end;
//    Result.Values[ACode]:=AEnCaption;

  end;

end;

function GetContinentByCountry(AENNameOrCode:String):String;
begin
  Result:='';
  if AENNameOrCode='' then Exit;

  if Length(AENNameOrCode)=2 then
  begin
    //�ǹ��Ҵ���
    Result:=GetContinentByCountryCode(AENNameOrCode);
  end
  else
  begin
    Result:=GetContinentByCountryENName(AENNameOrCode);
  end;
  
end;

function GetContinentByCountryCode(ACode:String):String;
var
  AENName:String;
begin
  AENName:=GetCountryENNameByCode(ACode);
  Result:=GetContinentByCountryENName(AENName);
end;

function GetContinentByCountryENName(AENName:String):String;
var
  I:Integer;
//  ACountryJson:ISuperObject;
  AValuesArray:ISuperArray;
//  AValue:Variant;
//  ACnCaption:String;
//  ACode:String;
//  AItem:TSkinItem;
begin
  Result:='';

//  ACountryJson:=SO(ReadResDataString('CFGJson_countrydata'));
//  AValuesArray:=ACountryJson.A['values'];
  AValuesArray:=GetCountryListJsonArray;//ACountryJson.A['values'];
  for I := 0 to AValuesArray.Length - 1 do
  begin
//    ShowMessage(AValuesArray.A[I].S[0] + ' + ' + AValuesArray.A[I].S[3]);
    //["674", "NR", "Nauru", "�³", "+674", "����", "4:00 AM", "12:00 PM"]
//      APhoneCaption:= VarToStr(AValuesArray.A[I].V[3]) + '(' + VarToStr(AValuesArray.A[I].V[1]) + ')' + '+' + VarToStr(AValuesArray.A[I].V[0]) + ',';
//      APhoneValue:= VarToStr(AValuesArray.A[I].V[0]) + ',';
//      ACaption:= VarToStr(AValuesArray.A[I].V[3]);//+',';
//      ACode:= VarToStr(AValuesArray.A[I].V[1]);//+',';
//      AItem:=lvData.Prop.Items.Add;
//      AItem.Caption:=ACaption;
//      AItem.Name:=ACode;
//    ACode:=VarToStr(AValuesArray.A[I].V[1]);
    if SameText(VarToStr(AValuesArray.A[I].V[2]),AENName) then
    begin
      Result:=VarToStr(AValuesArray.A[I].V[5]);
      Break;
    end;
//    if Result.IndexOf(ACaption)=-1 then
//    begin
//      Result.Add(ACaption);
//    end;
//    Result.Values[ACode]:=AEnCaption;

  end;



  if Result='' then
  begin
    if SameText('United States',AENName) then
    begin
      Result:='������';
    end;
  end;




//���ǵ�Ӣ�����Ʒֱ��ǣ�
//1. ���� - Asia
//2. ���� - Africa
//3. ŷ�� - Europe
//4. ������ - North America
//5. ������ - South America
//6. ������ - Oceania
//7. �ϼ��� - Antarctica
  if Result<>'' then
  begin
    if Result='����' then
    begin
      Result:='asia';
    end
    else if Result='����' then
    begin
      Result:='africa';
    end
    else if Result='ŷ��' then
    begin
      Result:='europe';
    end
    else if (Result='������') or (Result='����') or (Result='����') then
    begin
      Result:='north america';
    end
    else if (Result='������') or (Result='����') then
    begin
      Result:='south america';
    end
    else if (Result='������') or (Result='����') or (Result='����') then
    begin
      Result:='oceania';
    end
    else if (Result='�ϼ���') or (Result='�ϼ�') then
    begin
      Result:='antarctica';
    end
    else
    begin
      Result:='';
    end;
  end;


end;


function GetCountryENNameByCode(ACode:String):String;
var
  I:Integer;
//  ACountryJson:ISuperObject;
  AValuesArray:ISuperArray;
//  AValue:Variant;
//  ACnCaption:String;
//  ACode:String;
//  AItem:TSkinItem;
begin
  Result:='';

//  ACountryJson:=SO(ReadResDataString('CFGJson_countrydata'));
//  AValuesArray:=ACountryJson.A['values'];
  AValuesArray:=GetCountryListJsonArray;//ACountryJson.A['values'];
  for I := 0 to AValuesArray.Length - 1 do
  begin
//    ShowMessage(AValuesArray.A[I].S[0] + ' + ' + AValuesArray.A[I].S[3]);
    //["674", "NR", "Nauru", "�³", "+674", "����", "4:00 AM", "12:00 PM"]
//      APhoneCaption:= VarToStr(AValuesArray.A[I].V[3]) + '(' + VarToStr(AValuesArray.A[I].V[1]) + ')' + '+' + VarToStr(AValuesArray.A[I].V[0]) + ',';
//      APhoneValue:= VarToStr(AValuesArray.A[I].V[0]) + ',';
//      ACaption:= VarToStr(AValuesArray.A[I].V[3]);//+',';
//      ACode:= VarToStr(AValuesArray.A[I].V[1]);//+',';
//      AItem:=lvData.Prop.Items.Add;
//      AItem.Caption:=ACaption;
//      AItem.Name:=ACode;
//    ACode:=VarToStr(AValuesArray.A[I].V[1]);
    if SameText(VarToStr(AValuesArray.A[I].V[1]),ACode) then
    begin
      Result:=VarToStr(AValuesArray.A[I].V[2]);
      Break;
    end;
//    if Result.IndexOf(ACaption)=-1 then
//    begin
//      Result.Add(ACaption);
//    end;
//    Result.Values[ACode]:=AEnCaption;

  end;



end;


function GetCountryCodeByName(AName:String):String;
var
  I:Integer;
//  ACountryJson:ISuperObject;
  AValuesArray:ISuperArray;
//  AValue:Variant;
//  ACnCaption:String;
//  ACode:String;
//  AItem:TSkinItem;
begin
  Result:='';




//  ACountryJson:=SO(ReadResDataString('CFGJson_countrydata'));
//  AValuesArray:=ACountryJson.A['values'];
  AValuesArray:=GetCountryListJsonArray;//ACountryJson.A['values'];
  for I := 0 to AValuesArray.Length - 1 do
  begin
//    ShowMessage(AValuesArray.A[I].S[0] + ' + ' + AValuesArray.A[I].S[3]);
    //["674", "NR", "Nauru", "�³", "+674", "����", "4:00 AM", "12:00 PM"]
//      APhoneCaption:= VarToStr(AValuesArray.A[I].V[3]) + '(' + VarToStr(AValuesArray.A[I].V[1]) + ')' + '+' + VarToStr(AValuesArray.A[I].V[0]) + ',';
//      APhoneValue:= VarToStr(AValuesArray.A[I].V[0]) + ',';
//      ACaption:= VarToStr(AValuesArray.A[I].V[3]);//+',';
//      ACode:= VarToStr(AValuesArray.A[I].V[1]);//+',';
//      AItem:=lvData.Prop.Items.Add;
//      AItem.Caption:=ACaption;
//      AItem.Name:=ACode;
//    ACode:=VarToStr(AValuesArray.A[I].V[1]);
    if SameText(VarToStr(AValuesArray.A[I].V[2]),AName)
      or SameText(VarToStr(AValuesArray.A[I].V[3]),AName) then
    begin
      Result:=VarToStr(AValuesArray.A[I].V[1]);
      Break;
    end;
//    if Result.IndexOf(ACaption)=-1 then
//    begin
//      Result.Add(ACaption);
//    end;
//    Result.Values[ACode]:=AEnCaption;

  end;

  if Result='' then
  begin
    if SameText('United States',AName) then
    begin
      Result:='US';
    end
    else if SameText('United Kingdom',AName) then
    begin
      Result:='GB';
    end;
  end;


end;

function GetCountryCodeByNumber(ANumber:String):String;
var
  I:Integer;
//  ACountryJson:ISuperObject;
  AValuesArray:ISuperArray;
//  AValue:Variant;
//  ACnCaption:String;
//  ACode:String;
//  AItem:TSkinItem;
begin
  Result:='';

//  ACountryJson:=SO(ReadResDataString('CFGJson_countrydata'));
//  AValuesArray:=ACountryJson.A['values'];
  AValuesArray:=GetCountryListJsonArray;//ACountryJson.A['values'];
  for I := 0 to AValuesArray.Length - 1 do
  begin
//    ShowMessage(AValuesArray.A[I].S[0] + ' + ' + AValuesArray.A[I].S[3]);
    //["674", "NR", "Nauru", "�³", "+674", "����", "4:00 AM", "12:00 PM"]
//      APhoneCaption:= VarToStr(AValuesArray.A[I].V[3]) + '(' + VarToStr(AValuesArray.A[I].V[1]) + ')' + '+' + VarToStr(AValuesArray.A[I].V[0]) + ',';
//      APhoneValue:= VarToStr(AValuesArray.A[I].V[0]) + ',';
//      ACaption:= VarToStr(AValuesArray.A[I].V[3]);//+',';
//      ACode:= VarToStr(AValuesArray.A[I].V[1]);//+',';
//      AItem:=lvData.Prop.Items.Add;
//      AItem.Caption:=ACaption;
//      AItem.Name:=ACode;
//    ACode:=VarToStr(AValuesArray.A[I].V[1]);
    if SameText(VarToStr(AValuesArray.A[I].V[0]),ANumber) then
    begin
      Result:=VarToStr(AValuesArray.A[I].V[1]);
      Exit;
    end;
//    if Result.IndexOf(ACaption)=-1 then
//    begin
//      Result.Add(ACaption);
//    end;
//    Result.Values[ACode]:=AEnCaption;

  end;

end;



end.
