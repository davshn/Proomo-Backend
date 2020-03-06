require 'test_helper'

class Api::V1::CouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_coupons_index_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_coupons_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_coupons_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_coupons_update_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_coupons_edit_url
    assert_response :success
  end

end
