class Shift < ApplicationRecord
  validates :user_id, :start, :finish, :break_length, presence: true

  belongs_to :user,
             foreign_key: :user_id,
             class_name: :User

  belongs_to :organization,
             foreign_key: :organization_id,
             class_name: :Organization
end
