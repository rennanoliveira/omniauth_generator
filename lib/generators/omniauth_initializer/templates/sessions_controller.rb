class SessionsController < ApplicationController
  #The callback from logging in with facebook or twitter will hit this action.
  #All logic for what you will do with the omniauth response hash goes here.
  def create
    #@user = User.find_or_create_from_auth_hash(auth_hash)
    #self.current_user = @user
    #redirect_to '/'
  end

  protected

  #This auth_hash contains the response from the requested provider (facebook, twitter, etc)
  def auth_hash
    request.env['omniauth.auth']
  end
end