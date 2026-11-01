unit Servico.Artistas;

interface

uses
  System.JSON, FireDAC.Comp.Client;

type
  TServicoArtistas = class
  private
    class function MontarCorpo(const ANome, ATipo: string): TJSONObject; static;
  public
    class procedure Listar(const ANome: string; const APagina: Integer;
      const ADestino: TFDMemTable; out ATotalPaginas: Integer); static;
    class procedure BuscarPorId(const AId: Int64; const ADestino: TFDMemTable); static;
    class procedure Criar(const ANome, ATipo: string); static;
    class procedure Editar(const AId: Int64; const ANome, ATipo: string); static;
    class procedure Excluir(const AId: Int64); static;
  end;

implementation

uses
  System.SysUtils, DataSet.Serialize, Infra.Requisicao.Intf, Infra.Requisicao, Infra.Rotas;

{ TServicoArtistas }

class procedure TServicoArtistas.BuscarPorId(const AId: Int64;
  const ADestino: TFDMemTable);
var
  LResposta: IResponse;
begin

  LResposta := TRequisicao.Nova
    .Recurso(TRotas.Artistas + '/' + AId.ToString)
    .Get;

  ADestino.Close;
  ADestino.LoadFromJSON(LResposta.JSONValue as TJSONObject, False);

end;

class procedure TServicoArtistas.Criar(const ANome, ATipo: string);
begin

  TRequisicao.Nova
    .Recurso(TRotas.Artistas)
    .AdicionarCorpo(MontarCorpo(ANome, ATipo))
    .Post;

end;

class procedure TServicoArtistas.Editar(const AId: Int64; const ANome,
  ATipo: string);
begin

  TRequisicao.Nova
    .Recurso(TRotas.Artistas + '/' + AId.ToString)
    .AdicionarCorpo(MontarCorpo(ANome, ATipo))
    .Put;

end;

class procedure TServicoArtistas.Excluir(const AId: Int64);
begin

  TRequisicao.Nova
    .Recurso(TRotas.Artistas + '/' + AId.ToString)
    .Delete;

end;

class procedure TServicoArtistas.Listar(const ANome: string;
  const APagina: Integer; const ADestino: TFDMemTable;
  out ATotalPaginas: Integer);
var
  LResposta: IResponse;
  LResultado: TJSONObject;
begin

  LResposta := TRequisicao.Nova
    .Recurso(TRotas.Artistas)
    .AdicionarParametro('nome', ANome)
    .AdicionarParametro('page', APagina.ToString)
    .Get;

  LResultado := LResposta.JSONValue as TJSONObject;

  ADestino.Close;
  ADestino.LoadFromJSON(LResultado, 'content', False);

  ATotalPaginas := LResultado.GetValue<Integer>('page.totalPages');

end;

class function TServicoArtistas.MontarCorpo(const ANome,
  ATipo: string): TJSONObject;
begin

  Result := TJSONObject.Create;
  Result.AddPair('nome', ANome);
  Result.AddPair('tipo', ATipo);

end;

end.

