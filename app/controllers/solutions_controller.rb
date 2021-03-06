class SolutionsController < ApplicationController
  before_action :set_solution, only: %i[show update destroy]
  def show
  end

  def create
    @user_id = current_user.id
    @exercise_id = params[:exercise_id].to_i
    @status = Solution.statuses['in_progress']
    @solution = Solution.new(user_id: @user_id, exercise_id: @exercise_id, status: @status )
    @solution.save
    redirect_to exercise_path(@exercise_id)
  end 
  
  def update
    @solution.update(solution_params)
    redirect_to exercise_path(@solution.exercise_id)
  end

  def destroy
  end
  
  private
    def set_solution
      @solution = Solution.find(params[:id])
    end
    
    def solution_params
      params.require(:solution).permit(:status, :content, :user_id, :exercise_id)
    end
end

