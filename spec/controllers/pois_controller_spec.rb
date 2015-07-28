require 'spec_helper'

describe PoisController do

  # This should return the minimal set of attributes required to create a valid
  # Poi. As you add validations to Poi, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {"nome" => "Ponto", "x" => 10, "y" => 10} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PoisController. Be sure to keep this updated too.
  #let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all pois as @pois" do
      poi = Poi.create! valid_attributes
      get :index, {}
      assigns(:pois).should eq([poi])
    end
  end

  describe "GET new" do
    it "assigns a new poi as @poi" do
      get :new, {}
      assigns(:poi).should be_a_new(Poi)
    end
  end

  describe "GET edit" do
    it "assigns the requested poi as @poi" do
      poi = Poi.create! valid_attributes
      get :edit, {:id => poi.to_param}
      assigns(:poi).should eq(poi)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Poi" do
        expect {
          post :create, {:poi => valid_attributes}
        }.to change(Poi, :count).by(1)
      end

      it "assigns a newly created poi as @poi" do
        post :create, {:poi => valid_attributes}
        assigns(:poi).should be_a(Poi)
        assigns(:poi).should be_persisted
      end

      it "redirects to the created poi" do
        post :create, {:poi => valid_attributes}
        response.should redirect_to pois_url
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested poi" do
        poi = Poi.create! valid_attributes
        Poi.any_instance.should_receive(:update_attributes).with({"nome" => "Ponto1"})
        put :update, {:id => poi.to_param, :poi => {"nome" => "Ponto1"}}
      end

      it "assigns the requested poi as @poi" do
        poi = Poi.create! valid_attributes
        put :update, {:id => poi.to_param, :poi => valid_attributes}
        assigns(:poi).should eq(poi)
      end

      it "redirects to the poi" do
        poi = Poi.create! valid_attributes
        put :update, {:id => poi.to_param, :poi => valid_attributes}
        response.should redirect_to pois_url
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested poi" do
      poi = Poi.create! valid_attributes
      expect {
        delete :destroy, {:id => poi.to_param}
      }.to change(Poi, :count).by(-1)
    end

    it "redirects to the pois list" do
      poi = Poi.create! valid_attributes
      delete :destroy, {:id => poi.to_param}
      response.should redirect_to(pois_url)
    end
  end

end
