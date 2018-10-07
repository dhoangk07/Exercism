class AddUserIdAndExerciseIdForSolutions < ActiveRecord::Migration[5.2]
  def change
    add_column :solutions, :user_id, :integer
    add_column :solutions, :exercise_id, :integer
  end
end
