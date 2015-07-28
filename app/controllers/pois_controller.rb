class PoisController < ApplicationController
  before_filter :existe_pois?, only: [:index, :show, :edit, :update, :destroy, :procurar_pontos_proximos, :listar_pontos_proximidade]

  def index
    @pois = Poi.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @poi = Poi.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @poi = Poi.find(params[:id])
  end

  def create
    @poi = Poi.new(params[:poi])

    respond_to do |format|
      if @poi.save
        format.html { redirect_to pois_path, notice: 'Ponto criado com sucesso.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @poi = Poi.find(params[:id])

    respond_to do |format|
      if @poi.update_attributes(params[:poi])
        format.html { redirect_to pois_path, notice: 'Ponto atualizado com sucesso.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @poi = Poi.find(params[:id])
    @poi.destroy

    respond_to do |format|
      format.html { redirect_to pois_url }
    end
  end

  def procurar_pontos_proximos

  end

  def listar_pontos_proximos
    if params
      @pois_proximos = Poi.listar_pontos_proximidade(params)
      respond_to do |format|
        format.html
      end
    else
      render :procurar_pontos_proximos
    end

  end

  private

  def existe_pois?
    @pois = Poi.all
    if @pois.blank?
       redirect_to root_path
    end
  end

end
