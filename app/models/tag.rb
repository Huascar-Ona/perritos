class Tag < ApplicationRecord
  has_many :dogs, through: :dog_tags
  has_many :dog_tags

  #Validations
  validates  :name, presence: true
end 
