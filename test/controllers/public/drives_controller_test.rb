require "test_helper"

class Public::DrivesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_drives_new_url
    assert_response :success
  end

  test "should get index" do
    get public_drives_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_drives_edit_url
    assert_response :success
  end
end
