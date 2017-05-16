class AddColumnsToDog < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :description, :text
    add_column :dogs, :latitude, :float, precision: 10, scale: 6
    add_column :dogs, :longitude, :float, precision: 10, scale: 6
  end
end
