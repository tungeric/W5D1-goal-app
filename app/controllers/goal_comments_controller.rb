class GoalCommentsController < ApplicationController
  before_action :require_logged_in

  def new
  end

  def create
    @comment = GoalComment.new(goal_comment_params)
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

  def goal_comment_params
    params.require(:goal_comment).permit(:body, :goal_id)
  end
  end
