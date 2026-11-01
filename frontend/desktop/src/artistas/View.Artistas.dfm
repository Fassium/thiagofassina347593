object FrmArtistas: TFrmArtistas
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmArtistas'
  ClientHeight = 480
  ClientWidth = 640
  Color = 15920617
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  StyleElements = [seFont, seBorder]
  OnCreate = FormCreate
  TextHeight = 15
  object cpnArtistas: TCardPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    ActiveCard = crdLista
    BevelOuter = bvNone
    Caption = 'cpnArtistas'
    TabOrder = 0
    object crdLista: TCard
      Left = 0
      Top = 0
      Width = 640
      Height = 480
      Caption = 'crdLista'
      CardIndex = 0
      TabOrder = 0
      object pnlLista: TPanel
        Left = 0
        Top = 0
        Width = 640
        Height = 480
        Align = alClient
        BevelOuter = bvNone
        Padding.Left = 16
        Padding.Top = 16
        Padding.Right = 16
        Padding.Bottom = 16
        ParentBackground = False
        Color = 15920617
        ShowCaption = False
        TabOrder = 0
        StyleElements = [seFont, seBorder]
        object pnlFiltro: TPanel
          Left = 16
          Top = 16
          Width = 608
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          ShowCaption = False
          TabOrder = 0
          StyleElements = [seFont, seBorder]
          DesignSize = (
            608
            41)
          object edtBusca: TEdit
            OnKeyPress = edtBuscaKeyPress
            Left = 0
            Top = 8
            Width = 200
            Height = 23
            TabOrder = 0
            TextHint = 'Buscar por nome'
          end
          object btnBuscar: TButton
            OnClick = btnBuscarClick
            Left = 206
            Top = 7
            Width = 90
            Height = 25
            Caption = 'Buscar'
            TabOrder = 1
          end
          object btnNovo: TButton
            OnClick = btnNovoClick
            Left = 326
            Top = 7
            Width = 90
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Novo'
            TabOrder = 2
          end
          object btnEditar: TButton
            OnClick = btnEditarClick
            Left = 422
            Top = 7
            Width = 90
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Editar'
            TabOrder = 3
          end
          object btnExcluir: TButton
            OnClick = btnExcluirClick
            Left = 518
            Top = 7
            Width = 90
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Excluir'
            TabOrder = 4
          end
        end
        object dbgArtistas: TDBGrid
          OnDblClick = dbgArtistasDblClick
          Left = 16
          Top = 57
          Width = 608
          Height = 366
          Align = alClient
          DataSource = dsArtistas
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
        object pnlPaginacao: TPanel
          Left = 16
          Top = 423
          Width = 608
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
            OnClick = btnAnteriorClick
            Left = 0
            Top = 8
            Width = 90
            Height = 25
            Caption = 'Anterior'
            TabOrder = 0
          end
          object btnProxima: TButton
            OnClick = btnProximaClick
            Left = 200
            Top = 8
            Width = 90
            Height = 25
            Caption = 'Pr'#243'xima'
            TabOrder = 1
          end
        end
      end
    end
    object crdFormulario: TCard
      Left = 0
      Top = 0
      Width = 640
      Height = 480
      Caption = 'crdFormulario'
      CardIndex = 1
      TabOrder = 1
      object pnlFormulario: TPanel
        Left = 0
        Top = 0
        Width = 640
        Height = 480
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        Color = 15920617
        ShowCaption = False
        TabOrder = 0
        StyleElements = [seFont, seBorder]
        object lblNome: TLabel
          Left = 16
          Top = 16
          Width = 33
          Height = 15
          Caption = 'Nome'
        end
        object lblTipo: TLabel
          Left = 16
          Top = 74
          Width = 24
          Height = 15
          Caption = 'Tipo'
        end
        object edtNome: TEdit
          Left = 16
          Top = 37
          Width = 400
          Height = 23
          MaxLength = 200
          TabOrder = 0
        end
        object cbxTipo: TComboBox
          Left = 16
          Top = 95
          Width = 160
          Height = 23
          Style = csDropDownList
          TabOrder = 1
          Items.Strings = (
            'CANTOR'
            'BANDA')
        end
        object btnSalvar: TButton
          OnClick = btnSalvarClick
          Left = 16
          Top = 140
          Width = 90
          Height = 25
          Caption = 'Salvar'
          TabOrder = 2
        end
        object btnCancelar: TButton
          OnClick = btnCancelarClick
          Left = 112
          Top = 140
          Width = 90
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 3
        end
      end
    end
  end
  object mtArtistas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 456
    Top = 168
    object mtArtistasid: TLargeintField
      FieldName = 'id'
      Visible = False
    end
    object mtArtistasnome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'nome'
      Size = 200
    end
    object mtArtistastipo: TWideStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 12
      FieldName = 'tipo'
      Size = 10
    end
    object mtArtistasquantidadeAlbuns: TIntegerField
      DisplayLabel = #193'lbuns'
      DisplayWidth = 10
      FieldName = 'quantidadeAlbuns'
    end
  end
  object dsArtistas: TDataSource
    DataSet = mtArtistas
    Left = 456
    Top = 232
  end
  object mtArtista: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 552
    Top = 168
    object mtArtistaid: TLargeintField
      FieldName = 'id'
    end
    object mtArtistanome: TWideStringField
      FieldName = 'nome'
      Size = 200
    end
    object mtArtistatipo: TWideStringField
      FieldName = 'tipo'
      Size = 10
    end
  end
end
