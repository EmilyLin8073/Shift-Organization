class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Change user email to lowercase before save to db
  before_save{self.email = email.downcase}

  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :password, confirmation: { case_sensitive: true }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  has_many :shifts,
           primary_key: :id,
           foreign_key: :user_id

  belongs_to :organization,
             foreign_key: :organization_id

  has_secure_password
end
