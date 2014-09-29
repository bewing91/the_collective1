require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(username: "gucci1", email: "gucci@test.com", password: "talkwalk12")
	end

	test "associated projects destroyed" do
		@user.save
		@user.projects.create!(name: "A Name", description: "A project", media: "Link.com", user_id: @user.id)
		assert_difference 'Project.count', -1 do
			@user.destroy
		end
	end


end
