class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  enum role: { superadmin: 0, districtadmin: 1, schooladmin: 2, teacher: 3, student: 4 }
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :student
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
