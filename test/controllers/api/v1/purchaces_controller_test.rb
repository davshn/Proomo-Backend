require 'test_helper'

class Api::V1::PurchacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_purchaces_index_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_purchaces_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_purchaces_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_purchaces_update_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_purchaces_edit_url
    assert_response :success
  end

end
