// Written By Ismael Heredia in the year 2016

unit Usuario;

interface

uses Windows, SysUtils;

type
  TUsuario = class
  private
  public
    id_usuario: integer;
    nombre: string;
    password: string;
    tipo: integer;
    fecha_registro: string;
    function getId_usuario(): integer;
    procedure setId_usuario(id_usuario: integer);
    function getNombre(): string;
    procedure setNombre(nombre: string);
    function getPassword(): string;
    procedure setPassword(password: string);
    function getTipo(): integer;
    procedure setTipo(tipo: integer);
    function getFecha_registro(): string;
    procedure setFecha_registro(fecha_registro: string);
    Constructor Create; overload;
    Constructor Create(id_usuario: integer; nombre: string; password: string;
      tipo: integer; fecha_registro: string); overload;
    function ToString(): string;
  end;

implementation

constructor TUsuario.Create;
begin
  inherited;
  //
end;

constructor TUsuario.Create(id_usuario: integer; nombre: string;
  password: string; tipo: integer; fecha_registro: string);
begin
  self.id_usuario := id_usuario;
  self.nombre := nombre;
  self.password := password;
  self.tipo := tipo;
  self.fecha_registro := fecha_registro;
end;

function TUsuario.getId_usuario(): integer;
begin
  Result := id_usuario;
end;

procedure TUsuario.setId_usuario(id_usuario: integer);
begin
  self.id_usuario := id_usuario
end;

function TUsuario.getNombre(): string;
begin
  Result := nombre;
end;

procedure TUsuario.setNombre(nombre: string);
begin
  self.nombre := nombre;
end;

function TUsuario.getPassword(): string;
begin
  Result := password;
end;

procedure TUsuario.setPassword(password: string);
begin
  self.password := password;
end;

function TUsuario.getTipo(): integer;
begin
  Result := tipo;
end;

procedure TUsuario.setTipo(tipo: integer);
begin
  self.tipo := tipo;
end;

function TUsuario.getFecha_registro(): string;
begin
  Result := fecha_registro;
end;

procedure TUsuario.setFecha_registro(fecha_registro: string);
begin
  self.fecha_registro := fecha_registro;
end;

function TUsuario.ToString(): string;
begin
  Result := 'Usuario{' + 'id_usuario=' + IntToStr(id_usuario) + ', nombre=' +
    nombre + ', password=' + password + ', tipo=' + IntToStr(tipo) +
    ', fecha_registro=' + fecha_registro + '}';
end;

end.
