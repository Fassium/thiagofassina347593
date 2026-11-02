inherited FrmBaseCadastro: TFrmBaseCadastro
  Caption = 'FrmBaseCadastro'
  ClientHeight = 640
  ClientWidth = 800
  OnCreate = FormCreate
  ExplicitWidth = 800
  ExplicitHeight = 640
  TextHeight = 15
  object cpnCadastro: TCardPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 640
    Align = alClient
    ActiveCard = crdLista
    BevelOuter = bvNone
    Caption = 'cpnCadastro'
    TabOrder = 0
    object crdLista: TCard
      Left = 0
      Top = 0
      Width = 800
      Height = 640
      Caption = 'crdLista'
      CardIndex = 0
      TabOrder = 0
      object pnlLista: TPanel
        Left = 0
        Top = 0
        Width = 800
        Height = 640
        Align = alClient
        BevelOuter = bvNone
        Color = 15920617
        Padding.Left = 16
        Padding.Top = 16
        Padding.Right = 16
        Padding.Bottom = 16
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        StyleElements = [seFont, seBorder]
        object pnlFiltro: TPanel
          Left = 16
          Top = 16
          Width = 768
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          ShowCaption = False
          TabOrder = 0
          StyleElements = [seFont, seBorder]
          ExplicitWidth = 608
          DesignSize = (
            768
            41)
          object edtBusca: TEdit
            Left = 0
            Top = 8
            Width = 300
            Height = 23
            TabOrder = 0
            TextHint = 'Buscar'
            OnKeyPress = edtBuscaKeyPress
          end
          object btnBuscar: TButton
            Left = 304
            Top = 7
            Width = 80
            Height = 25
            Caption = 'Buscar'
            TabOrder = 1
            OnClick = btnBuscarClick
          end
          object btnNovo: TButton
            Left = 436
            Top = 7
            Width = 80
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Novo'
            TabOrder = 2
            OnClick = btnNovoClick
          end
          object btnEditar: TButton
            Left = 520
            Top = 7
            Width = 80
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Editar'
            TabOrder = 3
            OnClick = btnEditarClick
          end
          object btnExcluir: TButton
            Left = 604
            Top = 7
            Width = 80
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Excluir'
            TabOrder = 4
            OnClick = btnExcluirClick
          end
          object btnSair: TButton
            Left = 688
            Top = 7
            Width = 80
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Sair'
            TabOrder = 5
            OnClick = btnSairClick
          end
        end
        object dbgLista: TDBGrid
          Left = 16
          Top = 57
          Width = 768
          Height = 526
          Align = alClient
          DataSource = dsLista
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDblClick = dbgListaDblClick
        end
        object pnlPaginacao: TPanel
          Left = 16
          Top = 583
          Width = 768
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          ShowCaption = False
          TabOrder = 2
          StyleElements = [seFont, seBorder]
          object lblPagina: TLabel
            Left = 100
            Top = 12
            Width = 70
            Height = 15
            Caption = 'P'#225'gina 1 de 1'
          end
          object btnAnterior: TButton
            Left = 0
            Top = 8
            Width = 90
            Height = 25
            Caption = 'Anterior'
            TabOrder = 0
            OnClick = btnAnteriorClick
          end
          object btnProxima: TButton
            Left = 200
            Top = 8
            Width = 90
            Height = 25
            Caption = 'Pr'#243'xima'
            TabOrder = 1
            OnClick = btnProximaClick
          end
        end
      end
    end
    object crdFormulario: TCard
      Left = 0
      Top = 0
      Width = 800
      Height = 640
      Caption = 'crdFormulario'
      CardIndex = 1
      TabOrder = 1
      object pnlFormulario: TPanel
        Left = 0
        Top = 0
        Width = 800
        Height = 640
        Align = alClient
        BevelOuter = bvNone
        Color = 15920617
        Padding.Left = 16
        Padding.Top = 16
        Padding.Right = 16
        Padding.Bottom = 16
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        StyleElements = [seFont, seBorder]
        object pnlCampos: TPanel
          Left = 16
          Top = 16
          Width = 768
          Height = 567
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          ShowCaption = False
          TabOrder = 0
          StyleElements = [seFont, seBorder]
        end
        object pnlBotoesFormulario: TPanel
          Left = 16
          Top = 583
          Width = 768
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          ShowCaption = False
          TabOrder = 1
          StyleElements = [seFont, seBorder]
          object btnSalvar: TButton
            Left = 0
            Top = 8
            Width = 90
            Height = 25
            Caption = 'Salvar'
            TabOrder = 0
            OnClick = btnSalvarClick
          end
          object btnCancelar: TButton
            Left = 96
            Top = 8
            Width = 90
            Height = 25
            Caption = 'Cancelar'
            TabOrder = 1
            OnClick = btnCancelarClick
          end
        end
      end
    end
  end
  object mtLista: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 456
    Top = 168
    object mtListaid: TLargeintField
      FieldName = 'id'
      Visible = False
    end
  end
  object dsLista: TDataSource
    DataSet = mtLista
    Left = 456
    Top = 232
  end
  object mtRegistro: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 552
    Top = 168
  end
end
