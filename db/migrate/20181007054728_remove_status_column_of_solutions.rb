class RemoveStatusColumnOfSolutions < ActiveRecord::Migration[5.2]
  def change
    remove_column :solutions, :status
  end
end
