// Written By Ismael Heredia in the year 2016

unit FormProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
  Proveedor, AccesoDatos, Funciones;

type
  TProveedores = class(TForm)
    mmOpciones: TMainMenu;
    O1: TMenuItem;
    A1: TMenuItem;
    E1: TMenuItem;
    E2: TMenuItem;
    C1: TMenuItem;
    R1: TMenuItem;
    G1: TMenuItem;
    status: TStatusBar;
    gbAgregarProveedor: TGroupBox;
    lblNombre: TLabel;
    lblDireccion: TLabel;
    lblTelefono: TLabel;
    txtNombre: TEdit;
    txtDireccion: TEdit;
    txtTelefono: TEdit;
    txtID: TEdit;
    btnGrabar: TButton;
    gbProveedores: TGroupBox;
    lvProveedores: TListView;
    ppOpciones: TPopupMenu;
    A2: TMenuItem;
    E3: TMenuItem;
    B1: TMenuItem;
    C2: TMenuItem;
    R2: TMenuItem;
    G2: TMenuItem;
    procedure btnGrabarClick(Sender: TObject);
    procedure lvProveedoresDblClick(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure A2Click(Sender: TObject);
    procedure E3Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure G2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    nuevo: boolean;
    procedure cargarListaProveedores();
    procedure limpiar();
    procedure cargarCamposProveedor(id_proveedor_to_load: integer);
    function validar(): boolean;
    procedure agregar();
    procedure editar();
    procedure cancelar();
    procedure borrar();
    procedure recargarLista();
    procedure grabar();
  end;

var
  Proveedores: TProveedores;

implementation

{$R *.dfm}

procedure TProveedores.cargarListaProveedores();
var
  AccesoDatos: TAccesoDatos;
  lista: TStringList;
  i: integer;
  Proveedor: TProveedor;
var
  id_proveedor: integer;
  nombre_empresa: string;
  direccion: string;
  telefono: integer;
  fecha_registro: string;
begin

  lvProveedores.Items.Clear;

  AccesoDatos := TAccesoDatos.Create();

  lista := AccesoDatos.cargarListaProveedores();

  for i := 0 to lista.Count - 1 do
  begin
    with lvProveedores.Items.Add do
    begin
      Proveedor := TProveedor(lista.Objects[i]);

      id_proveedor := Proveedor.getId_proveedor;
      nombre_empresa := Proveedor.getNombre_empresa;
      direccion := Proveedor.direccion;
      telefono := Proveedor.telefono;
      fecha_registro := Proveedor.fecha_registro;

      Caption := nombre_empresa;
      SubItems.Add(direccion);
      SubItems.Add(IntToStr(telefono));
      Data := Pointer(id_proveedor);

      Proveedor.Free;

    end;

  end;

  lista.Free;

  AccesoDatos.Free;

end;

procedure TProveedores.E1Click(Sender: TObject);
begin
  editar();
end;

procedure TProveedores.E2Click(Sender: TObject);
begin
  borrar();
end;

procedure TProveedores.E3Click(Sender: TObject);
begin
  editar();
end;

procedure TProveedores.limpiar();
begin
  txtID.Text := '';
  txtNombre.Text := '';
  txtDireccion.Text := '';
  txtTelefono.Text := '';
end;

procedure TProveedores.cargarCamposProveedor(id_proveedor_to_load: integer);
var
  AccesoDatos: TAccesoDatos;
  Proveedor: TProveedor;
begin

  AccesoDatos := TAccesoDatos.Create();

  Proveedor := AccesoDatos.CargarProveedor(id_proveedor_to_load);

  txtID.Text := IntToStr(Proveedor.getId_proveedor);
  txtNombre.Text := Proveedor.getNombre_empresa;
  txtDireccion.Text := Proveedor.getDireccion;
  txtTelefono.Text := IntToStr(Proveedor.getTelefono);

  Proveedor.Free;
  AccesoDatos.Free();

end;

function TProveedores.validar(): boolean;
var
  respuesta: boolean;
begin
  if (txtNombre.Text = '') then
  begin
    ShowMessage('Falta el nombre');
    txtNombre.SetFocus;
    respuesta := false;
  end
  else if (txtDireccion.Text = '') then
  begin
    ShowMessage('Falta la direccion');
    txtDireccion.SetFocus;
    respuesta := false;
  end
  else if (txtTelefono.Text = '') then
  begin
    ShowMessage('Falta el telefono');
    txtTelefono.SetFocus;
    respuesta := false;
  end
  else
  begin
    respuesta := true;
  end;
  Result := respuesta;
end;

procedure TProveedores.A1Click(Sender: TObject);
begin
  agregar();
end;

procedure TProveedores.A2Click(Sender: TObject);
begin
  agregar();
end;

procedure TProveedores.agregar();
var
  AccesoDatos: TAccesoDatos;
begin
  AccesoDatos := TAccesoDatos.Create;
  status.Panels[0].Text := '[+] Programa en modo nuevo';
  nuevo := true;
  limpiar();
  AccesoDatos.Free;
  ShowMessage('Programa en modo nuevo');
end;

procedure TProveedores.B1Click(Sender: TObject);
begin
  borrar();
end;

procedure TProveedores.editar();
begin
  status.Panels[0].Text := '[+] Programa en modo editar';
  nuevo := false;
  ShowMessage('Programa en modo editar');
end;

procedure TProveedores.FormCreate(Sender: TObject);
begin
  //
end;

procedure TProveedores.G1Click(Sender: TObject);
begin
  grabar();
end;

procedure TProveedores.G2Click(Sender: TObject);
begin
  grabar();
end;

procedure TProveedores.cancelar();
begin
  status.Panels[0].Text := '[+] Programa cargado';
  nuevo := false;
  limpiar();
  ShowMessage('Opcion cancelada');
end;

procedure TProveedores.borrar();
var
  response: integer;
  AccesoDatos: TAccesoDatos;
  Proveedor: TProveedor;
  nombre_empresa: string;
  id_proveedor: integer;
  sql: string;
begin
  if lvProveedores.Selected <> nil then
  begin

    id_proveedor := integer(lvProveedores.Items[lvProveedores.Selected.
      index].Data);

    AccesoDatos := TAccesoDatos.Create();

    Proveedor := AccesoDatos.CargarProveedor(id_proveedor);

    nombre_empresa := Proveedor.getNombre_empresa;

    response := Application.MessageBox
      (Pchar('¿ Esta seguro borrar el registro ' + nombre_empresa + ' ?'),
      '¿ Desea borrar este registro ?', MB_ICONQUESTION or MB_YESNO);
    if response = IDYES then
    begin
      sql := 'delete from proveedores where id_proveedor=' +
        IntToStr(id_proveedor);
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

procedure TProveedores.recargarLista();
begin
  cargarListaProveedores();
end;

procedure TProveedores.grabar();
var
  AccesoDatos: TAccesoDatos;
  Proveedor: TProveedor;
  sql: string;
  grabar_ready: boolean;
begin

  grabar_ready := false;

  if (validar()) then
  begin

    Proveedor := TProveedor.Create();

    if not(txtID.Text = '') then
    begin
      Proveedor.setId_proveedor(StrToInt(txtID.Text));
    end;
    Proveedor.setNombre_empresa(txtNombre.Text);
    Proveedor.setDireccion(txtDireccion.Text);
    Proveedor.setTelefono(StrToInt(txtTelefono.Text));
    Proveedor.setFecha_registro(fecha_del_dia());

    sql := '';

    AccesoDatos := TAccesoDatos.Create();

    if (nuevo) then
    begin
      sql := 'insert into proveedores(nombre_empresa,direccion,telefono,fecha_registro_proveedor) values("'
        + Proveedor.getNombre_empresa() + '","' + Proveedor.getDireccion() +
        '","' + IntToStr(Proveedor.getTelefono()) + '","' +
        Proveedor.getFecha_registro() + '")';
    end
    else
    begin
      sql := 'update proveedores set nombre_empresa="' +
        Proveedor.getNombre_empresa() + '",direccion="' + Proveedor.getDireccion
        () + '",telefono=' + IntToStr(Proveedor.getTelefono()) +
        ' where id_proveedor=' + IntToStr(Proveedor.getId_proveedor());
    end;

    if (nuevo) then
    begin
      if (AccesoDatos.comprobar_existencia_proveedor_crear
        (Proveedor.getNombre_empresa())) then
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
      if (AccesoDatos.comprobar_existencia_proveedor_editar
        (Proveedor.getId_proveedor(), Proveedor.getNombre_empresa())) then
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
      ShowMessage('El proveedor ' + Proveedor.getNombre_empresa() +
        ' ya existe');
    end;

    AccesoDatos.Free();
    Proveedor.Free();

    recargarLista();

  end;
end;

procedure TProveedores.lvProveedoresDblClick(Sender: TObject);
var
  id_proveedor: integer;
begin
  if lvProveedores.Selected <> nil then
  begin
    id_proveedor := integer(lvProveedores.Items[lvProveedores.Selected.
      index].Data);
    cargarCamposProveedor(id_proveedor);
  end;
end;

procedure TProveedores.R1Click(Sender: TObject);
begin
  recargarLista();
end;

procedure TProveedores.R2Click(Sender: TObject);
begin
  recargarLista();
end;

procedure TProveedores.btnGrabarClick(Sender: TObject);
begin
  grabar();
end;

procedure TProveedores.C1Click(Sender: TObject);
begin
  cancelar();
end;

procedure TProveedores.C2Click(Sender: TObject);
begin
  cancelar();
end;

end.
