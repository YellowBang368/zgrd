class Product < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :estate, optional: true
  has_attached_file :avatar

  has_many :product_attachments
  accepts_nested_attributes_for :product_attachments

  # Валидации
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :name, :description, :price, :square, presence: true
end
