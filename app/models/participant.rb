class Participant < ApplicationRecord
  validates :name, uniqueness: { scope: :registry_id, message: "registery already exists for this name." }

  has_many :enrollments
  has_many :coordinators, through: :enrollments
  belongs_to :registry
end
