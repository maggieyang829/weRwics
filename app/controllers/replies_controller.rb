class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :set_comment_id, :set_user_id
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
    comment = Comment.find(@comment_id)
    authoring_user = User.find(@user_id)
    @reply = comment.replies.build(reply_params)
    authoring_user.replies << @reply
    @reply.save!
    flash[:notice] = "Reply was successfully created."
    redirect_to user_blog_path(@user_id, comment.blog_id)
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
  
    def set_reply
        @reply = Reply.find([:id])
    end
    
    def set_comment_id
        @comment_id = params[:comment_id]
    end
    
    def set_user_id
      c = Comment.find(@comment_id)
      @user_id = Blog.find(c.blog_id).user_id
    end

    def reply_params
      params.require(:reply).permit(:content,:comment_id, :user_id)
    end
end
