class AuthController < ApplicationController
  before_filter :require_login, :except => [:access_token]
  skip_before_filter :verify_authenticity_token, :only => [:access_token]
  
  def authorize
    redirect_to params[:redirect_uri]
  end
  
  def access_token
    hash = {
      # token generieren und speichern (user, application) => tokens
      
      :access_token  => "#{SecureRandom.hex(16)}", 
      :refresh_token => "#{SecureRandom.hex(16)}", 
      :expires_in    => 10
    }
    render :json => hash.to_json
  end
  
  def user
    hash = {
      :provider => 'homi_id',
      :id       => current_user.id,
      :username => current_user.username,
      :email    => current_user.email,
      :admin    => current_user.admin?
    }

    render :json => hash.to_json
  end
end
