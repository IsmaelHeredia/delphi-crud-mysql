// Written By Ismael Heredia in the year 2016

unit app;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Usuario, Data.SqlExpr,
  Data.DBXMSSQL, Data.DB, Data.Win.ADODB, AccesoDatos, Funciones, FormHome,
  Proveedor, frmReporteListadoProductos, frmReporteGraficoProductos,
  frmReporteGraficoProveedores;

type
  TFormLogin = class(TForm)
    gbDatos: TGroupBox;
    lblUsuario: TLabel;
    txtUsuario: TEdit;
    lblPassword: TLabel;
    txtPassword: TEdit;
    btnIngresar: TButton;
    procedure btnIngresarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

procedure TFormLogin.btnIngresarClick(Sender: TObject);
var
  Usuario: string;
  password: string;
  AccesoDatos: TAccesoDatos;
var
  sql: string;
  nombre_producto: string;
  conexion2: TAccesoDatos;
  id_producto: integer;
begin

  if not(txtUsuario.Text = '') and not(txtPassword.Text = '') then
  begin
    AccesoDatos := TAccesoDatos.Create();
    Usuario := txtUsuario.Text;
    password := md5_encode(txtPassword.Text);
    if (AccesoDatos.ingreso_usuario(Usuario, password)) then
    begin
      if (AccesoDatos.es_admin(Usuario)) then
      begin
        ShowMessage('Bienvenido administrador ' + Usuario);
        app.FormLogin.Hide;
        FormHome.Home.Usuario := Usuario;
        FormHome.Home.Show;
        FormHome.Home.comprobar_usuario();
      end
      else
      begin
        ShowMessage('Bienvenido usuario ' + Usuario);
        app.FormLogin.Hide;
        FormHome.Home.Usuario := Usuario;
        FormHome.Home.Show;
        FormHome.Home.comprobar_usuario();
      end;
      AccesoDatos.Free;
    end
    else
    begin
      ShowMessage('Datos incorrectos');
    end;
  end
  else
  begin
    ShowMessage('Faltan datos');
  end;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
var
  AccesoDatos: TAccesoDatos;
begin
  // AccesoDatos := TAccesoDatos.Create();
  // ShowMessage(AccesoDatos.CargarListaProductos2());
  // AccesoDatos.Free();
end;

end.
