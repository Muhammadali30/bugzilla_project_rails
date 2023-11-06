class ProjectsController < ApplicationController
    before_action :authorize_user, except: %i[index show]
    before_action :set_id, except: %i[index new create]
    def index
        if params[:pid].present?
            project=Project.where(id: params[:pid])
        render json: project
    else
        if current_user.Developer?
            project_ids = []
            Project.all.each do |project|
                if project.users.present? && project.users.where(user_type: "Developer").pluck(:id).include?(current_user.id)
                    project_ids << project.id
                end
            end
            @projects = Project.where(id: project_ids)
        else
            @projects=Project.all
        end
    end
end
    def new
        @project=Project.new
        # @project.bugs.build
        @project.project_users.build
    end
  
    def create
        @project=Project.new(project_params)
        @project.userid=current_user.id
        if @project.save
            redirect_to projects_path
        end
    end
    def edit
        if current_user.id == @project.userid
          else
            redirect_to projects_path, alert: 'You do not have permission to Edit this project.'
          end
    end
    def show
    end
    def update
        if @project.update(project_params)
            redirect_to projects_path
        end
    end
    def destroy
        if current_user.id == @project.userid
            # Perform your destroy logic here
            @project.destroy
            redirect_to projects_path, notice: 'Project was successfully destroyed.'
          else
            redirect_to projects_path, alert: 'You do not have permission to destroy this project.'
          end
        # if @project.destroy
        #     redirect_to projects_path
        # end
    end
    private
    def project_params
        params.require(:project).permit(:name,project_users_attributes: [:id,:user_id,:_destroy])
        # params.require(:project).permit(:name, bugs_attributes: [:id,:title,:image,:deadline,:description,:bug_type,:status,:_destroy],project_users_attributes: [:id,:user_id,:_destroy])
    end
    def authorize_user
        project = @project || Project
        authorize project
      end
      def set_id
        @project=Project.find(params[:id])
      end
end
