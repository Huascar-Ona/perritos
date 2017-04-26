class Dog < ApplicationRecord
  belongs_to :user, primary_key: :id, foreign_key: :contact_id
  has_many :tags, through: :dog_tags
  has_many :dog_tags
  has_many :photos

  attr_accessor :display_name, :tag_id, :image
end
