require 'test_helper'

class UsersControllerTest < ActionController::TestCase

	def setup
		@user = users(:one)
		@other_user = users(:two)
	end

	test "should redirect destroy when not logged-in" do
		assert_no_difference 'User.count' do
			delete :destroy, id: @user.id
		end
		assert_redirected_to new_user_session_url
	end

	test "should redirect destroy when logged-in but not admin" do
      	session[:user_id] = @other_user.id
		assert_no_difference 'User.count' do
			delete :destroy, id: @user.id
		end
		assert_redirected_to root_url
	end

	test "should redirect index when not logged-in"
		get :index
		assert_redirected_to new_user_session_url
	end


end
