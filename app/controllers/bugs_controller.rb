class BugsController < ApplicationController
    before_action :authorize_user, except: %i[index show]
def create
    @project=Project.find(params[:project_id])
   if @bug=@project.bugs.create(bug_param)
    current_user.add_role :creator,@bug
    redirect_to @project
   end 
end
def destroy
    @project=Project.find(params[:project_id])
    @bug=@project.bugs.find(params[:id])
    if @bug.destroy
    redirect_to @project
    end
end
def edit
@bug=Bug.find(params[:id])
end
def update
    @bug=Bug.find(params[:id])
    if @bug.update(bug_param)
        current_user.add_role :editor,@bug
        redirect_to @bug
    end
end

private
def bug_param
    params.require(:bug).permit(:title,:image,:deadline,:description,:bug_type,:status)
end
def authorize_user
    bug = @bug || Bug
    authorize bug
  end
end