unit View.Base.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.WinXPanels,
  View.Base;

type
  TFrmBaseCadastro = class(TFrmBase)
    cpnCadastro: TCardPanel;
    crdLista: TCard;
    pnlLista: TPanel;
    pnlFiltro: TPanel;
    edtBusca: TEdit;
    btnBuscar: TButton;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    dbgLista: TDBGrid;
    pnlPaginacao: TPanel;
    btnAnterior: TButton;
    lblPagina: TLabel;
    btnProxima: TButton;
    crdFormulario: TCard;
    pnlFormulario: TPanel;
    pnlCampos: TPanel;
    pnlBotoesFormulario: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    mtLista: TFDMemTable;
    mtListaid: TLargeintField;
    dsLista: TDataSource;
    mtRegistro: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure edtBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dbgListaDblClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FBusca: string;
    FPagina: Integer;
    FTotalPaginas: Integer;
    FIdEmEdicao: Int64;
    procedure CarregarLista;
    procedure MostrarFormulario(const AVisivel: Boolean);
    function IdSelecionado: Int64;
  protected
    procedure Listar(const ABusca: string; const APagina: Integer; out ATotalPaginas: Integer); virtual; abstract;
    procedure CarregarRegistro(const AId: Int64); virtual; abstract;
    procedure LimparCampos; virtual; abstract;
    procedure Salvar(const AId: Int64); virtual; abstract;
    procedure Excluir(const AId: Int64); virtual; abstract;
    function DescricaoRegistroSelecionado: string; virtual; abstract;
  public
    { Public declarations }
  end;

implementation

uses
  System.Math, System.UITypes;

{$R *.dfm}

{ TFrmBaseCadastro }

procedure TFrmBaseCadastro.btnAnteriorClick(Sender: TObject);
begin

  Dec(FPagina);
  CarregarLista;

end;

procedure TFrmBaseCadastro.btnBuscarClick(Sender: TObject);
begin

  FBusca := Trim(edtBusca.Text);
  FPagina := 0;
  CarregarLista;

end;

procedure TFrmBaseCadastro.btnCancelarClick(Sender: TObject);
begin

  MostrarFormulario(False);

end;

procedure TFrmBaseCadastro.btnEditarClick(Sender: TObject);
begin

  if mtLista.IsEmpty then
    Exit;

  FIdEmEdicao := IdSelecionado;
  CarregarRegistro(FIdEmEdicao);
  MostrarFormulario(True);

end;

procedure TFrmBaseCadastro.btnExcluirClick(Sender: TObject);
begin

  if mtLista.IsEmpty then
    Exit;

  if MessageDlg(Format('Excluir %s?', [DescricaoRegistroSelecionado]),
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  Excluir(IdSelecionado);
  CarregarLista;

end;

procedure TFrmBaseCadastro.btnNovoClick(Sender: TObject);
begin

  FIdEmEdicao := 0;
  LimparCampos;
  MostrarFormulario(True);

end;

procedure TFrmBaseCadastro.btnProximaClick(Sender: TObject);
begin

  Inc(FPagina);
  CarregarLista;

end;

procedure TFrmBaseCadastro.btnSairClick(Sender: TObject);
begin

  Close;

end;

procedure TFrmBaseCadastro.btnSalvarClick(Sender: TObject);
begin

  Salvar(FIdEmEdicao);
  MostrarFormulario(False);
  CarregarLista;

end;

procedure TFrmBaseCadastro.CarregarLista;
begin

  Listar(FBusca, FPagina, FTotalPaginas);

  if (FPagina > 0) and (FPagina >= FTotalPaginas) then
  begin

    Dec(FPagina);
    CarregarLista;
    Exit;

  end;

  lblPagina.Caption := Format('Página %d de %d', [FPagina + 1, Max(FTotalPaginas, 1)]);
  btnAnterior.Enabled := FPagina > 0;
  btnProxima.Enabled := FPagina < FTotalPaginas - 1;
  btnEditar.Enabled := not mtLista.IsEmpty;
  btnExcluir.Enabled := not mtLista.IsEmpty;

end;

procedure TFrmBaseCadastro.dbgListaDblClick(Sender: TObject);
begin

  btnEditar.Click;

end;

procedure TFrmBaseCadastro.edtBuscaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    btnBuscar.Click;

  end;

end;

procedure TFrmBaseCadastro.FormCreate(Sender: TObject);
begin

  CarregarLista;

end;

function TFrmBaseCadastro.IdSelecionado: Int64;
begin

  Result := mtListaid.AsLargeInt;

end;

procedure TFrmBaseCadastro.MostrarFormulario(const AVisivel: Boolean);
begin

  if AVisivel then
  begin

    cpnCadastro.ActiveCard := crdFormulario;
    SelectNext(pnlCampos, True, True);

  end
  else
    cpnCadastro.ActiveCard := crdLista;

end;

end.
