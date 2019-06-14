program aplicacion;

uses
  Vcl.Forms,
  app in 'app.pas' {FormLogin},
  Usuario in 'Usuario.pas',
  Proveedor in 'Proveedor.pas',
  Producto in 'Producto.pas',
  Conexion in 'Conexion.pas',
  Funciones in 'Funciones.pas',
  FormHome in 'FormHome.pas' {Home},
  FormUsuarios in 'FormUsuarios.pas' {Usuarios},
  FormProductos in 'FormProductos.pas' {Productos},
  FormProveedores in 'FormProveedores.pas' {Proveedores},
  FormCambiarUsuario in 'FormCambiarUsuario.pas' {CambiarUsuario},
  FormCambiarContraseña in 'FormCambiarContraseña.pas' {CambiarPassword},
  Vcl.Themes,
  Vcl.Styles,
  frmReporteGrafico in 'frmReporteGrafico.pas' {Form2},
  frmReporteGraficoProductos in 'frmReporteGraficoProductos.pas' {FormGrafico},
  frmReporteGraficoProveedores in 'frmReporteGraficoProveedores.pas' {FormGrafico2},
  AccesoDatos in 'AccesoDatos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metro Black');
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(THome, Home);
  Application.CreateForm(TUsuarios, Usuarios);
  Application.CreateForm(TProductos, Productos);
  Application.CreateForm(TProveedores, Proveedores);
  Application.CreateForm(TCambiarUsuario, CambiarUsuario);
  Application.CreateForm(TCambiarPassword, CambiarPassword);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFormGrafico, FormGrafico);
  Application.CreateForm(TFormGrafico2, FormGrafico2);
  Application.Run;
end.
