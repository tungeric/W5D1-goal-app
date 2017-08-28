class GoalsController < ApplicationController
  before_action :require_logged_in
  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find_by(id: params[:id])
    render :edit
  end

  def update
    @goal = Goal.find_by(id: params[:id])
    if @goal.author == current_user
      if @goal.update_attributes(goal_params)
        redirect_to goal_url(@goal)
      else
        flash[:errors] = @goal.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["cannot edit someone else's goal!"]
      render :index
    end
  end

  def show
    @goal = Goal.find_by(id: params[:id])
    render :show
  end

  def index
    @goals = Goal.all
    render :index
  end

  def destroy
    @goal = Goal.find_by(id: params[:id])
    @goal.destroy
    flash[:errors] = @goal.errors.full_messages
    redirect_to user_goals(current_user)
  end

  def goal_params
    params.require(:goal).permit(:title)
  end
end
