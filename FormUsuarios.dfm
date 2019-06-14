object Usuarios: TUsuarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Usuarios'
  ClientHeight = 224
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmOpciones
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object status: TStatusBar
    Left = 0
    Top = 205
    Width = 501
    Height = 19
    Panels = <
      item
        Text = 'Programa cargado'
        Width = 50
      end>
  end
  object gbAgregarUsuario: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 185
    Caption = 'Agregar Usuario'
    TabOrder = 1
    object lblUsuario: TLabel
      Left = 16
      Top = 32
      Width = 46
      Height = 13
      Caption = 'Usuario : '
    end
    object lblPassword: TLabel
      Left = 16
      Top = 64
      Width = 56
      Height = 13
      Caption = 'Password : '
    end
    object lblTipo: TLabel
      Left = 16
      Top = 96
      Width = 30
      Height = 13
      Caption = 'Tipo : '
    end
    object txtUsuario: TEdit
      Left = 64
      Top = 29
      Width = 109
      Height = 21
      TabOrder = 0
    end
    object txtPassword: TEdit
      Left = 78
      Top = 61
      Width = 95
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object cmbTipo: TComboBox
      Left = 49
      Top = 93
      Width = 124
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'Usuario'
      Items.Strings = (
        'Usuario'
        'Administrador')
    end
    object btnAgregar: TButton
      Left = 40
      Top = 136
      Width = 105
      Height = 25
      Caption = 'Agregar'
      TabOrder = 3
      OnClick = btnAgregarClick
    end
    object txtID: TEdit
      Left = 4
      Top = 138
      Width = 30
      Height = 21
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 4
    end
  end
  object gbUsuarios: TGroupBox
    Left = 199
    Top = 8
    Width = 290
    Height = 185
    Caption = 'Usuarios'
    TabOrder = 2
    object lvUsuarios: TListView
      Left = 12
      Top = 29
      Width = 269
      Height = 140
      Columns = <
        item
          AutoSize = True
          Caption = 'Tipo'
        end
        item
          AutoSize = True
          Caption = 'Nombre'
        end
        item
          AutoSize = True
          Caption = 'Fecha registro'
        end>
      ReadOnly = True
      RowSelect = True
      PopupMenu = ppOpciones
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lvUsuariosDblClick
    end
  end
  object mmOpciones: TMainMenu
    Left = 136
    Top = 80
    object O1: TMenuItem
      Caption = 'Opciones'
      object A1: TMenuItem
        Caption = 'Agregar Usuario'
        OnClick = A1Click
      end
      object E3: TMenuItem
        Caption = 'Editar Usuario'
        OnClick = E3Click
      end
      object C1: TMenuItem
        Caption = 'Cambiar tipo a'
        object U1: TMenuItem
          Caption = 'Usuario'
          OnClick = U1Click
        end
        object A2: TMenuItem
          Caption = 'Administrador'
          OnClick = A2Click
        end
      end
      object E1: TMenuItem
        Caption = 'Eliminar Usuario'
        OnClick = E1Click
      end
      object R1: TMenuItem
        Caption = 'Recargar Lista'
        OnClick = R1Click
      end
    end
  end
  object ppOpciones: TPopupMenu
    Left = 320
    Top = 88
    object A3: TMenuItem
      Caption = 'Agregar Usuario'
      OnClick = A3Click
    end
    object E4: TMenuItem
      Caption = 'Editar Usuario'
      OnClick = E4Click
    end
    object C2: TMenuItem
      Caption = 'Cambiar tipo a '
      object U2: TMenuItem
        Caption = 'Usuario'
        OnClick = U2Click
      end
      object A4: TMenuItem
        Caption = 'Administrador'
        OnClick = A4Click
      end
    end
    object E2: TMenuItem
      Caption = 'Eliminar Usuario'
      OnClick = E2Click
    end
    object R2: TMenuItem
      Caption = 'Recargar Lista'
      OnClick = R2Click
    end
  end
end
