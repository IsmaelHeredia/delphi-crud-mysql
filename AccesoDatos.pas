// Written By Ismael Heredia in the year 2016

unit AccesoDatos;

interface

uses Windows, SysUtils, ZAbstractConnection, ZConnection,
  ZAbstractTable, ZDataset, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  Classes, Producto, Proveedor, Usuario,
  Conexion;

type
  TAccesoDatos = class
  private
  public
    c: string;
    Constructor Create; overload;
    function EjecutarComando(sql: string): boolean;
    function CargarComando(sql: string): integer;
    function ingreso_usuario(Usuario: string; password: string): boolean;
    function es_admin(Usuario: string): boolean;
    function CargarListaProveedores(): TStringList;
    function CargarProveedor(id_proveedor_to_load: integer): TProveedor;
    function CargarListaProductos(): TStringList;
    function cargarNombreProveedor(id_proveedor: integer): string;
    function CargarProducto(id_producto_to_load: integer): TProducto;
    function cargar_id_nuevo_para_proveedor(): integer;
    function cargar_id_nuevo_para_producto(): integer;
    function CargarListaUsuarios(): TStringList;
    function CargarUsuario(id_usuario_to_load: integer): TUsuario;
    function comprobar_existencia_producto_crear(nombre_producto
      : string): boolean;
    function comprobar_existencia_producto_editar(id_producto: integer;
      nombre_producto: string): boolean;
    function comprobar_existencia_proveedor_crear(nombre_empresa
      : string): boolean;
    function comprobar_existencia_proveedor_editar(id_proveedor: integer;
      nombre_empresa: string): boolean;
    function comprobar_existencia_usuario_crear(nombre_usuario: string)
      : boolean;
    function comprobar_existencia_usuario_editar(nombre_usuario
      : string): boolean;
    function CargarListaProductos2(): string; //
  end;

implementation

constructor TAccesoDatos.Create;
begin
  inherited;
  c := '''';
end;

function TAccesoDatos.EjecutarComando(sql: string): boolean;
var
  Conexion: TConexion;
  comando: TZQuery;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  // Conexion.conexion_now.AutoCommit := True;
  // Conexion.conexion_now.StartTransaction;

  try
    begin
      comando := TZQuery.Create(nil);

      sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

      comando.Connection := Conexion.conexion_now;
      comando.sql.Clear;
      comando.sql.Add(sql);
      comando.ExecSQL;

      comando.Free;

      Result := True;

    end;
  except
    begin
      Result := false;
    end;
  end;

  Conexion.Desconectar();

  Conexion.Free();

end;

function TAccesoDatos.CargarComando(sql: string): integer;
var
  Conexion: TConexion;
  comando: TZQuery;
  count: integer;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  count := 0;
  comando := TZQuery.Create(nil);

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  while not comando.eof do
  begin
    Inc(count);
    comando.Next;
  end;

  comando.Free;

  Conexion.Desconectar();

  Conexion.Free();

  Result := count;
end;

function TAccesoDatos.ingreso_usuario(Usuario: string;
  password: string): boolean;
var
  filas: integer;
begin
  filas := CargarComando('select id_usuario from usuarios where usuario="' +
    Usuario + '" and clave="' + password + '"');
  if (filas >= 1) then
  begin
    Result := True;
  end
  else
  begin
    Result := false;
  end;
end;

function TAccesoDatos.comprobar_existencia_producto_crear(nombre_producto
  : string): boolean;
var
  respuesta: boolean;
  sql: string;
begin
  respuesta := false;
  sql := 'select * from productos where nombre_producto like "' +
    nombre_producto + '"';

  if (CargarComando(sql) >= 1) then
  begin
    respuesta := True;
  end
  else
  begin
    respuesta := false;
  end;
  Result := respuesta;
end;

function TAccesoDatos.comprobar_existencia_producto_editar(id_producto: integer;
  nombre_producto: string): boolean;
var
  respuesta: boolean;
  sql: string;
begin
  respuesta := false;
  sql := 'select * from productos where nombre_producto like "' +
    nombre_producto + '" and id_producto!=' + IntToStr(id_producto);
  if (CargarComando(sql) >= 1) then
  begin
    respuesta := True;
  end
  else
  begin
    respuesta := false;
  end;
  Result := respuesta;
end;

function TAccesoDatos.comprobar_existencia_proveedor_crear(nombre_empresa
  : string): boolean;
var
  respuesta: boolean;
  sql: string;
begin
  respuesta := false;
  sql := 'select * from proveedores where nombre_empresa like "' +
    nombre_empresa + '"';
  if (CargarComando(sql) >= 1) then
  begin
    respuesta := True;
  end
  else
  begin
    respuesta := false;
  end;
  Result := respuesta;
end;

function TAccesoDatos.comprobar_existencia_proveedor_editar
  (id_proveedor: integer; nombre_empresa: string): boolean;
var
  respuesta: boolean;
  sql: string;
begin
  respuesta := false;
  sql := 'select * from proveedores where nombre_empresa like "' +
    nombre_empresa + '" and id_proveedor!=' + IntToStr(id_proveedor);
  if (CargarComando(sql) >= 1) then
  begin
    respuesta := True;
  end
  else
  begin
    respuesta := false;
  end;
  Result := respuesta;
end;

function TAccesoDatos.comprobar_existencia_usuario_crear(nombre_usuario
  : string): boolean;
var
  respuesta: boolean;
  sql: string;
begin
  respuesta := false;
  sql := 'select * from usuarios where usuario like "' + nombre_usuario + '"';
  if (CargarComando(sql) >= 1) then
  begin
    respuesta := True;
  end
  else
  begin
    respuesta := false;
  end;
  Result := respuesta;
end;

function TAccesoDatos.comprobar_existencia_usuario_editar(nombre_usuario
  : string): boolean;
var
  respuesta: boolean;
  sql: string;
begin
  respuesta := false;
  sql := 'select * from usuarios where usuario like "' + nombre_usuario + '"';
  if (CargarComando(sql) >= 1) then
  begin
    respuesta := True;
  end
  else
  begin
    respuesta := false;
  end;
  Result := respuesta;
end;

function TAccesoDatos.es_admin(Usuario: string): boolean;
var
  Conexion: TConexion;
  comando: TZQuery;
  tipo: integer;
  sql: string;
  resultado: boolean;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  resultado := false;

  comando := TZQuery.Create(nil);

  sql := 'select tipo from usuarios where usuario="' + Usuario + '"';

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  if not comando.eof then
  begin
    tipo := comando.FieldByname('tipo').AsInteger;
  end;

  if (tipo = 1) then
  begin
    resultado := True;
  end
  else
  begin
    resultado := false;
  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := resultado;

end;

function TAccesoDatos.CargarListaProveedores(): TStringList;
var
  Conexion: TConexion;
  comando: TZQuery;
  count: integer;
  sql: string;
  Proveedor: TProveedor;
  listaProveedores: TStringList;
var
  id_proveedor: integer;
  nombre_empresa: string;
  direccion: string;
  telefono: integer;
  fecha_registro: string;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);

  listaProveedores := TStringList.Create;

  sql := 'select id_proveedor,nombre_empresa,direccion,telefono,fecha_registro_proveedor from proveedores';

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  while not comando.eof do
  begin
    id_proveedor := comando.FieldByname('id_proveedor').AsInteger;
    nombre_empresa := comando.FieldByname('nombre_empresa').AsString;
    direccion := comando.FieldByname('direccion').AsString;
    telefono := comando.FieldByname('telefono').AsInteger;
    fecha_registro := comando.FieldByname('fecha_registro_proveedor').AsString;
    Proveedor := TProveedor.Create(id_proveedor, nombre_empresa, direccion,
      telefono, fecha_registro);
    listaProveedores.AddObject(IntToStr(Proveedor.id_proveedor), Proveedor);
    comando.Next;
  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := listaProveedores;
end;

function TAccesoDatos.CargarProveedor(id_proveedor_to_load: integer)
  : TProveedor;
var
  Conexion: TConexion;
  comando: TZQuery;
  count: integer;
  sql: string;
  Proveedor: TProveedor;
var
  id_proveedor: integer;
  nombre_empresa: string;
  direccion: string;
  telefono: integer;
  fecha_registro: string;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);

  sql := 'select id_proveedor,nombre_empresa,direccion,telefono,fecha_registro_proveedor from proveedores where id_proveedor='
    + IntToStr(id_proveedor_to_load);

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  Proveedor := TProveedor.Create();

  if not comando.eof then
  begin
    id_proveedor := comando.FieldByname('id_proveedor').AsInteger;
    nombre_empresa := comando.FieldByname('nombre_empresa').AsString;
    direccion := comando.FieldByname('direccion').AsString;
    telefono := comando.FieldByname('telefono').AsInteger;
    fecha_registro := comando.FieldByname('fecha_registro_proveedor').AsString;

    Proveedor.setId_proveedor(id_proveedor);
    Proveedor.setNombre_empresa(nombre_empresa);
    Proveedor.setDireccion(direccion);
    Proveedor.setTelefono(telefono);
    Proveedor.setFecha_registro(fecha_registro);
  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := Proveedor;
end;

function TAccesoDatos.CargarListaProductos(): TStringList;
var
  Conexion: TConexion;
  comando: TZQuery;
  count: integer;
  sql: string;
  Producto: TProducto;
  listaProductos: TStringList;
var
  id_producto: integer;
  nombre_producto: string;
  descripcion: string;
  precio: integer;
  id_proveedor: integer;
  fecha_registro: string;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);

  listaProductos := TStringList.Create;

  sql := 'select id_producto,nombre_producto,descripcion,precio,id_proveedor,fecha_registro from productos';

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  while not comando.eof do
  begin
    id_producto := comando.FieldByname('id_producto').AsInteger;
    nombre_producto := comando.FieldByname('nombre_producto').AsString;
    descripcion := comando.FieldByname('descripcion').AsString;
    precio := comando.FieldByname('precio').AsInteger;
    id_proveedor := comando.FieldByname('id_proveedor').AsInteger;
    fecha_registro := comando.FieldByname('fecha_registro').AsString;
    Producto := TProducto.Create(id_producto, nombre_producto, descripcion,
      precio, fecha_registro, id_proveedor);
    listaProductos.AddObject(IntToStr(Producto.id_producto), Producto);
    comando.Next;
  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := listaProductos;
end;

function TAccesoDatos.CargarProducto(id_producto_to_load: integer): TProducto;
var
  Conexion: TConexion;
  comando: TZQuery;
  count: integer;
  sql: string;
  Producto: TProducto;
  listaProductos: TStringList;
var
  id_producto: integer;
  nombre_producto: string;
  descripcion: string;
  precio: integer;
  id_proveedor: integer;
  fecha_registro: string;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);

  sql := 'select id_producto,nombre_producto,descripcion,precio,id_proveedor,fecha_registro from productos where id_producto='
    + IntToStr(id_producto_to_load);

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  Producto := TProducto.Create();

  if not comando.eof then
  begin
    id_producto := comando.FieldByname('id_producto').AsInteger;
    nombre_producto := comando.FieldByname('nombre_producto').AsString;
    descripcion := comando.FieldByname('descripcion').AsString;
    precio := comando.FieldByname('precio').AsInteger;
    id_proveedor := comando.FieldByname('id_proveedor').AsInteger;
    fecha_registro := comando.FieldByname('fecha_registro').AsString;

    Producto.setId_producto(id_producto);
    Producto.setNombre_producto(nombre_producto);
    Producto.setDescripcion(descripcion);
    Producto.setPrecio(precio);
    Producto.setId_proveedor(id_proveedor);
    Producto.setFecha_registro(fecha_registro);

  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := Producto;
end;

function TAccesoDatos.cargarNombreProveedor(id_proveedor: integer): string;
var
  Conexion: TConexion;
  comando: TZQuery;
  sql: string;
  nombre_empresa: string;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);

  sql := 'select nombre_empresa from proveedores where id_proveedor="' +
    IntToStr(id_proveedor) + '"';

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  if not comando.eof then
  begin
    nombre_empresa := comando.FieldByname('nombre_empresa').AsString;
  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := nombre_empresa;

end;

function TAccesoDatos.cargar_id_nuevo_para_proveedor(): integer;
var
  Conexion: TConexion;
  comando: TZQuery;
  sql: string;
  nuevo_id: integer;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);

  sql := 'select max(id_proveedor) from proveedores';

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  if not comando.eof then
  begin
    nuevo_id := comando.Fields[0].AsInteger + 1;
  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := nuevo_id;

end;

function TAccesoDatos.cargar_id_nuevo_para_producto(): integer;
var
  Conexion: TConexion;
  comando: TZQuery;
  sql: string;
  nuevo_id: integer;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);

  sql := 'select max(id_producto) from productos';

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  if not comando.eof then
  begin
    nuevo_id := comando.Fields[0].AsInteger + 1;
  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := nuevo_id;

end;

function TAccesoDatos.CargarListaUsuarios(): TStringList;
var
  Conexion: TConexion;
  comando: TZQuery;
  count: integer;
  sql: string;
  Usuario: TUsuario;
  listaUsuarios: TStringList;
var
  id_usuario: integer;
  username: string;
  clave: string;
  tipo: integer;
  fecha_registro: string;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);

  listaUsuarios := TStringList.Create;

  sql := 'select id_usuario,usuario,clave,tipo,fecha_registro from usuarios';

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  while not comando.eof do
  begin
    id_usuario := comando.FieldByname('id_usuario').AsInteger;
    username := comando.FieldByname('usuario').AsString;
    clave := comando.FieldByname('clave').AsString;
    tipo := comando.FieldByname('tipo').AsInteger;
    fecha_registro := comando.FieldByname('fecha_registro').AsString;
    Usuario := TUsuario.Create(id_usuario, username, clave, tipo,
      fecha_registro);
    listaUsuarios.AddObject(IntToStr(Usuario.id_usuario), Usuario);
    comando.Next;
  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := listaUsuarios;
end;

function TAccesoDatos.CargarUsuario(id_usuario_to_load: integer): TUsuario;
var
  Conexion: TConexion;
  comando: TZQuery;
  count: integer;
  sql: string;
  Usuario: TUsuario;
  listaUsuarios: TStringList;
var
  id_usuario: integer;
  username: string;
  clave: string;
  tipo: integer;
  fecha_registro: string;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);

  sql := 'select id_usuario,usuario,clave,tipo,fecha_registro from usuarios where id_usuario='
    + IntToStr(id_usuario_to_load);

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  Usuario := TUsuario.Create();

  if not comando.eof then
  begin
    id_usuario := comando.FieldByname('id_usuario').AsInteger;
    username := comando.FieldByname('usuario').AsString;
    clave := comando.FieldByname('clave').AsString;
    tipo := comando.FieldByname('tipo').AsInteger;
    fecha_registro := comando.FieldByname('fecha_registro').AsString;

    Usuario.setId_usuario(id_usuario);
    Usuario.setNombre(username);
    Usuario.setPassword(clave);
    Usuario.setTipo(tipo);
    Usuario.setFecha_registro(fecha_registro);

  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := Usuario;
end;

// Shits

function TAccesoDatos.CargarListaProductos2(): string;
var
  Conexion: TConexion;
  comando: TZQuery;
  count: integer;
  sql: string;
  Producto: TProducto;
  listaProductos: TStringList;
var
  id_producto: integer;
  nombre_producto: string;
  descripcion: string;
  precio: integer;
  id_proveedor: integer;
  fecha_registro: string;
  output: string;
begin

  Conexion := TConexion.Create();

  Conexion.Conectar();

  comando := TZQuery.Create(nil);

  output := '';
  listaProductos := TStringList.Create;

  sql := 'select id_producto,nombre_producto,descripcion,precio,id_proveedor,fecha_registro from productos';

  sql := StringReplace(sql, '"', c, [rfReplaceAll, rfIgnoreCase]);

  comando.Connection := Conexion.conexion_now;
  comando.sql.Clear();
  comando.sql.Add(sql);
  comando.Open;

  while not comando.eof do
  begin
    id_producto := comando.FieldByname('id_producto').AsInteger;
    nombre_producto := comando.FieldByname('nombre_producto').AsString;
    descripcion := comando.FieldByname('descripcion').AsString;
    precio := comando.FieldByname('precio').AsInteger;
    id_proveedor := comando.FieldByname('id_proveedor').AsInteger;
    fecha_registro := comando.FieldByname('fecha_registro').AsString;
    Producto := TProducto.Create(id_producto, nombre_producto, descripcion,
      precio, fecha_registro, id_proveedor);
    // listaProductos.AddObject(IntToStr(Producto.id_producto), Producto);
    output := output + nombre_producto + '-' + cargarNombreProveedor
      (id_proveedor) + sLineBreak;
    comando.Next;
  end;

  comando.Free;

  Conexion.Desconectar();
  Conexion.Free();

  Result := output;
end;

//

end.
