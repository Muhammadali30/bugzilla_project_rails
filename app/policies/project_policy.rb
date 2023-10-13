class ProjectPolicy < ApplicationPolicy
    attr_reader :user, :project
    def initialize(user,project)
        @user=user
        @project=project   
    end

    def create?
        user.user_type=="Manager"
    end
    def destroy?
        #  project.userid === user.id
        true
    end
    def edit?
        user.user_type=="Manager"
     end
    #  def hide_content?
    #     user.user_type=="Manager"
    #  end
end