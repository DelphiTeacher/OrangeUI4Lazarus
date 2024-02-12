unit uMyControl;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,  Controls;

type
  TMyControl = class(TWinControl)
  private

  protected

  public

  published

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('OrangeUIControl',[TMyControl]);
end;

end.
