class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities


    user ||= User.new # guest user

    if user.persisted? #Applies to all signed in
      can :modify, Profile do |p|
        user.profile==p
      end
    end
      
    if user.is_a? Admin

      can :manage, :all
      cannot :see_user, User do |u|
        if u == user.userize
          true
        else
          false
        end
      end

    elsif user.is_a? Teacher

    elsif user.is_a? Technician

    elsif user.is_a? Student

    else #VISITOR - out of the system

    end

  end

end
