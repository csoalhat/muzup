class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all 
    else 
      can :read, :all

      [Song, Snippet, Comment, Profile].each do |klass|
        can(:update , klass){ |resource|  resource.user_id == user.id }
      end
      
      [Song, Snippet, Comment].each do |klass|
        can(:destroy , klass){ |resource| resource.user_id == user.id }
      end
    
    end
  end
end
