require 'spec_helper'

describe UsersController do

  describe "get #NEW" do
    
    it "should assign a new user as @new" do
      get :new
      assigns(:user).should be_an_instance_of(User)
    end
    
    it "should render the :new view" do
      get :new
      response.should render_template :new
    end
  end

  describe "get #SHOW" do

    let(:user) { create(:user) }

    it "should assign the requested user as user" do
      get :show, :id => user
      assigns(:user).should eq(user)
    end

    it "should render the show template" do
      get :show, :id => user
      response.should render_template :show
    end


  end

  describe "get #EDIT" do
    let(:user) { create(:user) }

    it "should render a edit user view" do
      get :edit, :id => user
      response.should render_template :edit
    end

    it "should assign the user to @user" do
      get :edit, :id => user
      assigns(:user).should eq user   
    end
  end

end
