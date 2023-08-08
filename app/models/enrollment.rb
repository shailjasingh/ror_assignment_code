class Enrollment < ApplicationRecord
    belongs_to :participant
    belongs_to :coordinator
end
