class SessionsController < ApplicationController
  before_action:logged_in_redirect,only:[:new,:create]

  def new
    
  end
  def create
       user=User.find_by(username:params[:session][:username])
        if user && user.authenticate(params[:session][:password])
              session[:user_id]=user.id
              #success is class in semantic
              flash[:success]="you have sucessfully login "
              redirect_to root_path
        else
          flash.now[:error] = "there was something wrong with your login information"
          render 'new'
      end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to login_path
  end
  private 
  def logged_in_redirect
    if logged_in?
      flash[:error]="you already login"
      redirect_to root_path
    end
  end
end
