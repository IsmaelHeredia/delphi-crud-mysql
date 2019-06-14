object FormLogin: TFormLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Aplicacion basica'
  ClientHeight = 188
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbDatos: TGroupBox
    Left = 8
    Top = 8
    Width = 273
    Height = 161
    Caption = 'Datos'
    TabOrder = 0
    object lblUsuario: TLabel
      Left = 24
      Top = 32
      Width = 46
      Height = 13
      Caption = 'Usuario : '
    end
    object lblPassword: TLabel
      Left = 24
      Top = 64
      Width = 56
      Height = 13
      Caption = 'Password : '
    end
    object txtUsuario: TEdit
      Left = 76
      Top = 29
      Width = 173
      Height = 21
      TabOrder = 0
    end
    object txtPassword: TEdit
      Left = 86
      Top = 61
      Width = 163
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object btnIngresar: TButton
      Left = 64
      Top = 112
      Width = 145
      Height = 25
      Caption = 'Ingresar'
      TabOrder = 2
      OnClick = btnIngresarClick
    end
  end
end
