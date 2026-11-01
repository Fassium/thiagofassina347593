unit Servico.Autenticacao;

interface

type
  TServicoAutenticacao = class
  public
    class procedure Entrar(const AEmail, ASenha: string); static;
    class procedure Sair; static;
  end;

implementation

uses
  System.JSON, Infra.Requisicao.Intf, Infra.Requisicao, Infra.Sessao, Infra.Rotas;

{ TServicoAutenticacao }

class procedure TServicoAutenticacao.Entrar(const AEmail, ASenha: string);
var
  LCorpo: TJSONObject;
  LResposta: IResponse;
  LTokens: TJSONObject;
begin

  LCorpo := TJSONObject.Create;
  LCorpo.AddPair('email', AEmail);
  LCorpo.AddPair('senha', ASenha);

  LResposta := TRequisicao.Nova
    .Recurso(Infra.Rotas.TRotas.Login)
    .AdicionarCorpo(LCorpo)
    .Post;

  LTokens := LResposta.JSONValue as TJSONObject;
  TSessao.Iniciar(
    AEmail,
    LTokens.GetValue<string>('accessToken'),
    LTokens.GetValue<string>('refreshToken'));

end;

class procedure TServicoAutenticacao.Sair;
var
  LCorpo : TJSONObject;
begin

  LCorpo := TJSONObject.Create;
  LCorpo.AddPair('refreshToken', TSessao.RefreshToken);

  try
    TRequisicao.Nova
    .Recurso(Infra.Rotas.TRotas.Logout)
    .AdicionarCorpo(LCorpo)
    .Post;
  finally
    TSessao.Encerrar;
  end;

end;

end.

