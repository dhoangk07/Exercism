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
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercises_path
    else
      flash.now[:error] = @exercise.errors.full_messages.join(", ")
      render :new
    end
  end 

  def edit
  end

  def update
  end

  def show
    @solution = Solution.where(user_id: current_user.id, exercise_id: @exercise.id).first
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