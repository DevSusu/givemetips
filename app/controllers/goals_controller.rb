class GoalsController < ApplicationController
  def index
  end

  def new
    @user = current_user
    @goal = Goal.new
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.save!

    redirect_to @goal
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update!(goal_params)

    redirect_to @goal
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    redirect_to goals_path
  end

private
  def goal_params
    params.require(:goal).permit(:content)
  end
end
