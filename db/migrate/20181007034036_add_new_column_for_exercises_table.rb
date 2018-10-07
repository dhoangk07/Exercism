class AddNewColumnForExercisesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :introduction, :string
  end
end
