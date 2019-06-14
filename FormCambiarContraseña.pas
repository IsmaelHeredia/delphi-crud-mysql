// Written By Ismael Heredia in the year 2016

unit FormCambiarContraseña;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Funciones, AccesoDatos;

type
  TCambiarPassword = class(TForm)
    gbDatos: TGroupBox;
    lblUsuarioActual: TLabel;
    lblContraseña: TLabel;
    lblNuevaContraseña: TLabel;
    txtUsuarioActual: TEdit;
    txtContraseña: TEdit;
    txtNuevaContraseña: TEdit;
    btnCambiar: TButton;
    procedure btnCambiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario: string;
    procedure cargarDatos(username: string);
  end;

var
  CambiarPassword: TCambiarPassword;

implementation

{$R *.dfm}

procedure TCambiarPassword.cargarDatos(username: string);
begin
  usuario := username;
  txtUsuarioActual.Text := usuario;
end;

procedure TCambiarPassword.btnCambiarClick(Sender: TObject);
var
  usuario: string;
  password: string;
  nuevo_password: string;
  AccesoDatos: TAccesoDatos;
  sql: string;
begin
  if (txtUsuarioActual.Text = '') or (txtContraseña.Text = '') or
    (txtNuevaContraseña.Text = '') then
  begin
    ShowMessage('Faltan datos');
  end
  else
  begin
    usuario := txtUsuarioActual.Text;
    password := md5_encode(txtContraseña.Text);
    nuevo_password := md5_encode(txtNuevaContraseña.Text);
    AccesoDatos := TAccesoDatos.Create();
    if (AccesoDatos.ingreso_usuario(usuario, password)) then
    begin
      sql := 'update usuarios set clave="' + nuevo_password +
        '" where usuario="' + usuario + '"';
      if (AccesoDatos.EjecutarComando(sql)) then
      begin
        ShowMessage
          ('La contraseña ha sido cambiada exitosamente , reinicie la aplicacion');
        Application.Terminate;
      end
      else
      begin
        ShowMessage('Ha ocurrido un error');
      end;
    end
    else
    begin
      ShowMessage('Datos incorrectos');
    end;
    AccesoDatos.Free;
  end;
end;

end.
