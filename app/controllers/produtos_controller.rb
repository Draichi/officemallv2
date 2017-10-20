class ProdutosController < ApplicationController
  def index
    @produtos_por_nome = Produto.order :nome
    @produtos_por_preco = Produto.order :preco
  end

  def create
    nome = params["nome"]
    preco = params["preco"]
    descricao = params["descricao"]
    quantidade = params["quantidade"]
    valores = params.require(:produto).permit :nome, :descricao, :quantidade, :preco
    produto = Produto.create valores
  end
end
