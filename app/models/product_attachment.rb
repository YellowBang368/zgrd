class ProductAttachment < ApplicationRecord
  mount_uploader :gallery, GalleryUploader
  belongs_to :product
end
