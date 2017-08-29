class UserCommentsController < ApplicationController
  before_action :require_logged_in

  def new
  end

  def create
    @comment = UserComment.new(user_comment_params)
    @comment.author_id = current_user.id
    @comment.save
    flash[:errors]=@comment.errors.full_messages
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

  def user_comment_params
    params.require(:user_comment).permit(:body, :user_id)
  end
end
