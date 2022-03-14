class Student < ApplicationRecord
   belongs_to :school

  has_many :enrollments
  has_many :lessons, through: :enrollments

 

end
