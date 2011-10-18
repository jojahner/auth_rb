require 'spec_helper'

describe UsersController do
  before(:each) do
    @user = Factory.create(:user)
    login_user @user
  end
  
  describe "GET index" do
    it "assigns all users as @users" do
      get :index
      assigns(:users).should eq([@user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = Factory.create(:user)
      get :show, :id => user.to_param.to_s
      assigns(:user).should eq(user)
    end
  end

end
