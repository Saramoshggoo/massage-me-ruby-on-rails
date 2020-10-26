class SessionController < ApplicationController
   before_action :logged_in_redirect, only:[:new,:create]
  def new
  end
  def login
    user=User.find_by(username:params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id]=user.id
      flash[:success]="you have sucessfually logged in"
      redirect_to root_path
    else
      flash[:error]="there was something wrong with your login information "
      render "new"
    end
  end 

  def destroy
    session[:user_id]=nil
     flash[:success]="you have sucessfully logged out"
    redirect_to login_path
  end

  private
  def logged_in_redirect
    if logged_in?
      flash[:error]="you are already login"
      redirect_to root_path
    end
  end
end
