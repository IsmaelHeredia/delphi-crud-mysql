// Written By Ismael Heredia in the year 2016

unit Proveedor;

interface

uses Windows, SysUtils;

type
  TProveedor = class
  private
  public
    id_proveedor: integer;
    nombre_empresa: string;
    direccion: string;
    telefono: integer;
    fecha_registro: string;
    function getId_proveedor(): integer;
    procedure setId_proveedor(id_proveedor: integer);
    function getNombre_empresa(): string;
    procedure setNombre_empresa(nombre_empresa: string);
    function getDireccion(): string;
    procedure setDireccion(direccion: string);
    function getTelefono(): integer;
    procedure setTelefono(telefono: integer);
    function getFecha_registro(): string;
    procedure setFecha_registro(fecha_registro: string);
    Constructor Create; overload;
    Constructor Create(id_proveedor: integer; nombre_empresa: string;
      direccion: string; telefono: integer; fecha_registro: string); overload;
    function ToString(): string;
  end;

implementation

function TProveedor.getId_proveedor(): integer;
begin
  Result := id_proveedor;
end;

procedure TProveedor.setId_proveedor(id_proveedor: integer);
begin
  self.id_proveedor := id_proveedor;
end;

function TProveedor.getNombre_empresa(): string;
begin
  Result := nombre_empresa;
end;

procedure TProveedor.setNombre_empresa(nombre_empresa: string);
begin
  self.nombre_empresa := nombre_empresa;
end;

function TProveedor.getDireccion(): string;
begin
  Result := direccion;
end;

procedure TProveedor.setDireccion(direccion: string);
begin
  self.direccion := direccion;
end;

function TProveedor.getTelefono(): integer;
begin
  Result := telefono;
end;

procedure TProveedor.setTelefono(telefono: integer);
begin
  self.telefono := telefono;
end;

function TProveedor.getFecha_registro(): string;
begin
  Result := fecha_registro;
end;

procedure TProveedor.setFecha_registro(fecha_registro: string);
begin
  self.fecha_registro := fecha_registro;
end;

constructor TProveedor.Create;
begin
  inherited;
  //
end;

constructor TProveedor.Create(id_proveedor: integer; nombre_empresa: string;
  direccion: string; telefono: integer; fecha_registro: string);
begin
  self.id_proveedor := id_proveedor;
  self.nombre_empresa := nombre_empresa;
  self.direccion := direccion;
  self.telefono := telefono;
  self.fecha_registro := fecha_registro;
end;

function TProveedor.ToString(): string;
begin
  Result := 'Proveedor{" + "id_proveedor=" ' + IntToStr(id_proveedor) +
    ', nombre_empresa="' + nombre_empresa + '", direccion="' + direccion +
    '", telefono="' + IntToStr(telefono) + '", fecha_registro="' +
    fecha_registro + '"}';
end;

end.
