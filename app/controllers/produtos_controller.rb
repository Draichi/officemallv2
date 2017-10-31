class ProdutosController < ApplicationController

  before_action :set_produto, only: [:edit, :update, :destroy]

  def index
    @produtos_por_nome = Produto.order :nome
    @produtos_por_preco = Produto.order :preco
  end

  def new
    @produto = Produto.new
    render_view :new
  end

  def create
    @produto = Produto.new produto_params
    @departamentos = Departamento.all
    if @produto.save
      flash[:notice] = "Produto adicionado"
      redirect_to root_url
    else
      render_view :new
    end
  end

  def destroy
    @produto.destroy
    redirect_to root_url
  end

  def busca
    @nome_buscado = params[:nome]
    @produtos = Produto.where "nome like ?", "%#{@nome_buscado}%"
  end

  def edit
    id = params[:id]
    @produto = Produto.find(id)
    render_view :edit
  end

  def update
    id = params[:id]
    @produto = Produto.find(id)
    @departamentos = Departamento.all
    if @produto.update produto_params
      flash[:notice] = "Atualizado"
      redirect_to root_url
    else
      render_view :edit
    end
  end


  private

  def render_view(view)
    @departamentos = Departamento.all
    render view
  end

  def set_produto
    id = params[:id]
    @produto = Produto.all
  end

  def produto_params
    params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
  end
end
