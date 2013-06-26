require 'spec_helper'

describe QuestionsController do

  let!(:question) { create(:question) }

  describe "GET #index" do
    it "gets all the questions" do
      get :index
      assigns(:questions).should eq([question])
    end
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested question to @question" do
      get :show, id: question
      assigns(:question).should eq(question)
    end

    it "renders the #show view" do
      get :show, id: question
      response.should render_template :show
    end
  end

  describe "GET #new" do

    it "should assign a new question to @question" do
      get :new
      assigns(:question).should be_an_instance_of(Question)
    end
    it "renders the form for the question" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "saves the question object to the database" do
        expect{
          post :create, question: attributes_for(:question)
        }.to change(Question, :count).by(1)
      end
    end

      it "redirects to the new question" do
        post :create, question: attributes_for(:question)
        response.should render_template :show
      end
  end



end
