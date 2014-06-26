class SessionsController < ApplicationController

  protect_from_forgery except: :create

  def create
    auth = request.env["omniauth.auth"]
    session[:user_info] = auth["info"]
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_info] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end
