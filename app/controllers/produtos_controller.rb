class ProdutosController < ApplicationController
  def index
    @produtos_por_nome = Produto.order :nome
    @produtos_por_preco = Produto.order :preco
  end

  def new
    @produto = Produto.new
    @departamentos = Departamento.all
  end

  def create
    nome = params["nome"]
    preco = params["preco"]
    descricao = params["descricao"]
    quantidade = params["quantidade"]
    valores = params.require(:produto).permit :nome, :descricao, :quantidade, :preco, :departamento_id
    @produto = Produto.new valores
    if @produto.save
      flash[:notice] = "Produto adicionado"
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    id = params[:id]
    Produto.destroy id
    redirect_to root_url
  end

  def busca
    @nome_buscado = params[:nome]
    @produtos = Produto.where "nome like ?", "%#{@nome_buscado}%"
  end
end
