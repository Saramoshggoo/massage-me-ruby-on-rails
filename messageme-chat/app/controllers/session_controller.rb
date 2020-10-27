class SessionController < ApplicationController
   before_action :logged_in_redirect, only:[:new,:create]
  def new
  end
  def signup
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
  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the  you have successfully signed up"
      redirect_to root_path
    else
      flash[:error] = "your password wasnt match"
      render 'signup'
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
  

  def user_params
    params.require(:user).permit(:username ,:password,:password_confirmation)
  end
end
