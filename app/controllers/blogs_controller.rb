class BlogsController < ApplicationController

  def index
  	@blogs = Blog.all
  end

  def show
  	@blog_id = Blog.find(params[:id])
  	@user_posts = Blog.joins(:user)
  	@user_posts.each do |post|
  		@user = User.find(post.user_id)
  	end
  end

  def new
  	@blog=Blog.new
  end

  def create
  	@blog = Blog.new(blog_params)
  	@blog.user_id = session[:user_id]
  	if @blog.save
  		flash[:seccess]="Post have been saved!!"
  		redirect_to user_path(@blog.user_id)
  	else
  		flash[:danger]="Post couldn't saved"
  		redirect_to user_path(@blog.user_id)
  	end
  end


  private
  def blog_params
  	params.require(:blog).permit(:title, :description)
  end

end
