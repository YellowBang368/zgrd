class Product < ApplicationRecord
  belongs_to :user
  has_attached_file :avatar

  # Валидации
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :name, :description, :price, :user, :square, presence: true
end
