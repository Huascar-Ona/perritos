class Dog < ApplicationRecord
  #Relationships
  belongs_to :user, primary_key: :id, foreign_key: :contact_id
  has_many :tags, through: :dog_tags
  has_many :dog_tags, dependent: :delete_all
  has_many :photos, dependent: :delete_all

  #Attributes Accesors
  attr_accessor :display_name, :tag_id, :image

  #Validations
  validates  :name, presence: true
end
