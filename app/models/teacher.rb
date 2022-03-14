class Teacher < ApplicationRecord
  belongs_to :school

  has_many :assignments
  has_many :lessons, through: :assignments
end
