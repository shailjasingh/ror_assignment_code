class Participant < ApplicationRecord
  validates_inclusion_of :gender, :in => %w( m f M F)
end
