class BugPolicy < ApplicationPolicy
    attr_reader :user, :bug
    def initialize(user,bug)
        @user=user
        @bug=bug   
    end
    def hide_tag?
        user.user_type == "QA"
      end
      def hide_form?
        user.user_type != "Developer"
      end
    def create?
        user.user_type=="QA"
    end
    def destroy?
        false
    end
     def update?
      user.user_type!="Manager"
     end
    #  def edit?
    #  bug.create==user
    #  end
end