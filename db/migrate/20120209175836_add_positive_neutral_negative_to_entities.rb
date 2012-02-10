class AddPositiveNeutralNegativeToEntities < ActiveRecord::Migration
  def change
    add_column :entities, :positive_count, :integer
    add_column :entities, :neutral_count, :integer
    add_column :entities, :negative_count, :integer
  end
end
