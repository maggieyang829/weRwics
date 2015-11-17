class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  def index
    user_id = User.find(params[:user_id])
    @blogs = user_id.blogs
  end

  # GET /blogs/1
  def show
  end

  # GET /blogs/1/edit
  def edit
  end

  
  # PATCH/PUT /blogs/1
  def update
    @blog.update_attributes!(blog_params)
    flash[:notice] = 'Blog post was successfully updated.'
    redirect_to user_blog_path(@blog.user_id,@blog.id)
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    flash[:notice] = "'#{@blog.title}' was successfully deleted."
    redirect_to user_blogs_path(@blog.user_id)
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end


    def blog_params
      params.require(:blog).permit(:title,:content,:user_id)
    end

end
