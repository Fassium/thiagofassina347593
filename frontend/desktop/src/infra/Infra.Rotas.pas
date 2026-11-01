unit Infra.Rotas;

interface

type
  TRotas = class
  public
    const
      Login    = '/v1/autenticacao/login';
      Refresh  = '/v1/autenticacao/refresh';
      Logout   = '/v1/autenticacao/logout';
      Artistas = '/v1/artistas';
      Albuns   = '/v1/albuns';
  end;

implementation

end.

