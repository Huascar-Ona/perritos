class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :avatar_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
