require 'spec_helper'

describe AuthController do
  describe "#authorize" do
    before(:each) do
      sign_in Factory.create(:user)
      get :authorize, :redirect_uri => "http://example.com/callback"
    end
    
    it "redirects to redirect_uri" do
      response.should redirect_to("http://example.com/callback")
    end
  end
  
  describe "#access_token" do
    before(:each) do
      get :access_token
    end
    
    it "responds successfuly" do
      response.should be_success
    end
    
    it "response with json"
  end
  
  describe "#user" do
    before(:each) do
      @user = Factory.create(:user)
      sign_in @user
      @expected = {
        :provider => 'homi_id',
        :id       => @user.id,
        :username => @user.username,
        :email    => @user.email,
        :admin    => @user.admin?
      }.to_json
      get :user
    end
    
    it "responds with the current_user as json" do
      response.body.should == @expected   
    end    
  end
end
