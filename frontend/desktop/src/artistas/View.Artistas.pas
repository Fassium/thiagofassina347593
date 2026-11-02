unit View.Artistas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.WinXPanels,
  View.Base.Cadastro;

type
  TFrmArtistas = class(TFrmBaseCadastro)
    mtListanome: TWideStringField;
    mtListatipo: TWideStringField;
    mtListaquantidadeAlbuns: TIntegerField;
    lblNome: TLabel;
    edtNome: TEdit;
    lblTipo: TLabel;
    cbxTipo: TComboBox;
    mtRegistronome: TWideStringField;
    mtRegistrotipo: TWideStringField;
  private
    { Private declarations }
  protected
    procedure Listar(const ABusca: string; const APagina: Integer; out ATotalPaginas: Integer); override;
    procedure CarregarRegistro(const AId: Int64); override;
    procedure LimparCampos; override;
    procedure Salvar(const AId: Int64); override;
    procedure Excluir(const AId: Int64); override;
    function DescricaoRegistroSelecionado: string; override;
  public
    { Public declarations }
  end;

implementation

uses
  Servico.Artistas;

{$R *.dfm}

{ TFrmArtistas }

procedure TFrmArtistas.CarregarRegistro(const AId: Int64);
begin

  TServicoArtistas.BuscarPorId(AId, mtRegistro);

  edtNome.Text := mtRegistronome.AsString;
  cbxTipo.ItemIndex := cbxTipo.Items.IndexOf(mtRegistrotipo.AsString);

end;

function TFrmArtistas.DescricaoRegistroSelecionado: string;
begin

  Result := Format('o artista "%s"', [mtListanome.AsString]);

end;

procedure TFrmArtistas.Excluir(const AId: Int64);
begin

  TServicoArtistas.Excluir(AId);

end;

procedure TFrmArtistas.LimparCampos;
begin

  edtNome.Clear;
  cbxTipo.ItemIndex := -1;

end;

procedure TFrmArtistas.Listar(const ABusca: string; const APagina: Integer; out ATotalPaginas: Integer);
begin

  TServicoArtistas.Listar(ABusca, APagina, mtLista, ATotalPaginas);

end;

procedure TFrmArtistas.Salvar(const AId: Int64);
begin

  if AId = 0 then
    TServicoArtistas.Criar(edtNome.Text, cbxTipo.Text)
  else
    TServicoArtistas.Editar(AId, edtNome.Text, cbxTipo.Text);

end;

end.
