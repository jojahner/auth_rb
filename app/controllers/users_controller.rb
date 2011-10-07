class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.where(username: params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
