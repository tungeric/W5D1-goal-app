class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.save
    flash.now[:errors] = @comment.errors.full_messages
    redirect_to request.referrer
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
