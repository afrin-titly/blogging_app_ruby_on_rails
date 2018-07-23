class BloggerLoginsController < ApplicationController
  def show
  	@blogger = BloggerLogin.find(params[:id])
  end

  def new
  	@blogger = BloggerLogin.new
  end

  def create
  	@blogger =  BloggerLogin.new(user_params)
  	if @blogger.save
  		log_in @blogger
  		flash[:success]="Welcome to Bloggers App"
  		redirect_to @blogger
  	else
  		render 'new'
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
