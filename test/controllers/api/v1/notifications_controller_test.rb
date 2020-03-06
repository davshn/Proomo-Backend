require 'test_helper'

class Api::V1::NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_notifications_index_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_notifications_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_notifications_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_notifications_update_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_notifications_edit_url
    assert_response :success
  end

end
