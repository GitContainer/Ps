unit uPSI_Mask;
{
This file has been generated by UnitParser v0.5, written by M. Knight
and updated by NP. v/d Spek.
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ifps3 are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok''s conv unility
}
interface

uses
  SysUtils, Classes, uPSComponent, uPSCompiler, uPSRuntime;

type
(*----------------------------------------------------------------------------*)
  TPSImport_Mask = class(TPSPlugin)
  protected
    procedure CompOnUses(CompExec: TPSScript); override;
    procedure ExecOnUses(CompExec: TPSScript); override;
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure CompileImport2(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
    procedure ExecImport2(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;

implementation


uses
   Windows ,StdCtrls ,Controls ,Messages ,Forms ,Graphics ,Menus ,Mask;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TMaskEdit(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TCustomMaskEdit', 'TMaskEdit') do
  with CL.AddClassN(CL.FindClass('TCustomMaskEdit'),'TMaskEdit') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TCustomMaskEdit(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TCustomEdit', 'TCustomMaskEdit') do
  with CL.AddClassN(CL.FindClass('TCustomEdit'),'TCustomMaskEdit') do
  begin
    RegisterMethod('Procedure ValidateEdit');
    RegisterMethod('Function GetTextLen : Integer');
    RegisterProperty('IsMasked', 'Boolean', iptr);
    RegisterProperty('EditText', 'string', iptrw);
    RegisterProperty('Text', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_Mask(CL: TPSPascalCompiler);
begin
 CL.AddConstantN('DefaultBlank','Char').SetString( '_');
 CL.AddConstantN('MaskFieldSeparator','Char').SetString( ';');
 CL.AddConstantN('MaskNoSave','Char').SetString( '0');
 CL.AddConstantN('mDirReverse','String').SetString( '!');
 CL.AddConstantN('mDirUpperCase','String').SetString( '>');
 CL.AddConstantN('mDirLowerCase','String').SetString( '<');
 CL.AddConstantN('mDirLiteral','String').SetString( '\');
 CL.AddConstantN('mMskAlpha','String').SetString( 'L');
 CL.AddConstantN('mMskAlphaOpt','String').SetString( 'l');
 CL.AddConstantN('mMskAlphaNum','String').SetString( 'A');
 CL.AddConstantN('mMskAlphaNumOpt','String').SetString( 'a');
 CL.AddConstantN('mMskAscii','String').SetString( 'C');
 CL.AddConstantN('mMskAsciiOpt','String').SetString( 'c');
 CL.AddConstantN('mMskNumeric','String').SetString( '0');
 CL.AddConstantN('mMskNumericOpt','String').SetString( '9');
 CL.AddConstantN('mMskNumSymOpt','String').SetString( '#');
 CL.AddConstantN('mMskTimeSeparator','String').SetString( ':');
 CL.AddConstantN('mMskDateSeparator','String').SetString( '/');
  CL.AddTypeS('TMaskCharType', '( mcNone, mcLiteral, mcIntlLiteral, mcDirective'
   +', mcMask, mcMaskOpt, mcFieldSeparator, mcField )');
  CL.AddTypeS('TMaskDirective', '( mdReverseDir, mdUpperCase, mdLowerCa'
   +'se, mdLiteralChar )');
  CL.AddTypeS('TMaskDirectives', 'set of TMaskDirective');
  CL.AddClassN(CL.FindClass('TOBJECT'),'EDBEditError');
  CL.AddTypeS('TMaskedStatex', '( msMasked, msReEnter, msDBSetText )');
  CL.AddTypeS('TMaskedState', 'set of TMaskedStatex');
  SIRegister_TCustomMaskEdit(CL);
  SIRegister_TMaskEdit(CL);
 CL.AddDelphiFunction('Function FormatMaskText( const EditMask : string; const Value : string) : string');
 CL.AddDelphiFunction('Function MaskGetMaskSave( const EditMask : string) : Boolean');
 CL.AddDelphiFunction('Function MaskGetMaskBlank( const EditMask : string) : Char');
 CL.AddDelphiFunction('Function MaskGetFldSeparator( const EditMask : string) : Integer');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TCustomMaskEditText_W(Self: TCustomMaskEdit; const T: string);
begin Self.Text := T; end;

(*----------------------------------------------------------------------------*)
procedure TCustomMaskEditText_R(Self: TCustomMaskEdit; var T: string);
begin T := Self.Text; end;

(*----------------------------------------------------------------------------*)
procedure TCustomMaskEditEditText_W(Self: TCustomMaskEdit; const T: string);
begin Self.EditText := T; end;

(*----------------------------------------------------------------------------*)
procedure TCustomMaskEditEditText_R(Self: TCustomMaskEdit; var T: string);
begin T := Self.EditText; end;

(*----------------------------------------------------------------------------*)
procedure TCustomMaskEditIsMasked_R(Self: TCustomMaskEdit; var T: Boolean);
begin T := Self.IsMasked; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_Mask_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@FormatMaskText, 'FormatMaskText', cdRegister);
 S.RegisterDelphiFunction(@MaskGetMaskSave, 'MaskGetMaskSave', cdRegister);
 S.RegisterDelphiFunction(@MaskGetMaskBlank, 'MaskGetMaskBlank', cdRegister);
 S.RegisterDelphiFunction(@MaskGetFldSeparator, 'MaskGetFldSeparator', cdRegister);
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TMaskEdit(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TMaskEdit) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TCustomMaskEdit(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TCustomMaskEdit) do
  begin
    RegisterVirtualMethod(@TCustomMaskEdit.ValidateEdit, 'ValidateEdit');
    RegisterMethod(@TCustomMaskEdit.GetTextLen, 'GetTextLen');
    RegisterPropertyHelper(@TCustomMaskEditIsMasked_R,nil,'IsMasked');
    RegisterPropertyHelper(@TCustomMaskEditEditText_R,@TCustomMaskEditEditText_W,'EditText');
    RegisterPropertyHelper(@TCustomMaskEditText_R,@TCustomMaskEditText_W,'Text');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_Mask(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(EDBEditError) do
  RIRegister_TCustomMaskEdit(CL);
  RIRegister_TMaskEdit(CL);
end;

 
 
{ TPSImport_Mask }
(*----------------------------------------------------------------------------*)
procedure TPSImport_Mask.CompOnUses(CompExec: TPSScript);
begin
  { nothing } 
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_Mask.ExecOnUses(CompExec: TPSScript);
begin
  { nothing } 
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_Mask.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_Mask(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_Mask.CompileImport2(CompExec: TPSScript);
begin
  { nothing } 
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_Mask.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_Mask(ri);
  RIRegister_Mask_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_Mask.ExecImport2(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  { nothing } 
end;

end.
