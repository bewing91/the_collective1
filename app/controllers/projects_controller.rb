class ProjectsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

def new
    @project = current_user.projects.build if user_signed_in?
end

def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to user_url(current_user.username)
    else
      render 'new'
    end
end

def edit
	@project = current_user.projects.find(params[:id])
end

def update
	@project = current_user.projects.find(params[:id])
	if @project.update_attributes(project_params)
		flash[:success] = "Project Updated"
		redirect_to user_url(current_user.username)
	else
		render 'edit'
	end
end


def destroy
	@project = Project.find(params[:id])
	@project.delete
	redirect_to user_url(current_user.username)
end

private

	def project_params
		params.require(:project).permit(:description, :name, :media)
	end

end
