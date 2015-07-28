require 'spec_helper'

RSpec.describe Poi, :type => :model do

  it 'has a valid factory' do
    expect(create :poi).to be_valid
  end

  describe 'validations' do
    it 'is invalid without a nome' do
      expect(build :poi, nome: nil).to have(1).errors_on(:nome)
    end

    it 'is invalid with a blank nome' do
      expect(build :poi, nome: '').to have(1).errors_on(:nome)
      expect(build :poi, nome: ' ').to have(1).errors_on(:nome)
    end

    it 'is invalid with a duplicate nome' do
      create :poi, nome: 'ponto1'
      expect(build :poi, nome: 'ponto1').to have(1).errors_on(:nome)
    end

    it 'is invalid without a value' do
      expect(build :poi, x: nil).to have(1).errors_on(:x)
    end

    it 'is invalid with a negative value' do
      expect(build :poi, x: -1.0).to have(1).errors_on(:x)
    end

    it 'is invalid without a value' do
      expect(build :poi, y: nil).to have(1).errors_on(:y)
    end

    it 'is invalid with a negative value' do
      expect(build :poi, y: -1.0).to have(1).errors_on(:y)
    end
  end

  describe 'methods' do
    describe '#calcular_distancia' do
      it 'returns distance' do
        ponto = create(:poi, x: 12, y: 12)
        #sqrt( (12-14)**2 + (12-12)**2 )
        expect(ponto.calcular_distancia(14, 12)).to eq 2
      end
    end

    describe '#listar_pontos_proximidade' do
      it 'returns list of pois' do
        ponto1 = create(:poi, x: 1, y: 1)
        ponto2 = create(:poi, x: 3, y: 3)
        ponto3 = create(:poi, x: 10, y: 10)
        params={x: 1, y: 4, distancia_max: 6}
        pois = Poi.all()
        lista_pois = Poi.listar_pontos_proximidade(params)
        expect(lista_pois.size).to eq 2
        expect(lista_pois.include?(ponto2)).to be_true
        expect(lista_pois.include?(ponto3)).to be_false
      end
    end
  end
end
