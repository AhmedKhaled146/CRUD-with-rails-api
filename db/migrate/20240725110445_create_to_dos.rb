class CreateToDos < ActiveRecord::Migration[7.2]
  def change
    create_table :to_dos do |t|
      t.string :title
      t.text :body
      t.boolean :is_active

      t.timestamps
    end
  end
end
