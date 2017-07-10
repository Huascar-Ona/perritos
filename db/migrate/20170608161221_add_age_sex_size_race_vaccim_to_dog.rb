class AddAgeSexSizeRaceVaccimToDog < ActiveRecord::Migration[5.0]
  def self.up
    add_column :dogs, :age, :integer
    add_column :dogs, :sex, :string, limit: 1
    add_column :dogs, :size, :string, limit: 1
    add_column :dogs, :race_id, :integer, default: 1
    add_column :dogs, :vaccines, :text
  end

  def self.down
    remove_column :dogs, :age
    remove_column :dogs, :sex
    remove_column :dogs, :size
    remove_column :dogs, :race_id
    remove_column :dogs, :vaccines
  end 
end
