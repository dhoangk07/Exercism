module ExercisesHelper
  include ActsAsTaggableOn::TagsHelper

  def generate_exercise_path(attribute)
    exercises_path(request.query_parameters.merge(attribute))
  end  
end
