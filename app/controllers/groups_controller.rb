class GroupsController < InheritedResources::Base
  protected

  def begin_of_association_chain
    if action_name == "create"
      current_user
    else
      super
    end
  end
end
