// Written By Ismael Heredia in the year 2016

unit FormUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
  Usuario, AccesoDatos, Funciones;

type
  TUsuarios = class(TForm)
    mmOpciones: TMainMenu;
    O1: TMenuItem;
    A1: TMenuItem;
    C1: TMenuItem;
    U1: TMenuItem;
    A2: TMenuItem;
    E1: TMenuItem;
    R1: TMenuItem;
    status: TStatusBar;
    gbAgregarUsuario: TGroupBox;
    lblUsuario: TLabel;
    txtUsuario: TEdit;
    lblPassword: TLabel;
    txtPassword: TEdit;
    lblTipo: TLabel;
    cmbTipo: TComboBox;
    btnAgregar: TButton;
    gbUsuarios: TGroupBox;
    lvUsuarios: TListView;
    ppOpciones: TPopupMenu;
    A3: TMenuItem;
    C2: TMenuItem;
    U2: TMenuItem;
    A4: TMenuItem;
    E2: TMenuItem;
    R2: TMenuItem;
    E3: TMenuItem;
    E4: TMenuItem;
    txtID: TEdit;
    procedure btnAgregarClick(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure A2Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure A3Click(Sender: TObject);
    procedure U2Click(Sender: TObject);
    procedure A4Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure E3Click(Sender: TObject);
    procedure E4Click(Sender: TObject);
    procedure lvUsuariosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nuevo: boolean;
    procedure cargarListaUsuarios();
    procedure cargarCamposUsuario(id_usuario_to_load: integer);
    procedure limpiar();
    function validar(): boolean;
    procedure agregar();
    procedure editar();
    procedure asignar(tipo_usuario: string);
    procedure borrar();
    procedure recargarLista();
    procedure grabar();
  end;

var
  Usuarios: TUsuarios;

implementation

{$R *.dfm}

procedure TUsuarios.cargarListaUsuarios();
var
  AccesoDatos: TAccesoDatos;
  lista: TStringList;
  i: integer;
  Usuario: TUsuario;
var
  id_usuario: integer;
  nombre: string;
  password: string;
  tipo: integer;
  fecha_registro: string;
  tipo_nombre: string;

begin

  lvUsuarios.Items.Clear;

  AccesoDatos := TAccesoDatos.Create();

  lista := AccesoDatos.cargarListaUsuarios();

  for i := 0 to lista.Count - 1 do
  begin
    with lvUsuarios.Items.Add do
    begin
      Usuario := TUsuario(lista.Objects[i]);

      id_usuario := Usuario.getId_usuario;
      nombre := Usuario.getNombre;
      password := Usuario.getPassword;
      tipo := Usuario.getTipo;
      fecha_registro := Usuario.getFecha_registro;

      tipo_nombre := '';

      if (tipo = 1) then
      begin
        tipo_nombre := 'Administrador';
      end
      else
      begin
        tipo_nombre := 'Usuario';
      end;

      Caption := tipo_nombre;
      SubItems.Add(nombre);
      SubItems.Add(fecha_registro);
      Data := Pointer(id_usuario);

    end;

  end;

  lista.Free;

  AccesoDatos.Free;

end;

procedure TUsuarios.cargarCamposUsuario(id_usuario_to_load: integer);
var
  AccesoDatos: TAccesoDatos;
  Usuario: TUsuario;
  nombre_empresa: string;
  index_proveedor: integer;
begin

  AccesoDatos := TAccesoDatos.Create();

  Usuario := AccesoDatos.CargarUsuario(id_usuario_to_load);

  txtID.Text := IntToStr(Usuario.id_usuario);
  txtUsuario.Text := Usuario.nombre;

  if (Usuario.tipo = 1) then
  begin
    cmbTipo.ItemIndex := 1;
  end
  else
  begin
    cmbTipo.ItemIndex := 0;
  end;

  Usuario.Free;
  AccesoDatos.Free();

end;

procedure TUsuarios.E1Click(Sender: TObject);
begin
  borrar();
end;

procedure TUsuarios.E2Click(Sender: TObject);
begin
  borrar();
end;

procedure TUsuarios.E3Click(Sender: TObject);
begin
  editar();
end;

procedure TUsuarios.E4Click(Sender: TObject);
begin
  editar();
end;

procedure TUsuarios.limpiar();
begin
  txtUsuario.Text := '';
  txtPassword.Text := '';
  cmbTipo.ItemIndex := -1;
end;

procedure TUsuarios.lvUsuariosDblClick(Sender: TObject);
var
  id_usuario: integer;
begin
  if lvUsuarios.Selected <> nil then
  begin
    id_usuario := integer(lvUsuarios.Items[lvUsuarios.Selected.index].Data);
    cargarCamposUsuario(id_usuario);
  end;
end;

procedure TUsuarios.R1Click(Sender: TObject);
begin
  recargarLista();
end;

procedure TUsuarios.R2Click(Sender: TObject);
begin
  recargarLista();
end;

procedure TUsuarios.recargarLista();
begin
  cargarListaUsuarios();
end;

procedure TUsuarios.U1Click(Sender: TObject);
begin
  asignar('user');
end;

procedure TUsuarios.U2Click(Sender: TObject);
begin
  asignar('user');
end;

function TUsuarios.validar(): boolean;
var
  respuesta: boolean;
begin
  if (txtUsuario.Text = '') then
  begin
    ShowMessage('Falta nombre de usuario');
    txtUsuario.SetFocus;
    respuesta := false;
  end
  else if (txtPassword.Text = '') then
  begin
    ShowMessage('Falta la contraseña');
    txtPassword.SetFocus;
    respuesta := false;
  end
  else if (cmbTipo.ItemIndex = -1) then
  begin
    ShowMessage('Seleccione tipo');
    cmbTipo.SetFocus;
    respuesta := false;
  end
  else
  begin
    respuesta := true;
  end;
  Result := respuesta;
end;

procedure TUsuarios.A1Click(Sender: TObject);
begin
  agregar();
end;

procedure TUsuarios.A2Click(Sender: TObject);
begin
  asignar('admin');
end;

procedure TUsuarios.A3Click(Sender: TObject);
begin
  agregar();
end;

procedure TUsuarios.A4Click(Sender: TObject);
begin
  asignar('admin');
end;

procedure TUsuarios.agregar();
begin
  nuevo := true;
  txtUsuario.Enabled := true;
  txtPassword.Enabled := true;
  status.Panels[0].Text := '[+] Programa en modo nuevo';
  limpiar();
  ShowMessage('Programa en modo nuevo');
end;

procedure TUsuarios.editar();
begin
  nuevo := false;
  txtUsuario.Enabled := false;
  txtPassword.Enabled := false;
  status.Panels[0].Text := '[+] Programa en modo editar';
  limpiar();
  ShowMessage('Programa en modo editar');
end;

procedure TUsuarios.borrar();
var
  response: integer;
  AccesoDatos: TAccesoDatos;
  Usuario: TUsuario;
  sql: string;
  username: string;
  id_usuario: integer;
begin
  if lvUsuarios.Selected <> nil then
  begin
    id_usuario := integer(lvUsuarios.Items[lvUsuarios.Selected.index].Data);

    AccesoDatos := TAccesoDatos.Create();

    Usuario := AccesoDatos.CargarUsuario(id_usuario);

    username := Usuario.getNombre;

    response := Application.MessageBox
      (Pchar('¿ Esta seguro borrar el registro ' + username + ' ?'),
      '¿ Desea borrar este registro ?', MB_ICONQUESTION or MB_YESNO);
    if response = IDYES then
    begin
      sql := 'delete from usuarios where id_usuario=' + IntToStr(id_usuario);
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

procedure TUsuarios.asignar(tipo_usuario: string);
var
  response: integer;
  AccesoDatos: TAccesoDatos;
  Usuario: TUsuario;
  sql: string;
  username: string;
  id_usuario: integer;
  tipo: integer;
  rango: string;
begin
  if lvUsuarios.Selected <> nil then
  begin
    id_usuario := integer(lvUsuarios.Items[lvUsuarios.Selected.index].Data);

    AccesoDatos := TAccesoDatos.Create();

    Usuario := AccesoDatos.CargarUsuario(id_usuario);

    username := Usuario.getNombre;

    tipo := 0;
    rango := '';

    if (tipo_usuario = 'admin') then
    begin
      tipo := 1;
      rango := 'Administrador';
    end
    else if (tipo_usuario = 'user') then
    begin
      tipo := 2;
      rango := 'Usuario';
    end
    else
    begin
      tipo := 2;
      rango := 'Usuario';
    end;

    response := Application.MessageBox
      (Pchar('¿ Desea asignar como ' + rango + ' al usuario ' + username +
      ' ?'), 'Asignar', MB_ICONQUESTION or MB_YESNO);
    if response = IDYES then
    begin
      sql := 'update usuarios set tipo=' + IntToStr(tipo) + ' where usuario="' +
        username + '"';
      if (AccesoDatos.EjecutarComando(sql)) then
      begin
        ShowMessage('Asignacion realizada');
        status.Panels[0].Text := '[+] Asignacion realizada';
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

procedure TUsuarios.grabar();
var
  AccesoDatos: TAccesoDatos;
  Usuario: TUsuario;
  password: string;
  sql: string;
  tipo: integer;
  grabar_ready: boolean;
begin
  grabar_ready := false;
  if (validar()) then
  begin
    AccesoDatos := TAccesoDatos.Create();
    Usuario := TUsuario.Create();
    Usuario.setNombre(txtUsuario.Text);
    password := md5_encode(txtPassword.Text);
    Usuario.setPassword(password);
    if (cmbTipo.ItemIndex = 1) then
    begin
      tipo := 1;
    end
    else
    begin
      tipo := 2;
    end;
    Usuario.setTipo(tipo);
    Usuario.setFecha_registro(fecha_del_dia());

    sql := '';

    if (nuevo) then
    begin
      sql := 'insert into usuarios(usuario,clave,tipo,fecha_registro) values("'
        + Usuario.getNombre() + '","' + Usuario.getPassword() + '",' +
        IntToStr(Usuario.getTipo()) + ',"' + Usuario.getFecha_registro() + '")';
    end
    else
    begin
      sql := 'update usuarios set tipo=' + IntToStr(tipo) + ' where usuario='''
        + Usuario.getNombre() + '''';
    end;

    if (nuevo) then
    begin
      if (AccesoDatos.comprobar_existencia_usuario_crear(Usuario.getNombre()))
      then
      begin
        grabar_ready := false;
      end
      else
      begin
        grabar_ready := true;
      end;
    end;

    if (grabar_ready) then
    begin
      if (AccesoDatos.EjecutarComando(sql)) then
      begin
        if (nuevo) then
        begin
          status.Panels[0].Text := 'Registro agregado';
          ShowMessage('Registro agregado');
        end
        else
        begin
          status.Panels[0].Text := 'Registo editado';
          ShowMessage('Registro editado');
        end;
      end
      else
      begin
        status.Panels[0].Text := 'Ocurrio un error';
        ShowMessage('Ocurrio un error');
      end;
    end
    else
    begin
      ShowMessage('El usuario ' + Usuario.getNombre() + ' ya existe');
    end;

    Usuario.Free;
    AccesoDatos.Free;

    limpiar();
    cargarListaUsuarios();

  end;
end;

procedure TUsuarios.btnAgregarClick(Sender: TObject);
begin
  grabar();
end;

end.
