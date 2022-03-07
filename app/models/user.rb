class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  enum role: [:superadmin, :districtadmin, :schooladmin, :teacher, :student]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :districtadmin
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
