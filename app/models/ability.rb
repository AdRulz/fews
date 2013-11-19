class Ability
  include CanCan::Ability

  def initialize(user)
    guest = User.new
    user ||= guest

    can :read, Article
    can :update, Article, user_id: user.id

  end
end
