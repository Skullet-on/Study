class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.admin?
      can :manage, :all
    elsif user
      can :edit, User do |usr|
        user == usr
      end
      can :cteate, Test do |test|
        user.authenticate?
      end
      can :create, Question
      can :create, Answer
      can :create, Test
    else
    end
  end
end
