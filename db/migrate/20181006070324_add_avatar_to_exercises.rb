class AddAvatarToExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :avatar, :string
  end
end
