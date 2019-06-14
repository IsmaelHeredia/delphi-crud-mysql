// Written By Ismael Heredia in the year 2016

unit Producto;

interface

uses Windows, SysUtils;

type
  TProducto = class
  private
  public
    id_producto: integer;
    nombre_producto: string;
    descripcion: string;
    precio: integer;
    fecha_registro: string;
    id_proveedor: integer;
    function getId_producto(): integer;
    procedure setId_producto(id_producto: integer);
    function getNombre_producto(): string;
    procedure setNombre_producto(nombre_producto: string);
    function getDescripcion(): string;
    procedure setDescripcion(descripcion: string);
    function getPrecio(): integer;
    procedure setPrecio(precio: integer);
    function getFecha_registro(): string;
    procedure setFecha_registro(fecha_registro: string);
    function getId_proveedor(): integer;
    procedure setId_proveedor(id_proveedor: integer);
    Constructor Create; overload;
    Constructor Create(id_producto: integer; nombre_producto: string;
      descripcion: string; precio: integer; fecha_registro: string;
      id_proveedor: integer); overload;
    function ToString(): string;
  end;

implementation

function TProducto.getId_producto(): integer;
begin
  Result := id_producto;
end;

procedure TProducto.setId_producto(id_producto: integer);
begin
  self.id_producto := id_producto;
end;

function TProducto.getNombre_producto(): string;
begin
  Result := nombre_producto;
end;

procedure TProducto.setNombre_producto(nombre_producto: string);
begin
  self.nombre_producto := nombre_producto;
end;

function TProducto.getDescripcion(): string;
begin
  Result := descripcion;
end;

procedure TProducto.setDescripcion(descripcion: string);
begin
  self.descripcion := descripcion;
end;

function TProducto.getPrecio(): integer;
begin
  Result := precio;
end;

procedure TProducto.setPrecio(precio: integer);
begin
  self.precio := precio;
end;

function TProducto.getFecha_registro(): string;
begin
  Result := fecha_registro;
end;

procedure TProducto.setFecha_registro(fecha_registro: string);
begin
  self.fecha_registro := fecha_registro;
end;

function TProducto.getId_proveedor(): integer;
begin
  Result := id_proveedor;
end;

procedure TProducto.setId_proveedor(id_proveedor: integer);
begin
  self.id_proveedor := id_proveedor;
end;

constructor TProducto.Create;
begin
  inherited;
  //
end;

constructor TProducto.Create(id_producto: integer; nombre_producto: string;
  descripcion: string; precio: integer; fecha_registro: string;
  id_proveedor: integer);
begin
  self.id_producto := id_producto;
  self.nombre_producto := nombre_producto;
  self.descripcion := descripcion;
  self.precio := precio;
  self.fecha_registro := fecha_registro;
  self.id_proveedor := id_proveedor;
end;

function TProducto.ToString(): string;
begin
  Result := 'Producto{" + "id_producto="' + IntToStr(id_producto) +
    '", nombre_producto="' + nombre_producto + '", descripcion="' + descripcion
    + '", precio="' + IntToStr(precio) + '", fecha_registro="' + fecha_registro
    + ', id_proveedor="' + IntToStr(id_proveedor) + '"}';
end;

end.
