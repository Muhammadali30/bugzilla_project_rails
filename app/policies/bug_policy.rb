class BugPolicy < ApplicationPolicy
    attr_reader :user, :project
    def initialize(user,project)
        @user=user
        @project=project   
    end
    def hide_tag?
        user.user_type == "QA"
      end
    def create?
        user.user_type=="QA"
    end
    def destroy?
        false
    end

     def update?
        user.user_type=="Developer"
     end
end