require 'spec_helper'

describe ProgramsController do

  before(:each) do
    @program = FactoryGirl.create(:programs)
  end

  describe 'GET #index' do
    it "populates an array of all programs" do
      get :index
      expect(assigns(:programs)).to match_array([@program])
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns the requested program to @program" do
      get :show, id: @program.id
      expect(assigns(:program)).to eq @program
    end

    it "renders the :show template" do
      get :show, id: @program.id
      expect(response).to render_template :show
    end
  end
end
