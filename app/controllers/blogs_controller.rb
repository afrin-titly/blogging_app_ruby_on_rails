class BlogsController < ApplicationController

  def index
  	@blogs = Blog.all
  end

  def show
  	@blog_id = Blog.find(params[:id])
  end

end
