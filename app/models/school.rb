class School < ApplicationRecord
  belongs_to :district 

  has_many :students
  has_many :lessons
  has_many :teachers
end
