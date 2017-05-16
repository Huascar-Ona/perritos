class Photo < ApplicationRecord
  belongs_to :dog
  
  has_attached_file  :image, styles: { large: "600x600#", medium: "300x300#", thumb: "150x150#" }, 
                     url: "/assets/:attachment/:id/:style/:basename.:extension", 
                     path: ":rails_root/public/assets/:attachment/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # byebug
  def to_jq_upload
    {
      "name" => read_attribute(:image_file_name),
      "size" => read_attribute(:image_file_size),
      "url" => image.url(:original),
      "delete_url" => image.url(self),
      "delete_type" => "DELETE" 
    }
  end
end
