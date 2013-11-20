class Ability
  include CanCan::Ability

  def initialize(user)
    guest = User.new
    user ||= guest

    can :read, Article
    can :create, Article if user.id
    can :update, Article, user_id: user.id
    can :destroy, Article, user_id: user.id

    can :read, User, id: user.id
  end
end
