// Written By Ismael Heredia in the year 2016

unit frmReporteGraficoProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, VCLTee.Series,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Conexion, ZAbstractConnection,
  ZConnection,
  ZAbstractTable, ZDataset, Data.DB, ZAbstractRODataset, ZAbstractDataset;

type
  TFormGrafico2 = class(TForm)
    Chart1: TChart;
    Series1: TPieSeries;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cargarGrafico();
  end;

var
  FormGrafico2: TFormGrafico2;

implementation

{$R *.dfm}

procedure TFormGrafico2.cargarGrafico();
var
  Conexion: TConexion;
  comando: TZQuery;
  sql: string;
  c: string;
  producto: string;
  precio: integer;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);
  sql := 'select nombre_empresa,count(prod.id_proveedor) as cantidad from productos prod,proveedores prov where prod.id_proveedor=prov.id_proveedor group by nombre_empresa';

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  Chart1.Series[0].Clear;

  while not comando.eof do
  begin
    producto := comando.FieldByname('nombre_empresa').AsString;
    precio := comando.FieldByname('cantidad').AsInteger;
    Chart1.Series[0].AddY(precio, producto);
    comando.Next;
  end;

  comando.Free;
  Conexion.Desconectar();

  Conexion.Free;
end;

procedure TFormGrafico2.FormCreate(Sender: TObject);
begin
  cargarGrafico();
end;

end.
