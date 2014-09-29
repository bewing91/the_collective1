require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:one)
  end

  #test "profile display" do
 # 	get '/users/(@user)'
 # 	assert_select 'title', full_title(@user.username)
  #	assert_match @user.username, response.body
  #	assert_match @user.projects.count.to_s, response.body
  #end


end
