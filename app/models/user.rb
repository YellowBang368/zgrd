class User < ApplicationRecord
  after_initialize :default_values

  enum status: [ :user, :admin, :agent, :owner, :manager, :blogger, :markup ]
  has_attached_file :avatar
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Валидации
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :first_name, :last_name, presence: true

  # Методы
  def default_values
    self.confirmed ||= false
    self.status ||= :user
  end
end
