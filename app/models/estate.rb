class Estate < ApplicationRecord
  belongs_to :user, optional: true
  has_many :products, dependent: :destroy

  has_many :product_attachments
  accepts_nested_attributes_for :product_attachments

  validates :title, presence: true
end
