class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can [:show, :edit, :update, :destroy], Shipment, :user_id => user.id
    end
  end

end
