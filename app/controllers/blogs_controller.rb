class BlogsController < ApplicationController

  def index
  	@blogs = Blog.joins(:user).distinct
    # @blogs = User.joins(:blogs)
    
  end

  def show
  	@blog_id = Blog.find(params[:id])

    @user_posts=User.joins(:blogs).distinct


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

  def edit
    @blog=Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      flash[:seccess] = "Data updated"
      @blog.user_id = session[:user_id]
      redirect_to user_path(@blog.user_id)
    else
      render 'edit'
    end
  end


  private
  def blog_params
  	params.require(:blog).permit(:title, :description)
  end

end
