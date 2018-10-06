class AddColumnExerciseIdForTagging < ActiveRecord::Migration[5.2]
  def change
    add_column :taggings, :exercise_id, :integer
  end
end
