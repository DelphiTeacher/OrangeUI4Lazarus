{
  $Project$
  $Workfile$
  $Revision$
  $DateUTC$
  $Id$

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log$
}
{
{   Rev 1.1    3/28/2005 1:11:46 PM  JPMugaas
{ Package build errors.
}
{
{   Rev 1.0    3/28/2005 5:53:06 AM  JPMugaas
{ New security package.
}
unit PackageSecurity;

interface

uses
  Package;

type
  TPackageSecurity = class(TPackage)
  public
    procedure Generate(ACompiler: TCompiler); override;
    procedure GenerateDT(ACompiler: TCompiler); override;
  end;

implementation

uses
  DModule;

{ TPackageSecurity }

procedure TPackageSecurity.Generate(ACompiler: TCompiler);
begin
  if not (ACompiler in DelphiNet) then
  begin
    Exit;
  end;
  inherited;
  FName := 'IndySecurity' + GCompilerID[Compiler];
  FDesc := 'Security';
  GenHeader;
  GenOptions;
  Code('');
  Code('requires');
  Code('  Borland.Delphi,');
  Code('  Borland.VclRtl,');
  Code('  IndySystem' + GCompilerID[Compiler] + ',');
  Code('  IndyCore' + GCompilerID[Compiler] + ',');
  Code('  IndyProtocols'+ GCompilerID[Compiler] + ',');
  Code('  Mono.Security,');
  Code('  System,');
  Code('  System.Data,');
  Code('  System.XML;');
  GenContains;
  //back door for embedding version information into an assembly
  //without having to do anything to the package directly.
  Code('{$I IdSecurity90ASM90.inc}');
  WriteFile(DM.OutputPath + '\Lib\Security\');
end;

procedure TPackageSecurity.GenerateDT(ACompiler: TCompiler);
begin
  if not (ACompiler in DelphiNet) then
  begin
    Exit;
  end;
  inherited;
  FName := 'dclIndySecurity' + GCompilerID[Compiler];
  FDesc := 'Security';
  GenHeader;
  GenOptions(True);
  Code('');
  Code('requires');
  Code('  Borland.Studio.Vcl.Design,');
  Code('  IndySystem' + GCompilerID[Compiler] + ',');
  Code('  IndyCore' + GCompilerID[Compiler] + ',');
  Code('  IndyProtocols'+ GCompilerID[Compiler] + ',');
  Code('  IndySecurity'+ GCompilerID[Compiler] + ',');
  Code('  dclIndyCore' + GCompilerID[Compiler]+',');
  Code('  dclIndyProtocols' + GCompilerID[Compiler]+',');
  Code('  Mono.Security,');
  Code('  System,');
  Code('  System.Data,');
  Code('  System.XML;');
  GenContains;
  //back door for embedding version information into an assembly
  //without having to do anything to the package directly.
  Code('{$I IddclSecurity90ASM90.inc}');
  WriteFile(DM.OutputPath + '\Lib\Security\');
end;

end.
