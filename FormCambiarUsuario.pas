// Written By Ismael Heredia in the year 2016

unit FormCambiarUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AccesoDatos, Funciones;

type
  TCambiarUsuario = class(TForm)
    gbDatos: TGroupBox;
    lblUsuarioActual: TLabel;
    lblContraseña: TLabel;
    lblNombreDeUsuario: TLabel;
    txtUsuarioActual: TEdit;
    txtContraseña: TEdit;
    txtNombreDeUsuario: TEdit;
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
  CambiarUsuario: TCambiarUsuario;

implementation

{$R *.dfm}

procedure TCambiarUsuario.cargarDatos(username: string);
begin
  usuario := username;
  txtUsuarioActual.Text := usuario;
end;

procedure TCambiarUsuario.btnCambiarClick(Sender: TObject);
var
  usuario: string;
  nuevo_nombre: string;
  password: string;
  AccesoDatos: TAccesoDatos;
  sql: string;
  grabar_ready: boolean;
begin
  grabar_ready := false;
  if (txtUsuarioActual.Text = '') or (txtContraseña.Text = '') or
    (txtNombreDeUsuario.Text = '') then
  begin
    ShowMessage('Faltan datos');
  end
  else
  begin
    usuario := txtUsuarioActual.Text;
    password := md5_encode(txtContraseña.Text);
    nuevo_nombre := txtNombreDeUsuario.Text;
    AccesoDatos := TAccesoDatos.Create();
    if (AccesoDatos.ingreso_usuario(usuario, password)) then
    begin
      sql := 'update usuarios set usuario="' + nuevo_nombre +
        '" where usuario="' + usuario + '"';

      if (AccesoDatos.comprobar_existencia_usuario_editar(nuevo_nombre)) then
      begin
        grabar_ready := false;
      end
      else
      begin
        grabar_ready := true;
      end;

      if (grabar_ready) then
      begin
        if (AccesoDatos.EjecutarComando(sql)) then
        begin
          ShowMessage
            ('El nombre de usuario ha sido cambiado exitosamente , reinicie la aplicacion');
          Application.Terminate;
        end
        else
        begin
          ShowMessage('Ha ocurrido un error');
        end;
      end
      else
      begin
        ShowMessage('El usuario ' + nuevo_nombre + ' ya existe');
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
