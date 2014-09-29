class UsersController < ApplicationController
before_action :authenticate_user!, only: [:index, :destroy]
before_action :correct_user, only: :show
before_action :admin_user, only: [:index, :destroy]

	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		@user = User.find_by_username(params[:id])
		@projects = @user.projects.paginate(page: params[:page])
	end
	
	def destroy
		User.find_by_id(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to users_url
	end

	private

		def admin_user
			redirect_to root_url unless current_user.admin?
		end
end
