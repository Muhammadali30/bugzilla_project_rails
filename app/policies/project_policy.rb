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
    def update?
        user.user_type=="Manager"
    end

     def show?
        # user==project.users.Developer
      # project.user_ids==user.id
      # user.project_users.pluck(:project_id)==project.ids
     end
    #  class Scope < Scope
    #     def resolve
    #       if user.admin?
    #         scope.all
    #       else
    #         scope.where(user: true)
    #       end
    #     end
    #   end


    # def show?
    #     if  user.user_type=="Developer"
    #      project.users==user
    #     else 
    #         true
    #     end
        
    #  end
     
    #  def hide_content?
    #     user.user_type=="Manager"
    #  end
end