class SolutionsController < ApplicationController
  before_action :set_solution, only: %i[destroy]
  def create
    @user = User.find(params[:id])
  end 
  
  def destroy
  end
  
  private
    def set_solution
      @solution = Solution.find(params[:id])
    end
    
    def solution_params
      params.require(:solution).permit(:status, :content)
    end
end
