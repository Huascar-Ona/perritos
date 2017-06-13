class Dog < ApplicationRecord
  #Relationships
  belongs_to :user, primary_key: :id, foreign_key: :contact_id
  belongs_to :race, primary_key: :id, foreign_key: :race_id
  has_many :tags, through: :dog_tags
  has_many :dog_tags, dependent: :delete_all
  has_many :photos, dependent: :delete_all

  #Attributes Accesors
  attr_accessor :display_name, :tag_id, :image

  #Validations
  validates  :name, presence: true
  validates  :image, presence: true
  validates  :latitude, presence: true
  validates  :longitude, presence: true
  validates  :description, presence: true

  #kaminari config
  paginates_per 1
  max_paginates_per 10
end
