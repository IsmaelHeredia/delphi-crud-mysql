// Written By Ismael Heredia in the year 2016

unit FormProductos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
  AccesoDatos, Producto, Proveedor, Funciones;

type
  TProductos = class(TForm)
    mmOpciones: TMainMenu;
    O1: TMenuItem;
    A1: TMenuItem;
    E1: TMenuItem;
    E2: TMenuItem;
    C1: TMenuItem;
    R1: TMenuItem;
    G1: TMenuItem;
    status: TStatusBar;
    gbAgregarProducto: TGroupBox;
    lblNombre: TLabel;
    lblDescripcion: TLabel;
    txtNombre: TEdit;
    mmDescripcion: TMemo;
    lblProveedor: TLabel;
    cmbProveedor: TComboBox;
    lblPrecio: TLabel;
    txtPrecio: TEdit;
    txtID: TEdit;
    btnGrabar: TButton;
    gbProductos: TGroupBox;
    lvProductos: TListView;
    ppOpciones: TPopupMenu;
    A2: TMenuItem;
    E3: TMenuItem;
    B1: TMenuItem;
    C2: TMenuItem;
    R2: TMenuItem;
    G2: TMenuItem;
    procedure btnGrabarClick(Sender: TObject);
    procedure lvProductosDblClick(Sender: TObject);
    procedure A2Click(Sender: TObject);
    procedure E3Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure G2Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nuevo: boolean;
    procedure cargarListaProductos();
    procedure limpiar();
    procedure cargarCamposProducto(id_producto_to_load: integer);
    function validar(): boolean;
    procedure agregar();
    procedure editar();
    procedure cancelar();
    procedure cargarComboProveedores();
    procedure borrar();
    procedure grabar();
    procedure recargarLista();
  end;

var
  Productos: TProductos;

implementation

{$R *.dfm}

procedure TProductos.cargarComboProveedores();
var
  AccesoDatos: TAccesoDatos;
  lista: TStringList;
  i: integer;
  Proveedor: TProveedor;
begin

  cmbProveedor.Clear;
  AccesoDatos := TAccesoDatos.Create();
  lista := AccesoDatos.CargarListaProveedores;
  for i := 0 to lista.Count - 1 do
  begin
    Proveedor := TProveedor(lista.Objects[i]);
    cmbProveedor.AddItem(Proveedor.getNombre_empresa,
      TObject(Proveedor.getId_proveedor));
  end;
  if (lista.Count >= 1) then
  begin
    cmbProveedor.ItemIndex := 0;
  end;
  AccesoDatos.Free;

end;

procedure TProductos.cargarListaProductos();
var
  AccesoDatos: TAccesoDatos;
  lista: TStringList;
  i: integer;
  Producto: TProducto;
var
  id_producto: integer;
  nombre_producto: string;
  descripcion: string;
  precio: integer;
  id_proveedor: integer;
  fecha_registro: string;
  nombre_proveedor: string;
begin

  lvProductos.Items.Clear;

  AccesoDatos := TAccesoDatos.Create();

  lista := AccesoDatos.cargarListaProductos();

  for i := 0 to lista.Count - 1 do
  begin
    with lvProductos.Items.Add do
    begin
      Producto := TProducto(lista.Objects[i]);

      id_producto := Producto.getId_producto;
      nombre_producto := Producto.getNombre_producto;
      descripcion := Producto.getDescripcion;
      precio := Producto.getPrecio;
      id_proveedor := Producto.getId_proveedor;
      fecha_registro := Producto.getFecha_registro;

      nombre_proveedor := AccesoDatos.cargarNombreProveedor(id_proveedor);

      Caption := nombre_producto;
      SubItems.Add(descripcion);
      SubItems.Add(IntToStr(precio));
      SubItems.Add(fecha_registro);
      SubItems.Add(nombre_proveedor);
      Data := Pointer(id_producto);

      Producto.Free;

    end;

  end;

  lista.Free;

  AccesoDatos.Free;

end;

procedure TProductos.E1Click(Sender: TObject);
begin
  editar();
end;

procedure TProductos.E2Click(Sender: TObject);
begin
  borrar();
end;

procedure TProductos.E3Click(Sender: TObject);
begin
  editar();
end;

procedure TProductos.limpiar();
begin
  txtID.Text := '';
  txtNombre.Text := '';
  mmDescripcion.Text := '';
  cmbProveedor.ItemIndex := -1;
  txtPrecio.Text := '';
end;

procedure TProductos.cargarCamposProducto(id_producto_to_load: integer);
var
  AccesoDatos: TAccesoDatos;
  Producto: TProducto;
  nombre_empresa: string;
  index_proveedor: integer;
begin

  AccesoDatos := TAccesoDatos.Create();

  Producto := AccesoDatos.CargarProducto(id_producto_to_load);

  txtID.Text := IntToStr(Producto.getId_producto);
  txtNombre.Text := Producto.getNombre_producto;
  mmDescripcion.Text := Producto.getDescripcion;

  nombre_empresa := AccesoDatos.cargarNombreProveedor(Producto.getId_proveedor);
  index_proveedor := cmbProveedor.Items.IndexOf(nombre_empresa);
  cmbProveedor.ItemIndex := index_proveedor;

  txtPrecio.Text := IntToStr(Producto.getPrecio);

  Producto.Free;
  AccesoDatos.Free();

end;

function TProductos.validar(): boolean;
var
  respuesta: boolean;
begin
  if (txtNombre.Text = '') then
  begin
    ShowMessage('Falta el nombre');
    txtNombre.setFocus;
    respuesta := false;
  end
  else if (mmDescripcion.Text = '') then
  begin
    ShowMessage('Falta la descripcion');
    mmDescripcion.setFocus;
    respuesta := false;
  end
  else if (cmbProveedor.ItemIndex = -1) or (cmbProveedor.Text = '') then
  begin
    ShowMessage('Seleccione proveedor');
    cmbProveedor.setFocus;
    respuesta := false;
  end
  else if (txtPrecio.Text = '') then
  begin
    ShowMessage('Falta el precio');
    txtPrecio.setFocus;
    respuesta := false;
  end
  else
  begin
    respuesta := true;
  end;
  Result := respuesta;
end;

procedure TProductos.A1Click(Sender: TObject);
begin
  agregar();
end;

procedure TProductos.A2Click(Sender: TObject);
begin
  agregar();
end;

procedure TProductos.agregar();
var
  AccesoDatos: TAccesoDatos;
begin
  AccesoDatos := TAccesoDatos.Create;
  status.Panels[0].Text := '[+] Programa en modo nuevo';
  nuevo := true;
  limpiar();
  // txtID.Text := IntToStr(Conexion.cargar_id_nuevo_para_producto);
  AccesoDatos.Free;
  ShowMessage('Programa en modo nuevo');

end;

procedure TProductos.B1Click(Sender: TObject);
begin
  borrar();
end;

procedure TProductos.editar();
begin
  status.Panels[0].Text := '[+] Programa en modo editar';
  nuevo := false;
  ShowMessage('Programa en modo editar');
end;

procedure TProductos.G1Click(Sender: TObject);
begin
  grabar();
end;

procedure TProductos.G2Click(Sender: TObject);
begin
  grabar();
end;

procedure TProductos.cancelar();
begin
  status.Panels[0].Text := '[+] Programa cargado';
  nuevo := false;
  limpiar();
  ShowMessage('Opcion cancelada');
end;

procedure TProductos.borrar();
var
  response: integer;
  AccesoDatos: TAccesoDatos;
  Producto: TProducto;
  nombre_producto: string;
  id_producto: integer;
  sql: string;
begin
  if lvProductos.Selected <> nil then
  begin
    id_producto := integer(lvProductos.Items[lvProductos.Selected.index].Data);

    AccesoDatos := TAccesoDatos.Create();

    Producto := AccesoDatos.CargarProducto(id_producto);

    nombre_producto := Producto.getNombre_producto;

    response := Application.MessageBox
      (Pchar('¿ Esta seguro borrar el registro ' + nombre_producto + ' ?'),
      '¿ Desea borrar este registro ?', MB_ICONQUESTION or MB_YESNO);
    if response = IDYES then
    begin
      sql := 'delete from productos where id_producto=' + IntToStr(id_producto);
      if (AccesoDatos.EjecutarComando(sql)) then
      begin
        ShowMessage('Registro borrado');
        status.Panels[0].Text := 'Registro borrado';
      end
      else
      begin
        ShowMessage('Ha ocurrido un error');
        status.Panels[0].Text := 'Ha ocurrido un error';
      end;
    end;

    AccesoDatos.Free();

    recargarLista();

  end;
end;

procedure TProductos.recargarLista();
begin
  cargarListaProductos();
  cargarComboProveedores();
end;

procedure TProductos.grabar();
var
  AccesoDatos: TAccesoDatos;
  Producto: TProducto;
  sql: string;
  grabar_ready: boolean;
begin

  grabar_ready := false;

  if (validar()) then
  begin

    Producto := TProducto.Create();

    if not(txtID.Text = '') then
    begin
      Producto.setId_producto(StrToInt(txtID.Text));
    end;
    Producto.setNombre_producto(txtNombre.Text);
    Producto.setDescripcion(mmDescripcion.Text);
    Producto.setPrecio(StrToInt(txtPrecio.Text));
    Producto.setFecha_registro(fecha_del_dia());
    Producto.setId_proveedor
      (integer(cmbProveedor.Items.Objects[cmbProveedor.ItemIndex]));

    sql := '';

    AccesoDatos := TAccesoDatos.Create();

    if (nuevo) then
    begin
      sql := 'insert into productos(nombre_producto,descripcion,precio,id_proveedor,fecha_registro) values("'
        + Producto.getNombre_producto() + '","' + Producto.getDescripcion() +
        '","' + IntToStr(Producto.getPrecio()) + '","' +
        IntToStr(Producto.getId_proveedor()) + '","' +
        Producto.getFecha_registro() + '")';
    end
    else
    begin
      sql := 'update productos set nombre_producto="' +
        Producto.getNombre_producto() + '",descripcion="' +
        Producto.getDescripcion() + '",precio=' + IntToStr(Producto.getPrecio())
        + ',id_proveedor=' + IntToStr(Producto.getId_proveedor()) +
        ' where id_producto=' + IntToStr(Producto.getId_producto());
    end;

    // ShowMessage(sql);

    if (nuevo) then
    begin
      if (AccesoDatos.comprobar_existencia_producto_crear
        (Producto.getNombre_producto())) then
      begin
        grabar_ready := false;
      end
      else
      begin
        grabar_ready := true;
      end;
    end
    else
    begin
      if (AccesoDatos.comprobar_existencia_producto_editar
        (Producto.getId_producto(), Producto.getNombre_producto())) then
      begin
        grabar_ready := false;
      end
      else
      begin
        grabar_ready := true;
      end;
    end;

    // ShowMessage(sql);

    if (grabar_ready) then
    begin
      if (AccesoDatos.EjecutarComando(sql)) then
      begin
        if (nuevo) then
        begin
          ShowMessage('Registro agregado');
          status.Panels[0].Text := 'Registro agregado';
        end
        else
        begin
          ShowMessage('Registro actualizado');
          status.Panels[0].Text := 'Registro actualizado';
        end;
      end
      else
      begin
        ShowMessage('Ha ocurrido un error');
        status.Panels[0].Text := 'Ha ocurrido un error';
      end;
    end
    else
    begin
      ShowMessage('El producto ' + Producto.getNombre_producto() +
        ' ya existe');
    end;

    AccesoDatos.Free();
    Producto.Free();

    recargarLista();

  end;
end;

procedure TProductos.lvProductosDblClick(Sender: TObject);
var
  id_producto: integer;
begin
  if lvProductos.Selected <> nil then
  begin
    id_producto := integer(lvProductos.Items[lvProductos.Selected.index].Data);
    cargarCamposProducto(id_producto);
  end;
end;

procedure TProductos.R1Click(Sender: TObject);
begin
  recargarLista();
end;

procedure TProductos.R2Click(Sender: TObject);
begin
  recargarLista();
end;

procedure TProductos.btnGrabarClick(Sender: TObject);
begin
  grabar();
end;

procedure TProductos.C1Click(Sender: TObject);
begin
  cancelar();
end;

procedure TProductos.C2Click(Sender: TObject);
begin
  cancelar();
end;

end.
