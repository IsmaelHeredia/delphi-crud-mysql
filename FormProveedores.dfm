object Proveedores: TProveedores
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Proveedores'
  ClientHeight = 234
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmOpciones
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object status: TStatusBar
    Left = 0
    Top = 215
    Width = 496
    Height = 19
    Panels = <
      item
        Text = 'Programa cargado'
        Width = 50
      end>
  end
  object gbAgregarProveedor: TGroupBox
    Left = 8
    Top = 16
    Width = 185
    Height = 185
    Caption = 'Agregar Proveedor'
    TabOrder = 1
    object lblNombre: TLabel
      Left = 16
      Top = 32
      Width = 47
      Height = 13
      Caption = 'Nombre : '
    end
    object lblDireccion: TLabel
      Left = 16
      Top = 64
      Width = 53
      Height = 13
      Caption = 'Direccion : '
    end
    object lblTelefono: TLabel
      Left = 16
      Top = 96
      Width = 52
      Height = 13
      Caption = 'Telefono : '
    end
    object txtNombre: TEdit
      Left = 69
      Top = 29
      Width = 102
      Height = 21
      TabOrder = 0
    end
    object txtDireccion: TEdit
      Left = 75
      Top = 61
      Width = 93
      Height = 21
      TabOrder = 1
    end
    object txtTelefono: TEdit
      Left = 74
      Top = 93
      Width = 94
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
    object txtID: TEdit
      Left = 18
      Top = 144
      Width = 45
      Height = 21
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 3
    end
    object btnGrabar: TButton
      Left = 69
      Top = 142
      Width = 75
      Height = 25
      Caption = 'Grabar'
      TabOrder = 4
      OnClick = btnGrabarClick
    end
  end
  object gbProveedores: TGroupBox
    Left = 199
    Top = 16
    Width = 282
    Height = 185
    Caption = 'Proveedores'
    TabOrder = 2
    object lvProveedores: TListView
      Left = 16
      Top = 17
      Width = 250
      Height = 150
      Columns = <
        item
          AutoSize = True
          Caption = 'Nombre'
        end
        item
          AutoSize = True
          Caption = 'Direccion'
        end
        item
          AutoSize = True
          Caption = 'Telefono'
        end>
      ReadOnly = True
      RowSelect = True
      PopupMenu = ppOpciones
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lvProveedoresDblClick
    end
  end
  object mmOpciones: TMainMenu
    Left = 256
    Top = 112
    object O1: TMenuItem
      Caption = 'Opciones'
      object A1: TMenuItem
        Caption = 'Agregar Proveedor'
        OnClick = A1Click
      end
      object E1: TMenuItem
        Caption = 'Editar Proveedor'
        OnClick = E1Click
      end
      object E2: TMenuItem
        Caption = 'Eliminar Proveedor'
        OnClick = E2Click
      end
      object C1: TMenuItem
        Caption = 'Cancelar'
        OnClick = C1Click
      end
      object R1: TMenuItem
        Caption = 'Recargar Lista'
        OnClick = R1Click
      end
      object G1: TMenuItem
        Caption = 'Grabar'
        OnClick = G1Click
      end
    end
  end
  object ppOpciones: TPopupMenu
    Left = 320
    Top = 80
    object A2: TMenuItem
      Caption = 'Agregar Proveedor'
      OnClick = A2Click
    end
    object E3: TMenuItem
      Caption = 'Editar Proveedor'
      OnClick = E3Click
    end
    object B1: TMenuItem
      Caption = 'Borrar Proveedor'
      OnClick = B1Click
    end
    object C2: TMenuItem
      Caption = 'Cancelar'
      OnClick = C2Click
    end
    object R2: TMenuItem
      Caption = 'Recargar Lista'
      OnClick = R2Click
    end
    object G2: TMenuItem
      Caption = 'Grabar'
      OnClick = G2Click
    end
  end
end
