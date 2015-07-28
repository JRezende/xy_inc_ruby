require 'spec_helper'

describe HomeController do

  describe 'GET index' do
    it 'populates the list of pois' do
      create :poi
      create :poi
      get :index
      assigns(:pois).length.should == 2
    end
  end
end
