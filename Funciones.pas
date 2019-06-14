// Written By Ismael Heredia in the year 2016

unit Funciones;

interface

uses Windows, SysUtils, IdGlobal, IdHash, IdHashMessageDigest;

function md5_encode(text: string): string;
function fecha_del_dia(): string;

implementation

function md5_encode(text: string): string;
var
  encoder: TIdHashMessageDigest5;
begin
  encoder := nil;
  try
    encoder := TIdHashMessageDigest5.Create;
    Result := IdGlobal.IndyLowerCase(encoder.HashStringAsHex(text));
  finally
    encoder.Free;
  end;
end;

function fecha_del_dia(): string;
var
  fecha: string;
begin
  fecha := FormatDateTime('dd-mm-yyyy', now);
  Result := fecha;
end;

end.
