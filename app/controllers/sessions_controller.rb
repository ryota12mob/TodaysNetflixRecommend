#sesssion_controller.rb
class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
      logout
      redirect_to welcome_path
  end
end