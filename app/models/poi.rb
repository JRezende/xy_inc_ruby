class Poi < ActiveRecord::Base
  attr_accessible :x, :y, :nome

  validates :nome, :x, :y, :presence => true
  validates :nome, uniqueness: true
  validates :x,:y, :numericality => { :greater_than_or_equal_to => 0 }, :allow_blank => true

  def calcular_distancia(x, y)
    Math.sqrt((self.x-x)**2 + (self.y-y)**2).to_i
  end

  def self.listar_pontos_proximidade(params)
    coord_x =params[:x].to_i
    coord_y =params[:y].to_i
    distancia_maxima = params[:distancia_max].to_f
    lista_pontos = []
    Poi.all.each{ |ponto|
      distancia_entre_pontos = ponto.calcular_distancia(coord_x,coord_y)
      if distancia_entre_pontos <= distancia_maxima
        lista_pontos << ponto
      end
    }
    return lista_pontos
  end
end
