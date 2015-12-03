class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_blog_id
  before_filter :authenticate_user_auth!, except: [:index, :show]

  def index
    blog = Blog.find(@blog_id)
    @comments = blog.comments
  end

  def show
  end

  def new
    # default: render 'new' template
  end
  
  def create
    blog = Blog.find(@blog_id)
    @comment = blog.comments.build(comment_params)
    @comment.save!
    flash[:notice] = "Comment was successfully created."
    redirect_to user_blog_path(@user_id, @blog_id)
  end
  
  def edit
      
  end

  def update
    @comment.update_attributes!(comment_params)
    flash[:notice] = 'Comment was successfully updated.'
    redirect_to user_blog_path(@user_id,@blog.id)
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Comment was successfully deleted."
    redirect_to user_blog_path(@user_id, @blog_id)
  end
  
  private
  
    def set_comment
        @comment = Comment.find([:id])
    end
    
    def set_user_id
        @user_id = params[:user_id]
    end
    
    def set_blog_id
        @blog_id = params[:blog_id]
    end

    def comment_params
      params.require(:blog).permit(:title,:content,:blog_id)
    end
end