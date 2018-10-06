class ExercisesController < ApplicationController
before_action :set_exercise, only: %i[edit update show destroy]
  def index
    if params[:tag]
      @exercises = Exercise.tagged_with(params[:tag])
    else
      @exercises = Exercise.all
    end
    @tags = Tag.all
  end

  def new
  end

  def create
  end 

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  def tag_cloud
    @tags = Exercise.tag_counts_on(:tags)
  end

private
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
  
  def exercise_params
    params.require(:exercise).permit(:title, :difficulty, :tag_list)
  end
end