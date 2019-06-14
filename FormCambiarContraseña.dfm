object CambiarPassword: TCambiarPassword
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cambiar contrase'#241'a'
  ClientHeight = 205
  ClientWidth = 278
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
    Width = 257
    Height = 129
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
    object lblNuevaContraseña: TLabel
      Left = 24
      Top = 96
      Width = 98
      Height = 13
      Caption = 'Nueva contrase'#241'a : '
    end
    object txtUsuarioActual: TEdit
      Left = 112
      Top = 32
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object txtContraseña: TEdit
      Left = 96
      Top = 59
      Width = 137
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object txtNuevaContraseña: TEdit
      Left = 128
      Top = 93
      Width = 105
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
  end
  object btnCambiar: TButton
    Left = 80
    Top = 160
    Width = 121
    Height = 25
    Caption = 'Cambiar'
    TabOrder = 1
    OnClick = btnCambiarClick
  end
end
