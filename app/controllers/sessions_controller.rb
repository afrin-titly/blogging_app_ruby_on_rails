class SessionsController < ApplicationController
  def new
  end

  def create
  	user = BloggerLogin.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
  	else
  		flash.now[:danger]="Invalid Email/Password combination"
  		render 'new'
  	end
  	
  end

  def destroy
  	log_out
  	redirect_to root_path
  end
end

