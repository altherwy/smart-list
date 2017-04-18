require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get items_add_url
    assert_response :success
  end

  test "should get update" do
    get items_update_url
    assert_response :success
  end

  test "should get delete" do
    get items_delete_url
    assert_response :success
  end

end
