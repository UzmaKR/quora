require 'spec_helper'

describe AnswersController do

  let!(:answer) { create(:answer) }

  describe "GET #index" do
    it "gets all the answers" do
      get :index
      assigns(:answers).should eq([answer])
    end
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "gets answer according to id" do
      get :show, id: answer
      assigns(:answer).should eq(answer)
    end

    it "renders the answer show template" do
      get :show, id: answer
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns new answer to @answer" do
      get :new
      assigns(:answer).should be_an_instance_of(Answer)
    end
    it "renders the form view" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "should save answer to database" do
        expect {
          post :create, answer: attributes_for(:answer) 
        }.to change(Answer, :count).by(1)
      end
      it "should redirect to answer show profile" do
        post :create, answer: attributes_for(:answer)
        response.should render_template :show
      end
    end

    context "with invalid attributes" do
      it "should not save answer to database" do
        invalid_answer = build(:answer, :answer => "")
        expect {
          post :create, invalid_answer: attributes_for(:answer) 
        }.to_not change(Answer, :count).by(1)
      end
      it "should render the new form again" do
        invalid_answer = build(:answer, :answer => "")
        post :create, invalid_answer: attributes_for(:answer)
        response.should render_template :new
      end
    end
  end

end
