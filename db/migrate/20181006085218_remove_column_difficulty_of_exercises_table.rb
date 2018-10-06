class RemoveColumnDifficultyOfExercisesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercises, :difficulty
  end
end
