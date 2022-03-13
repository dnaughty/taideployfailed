class Lesson < ApplicationRecord
  belongs_to :school

  has_many :enrollments
  has_many :students, through: :enrollments

  has_many :teachings
  has_many :teachers, through: :teachings

end
