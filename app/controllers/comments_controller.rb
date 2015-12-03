class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_blog_id, :set_user_id
  before_filter :authenticate_user_auth!, except: [:create, :index, :show]

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
    if !current_user_auth
      flash[:warning] = 'Please log in first to leave a comment'
    else
      blog = Blog.find(@blog_id)
      user = User.find(@user_id)
      @comment = Comment.new(comment_params)
      blog.comments << @comment
      user.comments << @comment
      @comment.save!
      flash[:notice] = "Comment was successfully created."
    end
    redirect_to user_blog_path(@user_id, @blog_id)
  end
  
  def edit
      
  end

  def update
    @comment.update_attributes!(comment_params)
    flash[:notice] = 'Comment was successfully updated.'
    redirect_to user_blog_path(@user_id,@blog_id)
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
      if !current_user_auth
        @user_id = -1
      else
        @user_id = current_user_auth.users.first.id
      end
    end
    
    def set_blog_id
        @blog_id = params[:blog_id]
    end

    def comment_params
      params.require(:comment).permit(:content,:blog_id, :user_id)
    end
end