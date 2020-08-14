class Organization < ApplicationRecord
  validates :name, :hourly_rate, presence: true

  has_many :users,
           primary_key: :id,
           foreign_key: :organization_id,
           class_name: :User

  has_many :shifts,
           primary_key: :id,
           foreign_key: :organization_id,
           class_name: :Shift
end
