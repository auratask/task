require 'test_helper'

class TaskksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get taskks_new_url
    assert_response :success
  end

  test "should get show" do
    get taskks_show_url
    assert_response :success
  end

  test "should get edit" do
    get taskks_edit_url
    assert_response :success
  end

  test "should get index" do
    get taskks_index_url
    assert_response :success
  end

end
