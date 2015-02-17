# encoding: utf-8
#
# This file is a part of Redmine More Blocks Extension plugin
#
# @author Strnadj <jan.strnadek@gmail.com>

require File.expand_path('../../test_helper', __FILE__)

class MyExtraBlocksTest < ActionController::TestCase
  fixtures :users, :user_preferences, :roles, :projects, :members, :member_roles,
  :issues, :issue_statuses, :trackers, :enumerations, :custom_fields, :auth_sources

  def setup
    @request.session[:user_id] = 2
    @controller = MyController.new
  end

  def test_extra_blocks
    blocks = MyController::BLOCKS.keys
    preferences = User.find(2).pref
    preferences[:my_page_layout] = {'top' => blocks}
    preferences.save!

    get :page
    assert_response :success
    assert_select 'div.mypage-box', blocks.size
  end
end
