require 'test_helper'

class UserCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get user_comments_create_url
    assert_response :success
  end

  test "should get edit" do
    get user_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_comments_destroy_url
    assert_response :success
  end

end
