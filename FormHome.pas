// Written By Ismael Heredia in the year 2016

unit FormHome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, AccesoDatos,
  FormProveedores, FormProductos, FormUsuarios, FormCambiarUsuario,
  FormCambiarContraseña, frmReporteListadoProductos, frmReporteGraficoProductos,
  frmReporteGraficoProveedores, RpDefine, RpRave, ZAbstractConnection,
  ZConnection, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RpCon,
  RpConDS;

type
  THome = class(TForm)
    mmMenu: TMainMenu;
    O1: TMenuItem;
    E1: TMenuItem;
    C1: TMenuItem;
    S1: TMenuItem;
    P1: TMenuItem;
    P2: TMenuItem;
    UserAdmin: TMenuItem;
    C2: TMenuItem;
    C3: TMenuItem;
    status: TStatusBar;
    P3: TMenuItem;
    P4: TMenuItem;
    L1: TMenuItem;
    G1: TMenuItem;
    G2: TMenuItem;
    ZConnection: TZConnection;
    ZQuery: TZQuery;
    RvDataSetConnection: TRvDataSetConnection;
    RvProject: TRvProject;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure S1Click(Sender: TObject);
    procedure P2Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure UserAdminClick(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure G2Click(Sender: TObject);
  private
    { Private declarations }
  public
    usuario: string;
    procedure comprobar_usuario();
  end;

var
  Home: THome;

implementation

{$R *.dfm}

procedure THome.C2Click(Sender: TObject);
begin
  FormCambiarUsuario.CambiarUsuario.Show;
  FormCambiarUsuario.CambiarUsuario.cargarDatos(usuario);
end;

procedure THome.C3Click(Sender: TObject);
begin
  FormCambiarContraseña.CambiarPassword.Show;
  FormCambiarContraseña.CambiarPassword.cargarDatos(usuario);
end;

procedure THome.comprobar_usuario();
var
  AccesoDatos: TAccesoDatos;
begin
  if not(usuario = '') then
  begin
    AccesoDatos := TAccesoDatos.Create();
    if (AccesoDatos.es_admin(usuario)) then
    begin
      UserAdmin.Enabled := True;
    end
    else
    begin
      UserAdmin.Enabled := False;
    end;
    AccesoDatos.Free;
  end;
end;

procedure THome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure THome.FormCreate(Sender: TObject);
begin
  //
end;

procedure THome.G1Click(Sender: TObject);
begin
  frmReporteGraficoProductos.FormGrafico.cargarGrafico();
  frmReporteGraficoProductos.FormGrafico.Show();
end;

procedure THome.G2Click(Sender: TObject);
begin
  frmReporteGraficoProveedores.FormGrafico2.cargarGrafico();
  frmReporteGraficoProveedores.FormGrafico2.Show();
end;

procedure THome.L1Click(Sender: TObject);
begin
  ZConnection.Connected := True;
  ZQuery.Active := True;
  RvProject.Execute;
end;

procedure THome.P1Click(Sender: TObject);
begin
  FormProductos.Productos.Show;
  FormProductos.Productos.cargarListaProductos;
  FormProductos.Productos.cargarComboProveedores();
end;

procedure THome.P2Click(Sender: TObject);
begin
  FormProveedores.Proveedores.Show;
  FormProveedores.Proveedores.cargarListaProveedores;
end;

procedure THome.S1Click(Sender: TObject);
var
  response: integer;
begin
  response := Application.MessageBox('¿ Esta seguro de salir ?',
    '¿ Desea Salir ?', MB_ICONQUESTION or MB_YESNO);
  if response = IDYES then
  begin
    Application.Terminate;
  end;
end;

procedure THome.UserAdminClick(Sender: TObject);
begin
  FormUsuarios.Usuarios.Show;
  FormUsuarios.Usuarios.cargarListaUsuarios;
end;

end.
