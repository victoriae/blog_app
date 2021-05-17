# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article

    if user.present?
      can :manage, Article, user_id: user.id
      can [:create, :read], Comment

      if user.admin?
        can :manage, :all
      end
    end

  end
end
