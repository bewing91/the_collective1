require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

	def setup
		@user = users(:one)
		@project = @user.projects.build(name: "A name", description: "A project", media: "Link.com", user_id: @user.id)
	end

	test "project should be valid" do
		assert @project.valid?
	end

	test "user id should be present" do
		@project.user_id = nil
		assert_not @project.valid?
	end

	test "description should be present" do
		@project.description = " "
		assert_not @project.valid?
	end

	test "most recent created is first" do
		assert_equal Project.first, projects(:two)
	end
end
