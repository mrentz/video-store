## Should be making use of cancancan and devise for authentication and setting up levels of user access which should be defined here
# looks like i can delete any video without even logging in, something you'd want to prevent users having access to
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.role.staff?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
