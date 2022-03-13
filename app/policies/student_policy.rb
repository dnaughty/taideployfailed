class StudentPolicy < ApplicationPolicy
  attr_reader :current_user, :record

  def initialize(current_user,student)
    @current_user = current_user
    @student = student
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @current_user.superadmin? || @current_user.schooladmin?
  end

  def new?
    @current_user.superadmin? || @current_user.schooladmin?
  end

  def update?
   @current_user.superadmin? || @current_user.schooladmin? 
 end

  def edit?
   @current_user.superadmin? || @current_user.schooladmin? 
  end

  def destroy?
   @current_user.superadmin? || @current_user.schooladmin?
  end

  class Scope
    def initialize(user, scope)
      @current_user = current_user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :student
  end
end