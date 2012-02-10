class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :impression_count

      t.timestamps
    end
  end
end
