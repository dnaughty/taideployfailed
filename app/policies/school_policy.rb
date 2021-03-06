# frozen_string_literal: true

class SchoolPolicy < ApplicationPolicy
  attr_reader :current_user, :record

  def initialize(current_user,school)
    @current_user = current_user
    @school = school
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @current_user.superadmin? || @current_user.districtadmin?
  end

  def new?
    @current_user.superadmin? || @current_user.districtadmin?
  end

  def update?
   @current_user.superadmin? || @current_user.districtadmin?
  end

  def edit?
   @current_user.superadmin? || @current_user.districtadmin?
  end

  def destroy?
   @current_user.superadmin? || @current_user.districtadmin?
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

    attr_reader :user, :school
  end
end
