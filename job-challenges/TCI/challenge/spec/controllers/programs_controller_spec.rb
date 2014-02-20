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

  describe 'GET #edit' do
    it "assigns the requested program to @program" do
      get :edit, id: @program.id
      expect(assigns(:program)).to eq @program
    end

    it "renders the :edit template" do
      get :edit, id: @program.id
      expect(response).to render_template :edit
    end
  end

  describe 'GET #new' do
    it "assigns a new Programs to @program" do
      get :new
      expect(assigns(:program)).to be_a_new(Programs)
    end
    it "renders the :new template" do
      get :new
      expect(response). to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new program in the database" do
        expect{
          post :create, program: attributes_for(:programs)
        }.to change(Programs, :count).by(1)
      end

      it "redirects to programs #show" do
        post :create, program: attributes_for(:programs)
        expect(response).to redirect_to program_path( Programs.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new program in the database" do
        expect{
          post :create,
            program: attributes_for(:programs, code: "123")
        }.to_not change(Programs, :count)
      end

      it "re-renders the :new template" do
        post :create, program: attributes_for(:programs, code: "123")
        expect(response).to render_template :new
      end
    end
  end
end
