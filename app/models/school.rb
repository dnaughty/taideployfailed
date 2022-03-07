class School < ApplicationRecord
  belongs_to :district

  has_many :lessons
end
