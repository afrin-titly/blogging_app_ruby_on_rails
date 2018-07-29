class UsersController < ApplicationController
  
  # before_action :logged_in_user, only: [:edit, :update]
  # before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
    
  end

  def show
  	@user = User.find(params[:id])
    # @user_posts = Blog.joins(:user)
    @user_posts = Blog.where(user_id: @user)
    @user_posts_plain=Blog.joins(:user).distinct


  end

  def new
  	@user = User.new
  end

  def create
  	@user =  User.new(user_params)
  	if @user.save
  		log_in @user
  		flash[:success]="Welcome to Bloggers App"

  		redirect_to @user
  	else
  		render 'new'
  	end
  end

# def logged_in_user
#   unless logged_in?
#     flash[:danger]= "Please Log in"
#     redirect_to login_url
#   end
# end

# def correct_user
#        @user = User.find(params[:id])
#       redirect_to(root_url) unless current_user?(@user)
      
#     end
  

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

