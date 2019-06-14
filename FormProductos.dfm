object Productos: TProductos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Productos'
  ClientHeight = 357
  ClientWidth = 771
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
    Top = 338
    Width = 771
    Height = 19
    Panels = <
      item
        Text = 'Programa cargado'
        Width = 50
      end>
  end
  object gbAgregarProducto: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 324
    Caption = 'Agregar Producto'
    TabOrder = 1
    object lblNombre: TLabel
      Left = 16
      Top = 32
      Width = 47
      Height = 13
      Caption = 'Nombre : '
    end
    object lblDescripcion: TLabel
      Left = 16
      Top = 64
      Width = 64
      Height = 13
      Caption = 'Descripcion : '
    end
    object lblProveedor: TLabel
      Left = 18
      Top = 192
      Width = 60
      Height = 13
      Caption = 'Proveedor : '
    end
    object lblPrecio: TLabel
      Left = 18
      Top = 224
      Width = 39
      Height = 13
      Caption = 'Precio : '
    end
    object txtNombre: TEdit
      Left = 69
      Top = 29
      Width = 102
      Height = 21
      TabOrder = 0
    end
    object mmDescripcion: TMemo
      Left = 18
      Top = 83
      Width = 153
      Height = 89
      TabOrder = 1
    end
    object cmbProveedor: TComboBox
      Left = 84
      Top = 192
      Width = 87
      Height = 21
      Style = csDropDownList
      TabOrder = 2
    end
    object txtPrecio: TEdit
      Left = 61
      Top = 221
      Width = 110
      Height = 21
      NumbersOnly = True
      TabOrder = 3
    end
    object txtID: TEdit
      Left = 18
      Top = 264
      Width = 45
      Height = 21
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 4
    end
    object btnGrabar: TButton
      Left = 69
      Top = 262
      Width = 84
      Height = 25
      Caption = 'Grabar'
      TabOrder = 5
      OnClick = btnGrabarClick
    end
  end
  object gbProductos: TGroupBox
    Left = 199
    Top = 8
    Width = 562
    Height = 324
    Caption = 'Productos'
    TabOrder = 2
    object lvProductos: TListView
      Left = 12
      Top = 29
      Width = 533
      Height = 276
      Columns = <
        item
          AutoSize = True
          Caption = 'Nombre'
        end
        item
          AutoSize = True
          Caption = 'Descripcion'
        end
        item
          AutoSize = True
          Caption = 'Precio'
        end
        item
          AutoSize = True
          Caption = 'Fecha'
        end
        item
          AutoSize = True
          Caption = 'Proveedor'
        end>
      ReadOnly = True
      RowSelect = True
      PopupMenu = ppOpciones
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lvProductosDblClick
    end
  end
  object mmOpciones: TMainMenu
    Left = 128
    Top = 48
    object O1: TMenuItem
      Caption = 'Opciones'
      object A1: TMenuItem
        Caption = 'Agregar Producto'
        OnClick = A1Click
      end
      object E1: TMenuItem
        Caption = 'Editar Producto'
        OnClick = E1Click
      end
      object E2: TMenuItem
        Caption = 'Eliminar Producto'
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
    Top = 120
    object A2: TMenuItem
      Caption = 'Agregar Producto'
      OnClick = A2Click
    end
    object E3: TMenuItem
      Caption = 'Editar Producto'
      OnClick = E3Click
    end
    object B1: TMenuItem
      Caption = 'Borrar Producto'
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
