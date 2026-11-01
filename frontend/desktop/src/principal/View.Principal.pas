unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.WinXCtrls;

type
  TFrmPrincipal = class(TForm)
    pnlTopo: TPanel;
    lblMenu: TLabel;
    lblTitulo: TLabel;
    lblUsuario: TLabel;
    lblIconeUsuario: TLabel;
    svMenu: TSplitView;
    btnInicio: TSpeedButton;
    btnArtistas: TSpeedButton;
    btnAlbuns: TSpeedButton;
    btnSair: TSpeedButton;
    pnlConteudo: TPanel;
    pnlCartao: TPanel;
    lblBemVindo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lblMenuClick(Sender: TObject);
    procedure btnInicioClick(Sender: TObject);
    procedure btnArtistasClick(Sender: TObject);
    procedure btnAlbunsClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FTelaAtual: TForm;
    procedure SelecionarModulo(const ATitulo: string);
    procedure AbrirTela(const AClasse: TFormClass);
    procedure FecharTela;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses Infra.Sessao, Servico.Autenticacao, View.Artistas;

{$R *.dfm}

// Mostra o nome do módulo ativo na barra do topo, ao lado do menu.
procedure TFrmPrincipal.SelecionarModulo(const ATitulo: string);
begin
  lblTitulo.Caption := ATitulo;
end;

// Fecha a tela atual e abre a nova dentro do cartão, sem borda, ocupando todo o espaço.
procedure TFrmPrincipal.AbrirTela(const AClasse: TFormClass);
begin

  FecharTela;

  FTelaAtual := AClasse.Create(Self);
  FTelaAtual.Parent := pnlCartao;
  FTelaAtual.Align := alClient;
  FTelaAtual.Show;

  lblBemVindo.Visible := False;

end;

procedure TFrmPrincipal.FecharTela;
begin

  FreeAndNil(FTelaAtual);
  lblBemVindo.Visible := True;

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if TSessao.Ativa then
    TServicoAutenticacao.Sair;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MessageDlg('Deseja sair do sistema?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  btnInicio.Click;
  lblUsuario.Caption := TSessao.Email;
end;

procedure TFrmPrincipal.btnInicioClick(Sender: TObject);
begin
  SelecionarModulo(btnInicio.Caption);
  FecharTela;
end;

procedure TFrmPrincipal.btnArtistasClick(Sender: TObject);
begin
  SelecionarModulo(btnArtistas.Caption);
  AbrirTela(TFrmArtistas);
end;

procedure TFrmPrincipal.btnAlbunsClick(Sender: TObject);
begin
  SelecionarModulo(btnAlbuns.Caption);
  FecharTela;
end;

procedure TFrmPrincipal.lblMenuClick(Sender: TObject);
begin
  svMenu.Opened := not svMenu.Opened;
end;

procedure TFrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
