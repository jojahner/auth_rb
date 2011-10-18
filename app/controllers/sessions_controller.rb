class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = login(params[:login], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url
    else
      flash.now.alert = "Login or password was invalid"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url
  end
end
