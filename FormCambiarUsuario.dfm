object CambiarUsuario: TCambiarUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cambiar Usuario'
  ClientHeight = 205
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbDatos: TGroupBox
    Left = 8
    Top = 8
    Width = 282
    Height = 137
    Caption = 'Datos'
    TabOrder = 0
    object lblUsuarioActual: TLabel
      Left = 24
      Top = 32
      Width = 78
      Height = 13
      Caption = 'Usuario actual : '
    end
    object lblContraseña: TLabel
      Left = 24
      Top = 64
      Width = 66
      Height = 13
      Caption = 'Contrase'#241'a : '
    end
    object lblNombreDeUsuario: TLabel
      Left = 24
      Top = 96
      Width = 100
      Height = 13
      Caption = 'Nombre de usuario : '
    end
    object txtUsuarioActual: TEdit
      Left = 108
      Top = 29
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object txtContraseña: TEdit
      Left = 108
      Top = 56
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object txtNombreDeUsuario: TEdit
      Left = 130
      Top = 93
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object btnCambiar: TButton
    Left = 80
    Top = 159
    Width = 129
    Height = 25
    Caption = 'Cambiar'
    TabOrder = 1
    OnClick = btnCambiarClick
  end
end
