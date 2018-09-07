class ProductAttachment < ApplicationRecord
  mount_uploader :gallery, GalleryUploader
  belongs_to :product, optional: true
  belongs_to :estate, optional: true
end
