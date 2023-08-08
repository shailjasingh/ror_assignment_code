class Coordinator < ApplicationRecord
    validates_uniqueness_of :email
    
    has_and_belongs_to_many :registries
    has_many :enrollments
    has_many :participants, through: :enrollments
end
