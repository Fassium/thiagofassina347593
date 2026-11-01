unit View.Artistas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.WinXPanels;

type
  TFrmArtistas = class(TForm)
    cpnArtistas: TCardPanel;
    crdLista: TCard;
    pnlLista: TPanel;
    pnlFiltro: TPanel;
    edtBusca: TEdit;
    btnBuscar: TButton;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    dbgArtistas: TDBGrid;
    pnlPaginacao: TPanel;
    btnAnterior: TButton;
    lblPagina: TLabel;
    btnProxima: TButton;
    crdFormulario: TCard;
    pnlFormulario: TPanel;
    lblNome: TLabel;
    edtNome: TEdit;
    lblTipo: TLabel;
    cbxTipo: TComboBox;
    btnSalvar: TButton;
    btnCancelar: TButton;
    mtArtistas: TFDMemTable;
    mtArtistasid: TLargeintField;
    mtArtistasnome: TWideStringField;
    mtArtistastipo: TWideStringField;
    mtArtistasquantidadeAlbuns: TIntegerField;
    dsArtistas: TDataSource;
    mtArtista: TFDMemTable;
    mtArtistaid: TLargeintField;
    mtArtistanome: TWideStringField;
    mtArtistatipo: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure edtBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgArtistasDblClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    FBusca: string;
    FPagina: Integer;
    FTotalPaginas: Integer;
    FIdEmEdicao: Int64;
    procedure CarregarLista;
    procedure MostrarFormulario(const AVisivel: Boolean);
  public
    { Public declarations }
  end;

implementation

uses
  System.Math, System.UITypes, Servico.Artistas;

{$R *.dfm}

{ TFrmArtistas }

procedure TFrmArtistas.btnAnteriorClick(Sender: TObject);
begin

  Dec(FPagina);
  CarregarLista;

end;

procedure TFrmArtistas.btnBuscarClick(Sender: TObject);
begin

  FBusca := Trim(edtBusca.Text);
  FPagina := 0;
  CarregarLista;

end;

procedure TFrmArtistas.btnCancelarClick(Sender: TObject);
begin

  MostrarFormulario(False);

end;

procedure TFrmArtistas.btnEditarClick(Sender: TObject);
begin

  if mtArtistas.IsEmpty then
    Exit;

  FIdEmEdicao := mtArtistasid.AsLargeInt;
  TServicoArtistas.BuscarPorId(FIdEmEdicao, mtArtista);

  edtNome.Text := mtArtistanome.AsString;
  cbxTipo.ItemIndex := cbxTipo.Items.IndexOf(mtArtistatipo.AsString);
  MostrarFormulario(True);

end;

procedure TFrmArtistas.btnExcluirClick(Sender: TObject);
begin

  if mtArtistas.IsEmpty then
    Exit;

  if MessageDlg(Format('Excluir o artista "%s"?', [mtArtistasnome.AsString]),
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  TServicoArtistas.Excluir(mtArtistasid.AsLargeInt);
  CarregarLista;

end;

procedure TFrmArtistas.btnNovoClick(Sender: TObject);
begin

  FIdEmEdicao := 0;
  edtNome.Clear;
  cbxTipo.ItemIndex := -1;
  MostrarFormulario(True);

end;

procedure TFrmArtistas.btnProximaClick(Sender: TObject);
begin

  Inc(FPagina);
  CarregarLista;

end;

procedure TFrmArtistas.btnSairClick(Sender: TObject);
begin

  Close;

end;

procedure TFrmArtistas.btnSalvarClick(Sender: TObject);
begin

  if FIdEmEdicao = 0 then
    TServicoArtistas.Criar(edtNome.Text, cbxTipo.Text)
  else
    TServicoArtistas.Editar(FIdEmEdicao, edtNome.Text, cbxTipo.Text);

  MostrarFormulario(False);
  CarregarLista;

end;

procedure TFrmArtistas.CarregarLista;
begin

  TServicoArtistas.Listar(FBusca, FPagina, mtArtistas, FTotalPaginas);

  if (FPagina > 0) and (FPagina >= FTotalPaginas) then
  begin

    Dec(FPagina);
    CarregarLista;
    Exit;

  end;

  lblPagina.Caption := Format('Página %d de %d', [FPagina + 1, Max(FTotalPaginas, 1)]);
  btnAnterior.Enabled := FPagina > 0;
  btnProxima.Enabled := FPagina < FTotalPaginas - 1;
  btnEditar.Enabled := not mtArtistas.IsEmpty;
  btnExcluir.Enabled := not mtArtistas.IsEmpty;

end;

procedure TFrmArtistas.dbgArtistasDblClick(Sender: TObject);
begin

  btnEditar.Click;

end;

procedure TFrmArtistas.edtBuscaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    btnBuscar.Click;

  end;

end;

procedure TFrmArtistas.FormCreate(Sender: TObject);
begin
  CarregarLista;
end;

procedure TFrmArtistas.MostrarFormulario(const AVisivel: Boolean);
begin

  if AVisivel then
  begin

    cpnArtistas.ActiveCard := crdFormulario;
    edtNome.SetFocus;

  end
  else
    cpnArtistas.ActiveCard := crdLista;

end;

end.
