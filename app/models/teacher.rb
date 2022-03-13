class Teacher < ApplicationRecord
  belongs_to :school

  has_many :teachings
  has_many :lessons, through: :teachings
end
