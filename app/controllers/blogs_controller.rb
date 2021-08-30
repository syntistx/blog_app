class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.page(params[:page]).per(1)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      redirect_to new_blog_path
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def update
    @blog.update(blog_params) if redirect_to blogs_path
  end

  def destroy_all
    @blogs = Blog.all
    @blogs.destroy_all
  end

  def destroy
    @blog.destroy if redirect_to blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :short_detail, :description, :blogimage)
  end
end
