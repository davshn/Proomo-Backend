require 'test_helper'

class Api::V1::CommercesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_commerces_index_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_commerces_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_commerces_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_commerces_update_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_commerces_edit_url
    assert_response :success
  end

end
