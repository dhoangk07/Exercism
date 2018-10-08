class ExercisesController < ApplicationController
before_action :set_exercise, only: %i[edit update show destroy]
  def index
    if params[:tag]
     #topic 
      tag_ids = Tag.where(name: params[:tag]).pluck(:id)
      tagging_ids = Tagging.where(id: tag_ids).pluck(:exercise_id)
      @exercises = Exercise.where(id: tagging_ids)
      # @exercises = Exercise.tagged_with(params[:tag])
    #difficulty
    elsif params[:filter] == 'easy'
      @exercises= Exercise.where(difficulty: 'easy')
    elsif params[:filter] == 'medium'
      @exercises= Exercise.where(difficulty: 'medium')
    elsif params[:filter] == 'hard'
      @exercises= Exercise.where(difficulty: 'hard')
    #status
        # debugger
    elsif params[:filter] == 'lock'
      exercise_ids = Solution.where(status: Solution.statuses[:locked]).where(user_id: current_user.id).pluck(:exercise_id)
      @exercises = Exercise.where(id: exercise_ids)
    elsif params[:filter] == 'in_progress'
      exercise_ids = Solution.where(status: Solution.statuses[:in_progress]).where(user_id: current_user.id).pluck(:exercise_id)
      @exercises = Exercise.where(id: exercise_ids)
    elsif params[:filter] == 'completed'
      exercise_ids = Solution.where(status: Solution.statuses[:completed]).where(user_id: current_user.id).pluck(:exercise_id)
      @exercises = Exercise.where(id: exercise_ids)
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