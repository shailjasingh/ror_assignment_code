class Registry < ApplicationRecord
    validates :name, uniqueness: { scope: :location, message: "location already exists for this name." }

    has_and_belongs_to_many :coordinators
end
