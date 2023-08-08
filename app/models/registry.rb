class Registry < ApplicationRecord
    validates :name, uniqueness: { scope: :location, message: "location already exists for this name." }
end
