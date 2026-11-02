inherited FrmArtistas: TFrmArtistas
  Caption = 'FrmArtistas'
  TextHeight = 15
  inherited cpnCadastro: TCardPanel
    inherited crdLista: TCard
      inherited pnlLista: TPanel
        inherited pnlFiltro: TPanel
          inherited edtBusca: TEdit
            TextHint = 'Buscar por nome'
          end
        end
      end
    end
    inherited crdFormulario: TCard
      inherited pnlFormulario: TPanel
        inherited pnlCampos: TPanel
          object lblNome: TLabel
            Left = 0
            Top = 0
            Width = 33
            Height = 15
            Caption = 'Nome'
          end
          object lblTipo: TLabel
            Left = 0
            Top = 58
            Width = 24
            Height = 15
            Caption = 'Tipo'
          end
          object edtNome: TEdit
            Left = 0
            Top = 21
            Width = 400
            Height = 23
            MaxLength = 200
            TabOrder = 0
          end
          object cbxTipo: TComboBox
            Left = 0
            Top = 79
            Width = 160
            Height = 23
            Style = csDropDownList
            TabOrder = 1
            Items.Strings = (
              'CANTOR'
              'BANDA')
          end
        end
      end
    end
  end
  inherited mtLista: TFDMemTable
    object mtListanome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'nome'
      Size = 200
    end
    object mtListatipo: TWideStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 12
      FieldName = 'tipo'
      Size = 10
    end
    object mtListaquantidadeAlbuns: TIntegerField
      DisplayLabel = #193'lbuns'
      DisplayWidth = 10
      FieldName = 'quantidadeAlbuns'
    end
  end
  inherited mtRegistro: TFDMemTable
    object mtRegistronome: TWideStringField
      FieldName = 'nome'
      Size = 200
    end
    object mtRegistrotipo: TWideStringField
      FieldName = 'tipo'
      Size = 10
    end
  end
end
