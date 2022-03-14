class Lesson < ApplicationRecord
  belongs_to :school

  has_many :enrollments
  has_many :students, through: :enrollments

  has_many :assignments
  has_many :teachers, through: :assignments

end
