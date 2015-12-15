class Ability
  include CanCan::Ability


    def initialize(user)
        user ||= User.new(role: 3) # guest user (not logged in)
        if user.admin?
          can :manage, :all
        elsif user.owner?
          can :read, :all
          can :create, :all
          can :update, [Ong, Comment, Tag], user_id: user.id
          can :destroy, [Ong, Comment, Tag], user_id: user.id
          # can :favorite, [Ong, Event]
        elsif user.basic?
          can :read, :all
          can :create, Comment
          can [:update, :destroy], Comment, user_id: user.id
          # can :favorite, [Ong, Event]
        else
          can :read, :all
        end
    end
end
