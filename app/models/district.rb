class District < ApplicationRecord
	has_many :schools, dependent: :destroy
end
