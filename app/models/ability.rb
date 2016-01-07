class Ability
  include CanCan::Ability


    def initialize(user)
        user ||= User.new(role: 3) # guest user (not logged in)
        if user.admin?
          can :manage, :all
          can :favorite, [Ong, Event]
          can :participate, [Ong, Event]
        elsif user.owner?
          can :read, :all
          can :create, :all
          can :create, Comment
          can :destroy, Comment, user_id: user.id
          can [:update, :destroy], Ong, user_id: user.id
          can [:update, :destroy], Event, ong: {user_id: user.id}
          can :favorite, [Ong, Event]
          can :participate, [Ong, Event]
        elsif user.basic?
          can :read, :all
          can :create, Comment
          can :destroy, Comment, user_id: user.id
          # can [:update, :destroy], Comment, user_id: user.id
          can :favorite, [Ong, Event]
          can :participate, [Ong, Event]
        else
          can :read, :all
        end
    end
end
