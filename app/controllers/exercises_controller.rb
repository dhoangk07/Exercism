class ExercisesController < ApplicationController
before_action :set_exercise, only: %i[edit update show destroy]
  def index
    @tags = Tag.all
    @exercises = Exercise.all
    @exercises = @exercises.by_difficulty(params[:difficulty]) if params[:difficulty].present?
    @exercises = @exercises.query_depend_on_status(params[:status].to_i, current_user) if params[:status].present?
    @exercises = @exercises.query_depend_on_tag(params[:tag]) if params[:tag].present?
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
    @tags = Tag.all
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