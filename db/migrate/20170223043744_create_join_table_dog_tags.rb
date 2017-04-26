class CreateJoinTableDogTags < ActiveRecord::Migration[5.0]
  def change
    create_table :dog_tags do |t|
      t.integer :dog_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
