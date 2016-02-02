class GoalsController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @public_goals = Goal.public_goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    checkbox_params(@goal)
    if @goal.save
      redirect_to user_url(current_user)
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find_by_id(params[:id])
  end

  def update
    @goal = Goal.find_by_id(params[:id])
    checkbox_params(@goal)
    if @goal.update(goal_params)
      redirect_to user_url(current_user)
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find_by_id(params[:id])
    @goal.destroy!
    redirect_to user_url(current_user)
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :target_date, :public, :complete)
  end

  def checkbox_params(goal)
    # if params[:public] == "true"
    #   goal.public = true
    # else
    #   goal.public = false
    # end
    goal.public = params[:public] == "true" ? true : false
    if params[:complete] == "true"
      goal.complete = true
    else
      goal.complete = false
    end
  end
end
