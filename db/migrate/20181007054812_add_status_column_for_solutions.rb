class AddStatusColumnForSolutions < ActiveRecord::Migration[5.2]
  def change
    add_column :solutions, :status, :integer
  end
end
