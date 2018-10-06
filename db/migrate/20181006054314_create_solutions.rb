class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.string :status
      t.string :content

      t.timestamps
    end
  end
end
