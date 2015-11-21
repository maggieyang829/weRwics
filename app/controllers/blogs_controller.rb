class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  #before_action :set_user_id, only: [:index, :edit, :create, :update, :destroy]
  before_action :set_user_id
  before_filter :authenticate_user_auth!, except: [:index, :show]

  # GET /blogs
  def index
    user_link_clicked = User.find(@user_id)
    @blogs = user_link_clicked.blogs
  end

  # GET /blogs/1
  def show
  end

  def new
    # default: render 'new' template
  end
  
  def create
    blog_user = User.find(@user_id)
    @blog = blog_user.blogs.build(blog_params)
    @blog.save!
    flash[:notice] = "#{@blog.title} was successfully created."
    redirect_to user_path(@user_id)
  end
  
  # GET /blogs/1/edit
  def edit
  end

  
  # PATCH/PUT /blogs/1
  def update
    @blog.update_attributes!(blog_params)
    flash[:notice] = 'Blog post was successfully updated.'
    redirect_to user_blog_path(@user_id,@blog.id)
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    flash[:notice] = "'#{@blog.title}' was successfully deleted."
    redirect_to user_blogs_path(@user_id)
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def set_user_id
      @user_id= params[:user_id]
    end

    def blog_params
      params.require(:blog).permit(:title,:content,:user_id)
    end

end
