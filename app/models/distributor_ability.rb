class DistributorAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_spree_role? "distributor"
      can :manage, Spree::Order
      cannot :destroy, Spree::Order
      can :index, "spree/admin/orders"
    end
  end
end
