program Catalogo;

uses
  Vcl.Forms,
  View.Principal in 'src\principal\View.Principal.pas' {FrmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  System.UITypes,
  DataSet.Serialize.Config,
  View.Login in 'src\autenticacao\View.Login.pas' {FrmLogin},
  Infra.Configuracao in 'src\infra\Infra.Configuracao.pas',
  Infra.Sessao in 'src\infra\Infra.Sessao.pas',
  Infra.Requisicao.Intf in 'src\infra\Infra.Requisicao.Intf.pas',
  Infra.Requisicao in 'src\infra\Infra.Requisicao.pas',
  Infra.Erros in 'src\infra\Infra.Erros.pas',
  Servico.Autenticacao in 'src\autenticacao\Servico.Autenticacao.pas',
  Infra.Rotas in 'src\infra\Infra.Rotas.pas',
  Servico.Artistas in 'src\artistas\Servico.Artistas.pas',
  View.Artistas in 'src\artistas\View.Artistas.pas' {FrmArtistas},
  View.Albuns in 'src\albuns\View.Albuns.pas' {FrmAlbuns},
  View.Base in 'src\comum\View.Base.pas' {FrmBase},
  View.Base.Cadastro in 'src\comum\View.Base.Cadastro.pas' {FrmBaseCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  TDataSetSerializeConfig.GetInstance.Import.ImportOnlyFieldsVisible := False;
  FrmLogin := TFrmLogin.Create(nil);
  try
    if FrmLogin.ShowModal <> mrOk then
      Exit;
  finally
    FrmLogin.Free;
  end;

  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
