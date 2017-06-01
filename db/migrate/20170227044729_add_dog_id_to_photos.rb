class AddDogIdToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :dog_id, :integer
  end
end
