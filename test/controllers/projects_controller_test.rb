require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

	def setup
		@project = projects(:one)
	end

	test "should redirect create when not logged in" do 
		assert_no_difference 'Project.count' do
			post :create, project: { name: "Painting", description: "Cats" }
		end
		assert_redirected_to '/users/sign_in'
	end

	test "should redirect destroy when not logged in" do
		assert_no_difference 'Project.count' do
			delete :destroy, id: @project
		end
		assert_redirected_to '/users/sign_in'
	end

end
